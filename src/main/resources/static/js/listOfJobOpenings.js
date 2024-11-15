function setActiveLink(event) {
    // 모든 링크에서 active 클래스 제거
    const links = document.querySelectorAll('#List_Category a');
    links.forEach(link => link.classList.remove('active'));

    // 클릭된 링크에만 active 클래스 추가
    event.target.classList.add('active');
}

const districts = {
    "서울": ["종로구", "중구", "용산구", "성동구", "광진구", "동대문구", "중랑구", "성북구", "강북구", "도봉구", "노원구", "은평구", "서대문구", "마포구", "양천구", "강서구", "구로구", "금천구", "영등포구", "동작구", "관악구", "서초구", "강남구", "송파구", "강동구"],
    "부산": ["중구", "서구", "동구", "영도구", "부산진구", "동래구", "남구", "북구", "해운대구", "사하구", "금정구", "강서구", "연제구", "수영구", "사상구", "기장군"],
    "대구": ["중구", "동구", "서구", "남구", "북구", "수성구", "달서구", "달성군"],
    "인천": ["중구", "동구", "미추홀구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군"],
    "광주": ["동구", "서구", "남구", "북구", "광산구"],
    "대전": ["동구", "중구", "서구", "유성구", "대덕구"],
    "울산": ["중구", "남구", "동구", "북구", "울주군"],
    "경기": ["수원시", "성남시", "의정부시", "안양시", "부천시", "광명시", "평택시", "동두천시", "안산시", "고양시", "과천시", "의왕시", "구리시", "남양주시", "오산시", "시흥시", "군포시", "하남시", "용인시", "파주시", "이천시", "안성시", "김포시", "화성시", "광주시", "양주시", "포천시", "여주시", "연천군", "가평군", "양평군"],
    "강원": ["춘천시", "원주시", "강릉시", "동해시", "태백시", "속초시", "삼척시", "홍천군", "횡성군", "영월군", "평창군", "정선군", "철원군", "화천군", "양구군", "인제군", "고성군", "양양군"],
    "충북": ["청주시", "충주시", "제천시", "보은군", "옥천군", "영동군", "증평군", "진천군", "괴산군", "음성군", "단양군"],
    "충남": ["천안시", "공주시", "보령시", "아산시", "서산시", "논산시", "계룡시", "당진시", "금산군", "부여군", "서천군", "청양군", "홍성군", "예산군", "태안군"],
    "전북": ["전주시", "군산시", "익산시", "정읍시", "남원시", "김제시", "완주군", "진안군", "무주군", "장수군", "임실군", "순창군", "고창군", "부안군"],
    "전남": ["목포시", "여수시", "순천시", "나주시", "광양시", "담양군", "곡성군", "구례군", "고흥군", "보성군", "화순군", "장흥군", "강진군", "해남군", "영암군", "무안군", "함평군", "영광군", "장성군", "완도군", "진도군", "신안군"],
    "경북": ["포항시", "경주시", "김천시", "안동시", "구미시", "영주시", "영천시", "상주시", "문경시", "경산시", "군위군", "의성군", "청송군", "영양군", "영덕군", "청도군", "고령군", "성주군", "칠곡군", "예천군", "봉화군", "울진군", "울릉군"],
    "경남": ["창원시", "진주시", "통영시", "사천시", "김해시", "밀양시", "거제시", "양산시", "의령군", "함안군", "창녕군", "고성군", "남해군", "하동군", "산청군", "함양군", "거창군", "합천군"],
    "제주": ["제주시", "서귀포시"]
};

let selectedRegion = '';
let selectedDistricts = [];

function toggleRegionPopup(event) {
    event.stopPropagation(); // 클릭 전파 차단
    const popup = document.getElementById('region_popup');
    popup.style.display = (popup.style.display === 'block') ? 'none' : 'block';
}

function selectRegion(region) {
    selectedRegion = region;
    openDistrictPopup(region);
}

function openDistrictPopup(region) {
    const districtPopup = document.getElementById('district_popup');
    const districtList = document.getElementById('district_list');
    const districtTitle = document.getElementById('district_title');

    districtList.innerHTML = '';
    selectedDistricts = [];

    districtTitle.innerText = `${region} - 구 선택 (최대 5개)`;

    districts[region].forEach(district => {
        const label = document.createElement('label');
        const checkbox = document.createElement('input');
        checkbox.type = 'checkbox';
        checkbox.value = district;
        checkbox.onclick = handleDistrictSelection;

        label.appendChild(checkbox);
        label.appendChild(document.createTextNode(district));
        districtList.appendChild(label);
    });

    districtPopup.style.display = 'block';
}

function handleDistrictSelection() {
    const checkboxes = document.querySelectorAll('#district_list input[type="checkbox"]');
    selectedDistricts = Array.from(checkboxes)
        .filter(checkbox => checkbox.checked)
        .map(checkbox => checkbox.value);

    if (selectedDistricts.length > 5) {
        alert('최대 5개까지 선택 가능합니다.');
        this.checked = false;
        selectedDistricts.pop();
    }
}

function confirmDistrictSelection() {
    const districtPopup = document.getElementById('district_popup');
    districtPopup.style.display = 'none';

    const regionPopup = document.getElementById('region_popup');
    regionPopup.style.display = 'none';

    const selectedText = selectedDistricts.length > 0 ? `${selectedRegion} - ${selectedDistricts.join(', ')}` : selectedRegion;
    document.getElementById('selected_region').innerText = selectedText;
}

// 상세 구 선택 팝업의 버튼 클릭 이벤트로 팝업 닫기
document.querySelector('.district_header').addEventListener('click', function (event) {
    if (event.target.tagName === 'BUTTON') {
        const districtPopup = document.getElementById('district_popup');
        districtPopup.style.display = 'none';

        const regionPopup = document.getElementById('region_popup');
        regionPopup.style.display = 'none';
    }
});

// 직업 팝업 토글 함수
function toggleJobPopup(event) {
    event.stopPropagation(); // 클릭이 choce_area 외부로 전파되지 않도록 합니다.
    const popup = document.getElementById('job_popup');
    popup.style.display = (popup.style.display === 'block') ? 'none' : 'block';
}

// 특정 버튼 클릭 시에만 팝업 닫기
document.getElementById('job_popup').onclick = function (event) {
    event.stopPropagation(); // 팝업 내부 클릭 시에도 닫히지 않도록 설정
};

// 직업 카테고리를 클릭 시 선택된 텍스트를 <span>에 추가
document.querySelectorAll('.job_category').forEach(category => {
    category.addEventListener('click', () => {
        const selectedJobSpan = document.getElementById('selected_job');
        selectedJobSpan.innerText = category.textContent; // 선택한 텍스트를 <span>에 추가
        document.getElementById('job_popup').style.display = 'none'; // 직업 선택 팝업 닫기
    });
});

// 팝업 외부를 클릭했을 때 팝업을 닫지 않고 유지
window.onclick = function (event) {
    const popup = document.getElementById('job_popup');
    if (!event.target.closest('.choce_area')) {
        popup.style.display = 'none';
    }
};

function toggleStar(button) {
    const starIcon = button.querySelector('.star-icon');
    if (starIcon.src.includes('btn_star_off.png')) {
        starIcon.src = contextPath + '/img/btn_star_on.png';
    } else {
        starIcon.src = contextPath + '/img/btn_star_off.png';
    }
}
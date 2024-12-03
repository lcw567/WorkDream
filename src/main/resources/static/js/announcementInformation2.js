let contextPath = ""
const data = {
    form: {
        workdream: "워크드림 프로필로 간편 지원",
        title: "",
        introduction: "",
        major: "",
        qualification: "",
        preferential: "",
        recruitment: "",
        other: "",
        period_time_min: "",
        period_time_max: "",
        qualification: [],
        applicants_preferential: [],
        information: [],
    },
    dutyList: [],
    tmpDyty: {
        rank: "",
        position: "",
        employment_type: "정규직",
        career_type: "경력 무관",
        career_year_min: "",
        career_year_max: "",
        academic: "학력무관",
        work_days: "주 5일",
        work_time_min: "",
        work_time_max: "",
        expected_salary_min: "",
        expected_salary_max: "",
        locationList: [],
        industryList: [],
        skillList: [],
        company_type: "대기업",
        companyList: [],
        employment_status: "재직무관",
    },
}

function init(path) {
    contextPath = path;

    const titleInput = document.getElementById('Announcement_Title');
    titleInput.addEventListener('keyup', function (event) {
        checkTextLength(event);
        changeValue('title', event.target.value);
    });

    // 모든 input[type=radio]를 선택
    const radioList = document.querySelectorAll("#Job_Position_content input[type=radio]");
    // 각 라디오 버튼에 onchange 이벤트 등록
    for (let r of radioList) {
        r.onchange = function (ev) {
            const radioButton = ev.target;

            // 라디오 버튼의 name 속성을 기반으로 tmpDyty의 key에 값 업데이트
            data.tmpDyty[radioButton.name] = radioButton.value;
            console.log(data)
        }
    }

    addPopupEvent();

};

function addPopupEvent() {
    // 공통 함수: 입력 필드 생성 및 처리
    function createInputHandler(container, placeholderText, wrapperClass, key) {
        return function () {
            const wrapper = document.createElement('div');
            wrapper.classList.add(wrapperClass);

            const inputField = document.createElement('input');
            inputField.setAttribute('placeholder', placeholderText);
            inputField.style.border = 'none';
            inputField.style.backgroundColor = 'transparent';
            inputField.style.color = 'white';
            inputField.style.fontSize = '14px';

            const deleteButton = document.createElement('button');
            deleteButton.textContent = 'x';
            deleteButton.classList.add('delete-btn');

            deleteButton.addEventListener('click', () => {
                if (wrapper.parentNode) {
                    removeListValue(key, wrapper.childNodes[0].innerText);
                    wrapper.parentNode.removeChild(wrapper);
                }
            });

            const confirmInput = () => {
                const enteredText = inputField.value.trim();
                if (!enteredText) {
                    alert(`${placeholderText}를 입력해주세요.`);
                    inputField.focus();
                    return;
                }

                const isDuplicate = Array.from(container.querySelectorAll(`.${wrapperClass} p`)).some(
                    (p) => p.textContent.trim() === enteredText
                );

                if (isDuplicate) {
                    alert(`${enteredText}는 이미 추가된 ${placeholderText}입니다. 다른 값을 입력해주세요.`);
                    inputField.focus();
                    return;
                }

                wrapper.innerHTML = '';
                const textContent = document.createElement('p');
                textContent.textContent = enteredText;

                wrapper.appendChild(textContent);
                wrapper.appendChild(deleteButton);

                addListValue(key, enteredText);
            };

            inputField.addEventListener('keypress', (event) => {
                if (event.key === 'Enter') {
                    event.preventDefault();
                    console.log(event.target)
                    confirmInput();
                }
            });

            wrapper.appendChild(inputField);
            wrapper.appendChild(deleteButton);
            container.appendChild(wrapper);

            inputField.focus();
        };
    }

    const workLocationAddressButton = document.querySelector('.Work_Location_Address');
    const locationContainer = document.getElementById('location-container');
    workLocationAddressButton.addEventListener(
        'click',
        createInputHandler(locationContainer, '지역', 'Work_Location', "locationList")
    );

    const industryCategoryButton = document.querySelector('.Industry_Category');
    const industryContainer = document.getElementById('industry-container');
    industryCategoryButton.addEventListener(
        'click',
        createInputHandler(industryContainer, '업종', 'Industry_Type', "industryList")
    );

    const addCompanyButton = document.querySelector('.add-company-btn');
    const companyContainer = document.getElementById('company-container');
    addCompanyButton.addEventListener(
        'click',
        createInputHandler(companyContainer, '기업명', 'Company_Type', "companyList")
    );

    const skillSearchInput = document.getElementById('Skill_Search_Keyward');
    const skillContainer = document.getElementById('skill-container');

    skillSearchInput.addEventListener('keypress', function (event) {
        if (event.key === 'Enter') {
            event.preventDefault();
            const keyword = skillSearchInput.value.trim();

            if (keyword !== '') {
                const isDuplicate = Array.from(skillContainer.querySelectorAll('h2')).some(
                    (element) => element.textContent.trim() === keyword
                );

                if (isDuplicate) {
                    alert('중복된 키워드입니다.');
                    skillSearchInput.value = '';
                    return;
                }

                const skillSearchContent = document.createElement('div');
                skillSearchContent.classList.add('Skill_Search_Contant');

                const icon = document.createElement('img');
                icon.src = contextPath + '/img/icons8-done-24.png';

                const h2 = document.createElement('h2');
                h2.textContent = keyword;

                const deleteButton = document.createElement('button');
                deleteButton.textContent = '×';
                deleteButton.addEventListener('click', function () {
                    removeListValue("skillList", keyword);
                    skillContainer.removeChild(skillSearchContent);
                });

                skillSearchContent.appendChild(icon);
                skillSearchContent.appendChild(h2);
                skillSearchContent.appendChild(deleteButton);

                skillContainer.appendChild(skillSearchContent);

                skillSearchInput.value = '';

                addListValue("skillList", keyword);
            }
        }
    });
}

// 파일 첨부 처리
function changeFile(fileInput) {
    const fileNameInput = document.getElementById("Announcement_Introduction_fileName");
    const imagePreviewDiv = document.getElementById("Announcement_Introduction_img");
    const defaultImage = imagePreviewDiv.querySelector("img");

    const file = fileInput.files[0];
    if (file) {
        fileNameInput.value = file.name;
        const reader = new FileReader();
        reader.onload = function (e) {
            defaultImage.classList.add("hidden");

            const img = document.createElement("img");
            img.src = e.target.result;
            img.classList.add("uploaded-image");
            img.alt = "미리보기 이미지";

            imagePreviewDiv.innerHTML = "";
            imagePreviewDiv.appendChild(img);
        };
        reader.readAsDataURL(file);
    }
}

// 제목 글자수 제한
function checkTextLength(ev) {
    const announcementTitle = ev.target;
    const maxLength = 25;
    const currentLength = announcementTitle.value.length;

    if (currentLength > maxLength) {
        announcementTitle.value = announcementTitle.value.substring(0, maxLength);
        alert("제목은 25자 이내로 입력해주세요.");
    }

    const charCountElement = document.getElementById("charCount");
    charCountElement.innerHTML = `현재 글자 수: ${currentLength}/${maxLength}`;
}

// 모든 라디오 버튼의 변경 이벤트 처리
document.querySelectorAll('input[type="radio"]').forEach((radio) => {
    radio.addEventListener('change', (event) => {
        console.log(`선택된 값: ${event.target.value}`);
    });
});

document.querySelectorAll('input[name="Career_Type"]').forEach((radio) => {
    radio.addEventListener('change', (event) => {
        console.log(`선택된 경력: ${event.target.value}`);
    });
});

document.querySelectorAll('input[name="workdream"]').forEach((radio) => {
    radio.addEventListener('change', (event) => {
        console.log(`선택된 경력: ${event.target.value}`);
    });
});

document.querySelectorAll('input[type="radio"]').forEach((radio) => {
    radio.addEventListener('change', (event) => {
        const groupName = event.target.name;
        const selectedValue = event.target.value;
        console.log(`그룹 "${groupName}"에서 선택된 값: ${selectedValue}`);
    });
});


function openModal() {
    const modal = document.querySelector('.modal');
    modal.style.display = 'block';
}

function closeModal() {
    const modal = document.querySelector('.modal');
    modal.style.display = 'none';

    //값을 가져와서 그려주기 data.dutyList에 추가
    data.dutyList.push(data.tmpDyty)
    data.tmpDyty = {
        rank: "",
        position: "",
        employment_type: "정규직",
        career_type: "경력 무관",
        career_year_min: "",
        career_year_max: "",
        academic: "학력무관",
        work_days: "주 5일",
        work_time_min: "",
        work_time_max: "",
        expected_salary_min: "",
        expected_salary_max: "",
        locationList: [],
        industryList: [],
        skillList: [],
        company_type: "대기업",
        companyList: [],
        employment_status: "재직무관",
    },

        console.log(data.dutyList)
    $("#Job_Position_content").html(`<div class="Position_And_Career">
                    <div class="radio_label">
						<div class="Position_And_Career_Title">
							<h2>직급 및 직책</h2>
							<b>
								<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
							</b>
						</div>

						<div id="Rank_And_Position">
							<input type="text" id="Rank" name="Rank"
								placeholder="직급을 선택해 주세요."
								onkeyup="changeValue('rank', this.value)"> <input
								type="text" id="Position" name="Position"
								placeholder="직책을 선택해 주세요."
								onkeyup="changeValue('position', this.value)">
						</div>

						<div class="Position_And_Career_Title">
							<h2>고용 형태</h2>
							<b>
								<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
							</b>
						</div>

						<div id="Employment_Type">
							<div>
								<input type="radio" id="fullTime" name="employment_type"
									value="정규직" checked /> <label for="fullTime">정규직</label>
							</div>
							<div>
								<input type="radio" id="contract" name="employment_type"
									value="계약직" /> <label for="contract">계약직</label>
							</div>
						</div>


						<div class="Position_And_Career_Title">
							<h2>경력</h2>
							<b>
								<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
							</b>
						</div>

						<div id="Career">
							<div>
								<input type="radio" id="Newcomer" name="career_type" value="신입">
								<label for="Newcomer">신입</label>
							</div>
							<div>
								<input type="radio" id="Work_History" name="career_type"
									value="경력"> <label for="Work_History">경력</label>
							</div>
							<div>
								<input type="radio" id="Regardless_Of_Experience"
									name="career_type" value="경력 무관" checked> <label
									for="Regardless_Of_Experience">경력 무관</label>
							</div>
						</div>

						<div id="Career_Year">
							<input type="text" class="Career_Year_Min" name="career_year_min"
								placeholder="최소"
								onkeyup="changeValue('career_year_min', this.value)">
							<p style="font-size: 0.9rem; font-weight: 700;">~</p>
							<input type="text" class="Career_Year_Max" name="career_year_max"
								placeholder="최대"
								onkeyup="changeValue('career_year_max', this.value)">
							<p style="font-size: 0.9rem; font-weight: 700;">년차</p>
						</div>

						<div class="Position_And_Career_Title">
							<h2>학력</h2>
							<b>
								<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
							</b>
						</div>

						<div id="Education">
							<div>
								<input type="radio" id="Academic" name="academic" value="학력무관"
									checked> <label for="Academic">학력무관</label>
							</div>
							<div>
								<input type="radio" id="High_School_Graduate" name="academic"
									value="고등학교 졸업"> <label for="High_School_Graduate">고등학교
									졸업</label>
							</div>
							<div>
								<input type="radio" id="College_Graduate2" name="academic"
									value="대학졸업(2,3년)"> <label for="College_Graduate2">대학졸업(2,3년)</label>
							</div>
							<div>
								<input type="radio" id="College_Graduate4" name="academic"
									value="대학졸업(4년)"> <label for="College_Graduate4">대학졸업(4년)</label>
							</div>
							<div>
								<input type="radio" id="University_Master_Graduate"
									name="academic" value="대학원 석사졸업"> <label
									for="University_Master_Graduate">대학원 석사졸업</label>
							</div>
							<div>
								<input type="radio" id="PhD_Graduate" name="academic"
									value="대학원 박사졸업"> <label for="PhD_Graduate">대학원
									박사졸업</label>
							</div>
						</div>

						<div class="Position_And_Career_Title">
							<h2>근무요일</h2>
							<b>
								<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
							</b>
						</div>

						<div id="Work_Days">
							<div>
								<input type="radio" id="6-Day_Work_Week" name="work_days"
									value="주 6일"> <label for="6-Day_Work_Week">주 6일</label>
							</div>
							<div>
								<input type="radio" id="5-Day_Work_Week" name="work_days"
									value="주 5일" checked> <label for="5-Day_Work_Week">주
									5일</label>
							</div>
							<div>
								<input type="radio" id="4-Day_Work_Week" name="work_days"
									value="주 4일"> <label for="4-Day_Work_Week">주 4일</label>
							</div>
							<div>
								<input type="radio" id="3-Day_Work_Week" name="work_days"
									value="주 3일"> <label for="3-Day_Work_Week">주 3일</label>
							</div>
							<div>
								<input type="radio" id="2-Day_Work_Week" name="work_days"
									value="주 2일"> <label for="2-Day_Work_Week">주 2일</label>
							</div>
							<div>
								<input type="radio" id="1-Day_Work_Week" name="work_days"
									value="주 1일"> <label for="1-Day_Work_Week">주 1일</label>
							</div>
							<div>
								<input type="radio" id="Negotiable_Work" name="work_days"
									value="협의,스케줄 근무"> <label for="Negotiable_Work">협의,스케줄
									근무</label>
							</div>
						</div>
                    </div>
						<div class="Position_And_Career_Title">
							<h2>근무시간</h2>
							<b>
								<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
							</b>
						</div>

						<div id="Wark_Time" style="margin-bottom: 5px;">
							<input type="time" class="Wark_Time_Min"
								onchange="changeValue('work_time_min', this.value)">
							<p style="font-size: 0.9rem; font-weight: 900;">~</p>
							<input type="time" class="Wark_Time_Min"
								onchange="changeValue('work_time_max', this.value)">
							<p style="font-size: 0.9rem; font-weight: 700;">까지</p>
						</div>

						<div style="display: flex; margin-bottom: 10px; margin-top: 5px;">
							<!-- 협의, 스케쥴 근무 -->
							<label class="unstyled-label"> <input type="checkbox"
								style="font-weight: 900; font-size: 15px;">
								<p style="font-size: 12px; font-weight: 600; margin: 0;">협의,
									스케쥴 근무</p>
							</label>
						</div>

						<div class="Position_And_Career_Title">
							<h2>예상연봉</h2>
							<b>
								<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
							</b>
						</div>

						<div id="Expected_Salary" style="margin-bottom: 0px;">
							<input type="text" class="Expected_Salary_Min"
								name="expected_salary_min" placeholder="최소"
								onkeyup="changeValue('expected_salary_min', this.value)">
							<p style="font-size: 0.9rem; font-weight: 900;">~</p>
							<input type="text" class="Expected_Salary_Max"
								name="expected_salary_max" placeholder="최대"
								onkeyup="changeValue('expected_salary_max', this.value)">
							<p style="font-size: 0.9rem; font-weight: 900;">만원</p>
						</div>

						<div style="display: flex; margin-bottom: 10px; margin-top: 5px;">
							<!-- 채용시 협의 -->
							<label class="unstyled-label"> <input type="checkbox"
								name="" style="font-weight: 900; font-size: 15px;">
								<p style="font-size: 12px; font-weight: 600; margin: 0;">채용시
									협의</p>
							</label>
						</div>

						<div class="Position_And_Career_Title">
							<h2>근무지 주소</h2>
							<b>
								<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
							</b>
						</div>

						<div style="display: flex;">
							<button class="Work_Location_Address">
								<img
									src="${contextPath}/img/free-icon-plus-3524388.png">
								<p>지역 선택</p>
							</button>
							<div id="location-container">
								<!-- 새로운 Work_Location 버튼이 추가될 곳 -->
							</div>
						</div>

						<div class="Position_And_Career_Title">
							<h2
								style="font-size: 1.5rem; font-weight: 900; margin-bottom: 20px;">선호
								경력</h2>
						</div>

						<div class="Position_And_Career_Title">
							<h2>업종</h2>
							<b>
								<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
							</b>
						</div>

						<div style="display: flex;">
							<button class="Industry_Category">
								<img
									src="${contextPath}/img/free-icon-plus-3524388.png">
								<p>업종 추가</p>
							</button>
							<div id="industry-container">
								<!-- 새로운 Industry_Type 버튼이 추가될 곳 -->
							</div>
						</div>


						<div class="Position_And_Career_Title">
							<h2>전문분야 및 스킬</h2>
							<b>
								<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
							</b>
						</div>

						<div id="Skill_Search">
							<img
								src="${contextPath}/img/icons8-search-24.png"
								id="search_Icon"> <img
								src="${contextPath}/img/icons8-vertical-line-16.png"
								id="Vertical_Line"> <input type="text"
								placeholder="키워드로 전문분야 - 스킬을 검색하세요" id="Skill_Search_Keyward">
						</div>

						<p style="font-size: 0.8rem; color: #656565;">추천 스킬을 선택해보세요</p>

						<div id="skill-container">
							<!-- 키워드가 추가될 곳 -->
						</div>


						<hr>

						<div class="Position_And_Career_Title"
							style="margin-top: 20px; margin-bottom: 30px;">
							<h2 style="font-size: 1.5rem;">선호 기업</h2>
						</div>

						<div class="Position_And_Career_Title" style="margin-bottom: 0px;">
							<h2>기업 유형</h2>
						</div>
						<p style="color: #656565; margin-top: 5px; margin-bottom: 20px;">특정
							기업 유형의 과거•현재 재직자에게 우선적으로 노출하고 싶다면 입력해주세요</p>

                    <div class="radio_label">
						<div id="Business_Type">
							<div>
								<input type="radio" id="Enterprise" name="company_type"
									value="대기업" checked> <label for="Enterprise">대기업</label>
							</div>
							<div>
								<input type="radio" id="Medium-sized_Enterprise"
									name="company_type" value="중견기업"> <label
									for="Medium-sized_Enterprise">중견기업</label>
							</div>
							<div>
								<input type="radio" id="Small_and_Medium_Enterprise"
									name="company_type" value="중소기업"> <label
									for="Small_and_Medium_Enterprise">중소기업</label>
							</div>
							<div>
								<input type="radio" id="Startup" name="company_type"
									value="스타트업"> <label for="Startup">스타트업</label>
							</div>
							<div>
								<input type="radio" id="Foreign_Company" name="company_type"
									value="외국계기업"> <label for="Foreign_Company">외국계기업</label>
							</div>
						</div>

						<div class="Position_And_Career_Title" style="margin-bottom: 0px;">
							<h2>특정기업</h2>
						</div>
						<p style="color: #656565; margin-top: 5px; margin-bottom: 20px;">특정
							기업의 과거•현재 재직자에게 우선적으로 노출하고 싶다면 입력해주세요</p>

						<div style="display: flex;">
							<button class="add-company-btn">
								<img
									src="${contextPath}/img/free-icon-plus-3524388.png">
								<p>기업 추가</p>
							</button>
							<div id="company-container">
								<!-- 새로운 Company_Type 버튼이 추가될 곳 -->
							</div>
						</div>

						<div id="Employment_Status_with_Preferred_Company">
							<div class="Position_And_Career_Title">
								<h2>선호 기업에 대한 재직 여부</h2>
								<b>
									<p style="color: #FE0000; font-size: 18px; font-weight: 900;">*</p>
								</b>
							</div>

							<div style="display: flex; justify-content: space-between;">
								<div class="Currently_Employed">
									<div class="Employment_Status">
										<div>
											<input type="radio" id="Currently_Employed"
												name="employment_status" value="재직중"> <label
												for="Currently_Employed">재직중</label>
										</div>
									</div>

									<p style="margin-left: 35px;">기업 유형•특정 기업의 재직자를 타겟팅합니다</p>
								</div>

								<div class="Currently_Employed">
									<div class="Employment_Status">
										<div>
											<input type="radio" id="Regardless_Of_Employment"
												name="employment_status" value="재직무관" checked> <label
												for="Regardless_Of_Employment">재직무관</label>
										</div>
									</div>

									<p style="margin-left: 35px;">과거•현재 재직자를 함께 타겟팅합니다</p>
								</div>
							</div>
						</div>
                    </div>
						<div
							style="width: 89%; display: flex; margin-top: 15px; justify-content: end;">
							<button id="Confirm" class="close_btn" onclick="closeModal()">확인</button>
						</div>

					</div>`)

    addPopupEvent();
    drawDutyList();
}

document.getElementById("addDutyButton").addEventListener("click", function () {
    const dutyListArea = document.getElementById("duty-list-area");

    if (!dutyListArea) {
        console.error("dutyListArea 요소를 찾을 수 없습니다.");
        return;
    }

    // 현재 추가된 직무 개수 확인
    const renderedDuties = Array.from(dutyListArea.children).length;

    if (renderedDuties >= 5) {
        // 최대 개수 초과 시 경고를 표시하고 추가를 막음
        alert(`최대 5개의 직무만 추가할 수 있습니다.`);
        return; // 동작 중단
    } else {
        // 직무 개수가 초과되지 않았을 때만 모달 호출
        openModal();
    }
});

function drawDutyList() {
    //duty-list-area에다가 list에 있는 정보로
    /*
    <div class="Job_duty"> 
                                    <p style="color: white; font-size: 12px; font-weight: 600;"
                                        class="Job_duty_p">~~sdvsdv ~~년</p>
                                    <button style="background: #4E21A8; border: none">
                                        <img
                                            src="${pageContext.request.contextPath}/img/letter-x_9215129.png"
                                            style="width: 25px; height: 26px; margin-top: 2px;">
                                    </button>
                                </div>
                                넣어주기
    */
    //data .dutyList를 이용해서 화면에 그려주기
    const dutyListArea = document.getElementById("duty-list-area");

    if (!dutyListArea) {
        console.error("dutyListArea 요소를 찾을 수 없습니다.");
        return;
    }


    // dutyListArea 초기화 (기존 내용을 유지하려면 이 부분 수정 필요)
    dutyListArea.innerHTML = "";

    // dutyList를 기준으로 화면에 추가
    data.dutyList.forEach((duty, index) => {
        const formattedText = `
         직급: ${duty.rank || "없음"} /
         직책: ${duty.position || "없음"} /
         고용 형태: ${duty.employment_type || "없음"} /
         경력: ${duty.career_type || "없음"} (${duty.career_year_min || "0"}년 ~ ${duty.career_year_max || "0"}년) /
         학력: ${duty.academic || "없음"} /
         근무일: ${duty.work_days || "없음"} /
         근무 시간: ${duty.work_time_min || "없음"} ~ ${duty.work_time_max || "없음"} /
         예상 연봉: ${duty.expected_salary_min || "없음"} ~ ${duty.expected_salary_max || "없음"} /
         근무 지역: ${duty.locationList.join(", ") || "없음"} /
         업종: ${duty.industryList.join(", ") || "없음"} /
         기술: ${duty.skillList.join(", ") || "없음"} /
         회사 형태: ${duty.company_type || "없음"} /
         회사명: ${duty.companyList.join(", ") || "없음"} /
         재직 상태: ${duty.employment_status || "없음"}
     `.trim();

        const jobDutyDiv = document.createElement("div");
        jobDutyDiv.classList.add("Job_duty");
        jobDutyDiv.dataset.index = index;

        const jobDutyText = document.createElement("p");
        jobDutyText.classList.add("Job_duty_p");
        jobDutyText.style.color = "white";
        jobDutyText.style.fontSize = "12px";
        jobDutyText.style.fontWeight = "600";
        jobDutyText.style.textOverflow = "ellipsis";
        jobDutyText.style.overflow = "hidden";
        jobDutyText.style.whiteSpace = "nowrap";
        jobDutyText.textContent = formattedText;

        const deleteButton = document.createElement("button");
        deleteButton.style.background = "#4E21A8";
        deleteButton.style.border = "none";
        deleteButton.style.height = "30px";
        deleteButton.style.display = "flex";
        deleteButton.style.alignItems = "center";

        const deleteImg = document.createElement("img");
        deleteImg.src = `${contextPath}/img/letter-x_9215129.png`;
        deleteImg.style.width = "25px";
        deleteImg.style.height = "25px";

        deleteButton.appendChild(deleteImg);

        // 삭제 버튼 클릭 이벤트
        deleteButton.addEventListener("click", () => {
            data.dutyList.splice(index, 1); // 데이터에서 삭제
            drawDutyList(); // 리스트 다시 그리기
        });

        jobDutyDiv.appendChild(jobDutyText);
        jobDutyDiv.appendChild(deleteButton);

        // dutyListArea에 추가
        dutyListArea.appendChild(jobDutyDiv);
    });
}



function collectData() {
    const data = {
        title: document.getElementById('Announcement_Title').value,
        description: document.querySelector('textarea[placeholder="회사나 제품 / 서비스 또는 공고에 대한 소개를 작성해주세요."]').value,
        mainDuties: document.querySelector('textarea[placeholder="해당 포지션에서 어떤 업무를 하는지 작성해주세요."]').value,
        qualifications: document.querySelector('textarea[placeholder="업무상 꼭 필요한 필수 요건을 작성해 주세요."]').value,
        preferences: document.querySelector('textarea[placeholder="우대하는 요건을 작성해 주세요."]').value,
        process: document.querySelector('textarea[placeholder="서류 전형, 면접 등 채용 절차를 작성해 주세요."]').value,
        otherInfo: document.querySelector('textarea[placeholder="복지 및 해택 등 알리고 싶은 기타 정보를 작성합니다."]').value,
        postStartTime: document.getElementById('Post_First_Time').value,
        postEndTime: document.getElementById('Post_End_Time').value,
        workdreamApplied: document.querySelector('input[name="workdream"]:checked').value,
    };
    return data;
}

function sendData() {
    const data = collectData();

    fetch('http://localhost:3333/WorkDream/business/announcementInformation2', { // 서버 URL
        method: 'POST', // HTTP 메서드 (POST, GET 등)
        headers: {
            'Content-Type': 'application/json', // JSON 형식으로 전송
        },
        body: JSON.stringify(data), // 데이터를 JSON 형식으로 변환하여 전송
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok ' + response.statusText);
            }
            return response.json(); // JSON 형식으로 응답 처리
        })
        .then(data => {
            console.log('Success:', data); // 성공 시 응답 처리
            alert('임시저장 되었습니다!');
        })
        .catch(error => {
            console.error('Error:', error); // 에러 처리
        });

}

document.getElementById('TemporarySave').addEventListener('click', () => {
    sendData();
});

function addListValue(key, value) {
    data.tmpDyty[key].push(value);
}

function removeListValue(key, value) {
    data.tmpDyty[key] = data.tmpDyty[key].filter(v => v !== value);
}

function changeValue(key, value) {
    console.log(data.tmpDyty);
    data.tmpDyty[key] = value;
}
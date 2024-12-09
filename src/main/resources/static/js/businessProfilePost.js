document.addEventListener('DOMContentLoaded', () => {
    // 대표 기업 로고 이미지 미리보기
    const companyLogoInput = document.getElementById('company-logo');
    const logoPreview = document.getElementById('logo-preview');

    companyLogoInput.addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (file && file.type.startsWith('image/')) {
            const reader = new FileReader();
            reader.onload = function(e) {
                logoPreview.src = e.target.result;
                logoPreview.style.display = 'block';
            }
            reader.readAsDataURL(file);
        } else {
            logoPreview.src = '#';
            logoPreview.style.display = 'none';
        }
    });

    const benefitsInput = document.getElementById('benefits-input');
    const benefitsList = document.getElementById('benefits-list');

    benefitsInput.addEventListener('keypress', function(event) {
        if (event.key === 'Enter') {
            event.preventDefault();
            const benefitText = benefitsInput.value.trim();
            if (benefitText !== '') {
                // 중복 확인
                const existingBenefits = [...benefitsList.children].map(child => child.textContent.replace('×', '').trim());
                if (!existingBenefits.includes(benefitText)) {
                    const benefitItem = document.createElement('span');
                    benefitItem.classList.add('benefit-item');
                    benefitItem.textContent = benefitText;

                    const removeBtn = document.createElement('button');
                    removeBtn.classList.add('remove-benefit');
                    removeBtn.textContent = '×';
                    removeBtn.addEventListener('click', () => {
                        benefitsList.removeChild(benefitItem);
                    });

                    benefitItem.appendChild(removeBtn);
                    benefitsList.appendChild(benefitItem);
                    benefitsInput.value = '';
                } else {
                    alert('이미 추가된 복리후생 항목입니다.');
                }
            }
        }
    });

    // 기존 복리후생 항목에 삭제 버튼 이벤트 추가
    const existingBenefitItems = benefitsList.querySelectorAll('.benefit-item');
    existingBenefitItems.forEach(item => {
        const removeBtn = item.querySelector('.remove-benefit');
        removeBtn.addEventListener('click', () => {
            benefitsList.removeChild(item);
        });
    });

    // 이미지 클릭 시 파일 선택창 오픈 & 이미지 미리보기
    const imageItems = document.querySelectorAll('.image-item');
    imageItems.forEach(item => {
        const img = item.querySelector('.add-icon');
        const fileInput = item.querySelector('.hidden-file-input');

        img.addEventListener('click', () => {
            fileInput.click();
        });

        fileInput.addEventListener('change', (event) => {
            const file = event.target.files[0];
            if (file && file.type.startsWith('image/')) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    img.src = e.target.result;
                }
                reader.readAsDataURL(file);
            } else {
                img.src = window.contextPath + "/img/add-image.png"; // 기본 이미지로 복귀
            }
        });
    });

    // 이미지 제목 입력란에서 엔터키 막기
    document.querySelectorAll('.photo-title').forEach(input => {
        input.addEventListener('keydown', function(e) {
            if(e.key === 'Enter') {
                e.preventDefault(); // 폼 제출 막기
            }
        });
    });

    // 등록 버튼 클릭 핸들러
    const registerButton = document.querySelector('.register-btn');
    registerButton.addEventListener('click', () => {
        const form = document.getElementById('business-form');
        const formData = new FormData(form);

        // 복리후생 목록 수집
        const benefits = [];
        const benefitItems = benefitsList.querySelectorAll('.benefit-item');
        benefitItems.forEach(item => {
            const benefitText = item.textContent.replace('×', '').trim();
            if (benefitText !== '') {
                benefits.push(benefitText);
            }
        });
        formData.append('benefits', JSON.stringify(benefits));

        // 기존/신규 이미지 분리 처리
        const allImageItems = document.querySelectorAll('.image-item');
        const existingImageIdInputs = document.querySelectorAll('input[name="existingImageIds"]');
        const existingCount = existingImageIdInputs.length;

        // 기존 이미지 제목 배열
        const existingTitles = [];
        // 신규 이미지 제목 배열
        const newTitles = [];

        // 먼저 existingImageIds가 있는 이미지들을 순서대로 처리
        let existingIdx = 0;
        allImageItems.forEach(item => {
            const titleInput = item.querySelector('.photo-title');
            const fileInput = item.querySelector('.hidden-file-input');
            const existingImageIdInput = item.querySelector('input[name="existingImageIds"]');

            if (existingImageIdInput !== null) {
                // 이 슬럿은 기존 이미지
                const title = titleInput.value.trim();
                existingTitles.push(title);
                existingIdx++;
            } else {
                // 이 슬럿은 신규 이미지
                // 신규 이미지가 실제로 업로드 되었거나(파일 있음), 제목이 있다면 반영
                // 여기서는 파일이 없어도 제목만 있으면 반영할 수도 있음
                // 하지만 서버로직에 맞추어 파일이 있어야 new 이미지로 인식하므로
                // fileInput.files.length > 0인 경우에만 신규 이미지로 처리
                if (fileInput.files.length > 0) {
                    const title = titleInput.value.trim();
                    newTitles.push(title);
                }
            }
        });

        // 기존 이미지 IDs 추가
        existingImageIdInputs.forEach(input => {
            formData.append('existingImageIds', input.value);
        });

        // 신규 이미지의 경우 파일이 이미 formData에 name="newWorkEnvironmentFiles"로 자동 들어감
        // 지금은 제목만 처리하면 됨.

        // 최종 배열: 기존 이미지 제목들 + 신규 이미지 제목들
        const workEnvImageTitles = [...existingTitles, ...newTitles];
        formData.append('workEnvImageTitles', JSON.stringify(workEnvImageTitles));

        // 삭제할 이미지 IDs 수집
        const deleteImageIdInputs = document.querySelectorAll('input[name="deleteImageIds"]:checked');
        deleteImageIdInputs.forEach(input => {
            formData.append('deleteImageIds', input.value);
        });

        // 디버깅 로그
        console.log("Context Path:", window.contextPath);
        const url = window.contextPath + "/business/register";
        console.log("AJAX URL:", url);
        console.log("Form Data Entries:");
        for (let pair of formData.entries()) {
            console.log(`${pair[0]}: ${pair[1]}`);
        }

        // AJAX 요청 전송
        fetch(url, {
            method: 'POST',
            body: formData
        })
        .then(response => {
            if (response.ok) {
                return response.text();
            }
            throw new Error('네트워크 응답이 정상적이지 않습니다.');
        })
        .then(data => {
            // 응답으로 받은 URL로 리다이렉트
            window.location.href = data;
        })
        .catch(error => {
            console.error('오류:', erraor);
            alert('기업 정보 등록 중 오류가 발생했습니다.');
        });
    });
});

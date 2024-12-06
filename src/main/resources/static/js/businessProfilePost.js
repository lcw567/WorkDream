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

    // 사내 근무 환경 이미지 첨부 및 변경
    const imageItems = document.querySelectorAll('.image-item');

    imageItems.forEach(item => {
        const img = item.querySelector('.add-icon');
        const fileInput = item.querySelector('.hidden-file-input');
        const photoTitleInput = item.querySelector('.photo-title');

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
            if (benefitText !== '') { // 빈 문자열 필터링
                benefits.push(benefitText);
            }
        });
        formData.append('benefits', JSON.stringify(benefits));

        // 근무 환경 이미지 제목 수집
        const workEnvImageTitles = [];
        const imageItems = document.querySelectorAll('.image-item');
        imageItems.forEach(item => {
            const titleInput = item.querySelector('.photo-title');
            const fileInput = item.querySelector('.hidden-file-input');
            const img = item.querySelector('.add-icon');
            const isExistingImage = item.querySelector('input[name="existingImageIds"]') !== null;

            // 기존 이미지 또는 새로운 이미지 여부 확인
            if (fileInput.files.length > 0 || (!fileInput.files.length && isExistingImage && img.src !== window.contextPath + "/img/add-image.png")) {
                const title = titleInput.value.trim();
                workEnvImageTitles.push(title);
            }
        });
        formData.append('workEnvImageTitles', JSON.stringify(workEnvImageTitles));

        // 기존 이미지 IDs 수집 및 개별 파라미터로 추가
        const existingImageIdInputs = document.querySelectorAll('input[name="existingImageIds"]');
        existingImageIdInputs.forEach(input => {
            formData.append('existingImageIds', input.value);
        });

        // 삭제할 이미지 IDs 수집 및 개별 파라미터로 추가
        const deleteImageIdInputs = document.querySelectorAll('input[name="deleteImageIds"]:checked');
        deleteImageIdInputs.forEach(input => {
            formData.append('deleteImageIds', input.value);
        });

        // 디버깅을 위한 로그 출력
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
            // 보기 페이지로 리다이렉트
            window.location.href = data;
        })
        .catch(error => {
            console.error('오류:', error);
            alert('기업 정보 등록 중 오류가 발생했습니다.');
        });
    });
});

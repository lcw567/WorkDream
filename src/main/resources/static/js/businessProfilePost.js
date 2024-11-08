document.addEventListener('DOMContentLoaded', () => {
    //  대표 기업 로고 이미지 미리보기
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
            }
        }
    });

    //  사내 근무 환경 이미지 첨부 및 변경
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
                img.src = 'img/add-image.png'; // 기본 이미지로 복귀
            }
        });
    });
});

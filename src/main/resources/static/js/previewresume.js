// previewresume.js

document.addEventListener("DOMContentLoaded", function () {
    const portfolioContainer = document.getElementById("portfolio-container");

    if (!resumeNo) {
        portfolioContainer.innerHTML = "<p>이력서 번호가 정의되지 않았습니다.</p>";
        return;
    }

    // 포트폴리오 데이터를 가져오는 함수
    function loadPortfolios() {
        fetch(`${contextPath}/resume/getPortfoliosByResumeNo?resumeNo=${resumeNo}`, {
            method: 'GET',
            credentials: 'same-origin' // 쿠키 포함
        })
        .then(response => {
            if (response.status === 401) {
                throw new Error("로그인이 필요합니다.");
            }
            if (!response.ok) {
                throw new Error("네트워크 응답에 문제가 있습니다.");
            }
            return response.json();
        })
        .then(portfolios => {
            portfolioContainer.innerHTML = ""; // 기존 내용을 초기화

            if (portfolios.length === 0) {
                portfolioContainer.innerHTML = "<p>등록된 포트폴리오가 없습니다.</p>";
            } else {
                const ul = document.createElement("ul");
                portfolios.forEach(portfolio => {
                    const li = document.createElement("li");
                    li.innerHTML = `<strong>제목:</strong> ${portfolio.title} <br>
                                    <strong>등록일:</strong> ${new Date(portfolio.createDate).toLocaleDateString()}`;
                    ul.appendChild(li);
                });
                portfolioContainer.appendChild(ul);
            }
        })
        .catch(error => {
            console.error("포트폴리오 데이터를 가져오는 중 오류 발생:", error);
            portfolioContainer.innerHTML = `<p>${error.message}</p>`;
        });
    }

    // 포트폴리오 데이터 로드
    loadPortfolios();
});

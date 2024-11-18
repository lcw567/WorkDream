document.addEventListener("DOMContentLoaded", function () {
    // 컨텍스트 경로 가져오기
    const contextPath = document.getElementById("contextPath").value;

    // URL 파라미터에서 기본 카테고리 가져오기
    const urlParams = new URLSearchParams(window.location.search);
    let currentCategory = urlParams.get('category') || '전체글';
    let currentPage = 1;
    const postsPerPage = 10;
    let currentFilter = "최신순";
    let currentJobFilter = ""; // 직무 필터 초기값

    // 초기 로드: 기본 카테고리, 정렬, 직무 필터에 따른 게시글 로드
    loadPosts(currentCategory, currentFilter, currentPage, currentJobFilter);

    // 제목 업데이트
    document.querySelector(".title h1").innerText = currentCategory;

    // 1. 카테고리 버튼 클릭 이벤트
    document.querySelectorAll('.category-tags button').forEach(button => {
        button.addEventListener('click', () => {
            currentCategory = button.innerText;
            document.querySelector('.title h1').innerText = currentCategory; // 상단 제목 변경
            currentPage = 1; // 페이지 리셋
            // URL 파라미터 업데이트
            const newUrl = `${window.location.pathname}?category=${encodeURIComponent(currentCategory)}`;
            window.history.pushState({ path: newUrl }, '', newUrl);
            loadPosts(currentCategory, currentFilter, currentPage, currentJobFilter);
        });
    });

    // 2. 정렬 필터 선택 이벤트
    document.querySelector('.filter-section select#sortFilter').addEventListener('change', (event) => {
        currentFilter = event.target.value;
        currentPage = 1; // 페이지 리셋
        loadPosts(currentCategory, currentFilter, currentPage, currentJobFilter);
    });

    // 3. 직무 필터 선택 이벤트
    document.querySelector('.filter-section select#jobFilter').addEventListener('change', (event) => {
        currentJobFilter = event.target.value;
        currentPage = 1; // 페이지 리셋
        loadPosts(currentCategory, currentFilter, currentPage, currentJobFilter);
    });

    // 4. 페이지네이션 버튼 이벤트
    document.getElementById('prevPage').addEventListener('click', () => {
        if (currentPage > 1) {
            currentPage--;
            loadPosts(currentCategory, currentFilter, currentPage, currentJobFilter);
        }
    });

    document.getElementById('nextPage').addEventListener('click', () => {
        currentPage++;
        loadPosts(currentCategory, currentFilter, currentPage, currentJobFilter);
    });

    // 5. 게시글 불러오기 함수
    function loadPosts(category, filter, page, jobFilter = "") {
        const offset = (page - 1) * postsPerPage;

        fetch(`${contextPath}/board/api/posts?category=${encodeURIComponent(category)}&filter=${encodeURIComponent(filter)}&jobFilter=${encodeURIComponent(jobFilter)}&offset=${offset}&limit=${postsPerPage}`)
            .then(response => response.json())
            .then(data => {
                console.log('Received data:', data); // 디버깅용 로그
                updatePostList(data.posts);
                updatePostCount(data.totalCount);
                updatePagination(data.totalCount);
            })
            .catch(error => console.error('Error loading posts:', error));
    }

    // 6. 게시글 목록 업데이트 함수
    function updatePostList(posts) {
        const tbody = document.querySelector('.post-list table tbody');
        tbody.innerHTML = ''; // 기존 내용 초기화

        if (posts.length === 0) {
            const row = document.createElement('tr');
            const cell = document.createElement('td');
            cell.colSpan = 7; // 필터 열 추가로 colspan 수정
            cell.innerText = '게시글이 없습니다.';
            row.appendChild(cell);
            tbody.appendChild(row);
        } else {
            posts.forEach(post => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${post.category}</td>
                    <td><a href="${contextPath}/board/communityView?postId=${post.postingNo}">${post.title}</a></td>
                    <td>${post.author}</td>
                    <td>${new Date(post.createdTime).toLocaleString()}</td>
                    <td>${post.viewCount}</td>
                    <td>${post.likeCount}</td>
                    <td>${post.jobCategories ? post.jobCategories.join(', ') : 'N/A'}</td>
                `;
                tbody.appendChild(row);
            });
        }
    }

    // 7. 게시글 수 업데이트 함수
    function updatePostCount(totalCount) {
        document.querySelector('.total-count strong').innerText = totalCount;
    }

    // 8. 페이지네이션 상태 업데이트 함수
    function updatePagination(totalCount) {
        const totalPages = Math.ceil(totalCount / postsPerPage);
        document.getElementById('pageNumber').innerText = currentPage;
        document.getElementById('prevPage').disabled = currentPage === 1;
        document.getElementById('nextPage').disabled = currentPage >= totalPages;
    }

    // 9. popstate 이벤트 처리 (브라우저 뒤로가기/앞으로가기 버튼)
    window.addEventListener('popstate', () => {
        const urlParams = new URLSearchParams(window.location.search);
        currentCategory = urlParams.get('category') || '전체글';
        currentPage = 1; // 페이지 리셋
        document.querySelector('.title h1').innerText = currentCategory;
        loadPosts(currentCategory, currentFilter, currentPage, currentJobFilter);
    });
});

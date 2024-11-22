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
    let currentSearchQuery = ""; // 검색어 초기값

    // 초기 로드: 기본 카테고리, 정렬, 직무 필터에 따른 게시글 로드
    loadPosts(currentCategory, currentFilter, currentPage, currentJobFilter, currentSearchQuery);

    // 제목 업데이트
    document.querySelector(".title h1").innerText = currentCategory;

    // 1. 카테고리 버튼 클릭 이벤트
    document.querySelectorAll('.category-tags button').forEach(button => {
        button.addEventListener('click', () => {
            currentCategory = button.innerText;
            currentSearchQuery = ""; // 카테고리 변경 시 검색어 초기화
            document.querySelector('.title h1').innerText = currentCategory; // 상단 제목 변경
            currentPage = 1; // 페이지 리셋
            // URL 파라미터 업데이트
            const newUrl = `${window.location.pathname}?category=${encodeURIComponent(currentCategory)}`;
            window.history.pushState({ path: newUrl }, '', newUrl);
            loadPosts(currentCategory, currentFilter, currentPage, currentJobFilter, currentSearchQuery);
        });
    });

    // 2. 정렬 필터 선택 이벤트
    document.querySelector('.filter-section select#sortFilter').addEventListener('change', (event) => {
        currentFilter = event.target.value;
        currentPage = 1; // 페이지 리셋
        loadPosts(currentCategory, currentFilter, currentPage, currentJobFilter, currentSearchQuery);
    });

    // 3. 직무 필터 선택 이벤트
    document.querySelector('.filter-section select#jobFilter').addEventListener('change', (event) => {
        currentJobFilter = event.target.value;
        currentPage = 1; // 페이지 리셋
        loadPosts(currentCategory, currentFilter, currentPage, currentJobFilter, currentSearchQuery);
    });

    // 4. 페이지네이션 버튼 이벤트
    document.getElementById('prevPage').addEventListener('click', () => {
        if (currentPage > 1) {
            currentPage--;
            loadPosts(currentCategory, currentFilter, currentPage, currentJobFilter, currentSearchQuery);
        }
    });

    document.getElementById('nextPage').addEventListener('click', () => {
        currentPage++;
        loadPosts(currentCategory, currentFilter, currentPage, currentJobFilter, currentSearchQuery);
    });

    // 5. 검색 버튼 클릭 이벤트
    document.getElementById('searchButton').addEventListener('click', () => {
        const query = document.getElementById('searchInput').value.trim();
        if (query === "") {
            alert("검색어를 입력해 주세요.");
            return;
        }
        currentSearchQuery = query;
        currentCategory = "전체글"; // 검색 시 전체글 카테고리로 설정
        document.querySelector('.title h1').innerText = `검색 결과: "${query}"`;
        currentPage = 1; // 페이지 리셋
        // URL 파라미터 업데이트
        const newUrl = `${window.location.pathname}?title=${encodeURIComponent(query)}`;
        window.history.pushState({ path: newUrl }, '', newUrl);
        loadPosts(currentCategory, currentFilter, currentPage, currentJobFilter, currentSearchQuery);
    });

    // 6. Enter 키로도 검색 가능하게 설정
    document.getElementById('searchInput').addEventListener('keypress', function (e) {
        if (e.key === 'Enter') {
            e.preventDefault();
            document.getElementById('searchButton').click();
        }
    });

    // 7. 게시글 불러오기 함수
    function loadPosts(category, filter, page, jobFilter = "", title = "") {
        const offset = (page - 1) * postsPerPage;
        let apiUrl = "";

        if (title !== "") {
            // 검색 모드
            apiUrl = `${contextPath}/board/api/searchPosts?title=${encodeURIComponent(title)}&offset=${offset}&limit=${postsPerPage}`;
        } else {
            // 일반 목록 모드
            apiUrl = `${contextPath}/board/api/posts?category=${encodeURIComponent(category)}&filter=${encodeURIComponent(filter)}&jobFilter=${encodeURIComponent(jobFilter)}&offset=${offset}&limit=${postsPerPage}`;
        }

        fetch(apiUrl)
            .then(response => response.json())
            .then(data => {
                console.log('Received data:', data); // 디버깅용 로그
                updatePostList(data.posts);
                updatePostCount(data.totalCount);
                updatePagination(data.totalCount, title);
            })
            .catch(error => console.error('Error loading posts:', error));
    }

    // 8. 게시글 목록 업데이트 함수
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
                    <td><a href="${contextPath}/board/communityView?postId=${post.postingNo}">${escapeHtml(post.category)}</a></td>
                    <td><a href="${contextPath}/board/communityView?postId=${post.postingNo}">${escapeHtml(post.title)}</a></td>
                    <td><a href="${contextPath}/board/communityView?postId=${post.postingNo}">${escapeHtml(post.author)}</a></td>
                    <td><a href="${contextPath}/board/communityView?postId=${post.postingNo}">${formatDate(post.createdTime)}</a></td>
                    <td><a href="${contextPath}/board/communityView?postId=${post.postingNo}">${post.viewCount}</a></td>
                    <td><a href="${contextPath}/board/communityView?postId=${post.postingNo}">${post.likeCount}</a></td>
                    <td><a href="${contextPath}/board/communityView?postId=${post.postingNo}">${post.jobCategories ? escapeHtml(post.jobCategories.join(', ')) : 'N/A'}</a></td>
                `;
                tbody.appendChild(row);
            });
        }
    }

    // 9. 게시글 수 업데이트 함수
    function updatePostCount(totalCount) {
        document.querySelector('.total-count strong').innerText = totalCount;
    }

    // 10. 페이지네이션 상태 업데이트 함수
    function updatePagination(totalCount, title = "") {
        const totalPages = Math.ceil(totalCount / postsPerPage);
        document.getElementById('pageNumber').innerText = currentPage;
        document.getElementById('prevPage').disabled = currentPage === 1;
        document.getElementById('nextPage').disabled = currentPage >= totalPages;
    }

    // 11. popstate 이벤트 처리 (브라우저 뒤로가기/앞으로가기 버튼)
    window.addEventListener('popstate', () => {
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('title')) {
            // 검색 모드
            currentSearchQuery = urlParams.get('title');
            currentCategory = "전체글"; // 검색 시 전체글 카테고리로 설정
            document.querySelector('.title h1').innerText = `검색 결과: "${currentSearchQuery}"`;
            loadPosts(currentCategory, currentFilter, currentPage, currentJobFilter, currentSearchQuery);
        } else {
            // 일반 목록 모드
            currentCategory = urlParams.get('category') || '전체글';
            currentSearchQuery = "";
            document.querySelector('.title h1').innerText = currentCategory;
            loadPosts(currentCategory, currentFilter, currentPage, currentJobFilter, currentSearchQuery);
        }
    });

    // 12. XSS 방지용 HTML 이스케이프 함수
    function escapeHtml(text) {
        if(!text) return '';
        const map = {
            '&': '&amp;',
            '<': '&lt;',
            '>': '&gt;',
            '"': '&quot;',
            "'": '&#039;'
        };
        return text.replace(/[&<>"']/g, function(m) { return map[m]; });
    } 

    // 13. 날짜 형식 지정 함수
    function formatDate(dateString) {
        const date = new Date(dateString);
        if(isNaN(date)) return 'Invalid Date';
        return date.toLocaleString();
    }

});

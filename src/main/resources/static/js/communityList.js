document.addEventListener("DOMContentLoaded", function () {
    // 컨텍스트 경로 가져오기
    const contextPath = document.getElementById("contextPath").value;

    // URL 파라미터에서 카테고리 가져오기
    const urlParams = new URLSearchParams(window.location.search);
    let currentCategory = urlParams.get('category') || '인기글';
    let currentPage = 1;
    const postsPerPage = 10;
    let currentFilter = "최신순";

    // 초기 로드: 기본 카테고리 및 필터에 따른 게시글 로드
    loadPosts(currentCategory, currentFilter, currentPage);

    // 제목 업데이트
    document.querySelector(".title h1").innerText = currentCategory;

    // 1. 카테고리 버튼 클릭 시 이벤트
    document.querySelectorAll('.category-tags button').forEach(button => {
        button.addEventListener('click', () => {
            currentCategory = button.innerText;
            document.querySelector('.title h1').innerText = currentCategory; // 상단 제목 변경
            currentPage = 1; // 페이지 리셋
            loadPosts(currentCategory, currentFilter, currentPage);
        });
    });

    // 2. 필터 옵션 선택 시 이벤트
    document.querySelector('.filter-section select#sortFilter').addEventListener('change', (event) => {
        currentFilter = event.target.value;
        currentPage = 1;
        loadPosts(currentCategory, currentFilter, currentPage);
    });

    // 3. 페이지네이션 버튼 이벤트
    document.getElementById('prevPage').addEventListener('click', () => {
        if (currentPage > 1) {
            currentPage--;
            loadPosts(currentCategory, currentFilter, currentPage);
        }
    });

    document.getElementById('nextPage').addEventListener('click', () => {
        currentPage++;
        loadPosts(currentCategory, currentFilter, currentPage);
    });
    
    // 4. 게시글 검색 버튼 이벤트 (추가 가능)

    // 5. 게시글 불러오기 함수
    function loadPosts(category, filter, page) {
        const offset = (page - 1) * postsPerPage;

        fetch(`${contextPath}/board/api/posts?category=${encodeURIComponent(category)}&filter=${encodeURIComponent(filter)}&offset=${offset}&limit=${postsPerPage}`)
            .then(response => response.json())
            .then(data => {
                updatePostList(data.posts);
                updatePostCount(data.totalCount);
                updatePagination(data.totalCount);
            })
            .catch(error => console.error('Error loading posts:', error));
    }

    // 6. 게시글 목록 업데이트 함수
    function updatePostList(posts) {
        const tbody = document.querySelector('.post-list tbody');
        tbody.innerHTML = '';

        posts.forEach(post => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${post.postingNo}</td>
                <td>${post.category}</td>
                <td><a href="${contextPath}/board/communityView?postId=${post.postingNo}">${post.title}</a></td>
                <td>${post.author}</td>
                <td>${new Date(post.createdTime).toLocaleString()}</td>
                <td>${post.viewCount}</td>
                <td>${post.likeCount}</td>
            `;
            tbody.appendChild(row);
        });
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
        document.getElementById('nextPage').disabled = currentPage === totalPages;
    }
});

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
            // URL 파라미터 업데이트
            const newUrl = `${window.location.pathname}?category=${encodeURIComponent(currentCategory)}`;
            window.history.pushState({ path: newUrl }, '', newUrl);
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

    // 5. 게시글 불러오기 함수
    function loadPosts(category, filter, page) {
        const offset = (page - 1) * postsPerPage;

        fetch(`${contextPath}/board/api/posts?category=${encodeURIComponent(category)}&filter=${encodeURIComponent(filter)}&offset=${offset}&limit=${postsPerPage}`)
            .then(response => response.json())
            .then(data => {
                console.log('Received data:', data); // 디버깅용 로그 추가
                updatePostList(data.posts);
                updatePostCount(data.totalCount);
                updatePagination(data.totalCount);
            })
            .catch(error => console.error('Error loading posts:', error));
    }

    // 6. 게시글 목록 업데이트 함수
    function updatePostList(posts) {
        const tbody = document.querySelector('.post-list table tbody');
        tbody.innerHTML = '';

        if (posts.length === 0) {
            const row = document.createElement('tr');
            const cell = document.createElement('td');
            cell.colSpan = 5;
            cell.innerText = '게시글이 없습니다.';
            row.appendChild(cell);
            tbody.appendChild(row);
        } else {
            posts.forEach(post => {
                console.log('Post object:', post); // 디버깅용 로그 추가
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td><a href="${contextPath}/board/communityView?postId=${post.postingNo}">${post.category}</a></td>
                    <td><a href="${contextPath}/board/communityView?postId=${post.postingNo}">${post.title}</a></td>
                    <td><a href="${contextPath}/board/communityView?postId=${post.postingNo}">${post.author}</a></td>
                    <td><a href="${contextPath}/board/communityView?postId=${post.postingNo}">${new Date(post.createdTime).toLocaleString()}</a></td>
                    <td><a href="${contextPath}/board/communityView?postId=${post.postingNo}">${post.viewCount}</a></td>
                    <td><a href="${contextPath}/board/communityView?postId=${post.postingNo}">${post.likeCount}</a></td>
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

    // 9. popstate 이벤트 처리
    window.addEventListener('popstate', (event) => {
        const urlParams = new URLSearchParams(window.location.search);
        currentCategory = urlParams.get('category') || '인기글';
        currentPage = 1;
        document.querySelector('.title h1').innerText = currentCategory;
        loadPosts(currentCategory, currentFilter, currentPage);
    });
});

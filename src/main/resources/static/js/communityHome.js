document.addEventListener("DOMContentLoaded", function() {
    // 컨텍스트 경로 가져오기
    const contextPath = document.getElementById("contextPath").value;

    // 1. 실시간 글 개수 가져오기
    fetchPostCount();

    // 2. 인기 글 목록 가져오기
    fetchPopularPosts();

    // 3. 주제별 카테고리 버튼 클릭 시 이동 처리
    document.querySelectorAll('.category-tags button').forEach(button => {
        button.addEventListener('click', () => {
            const category = button.getAttribute('data-category');
            location.href = `${contextPath}/board/communityList?category=${encodeURIComponent(category)}`;
        });
    });

    // 4. 더보기 클릭 시 이동 처리
    document.querySelectorAll('.post-category h3 a').forEach(link => {
        link.addEventListener('click', (event) => {
            event.preventDefault();
            const category = link.getAttribute('data-category');
            location.href = `${contextPath}/board/communityList?category=${encodeURIComponent(category)}`;
        });
    });

    // 5. 게시글 목록 가져오기
    fetchCategoryPosts('allPostsList', '전체글', contextPath);
    fetchCategoryPosts('newPostsList', '신입', contextPath);
    fetchCategoryPosts('prepPostsList', '취준', contextPath);
    fetchCategoryPosts('jobPostsList', '채용공고', contextPath);
    fetchCategoryPosts('coverLetterPostsList', '자소서', contextPath);
    fetchCategoryPosts('interviewPostsList', '면접', contextPath);
});

// 실시간 전체 글 개수 가져오는 함수
function fetchPostCount() {
    fetch('/api/postCount')
        .then(response => response.json())
        .then(data => {
            document.getElementById('postCount').innerText = `실시간 전체글 ${data.count} 개`;
        })
        .catch(error => console.error('Error fetching post count:', error));
}

// 인기 글 목록 가져오는 함수
function fetchPopularPosts() {
    const contextPath = document.getElementById("contextPath").value;
    fetch(`${contextPath}/api/popularPosts`)
        .then(response => response.json())
        .then(data => {
            const popularPostList = document.getElementById('popularPostList');
            popularPostList.innerHTML = '';
            data.posts.forEach(post => {
                const postItem = document.createElement('li');
                postItem.innerHTML = `<a href="${contextPath}/board/communityView?postId=${post.postingNo}">${post.title}</a> <div class="icon-group"><span>🗨️ ${post.commentCount || 0}</span><span>👁️ ${post.viewCount}</span></div>`;
                popularPostList.appendChild(postItem);
            });
        })
        .catch(error => console.error('Error fetching popular posts:', error));
}

// 카테고리별 게시글 목록 가져오는 함수
function fetchCategoryPosts(listId, category, contextPath) {
    fetch(`${contextPath}/api/posts?category=${encodeURIComponent(category)}`)
        .then(response => response.json())
        .then(data => {
            const postList = document.getElementById(listId);
            postList.innerHTML = '';
            data.posts.forEach(post => {
                const postItem = document.createElement('li');
                postItem.innerHTML = `<a href="${contextPath}/board/communityView?postId=${post.postingNo}">${post.title}</a> <div class="icon-group"><span>🗨️ ${post.commentCount || 0}</span><span>👁️ ${post.viewCount}</span></div>`;
                postList.appendChild(postItem);
            });
        })
        .catch(error => console.error(`Error fetching posts for category ${category}:`, error));
}

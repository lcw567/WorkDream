document.addEventListener("DOMContentLoaded", function() {
    // Toggle buttons for full view
    const toggleButtons = document.querySelectorAll(".toggle-btn");
    toggleButtons.forEach(button => {
        button.addEventListener("click", function() {
            const targetId = button.getAttribute("data-target");
            const targetElement = document.getElementById(targetId);
            if(targetElement.classList.contains("limited-text")) {
                targetElement.classList.remove("limited-text");
                button.textContent = "간략히 보기";
            } else {
                targetElement.classList.add("limited-text");
                button.textContent = "전체보기";
            }
        });
    });

    // Gallery navigation
    const leftBtn = document.querySelector(".left-btn");
    const rightBtn = document.querySelector(".right-btn");
    const gallery = document.getElementById("work-environment-gallery");

    leftBtn.addEventListener("click", () => {
        gallery.scrollBy({
            top: 0,
            left: -300,
            behavior: 'smooth'
        });
    });

    rightBtn.addEventListener("click", () => {
        gallery.scrollBy({
            top: 0,
            left: 300,
            behavior: 'smooth'
        });
    });
});

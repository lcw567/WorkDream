document.addEventListener("DOMContentLoaded", function() {
    // Toggle buttons for full view
    const toggleButtons = document.querySelectorAll(".toggle-btn");
    toggleButtons.forEach(button => {
        button.addEventListener("click", function() {
            const targetId = button.getAttribute("data-target");
            const targetElement = document.getElementById(targetId);

            // Toggle 'expanded' class
            const isExpanded = targetElement.classList.toggle("expanded");

            // Update button text based on state
            button.textContent = isExpanded ? "간략히 보기" : "전체보기";

            // Update aria-expanded attribute for accessibility
            button.setAttribute("aria-expanded", isExpanded);

            // Optional: Scroll to the target element smoothly
            targetElement.scrollIntoView({ behavior: 'smooth' });
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

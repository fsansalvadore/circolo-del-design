const Toggle = () => {
 const toggleBtns = document.querySelectorAll(".toggle-btn");

  toggleBtns.forEach((btn) => {
    const icon = btn.querySelector(".toggle-arrow");
    const content = btn.parentNode.querySelector(".toggle-content");

    btn.addEventListener("click", () => {
      icon.classList.toggle("toggle-open");
      content.classList.toggle("toggle-content-open");
    });
 });
}

export { Toggle };

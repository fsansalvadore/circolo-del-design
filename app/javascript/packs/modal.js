const Modal = () => {
  const modal = document.querySelector("#hp-modal");
  const closeBtn = modal.querySelector(".modal-close-btn");

  window.addEventListener("load", () => {
    setTimeout(() => {
      document.body.classList.add("noscroll");
      modal.classList.add("open");
      window.scrollTo(0, 0);
    }, 1000);
  });

  closeBtn.addEventListener("click", () => {
    modal.remove();
    document.body.classList.remove("noscroll");
  });
};

export { Modal };

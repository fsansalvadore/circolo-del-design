const flashFade = () => {
  const flashes = document.querySelectorAll(".form-alert");
  flashes.forEach((f) => {
    setTimeout(() => {
      f.style.opacity = "0";
      setTimeout(() => {
        f.remove();
      }, 1000);
    }, 5000)
  })
}

export { flashFade };

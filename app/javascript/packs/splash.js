const Splash = () => {
  document.getElementById("splash").addEventListener("click", () => {
    this.classList.add("splash-out");
    setTimeout(() => {
      this.remove();
    }, 1000);
  });
}

export { Splash };

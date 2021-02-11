const Splash = () => {
  document.getElementById("splash").addEventListener("click", () => {
    console.log(this)
    console.log(this.classList)
    setTimeout(() => {
      this.remove();
    }, 1000);
  });
}

export { Splash };

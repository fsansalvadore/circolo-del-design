const Splash = () => {
  document.querySelector("#splash.splash-container").addEventListener("click", (e) => {
    e.target.classList.add("splash-out");
    console.log("e.target", e.target)
    console.log("e.target.classList", e.target.classList)

    setTimeout(() => {
      e.target.remove();
    }, 1000);
  });
}

export { Splash };

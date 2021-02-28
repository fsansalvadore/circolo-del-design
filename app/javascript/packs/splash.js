const Splash = () => {
  if(document.querySelector("#splash")) {
    const splash = document.querySelector("#splash")
    splash.addEventListener("click", (e) => {
      splash.classList.add("splash-out");
      console.log('splash', splash)
  
      setTimeout(() => {
        splash.remove();
      }, 1000);
    });
  }
}

export { Splash };

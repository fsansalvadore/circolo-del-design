const Splash = () => {
  if(document.querySelector("#splash.splash-container")) {
    document.querySelector("#splash.splash-container").addEventListener("click", (e) => {
      document.querySelector("#splash.splash-container").classList.add("splash-out");
      console.log('document.querySelector("#splash.splash-container")', document.querySelector("#splash.splash-container"))
  
      setTimeout(() => {
        document.querySelector("#splash.splash-container").remove();
      }, 1000);
    });
  }
}

export { Splash };

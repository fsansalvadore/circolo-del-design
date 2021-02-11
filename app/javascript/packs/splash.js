const Splash = () => {
  const splash = document.querySelector("#splash");
  splash.addEventListener("click", (s) => {
    console.log("removed: " + s)
    s.remove();
  })
}

export { Splash };

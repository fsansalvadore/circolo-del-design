const Splash = () => {
  document.getElementById("splash").addEventListener("click", (e) => {
    e.target.classList.add("splash-out");

    setTimeout(() => {
      e.target.remove();
    }, 1000);
  });
}

export { Splash };

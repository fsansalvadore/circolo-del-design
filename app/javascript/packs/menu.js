const Menu = () => {
  const MenuTitles = document.querySelectorAll('.menu-main-link');
  const SubMenus = document.querySelectorAll('.menu-sub-links-container');

  const toggleMenu = (s) => {
    if(s.style.display === "none") {
      s.style.display = "block";
      setTimeout(() => {
        s.classList.toggle('submenu-open');
      }, 20);
    } else {
      s.classList.toggle('submenu-open');
      setTimeout(() => {
        s.style.display = "none";
      }, 200);
    }
  };

  MenuTitles.forEach((t) => {
    t.addEventListener('click', () => {
      let SubMenu = t.parentNode.querySelector('.menu-sub-links-container');

      if(SubMenu.classList.contains("submenu-open")) {
        toggleMenu(SubMenu);
      } else {
        SubMenus.forEach((s) => {
          s.classList.remove("submenu-open");
          setTimeout(() => {
            s.style.display = "none";
          }, 100);
        });
        setTimeout(() => {
          toggleMenu(SubMenu);
        }, 150);
      }
    });
  });
};

export { Menu };

const Menu = () => {
  const MenuTitles = document.querySelectorAll('.menu-main-link');
  const SubMenus = document.querySelectorAll('.menu-sub-links-container');
  const Pluses = document.querySelectorAll('.menu-toggle-line');
  const MenuBtn = document.querySelector('.nav-menu-a');
  const MenuCont = document.querySelector('.menu-container-a');

  MenuBtn.addEventListener('click', () => {
    MenuCont.classList.toggle('menu-toggle');
  });

  const toggleSubMenu = (s, p) => {
    if(s.style.display === "none") {
      s.style.display = "block";
      p.classList.toggle('open');
      setTimeout(() => {
        s.classList.toggle('submenu-open');
      }, 20);
    } else {
      s.classList.toggle('submenu-open');
      setTimeout(() => {
        s.style.display = "none";
        p.classList.toggle('open');
      }, 200);
    }
  };

  MenuTitles.forEach((t) => {
    t.addEventListener('click', () => {
      let SubMenu = t.parentNode.querySelector('.menu-sub-links-container');
      let Plus = t.parentNode.querySelector('.menu-toggle-line');

      if(SubMenu.classList.contains("submenu-open")) {
        toggleSubMenu(SubMenu, Plus);
      } else {
        SubMenus.forEach((s) => {
          s.classList.remove("submenu-open");
          setTimeout(() => {
            s.style.display = "none";
          }, 150);
        });

        Pluses.forEach((p) => {
          p.classList.remove("open");
        });

        setTimeout(() => {
          toggleSubMenu(SubMenu, Plus);
        }, 150);
      }
    });
  });
};

export { Menu };

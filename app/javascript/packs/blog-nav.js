const BlogNav = () => {
  const blogNav = $(".blog_nav_container");

  if (blogNav.length > 0) {
    const navbar = $("header.navbar-inner-page");
    const header = $("header#top");
    const navBtn = document.querySelector("a#blog_nav_btn");
    const navContainer = $(".blog_nav_container");
    const navLinks = $("#blog_nav_links");
    const navLinksGhost = $("#blog_nav_links_ghost");

    $(window).on("scroll", function () {
      let main = $("main.page-postheader");
      if (
        $(window).scrollTop() >=
        header.outerHeight() - navbar.outerHeight()
      ) {
        blogNav.addClass("fixed");
        blogNav.css("top", navbar.outerHeight() + "px");
      } else {
        blogNav.removeClass("fixed");
        blogNav.css("top", header.outerHeight() + "px");
      }
    });

    navBtn.addEventListener("click", (e) => {
      e.preventDefault();
      navContainer.toggleClass("open");

      if (navContainer.hasClass("open")) {
        navLinks.css("display", "block");
        navLinks.css("height", navLinksGhost.outerHeight() + "px");
        setTimeout(() => {
          navLinks.addClass("show");
        }, 100);
      } else {
        navLinks.css("opacity", "0px");
        setTimeout(() => {
          navLinks.css("height", "0px");
          navLinks.removeClass("show");
        }, 100);
        // navLinks.css('display', "none");
      }
    });
  }
};

export { BlogNav };

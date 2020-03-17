const BlogNav = () => {
  const blogNav = $('.blog_nav_container');

  if (blogNav.length > 0) {
    const navbar = $('header.navbar-inner-page');
    const header = $('header#top');

    $(window).on('scroll', function () {
        let main = $('main.page-postheader');
        if ($(window).scrollTop() >= header.outerHeight() - navbar.outerHeight()) {
            blogNav.addClass('fixed');
            blogNav.css("top", navbar.outerHeight() + "px");
        } else {
            blogNav.removeClass('fixed');
            blogNav.css("top", header.outerHeight() + "px");
        }
    });
  }
}

export { BlogNav };

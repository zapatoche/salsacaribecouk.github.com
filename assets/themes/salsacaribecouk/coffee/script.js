
$(function() {
  var aboveHeight, homeLink, homeLinkText, menuBarheight, siteNav, ul;
  $('.site-tagline .h1').fitText(1.2, {
    minFontSize: '40px',
    maxFontSize: '70px'
  });
  aboveHeight = $('.site-header').outerHeight(true);
  siteNav = $('.site-nav');
  menuBarheight = siteNav.outerHeight(true);
  homeLink = siteNav.find('.home');
  homeLinkText = homeLink.text();
  ul = siteNav.find('.navigation');
  ul.children().each(function(i, li) {
    return ul.prepend(li);
  });
  return $(window).scroll(function() {
    if ($(window).scrollTop() > aboveHeight) {
      siteNav.addClass('fixed').css({
        'top': '0'
      }).next().css('padding-top', menuBarheight + 'px');
      return homeLink.text('Salsa Caribe Productions');
    } else {
      $('.site-nav').removeClass('fixed').next().css('padding-top', '0');
      return homeLink.text(homeLinkText);
    }
  });
});

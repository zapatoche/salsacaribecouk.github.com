
if (typeof jQuery !== 'undefined' && parseFloat(jQuery.fn.jquery) >= 1.8) {
  $(function() {
    var $window, aboveHeight, homeLink, homeLinkText, links, menuBarheight, mobileNav, mobileNavOption, navBar, resetNav, reseted, showing, siteNav, switchLi, timer, toggleMobileNav, trigger;
    $('.site-tagline .h1').fitText(1.2, {
      minFontSize: '40px',
      maxFontSize: '70px'
    });
    $window = $(window);
    aboveHeight = $('.site-header').outerHeight(true);
    siteNav = $('.site-nav');
    menuBarheight = siteNav.outerHeight(true);
    navBar = siteNav.find('[role="navigation"]');
    links = navBar.find('a');
    homeLink = siteNav.find('.home');
    homeLinkText = homeLink.text();
    trigger = 800;
    showing = 'standard';
    timer = null;
    reseted = false;
    switchLi = function() {
      return navBar.children().each(function(i, li) {
        return navBar.prepend(li);
      });
    };
    resetNav = function() {
      var $width;
      $width = $window.width();
      if ($width > 768 && reseted === false) {
        switchLi();
        return reseted = true;
      } else if ($width <= 768 && reseted === true) {
        switchLi();
        return reseted = false;
      }
    };
    $(window).scroll(function() {
      if ($(window).scrollTop() > aboveHeight) {
        return siteNav.addClass('fixed').css({
          'top': '0'
        }).next().css('padding-top', menuBarheight + 'px');
      } else {
        return $('.site-nav').removeClass('fixed').next().css('padding-top', '0');
      }
    });
    navBar.find('.active').click(function(event) {
      return event.preventDefault();
    });
    if (navBar.length && links.length) {
      mobileNav = $('<select></select>');
      mobileNavOption = $('<option>-- Navigation --</option>').appendTo(mobileNav);
      links.each(function() {
        var link;
        link = $(this);
        return mobileNavOption.clone().attr('value', link.attr('href')).text(link.text()).appendTo(mobileNav);
      });
      mobileNav = mobileNav.wrap('<div class="mobile-nav" />').parent().delegate('select', 'change', function() {
        return window.location = $(this).val();
      });
    }
    toggleMobileNav = function() {
      var $width;
      $width = $window.width();
      if (showing === 'standard' && $width <= trigger) {
        navBar.replaceWith(mobileNav);
        return showing = 'mobileNav';
      } else if (showing === 'mobileNav' && $width >= trigger) {
        mobileNav.replaceWith(navBar);
        return showing = 'standard';
      }
    };
    resetNav();
    return $window.resize(function() {
      if (timer) clearTimeout(timer);
      return resetNav();
    });
  });
}

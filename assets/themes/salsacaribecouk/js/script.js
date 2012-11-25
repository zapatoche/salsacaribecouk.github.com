
if (typeof jQuery !== 'undefined' && parseFloat(jQuery.fn.jquery) >= 1.8) {
  $(function() {
    var $backButton, $h1, $map, $screenWidth, $sw, $width, $window, aboveHeight, buildEmbed, buildMap, buildStatic, embedMap, getWindowWidth, homeLink, homeLinkText, ipadLandscape, links, mapLink, menuBarheight, mobilizeNav, navBar, resetNav, reseted, showing, siteNav, staticMap, switchLi, timer, triggerMenu, trim, words;
    $window = $(window);
    $sw = document.body.clientWidth;
    $screenWidth = screen.width;
    siteNav = $('.site-nav');
    aboveHeight = $('.site-header').outerHeight(true) - siteNav.outerHeight(true);
    menuBarheight = siteNav.outerHeight(true);
    navBar = siteNav.find('[role="navigation"]');
    links = navBar.find('a');
    homeLink = siteNav.find('.home');
    homeLinkText = homeLink.text();
    ipadLandscape = 768;
    triggerMenu = 590;
    showing = 'standard';
    timer = null;
    reseted = false;
    $width = 0;
    $map = $('.google-map');
    mapLink = $('.map-link').attr('href');
    staticMap = 'http://api.tiles.mapbox.com/v3/bishbashbosh.map-hs0p13ed/pin-m-star+f63a39(-0.128,51.527),pin-m-star+f63a39(-0.103,51.545)/-0.113,51.537,13/550x350.png';
    embedMap = "<iframe width='500' height='300' frameBorder='0' src='http://a.tiles.mapbox.com/v3/bishbashbosh.map-hs0p13ed.html#14/51.537/-0.113'></iframe>";
    $h1 = $('.site-tagline h1');
    trim = $h1.text().replace(/^\s+|\s+$/g, "");
    $h1.html(trim);
    $h1.lettering('words').children('span').lettering();
    words = $h1.children();
    words.each(function() {
      var letters, rand;
      letters = $(this).children().length;
      rand = Math.floor(Math.random() * letters);
      return $(this).children("span:eq(" + rand + ")").addClass('faded');
    });
    $h1.fitText(1.2, {
      minFontSize: '32px',
      maxFontSize: '70px'
    });
    getWindowWidth = function() {
      return $width = $window.width();
    };
    switchLi = function() {
      return navBar.children().each(function(i, li) {
        return navBar.prepend(li);
      });
    };
    resetNav = function() {
      getWindowWidth();
      if ($width >= ipadLandscape && reseted === false) {
        switchLi();
        return reseted = true;
      } else if ($width < ipadLandscape && reseted === true) {
        switchLi();
        return reseted = false;
      }
    };
    $('.site-branding .contact').append('<div id="menu-icon">Menu</div>');
    $('#menu-icon').click(function() {
      navBar.slideToggle();
      return $(this).toggleClass('active');
    });
    mobilizeNav = function() {
      getWindowWidth();
      if ($width > triggerMenu) {
        return navBar.css('display', 'block');
      } else if ($width <= triggerMenu) {
        return navBar.css('display', 'none');
      }
    };
    $(window).scroll(function() {
      if ($(window).scrollTop() >= aboveHeight) {
        return siteNav.addClass('site-nav-advanced').css({
          'top': '0'
        }).next().css('padding-top', menuBarheight + 'px');
      } else {
        return $('.site-nav').removeClass('site-nav-advanced').next().css('padding-top', '0');
      }
    });
    navBar.find('.active').click(function(event) {
      return event.preventDefault();
    });
    $backButton = $('.history-back');
    $backButton.click(function(event) {
      event.preventDefault();
      return history.back(1);
    });
    $('noscript[data-large][data-medium]').each(function() {
      var src;
      src = $screenWidth >= 500 && $(this).data('large') !== "" ? $(this).data('large') : $(this).data('small');
      return $("<img src='" + src + "' alt='" + ($(this).data('alt')) + "' />").insertAfter($(this));
    });
    buildMap = function() {
      if ($sw > triggerMenu) {
        if ($('.map-container').length < 1) return buildEmbed();
      } else {
        if ($('.static-map').length < 1) return buildStatic();
      }
    };
    buildEmbed = function() {
      var map;
      $('<div id="mapbox" class="map-container embed-media-block"/>').prependTo($map);
      return map = mapbox.auto('mapbox', 'bishbashbosh.map-hs0p13ed', function(map, tiledata) {
        return tiledata.markers.factory(function(m) {
          var elem;
          elem = mapbox.markers.simplestyle_factory(m);
          MM.addEvent(map, 'load', function(e) {
            return map.zoom(3);
          });
          MM.addEvent(elem, 'click', function(e) {
            return map.ease.location({
              lat: m.geometry.coordinates[1],
              lon: m.geometry.coordinates[0]
            }).zoom(map.zoom()).optimal();
          });
          return elem;
        });
      });
    };
    buildStatic = function() {
      var $img;
      mapLink = $('.map-link').attr('href');
      $img = $('<img class="static-map"/>').attr('src', staticMap);
      return $('<a/>').attr('href', mapLink).html($img).prependTo($map).css('background-image', staticMap);
    };
    mobilizeNav();
    resetNav();
    buildMap();
    return $window.resize(function() {
      mobilizeNav();
      resetNav();
      $sw = document.body.clientWidth;
      buildMap();
      return google.maps.event.trigger(map, "resize");
    });
  });
}

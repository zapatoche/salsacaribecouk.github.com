if  typeof(jQuery) isnt 'undefined' and parseFloat(jQuery.fn.jquery) >= 1.8
  $ ->

    # variables
    $window = $(window)
    $sw = document.body.clientWidth
    $screenWidth = screen.width
    siteNav = $('.site-nav')
    aboveHeight = $('.site-header').outerHeight(true) - siteNav.outerHeight(true)
    menuBarheight = siteNav.outerHeight(true)
    navBar = siteNav.find('[role="navigation"]')
    links = navBar.find('a')
    homeLink = siteNav.find('.home')
    homeLinkText = homeLink.text()
    ipadLandscape = 768 # iphone lanscape
    triggerMenu = 590
    showing = 'standard'
    timer = null
    reseted = false
    $width = 0
    $map = $('.google-map')
    staticMap = 'http://maps.google.com/maps/api/staticmap?center=51.537474,-0.112953&zoom=13&markers=51.527234,-0.129160|51.545756,-0.103161&size=640x360&sensor=true&key=AIzaSyBgvmh48DRovU0FfSThuiRVQ7WzcjhP5m8'
    # embedMap = '<iframe width="640" height="360" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps/ms?msid=204512405293599754812.0004cd6e64e8e7a252869&amp;msa=0&amp;ie=UTF8&amp;t=m&amp;ll=51.537153,-0.11158&amp;spn=0.038439,0.110035&amp;z=13&amp;output=embed&key=AIzaSyBgvmh49DRovU0FfSThuiRVQ7WzcjhP5m8"></iframe>'
    embedMap = "<iframe width='500' height='300' frameBorder='0' src='http://a.tiles.mapbox.com/v3/bishbashbosh.map-hs0p13ed.html#14/51.537/-0.113'></iframe>
"
    # wrap random .site-tagline h1 character
    $h1 = $('.site-tagline h1')
    trim = $h1.text().replace(/^\s+|\s+$/g, "")
    $h1.html(trim)
    $h1.lettering('words').children('span').lettering();
    words = $h1.children()
    words.each ->
      letters = $(@).children().length
      rand = Math.floor(Math.random() * letters)
      $(@).children("span:eq(#{rand})").addClass('faded')

    # resize main headline
    $h1.fitText 1.2
      minFontSize: '32px'
      maxFontSize: '70px'

    # reverse li order when navigation is floated right
    getWindowWidth = ->
      return $width  = $window.width()
    switchLi = ->
        navBar.children().each (i,li) ->
          navBar.prepend(li)

    resetNav = ->
      getWindowWidth()
      if $width >= ipadLandscape  and reseted is false
        switchLi()
        reseted = true
      else if $width < ipadLandscape and reseted is true
        switchLi()
        reseted = false

    # build mobile nav
    $('.site-branding .contact').append('<div id="menu-icon">Menu</div>')
    $('#menu-icon').click( ->
      navBar.slideToggle()
      $(@).toggleClass('active')
    )

    mobilizeNav = ->
      getWindowWidth()
      if $width > triggerMenu
        navBar.css('display','block')
      else if $width <= triggerMenu
        navBar.css('display','none')

    # ensure menu is always visible on top when the page is scrolled
    $(window).scroll ->
      if $(window).scrollTop() >= aboveHeight
        siteNav.addClass('site-nav-advanced').css('top':'0').next().css('padding-top', menuBarheight + 'px')
      else
        $('.site-nav').removeClass('site-nav-advanced').next().css('padding-top','0')

    # disable .active link
    navBar.find('.active').click (event) ->
      event.preventDefault()

    # handle previous page history state
    $backButton = $('.history-back')
    $backButton.click (event) ->
      event.preventDefault()
      history.back(1)

    # responsive images: noscript tag
    # http://www.monoliitti.com/images/
    $('noscript[data-large][data-small]').each ->
      src = if $screenWidth >= 500 then $(@).data('large') else $(@).data('small')
      $("<img src='#{src}' alt='#{$(@).data('alt')}' />").insertAfter($(@))

    # responsive map
    # http://codepen.io/bradfrost/pen/tLxAs
    buildMap = ->
      console.log 'run'
      if $sw > triggerMenu
        console.log 'wide'
        buildEmbed() if $('.map-container').length < 1
      else
        console.log 'small'
        buildStatic() if $('.static-map').length < 1

    buildEmbed = ->
      $('<div id="mapbox" class="map-container embed-media-block"/>').prependTo($map)
      mapbox.auto('mapbox', 'bishbashbosh.map-hs0p13ed', (map, tiledata) ->
        tiledata.markers.factory (m) -> 
          elem = mapbox.markers.simplestyle_factory(m)
          MM.addEvent(elem, 'click', (e) ->
            map.ease.location
              lat: m.geometry.coordinates[1]
              lon: m.geometry.coordinates[0]
            .zoom(map.zoom()).optimal()
          )
          return elem
      )

    buildStatic = ->
      mapLink = $('.map-link').attr('href')
      $img = $('<img class="static-map"/>').attr('src', staticMap)
      $('<a/>').attr('href', mapLink).html($img).prependTo($map)




    mobilizeNav()
    resetNav()
    buildMap()
    # resizeFooter()
    $window.resize ->
      mobilizeNav()
      resetNav()
      $sw = document.body.clientWidth
      buildMap()
      google.maps.event.trigger(map, "resize")
      # resizeFooter()

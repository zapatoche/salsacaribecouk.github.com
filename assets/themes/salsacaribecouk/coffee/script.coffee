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
    $map = $('.responsive-map')
    mapLink = $('.map-link').attr('href')
    staticMap = 'http://api.tiles.mapbox.com/v3/bishbashbosh.map-hs0p13ed/pin-m-b+5b8dd3(-0.128,51.527),pin-m-a+5b8dd3(-0.103,51.545)/-0.113,51.537,13/550x350.png'
    embedMap = "<iframe width='500' height='300' frameBorder='0' src='http://a.tiles.mapbox.com/v3/bishbashbosh.map-hs0p13ed.html#14/51.537/-0.113'></iframe>
"
    # wrap random .site-tagline h1 character
    $h1 = $('.site-tagline h1')
    trim = $h1.text().replace(/^\s+|\s+$/g, "")
    $h1.html(trim)
    $h1.lettering('words').children('span').lettering()
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
    $('noscript[data-large][data-medium]').each ->
      src = if $screenWidth >= 500 and $(@).data('large') isnt ""
        $(@).data('large')
      else
        $(@).data('small')
      $("<img src='#{src}' alt='#{$(@).data('alt')}' />").insertAfter($(@))

    # responsive map
    # http://codepen.io/bradfrost/pen/tLxAs
    buildMap = ->
      if $sw > triggerMenu
        buildEmbed() if $('.map-container').length < 1
      else
        buildStatic() if $('.static-map').length < 1

    buildEmbed = ->
      $('<div id="mapbox" class="map-container embed-media-block"/>').prependTo($map)
      map = mapbox.auto('mapbox', 'bishbashbosh.map-hs0p13ed', (map, tiledata) ->
        tiledata.markers.factory (m) ->
          elem = mapbox.markers.simplestyle_factory(m)
          MM.addEvent(map, 'load', (e) ->
            map.zoom(3)
          )
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
      $('<a/>').attr('href', mapLink).html($img).prependTo($map).css('background-image', staticMap)




    mobilizeNav()
    resetNav()
    buildMap()
    # resizeFooter()
    $window.resize ->
      mobilizeNav()
      resetNav()
      $sw = document.body.clientWidth
      buildMap()
      # resizeFooter()

if  typeof(jQuery) isnt 'undefined' and parseFloat(jQuery.fn.jquery) >= 1.8
  $ ->
    # resize main headline
    $('.site-tagline .h1').fitText 1.2
      minFontSize: '40px'
      maxFontSize: '70px'

    # sticky navigation
    $window = $(window)
    aboveHeight = $('.site-header').outerHeight(true)
    siteNav = $('.site-nav')
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

    # reverse li order when navigation is floated right
    getWindowWidth = ->
      return $width  = $window.width()
    switchLi = ->
        navBar.children().each (i,li) ->
          navBar.prepend(li)

    resetNav = ->
      getWindowWidth()
      if $width > ipadLandscape  and reseted is false
        switchLi()
        reseted = true
      else if $width <= ipadLandscape and reseted is true
        switchLi()
        reseted = false

    # build mobile nav
    $('.site-header .contact').append('<div id="menu-icon">Menu</div>')
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
      if $(window).scrollTop() > aboveHeight
        siteNav.addClass('fixed').css('top':'0').next().css('padding-top', menuBarheight + 'px')
      else
        $('.site-nav').removeClass('fixed').next().css('padding-top','0')

    # disable .active link
    navBar.find('.active').click (event) ->
      event.preventDefault()

    mobilizeNav()
    resetNav()
    $window.resize ->
      mobilizeNav()
      resetNav()

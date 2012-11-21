if  typeof(jQuery) isnt 'undefined' and parseFloat(jQuery.fn.jquery) >= 1.8
  $ ->

    # sticky navigation
    $window = $(window)
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

    # wrap random .site-tagline h1 character
    $h1 = $('.site-tagline h1')
    trim = $h1.text().replace(/^\s+|\s+$/g, "")
    $h1.html(trim)
    $h1.lettering('words').children('span').lettering();
    words = $h1.children()
    words.each ->
      letters = $(@).children().length
      rand = Math.floor(Math.random() * letters)
      console.log rand
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
    $('.site-branding .call').append('<div id="menu-icon">Menu</div>')
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

    # for span in [1..maxSpan]
    #   console.log trim.substr(span - 1 , span)
      # $h1.html($h1.text().substr(span, span)).wrap('<span></span>')
    # $h1.html($h1.text().substr(0,1)).wrap('<span></span>')

    mobilizeNav()
    resetNav()
    # resizeFooter()
    $window.resize ->
      mobilizeNav()
      resetNav()
      # resizeFooter()

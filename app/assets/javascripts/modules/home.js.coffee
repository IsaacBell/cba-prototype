$(document).ready ->
  # Bind a CSS transition slide event to each navigation link
  slideContent = ->
    $slideTriggers = $('.uk-navbar-link')

    $slideTriggers.on('click', (e) ->
      $ctr = $('.container')
      $cnt = $('.switcheable-content')
      $sld = $('.slide')
      if $ctr.length and $sld.length
        if $(@.getAttribute('href')).hasClass('uk-hidden')
          $sld.addClass('uk-hidden').removeClass('slide')
          $(@.getAttribute('href')).removeClass('uk-hidden').addClass('slide')
        else if $(@.getAttribute('href')).hasClass('slide')
          $ctr.first().removeClass('container--open')
          $(@.getAttribute('href')).removeClass('slide').addClass('uk-hidden')
      else
        $ctr.first().addClass('container--open')
        $(@.getAttribute('href')).removeClass('uk-hidden').addClass('slide')
      e.preventDefault()
    )

  noScroll = ->
    # Prevents scrolling
    $('window').ScrollTo(0,0)
    # reset scrolling position
    $('body').scrollTop = 0
    $('document').scrollTop = 0
    false

  # Initialize sliding UI
  slideContent()

  # Disable scrolling
  $('.switcheable-content').on('scroll', noScroll)

  # Initialize UI Kit Components
  grid = UIkit.grid( $('.homeWindow') ) if $('.homeWindow').length
  sticky = UIkit.sticky($('#sticky-header'), {})










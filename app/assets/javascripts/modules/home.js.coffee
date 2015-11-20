# Homepage animations/events
class @Homepage
  grid          = null
  $ctr          = null
  $cnt          = null
  $sld          = null
  slideTriggers = null

  constructor: ->
    init = @
    # Initialize UI Kit Components
    @grid = UIkit.grid( $('.homeWindow') ) if $('.homeWindow').length
    # Disable scrolling while the hero unit is up, listens for scroll event
    $('.switcheable-content').on 'scroll', @noScroll
    # Bind a CSS transition slide event to each navigation link
    # console.log @
    @slideTriggers = $('.uk-navbar-link')
    # Swap out the (top) hero unit and the (bottom) content 
    # container, or swap out content containers on click
    @slideTriggers.on 'click', (e) ->
      e.preventDefault()
      init.slide e.target
      return
    return

  slide: (trigger) ->
    # console.log trigger
    $nav   = $('.uk-navbar')
    $ctr   = $('.container')
    $cnt   = $('.switcheable-content')
    $sld   = $('.slide')
    target = $( trigger.getAttribute('href') )

    if $ctr.length and $sld.length # If a slide unit is open
      if target.hasClass('uk-hidden') # Are we opening the target slide?
        $sld.addClass('uk-hidden').removeClass('slide')
        target.removeClass('uk-hidden').addClass('slide')
      else if target.hasClass('slide') # Or are we closing the target slide?
        $ctr.first().removeClass('container--open')
        target.removeClass('slide').addClass('uk-hidden')
        $nav.css(bottom: 0)
    else # If the hero unit unit is open
      $ctr.first().addClass('container--open')
      target.removeClass('uk-hidden').addClass('slide')
    

  # Prevent scrolling
  noScroll: ->
    # Just reset the scroll position to the top
    $('window').ScrollTo(0,0)
    $('body').scrollTop = 0
    $('document').scrollTop = 0
    false

# Initialize
@home = new Homepage()







# Homepage animations/events
class @Homepage
  grid          = null
  $ctr          = null
  $cnt          = null
  $sld          = null
  slideTriggers = null

  constructor: ->
    # Initialize UI Kit Components
    @grid = UIkit.grid( $('.homeWindow') ) if $('.homeWindow').length
    # Disable scrolling while the hero unit is up, listens for scroll event
    $('.switcheable-content').on 'scroll', @noScroll
    # Bind a CSS transition slide event to each navigation link
    # console.log @
    @slideTriggers = $('.uk-navbar-link')
    # Swap out the (top) hero unit and the (bottom) content 
    # container, or swap out content containers on click
    return

  slide: (trigger) ->
    console.log trigger
    $ctr   = $('.container')
    $cnt   = $('.switcheable-content')
    $sld   = $('.slide')
    target = $( trigger.getAttribute('href') )

    if $ctr.length and $sld.length
      if target.hasClass('uk-hidden')
        $sld.addClass('uk-hidden').removeClass('slide')
        target.removeClass('uk-hidden').addClass('slide')
      else if target.hasClass('slide')
        $ctr.first().removeClass('container--open')
        target.removeClass('slide').addClass('uk-hidden')
    else
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
home.slideTriggers.on 'click', (e) ->
  e.preventDefault()
  home.slide(@)
  return







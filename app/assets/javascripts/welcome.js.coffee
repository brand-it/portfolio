class Welcome extends ApplicationDocument
  constructor: (attrs) ->
    height = $(window).height() - $('.navbar').height()
    welcome_carousel_bg_image = $('#welcome-carousel > .carousel-inner .item')
    welcome_carousel_bg_image.height( height )
    $('#welcome-carousel').carousel( interval: 10000)
    
    $('#contact-me').on 'submit', (event)->
      alert("This has been disabled For Demo only")
      event.preventDefault()
      return
    
welcome = new Welcome if $("#welcome").length
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
  ((d, s, id) ->
    js = undefined
    fjs = d.getElementsByTagName(s)[0]
    if d.getElementById(id)
      return
    js = d.createElement(s)
    js.id = id
    js.src = '//connect.facebook.net/fb_LT/sdk.js#xfbml=1&version=v2.8'
    fjs.parentNode.insertBefore js, fjs
    return
  ) document, 'script', 'facebook-jssdk'
  console.log('Facebook comment only works on refresh')
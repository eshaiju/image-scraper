# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$(document).ready ->



  $(".btn_submit").click (e) ->
    e.preventDefault()
    $.ajax
      url: 'http://localhost:3000' + "/scrap"
      data: $(".scraper").serialize()
      dataType: "json"
      success: (data) ->
        $('.title').html("Title" +data.title)
        $('.imagecount').html("Image Count : "+ data.image_count)
        for image in data.images
          console.log(image)
          $("#slides").append("<li><img src='"+image+"' width='300px',height='300px' title='"+data.title+"'/></li>");
        $('.bxslider').bxSlider
          mode: 'fade',
          captions: true
          auto: true,
          autoControls: true

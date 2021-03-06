$(document).ready(function() {

  $('#resultscontainer').on('click', '#left-arrow' ,function(event) {

    event.preventDefault();

    var row = $(this).parent().parent();
    var link = $(this).attr('href');
    var data = row.find('td:nth-child(2)');
    var name = data.find('a').text();
    var url = data.find('a').attr('href');
    var image_img = data.find('img.restaurant_img').attr('src');
    var rating_img = data.find('img.restaurant_rating').attr('src');
    var cuisine = row.attr('data-cuisine');
    var neighborhood = row.attr('data-neighborhood')

    console.log(row);
    console.log(data);
    console.log(name);
    console.log(url);
    console.log(image_img);

    var request = $.ajax({
      url: link,
      type: 'POST',
      dataType: 'json',
      data: {name: name,
            url: url,
            image_img: image_img,
            rating_img: rating_img,
            cuisine: cuisine,
            neighborhood: neighborhood}
    });


    request.done(function(response) {
      $('div:visible.restaurant_container').first().hide();
      $('div#trash_list_container').append('<p>'+response.restaurant.name+'<p>');
    });

  });

    $('#resultscontainer').on('click', '#right-arrow', function(event) {
    event.preventDefault();


    var container = $(this).parent().parent().parent().parent().parent();
    var row = $(this).parent().parent();
    var link = $(this).attr('href');
    var data = row.find('td:nth-child(2)');
    var name = data.find('a').text();
    var url = data.find('a').attr('href');
    var image_img = data.find('img.restaurant_img').attr('src');
    var rating_img = data.find('img.restaurant_rating').attr('src');
    var cuisine = row.attr('data-cuisine');
    var neighborhood = row.attr('data-neighborhood')

    var request = $.ajax({
      url: link,
      type: 'POST',
      dataType: 'json',
      data: {name: name,
            url: url,
            image_img: image_img,
            rating_img: rating_img,
            cuisine: cuisine,
            neighborhood: neighborhood}
    });


    request.done(function(response) {
      container.remove();
      $('div:visible.restaurant_container').first().hide();
      $('div#gold_list_container').append('<p>'+response.restaurant.name+'<p>');
    });

  });
//DRAG AND DROP ---------------------------------------------------------
  // $('.restaurant_container').on('dragstart', function(event){
  //   event.dataTransfer.setData("text", event.target.id);
  // })

  // $('.gold_list_container').on('dragover', function(event){
  //   event.preventDefault();
  // })

  // $('.gold_list_container').on('drop', function(event){
  //   event.preventDefault();
  //   var data = eventdataTransfer.getData("text");
  //   event.target.appendChild(document.getElementById(data));
  // })
// ----------------------------------------------------------------------
var sections      = $('section');
  var navbar        = $('#nav');
  var navbarHeight  = navbar.height();

  var sectionOffset = [];

  sections.each(function() {
    var section = $(this);

        var position = section.offset().top - navbarHeight;
        var backgroundColor = section.css("background-color");

        sectionOffset.push({'postion': position,'color': backgroundColor});

    });

  $(window).on('scroll', function(){
    var scrollPos = $(document).scrollTop();

    $.each(sectionOffset, function(index, section){
      if (scrollPos >= section.postion) {
        navbar.css("background-color", section.color);
      }
    })
  });

});

$(document).ready(function() {

  $('#left-arrow').on('click', function(event) {
    debugger
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
      $('div#trash_list_container').append('<h4>'+response.list.cuisine+' restaurants in '+response.list.neighborhood+'</h4>');
      $('div#trash_list_container').append('<p>'+response.restaurant.name+'<p>');
    });

  });

    $('#right-arrow').on('click', function(event) {
    event.preventDefault();

    debugger

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
      $('div#gold_list_container').append('<h4>'+response.list.cuisine+' restaurants in '+response.list.neighborhood+'</h4>');
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

});

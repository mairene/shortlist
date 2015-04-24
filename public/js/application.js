$(document).ready(function() {

  $('#left-arrow').on('click', function(event) {
    event.preventDefault();

    var row = $(this).parent().parent();
    var link = $(this).attr('href');
    var data = row.find('td:nth-child(2)');
    var name = data.find('a').text();
    var url = data.find('a').attr('href');
    var image_img = data.find('img.restaurant_img').attr('src');
    var rating_img = data.find('img.restaurant_rating').attr('src');

    var request = $.ajax({
      url: link,
      type: 'POST',
      dataType: 'json',
      data: {name: name,
            url: url,
            image_img: image_img,
            rating_img: rating_img}
    });


    request.done(function(response) {
      console.log('it effin worked!');
      console.log(response);
    });

  })
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

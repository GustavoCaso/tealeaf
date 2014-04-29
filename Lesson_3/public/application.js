$(document).ready(function(){

  $('.left').animate({right: 0}, 1500, "linear");

  $('.right').animate({left: 0},1500, "linear");

  $('.buttons').on('click', '.hit_form', function(e){
    $.ajax({
      url: '/hit',
      type: 'POST'
    }).done(function(msg) {
      $('.game').replaceWith(msg);
    });

    e.preventDefault();
  });

  $('.buttons').on('click', '.stay_form', function(e){
    $.ajax({
      url: '/stay',
      type: 'POST'
    }).done(function(msg) {
      $('.game').replaceWith(msg);
    });

    e.preventDefault();
  });

  $(document).on('click', '.dealer_hit', function(){
    $.ajax({
      url: '/dealer_hit',
      type: 'POST'
    })
    .done(function(msg) {
      $('.game').replaceWith(msg);
    });
  });

});
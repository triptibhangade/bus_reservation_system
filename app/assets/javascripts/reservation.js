$( document ).on('turbolinks:load', function() {
  book_seat();
  show_seat();
})

// --------------------------------- Book Seat --------------------------------
book_seat = function(){
  $(document).on('click', '.book_seat', function() {
    if($(this).attr('disable') == "false"){
      $(this).attr('disable', true)
       $(this).css({
            "background-color": 'red',
            "color" : "white"
        });
    } else {
        $(this).attr('disable', false)
        $(this).css({
            "background-color": '#428bca',
            "color" : "white"
        });
    } 
  });
}

// --------------------------------- Datewise Seat --------------------------------
show_seat = function(){
  $(".show_seat").hide();
  $(document).on('change', '#reservation_reservation_date', function(){ 
    var date = this.value;
    var bus_id = $("#new_reservation").attr('bus_id');
    var params = {
      bus_id: bus_id,
      date: date
    };
    $.ajax({
      method: "GET",
      url: "/buses/"+bus_id+"/reservations/new",
      data: params
    });
  });
}
// --------------------------------------------------------------------------------------

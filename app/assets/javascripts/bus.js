$( document ).on('turbolinks:load', function() {
  clickableRow();
  buses();
})
// -------------------------------- Buses list --------------------------------
buses = function(){
  $(document).on('change', '#search', function(){ 
    var date = $("#date_search").val();
    var source = $("#source_search").val();
    var destination = $("#destination_search").val();
    var params = {
      date: date,
      source: source,
      destination: destination
    };
    $.ajax({
      method: "GET",
      url: "/",
      data: params
    });
  });
}

// -------------------------------- Clickable Row --------------------------------
clickableRow = function(){
    $(".clickable-row").click(function() {
        window.location = $(this).data("href");
    });
}
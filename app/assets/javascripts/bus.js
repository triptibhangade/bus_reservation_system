$( document ).on('turbolinks:load', function() {
  buses();
  disableBrowserBackButton();
})
// ------------------ Disable Browser Back Button Script ------------------
disableBrowserBackButton = function(){
  function preventBack(){window.history.forward();}
  setTimeout("preventBack()", 0);
  window.onunload = function(){null};
};
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
jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {
        window.location = $(this).data("href");
    });
});
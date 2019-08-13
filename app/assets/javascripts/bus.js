$( document ).on('turbolinks:load', function() {
  buses();
})

buses = function(){
  $(".buses").hide();
  $(document).on('change', '#date_search', function(){ 
    var date = this.value;
    var params = {
      date: date
    };
    debugger
    $.ajax({
      method: "GET",
      url: "/buses",
      type: 'script',
      data: params
    });
  });
}
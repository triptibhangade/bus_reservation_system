$( document ).on('turbolinks:load', function() {
  disableBrowserBackButton();
})
// ------------------ Disable Browser Back Button Script ------------------
disableBrowserBackButton = function(){
  function preventBack(){window.history.forward();}
  setTimeout("preventBack()", 0);
  window.onunload = function(){null};
};
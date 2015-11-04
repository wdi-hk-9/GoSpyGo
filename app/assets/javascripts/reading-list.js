$(function(){
  $("#reading-list").hide();
  $("#realtime_value").hide();

  $("#show-history").on('click', function(){
    $("#reading-list").slideToggle('fast',function(){});
  });


});
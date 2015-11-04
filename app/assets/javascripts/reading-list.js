$(function(){
  // $("#show-history").on('click', function(){
  //   $("#reading-list").slideToggle('fast',function(){});
  // });
  $(".show-five-list").hide();

  $(".show-five").on('click', function(){
    $("#"+ this.id + "-list").slideToggle('fast',function(){});
  });
});
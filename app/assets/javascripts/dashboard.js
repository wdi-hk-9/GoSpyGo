$(function(){

  // $("#testbox").bootstrapSwitch();
  $(".switch_state").each(function(){
    $(this).bootstrapSwitch();
    if (this.id.indexOf("sensor") != -1){
      $(this).bootstrapSwitch('readOnly',true)
    }
  })

  $("#socket_switch").bootstrapSwitch('state', false);
  $('#socket_switch').on('switchChange.bootstrapSwitch', function (event, state) {
      switch (state){
        case true:
          newConnection(uri);
          break;
        case false:
          console.log("DISCONNECT")
          ws.close();
          delete ws;
          break;
      }
  });

});


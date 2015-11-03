// var ws = new WebSocket(uri);
var scheme = "ws://";
var uri = scheme + window.document.location.host + "/";

// newConnection(uri);

function newConnection (uri){
  ws = new WebSocket(uri);
  console.log("Woohoo New Connection!!")
  ws.onmessage = function(message){
    var data = JSON.parse(message.data);
    // $("#chat-text").append("<div class='panel panel-default'><div class='panel-heading'>" + data.handle + "</div><div class='panel-body'>" + data.text + "</div></div>");
    // $("#chat-text").stop().animate({
    //   scrollTop: $('#chat-text')[0].scrollHeight
    // }, 800);
  };
}

$(function(){
    $("#start_connection").on("click", function(event){
      newConnection(uri);
    });

    $("#new_reading").on("submit", function(event) {
      // Case 1: Connection Error
      if (typeof ws == 'undefined'){
        console.log("Not Connceted")
        event.preventDefault();
      }else{
        // Case 2: Update Database(thru form) + Send Message to All Client(in backend)
        var value = $("#reading_value").val();
        var fetchStatus = $("#attribute_tracker").data();
        ws.send(JSON.stringify(
          {
            user_id: fetchStatus.userId,
            sensor_type: fetchStatus.sensorType,
            sensor_id: fetchStatus.sensorId,
            time: fetchStatus.time,
            requester: fetchStatus.requester,
            reading: value
          })
        );
      }
    });

    $("#end_connection").on("click", function(){
      console.log("DISCONNECT")
      ws.close();
      delete ws;
    })
  // });

});

    // add to database

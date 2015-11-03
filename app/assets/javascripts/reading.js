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
      if (typeof ws == 'undefined'){
        console.log("Not Connceted")
        event.preventDefault();
      }else{
        var value = $("#reading_value").val();

        ws.send(JSON.stringify({
          value: value,
        }));
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

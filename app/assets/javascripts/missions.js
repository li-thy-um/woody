var dispatcher = new WebSocketRails('localhost:3000/websocket');

// dispatcher.trigger('start_timing');

var channel = dispatcher.subscribe('missions');

channel.bind('new', function(mission){
  alert(mission.user + ":\"干!\" " + mission.content)
});

channel.bind('destroy', function(mission){
  alert(mission.user + ":\"不干了!\" " + mission.content)
});

$(function(){
  $("#date_picker").calendarPicker({
    date: new Date($('#date').val()),
    callback:function(cal){
      window.location = '/?date='+cal.currentDateStr();
    }
  });
});

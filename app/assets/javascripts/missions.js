var dispatcher = new WebSocketRails('localhost:3000/websocket');

dispatcher.trigger('start_timing');

var channel = dispatcher.subscribe('time');

channel.bind('tick_tock', function(time){ console.log(time); });

var ProtocolParser = function() {
	var parser = Object.create(ProtocolParser.prototype);

	var state = "WAIT_FOR_SYNC";
	var sync_byte_count = 0;
	var address_buffer = new ArrayBuffer(2);
	var address_uint8 = new Uint8Array(address_buffer);
	var address_uint16 = new Uint16Array(address_buffer);
	var count_buffer = new ArrayBuffer(2);
	var count_uint8 = new Uint8Array(count_buffer);
	var count_uint16 = new Uint16Array(count_buffer);
	var data_buffer = new ArrayBuffer(2);
	var data_uint8 = new Uint8Array(data_buffer);
	var data_uint16 = new Uint16Array(data_buffer);

	parser.processChar = function(c) {
		switch(state) {
			case "WAIT_FOR_SYNC":
			break;

			case "ADDRESS_LOW":
				address_uint8[0] = c;
				state = "ADDRESS_HIGH";
			break;

			case "ADDRESS_HIGH":
				address_uint8[1] = c;
				if (address_uint16[0] != 0x5555) {
					state = "COUNT_LOW";
				} else {
					state = "WAIT_FOR_SYNC";
				}
			break;

			case "COUNT_LOW":
				count_uint8[0] = c;
				state = "COUNT_HIGH";
			break;

			case "COUNT_HIGH":
				count_uint8[1] = c;
				state = "DATA_LOW";
			break;

			case "DATA_LOW":
				data_uint8[0] = c;
				count_uint16[0]--;
				state = "DATA_HIGH";
			break;

			case "DATA_HIGH":
				data_uint8[1] = c;
				count_uint16[0]--;
				$(document).trigger("dcs-bios-write", [address_uint16, data_uint16]);
				address_uint16[0] += 2;
				if (count_uint16[0] == 0) {
					state = "ADDRESS_LOW";
				} else {
					state = "DATA_LOW";
				}
			break;

		}

		if (c == 0x55)
			sync_byte_count++;
		else
			sync_byte_count = 0;

		if (sync_byte_count == 4) {
			state = "ADDRESS_LOW";
			sync_byte_count = 0;
			$(document).trigger("dcs-bios-frame-sync");
		}
	}

	return parser;
}

function rawStringToBuffer( str ) {
    var idx, len = str.length, arr = new Array( len );
    for ( idx = 0 ; idx < len ; ++idx ) {
        arr[ idx ] = str.charCodeAt(idx) & 0xFF;
    }
    // You may create an ArrayBuffer from a standard array (of values) as follows:
    return new Uint8Array( arr ).buffer;
}

$(function() {
	if (typeof chrome == "undefined") return;
	if (!chrome.sockets) return;
	if (!chrome.sockets.tcp) return;

    var socketId;
	var parser = ProtocolParser();

    var onReceive = function(info) {
        if (info.socketId != socketId) return;

		var data = new DataView(info.data);
		for (var i=0; i<data.byteLength; i++)
			parser.processChar(data.getUint8(i));
    };

	tcp.create()
	.then(function(createInfo) {
		socketId = createInfo.socketId;
		console.log("created TCP socket, createInfo = ", createInfo);
		return tcp.connect(socketId, "127.0.0.1", 7778);
	})
	.then(function(result) {
		console.log("connected, result = ", result);
		return tcp.setNoDelay(socketId, true);
	})
	.then(function(result) {
		chrome.sockets.tcp.onReceive.addListener(onReceive);
		console.log(socketId);
	});

	$(document).on("dcs-bios-send", function(evt, msg) {
		chrome.sockets.tcp.send(socketId, rawStringToBuffer(msg), function(result) {

		});
	});

});
var tcp = {}

tcp.create = function(properties) {
	return new Promise(function(resolve, reject) {
		chrome.sockets.tcp.create(properties, resolve);
	});
}

tcp.setNoDelay = function(socketId, noDelay) {
	return new Promise(function(resolve, reject) {
		chrome.sockets.tcp.setNoDelay(socketId, noDelay, function(result) {
			if (result < 0)
				reject(result);
			resolve(result);
		});
	});
}

tcp.connect = function(socketId, peerAddress, peerPort) {
	return new Promise(function(resolve, reject) {
		chrome.sockets.tcp.connect(socketId, peerAddress, peerPort, function(result) {
			if (result < 0)
				reject(result);
			resolve(result);
        });
	});
}

tcp.send = function(socketId, data) {
	return new Promise(function(resolve, reject) {
		chrome.sockets.tcp.send(socketId, data, function(result) {
			if (result.resultCode < 0)
				reject(result);
			resolve(result);
		});
	});
}

var tcp = {}

tcp.create = function(properties) {
	return Q.Promise(function(resolve, reject, notify) {
		chrome.sockets.tcp.create(properties, resolve);
	});
}

tcp.setNoDelay = function(socketId, noDelay) {
	return Q.Promise(function(resolve, reject, notify) {
		chrome.sockets.tcp.setNoDelay(socketId, noDelay, resolve);
	});
}

tcp.connect = function(socketId, peerAddress, peerPort) {
	return Q.Promise(function(resolve, reject, notify) {
		chrome.sockets.tcp.connect(socketId, peerAddress, peerPort, resolve);
	});
}

tcp.send = function(socketId, data) {
	return Q.Promise(function(resolve, reject, notify) {
		chrome.sockets.tcp.send(socketId, data, resolve);
	});
}

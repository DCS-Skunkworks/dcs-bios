chrome.app.runtime.onLaunched.addListener(
	function() {
		chrome.app.window.create(
			'control-reference.html',
			{
				innerBounds: {
					width: 500, minWidth: 150, maxWidth: 900,
					height: 900, minHeight: 100, maxHeight: 1000
				},
				'resizable' : true,
			},
			function(createdWindow) {
				createdWindow.innerBounds.height = 800;
				createdWindow.innerBounds.width = 500;
				createdWindow.setAlwaysOnTop(true);
			}
		);
	}
);
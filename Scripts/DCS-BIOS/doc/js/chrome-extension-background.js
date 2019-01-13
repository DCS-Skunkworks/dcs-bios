chrome.app.runtime.onLaunched.addListener(
	function() {
		chrome.app.window.create(
			'control-reference.html',
			{
				innerBounds: {
					width: 500, minWidth: 500, maxWidth: 500,
					height: 900, minHeight: 900, maxHeight: 900
				},
				'resizable' : true
			},
			function(createdWindow) {
				createdWindow.innerBounds.height = 800;
				createdWindow.innerBounds.width = 500;
			}
		);
	}
);

/**
 * Ventus example
 * Copyright © 2012 Ramón Lamana
 */
(function($, Ventus) {
	$(document).ready(function() {
		var wm = new Ventus.WindowManager();

		window.wm = wm; // For debugging reasons

		function init() {
			// Mount all riot tags
			riot.mount('applauncher');
		}

		init();
	});
})($, Ventus);

/**
 * Ventus example
 * Copyright © 2012 Ramón Lamana
 */
(function($, Ventus) {
	$(document).ready(function() {
		var wm = new Ventus.WindowManager();

		window.wm = wm; // For debugging reasons

		//wmHack = window.wm; //hacked.

		function init() {
			// Mount all riot tags
			riot.mount('applauncher');

			//window.wm.mode = 'exposeHack';
            //window.wm.mode = 'default';
		}

		function getVentusWindowManager(){
		    return window.wm;
		}



		init();
	});
})($, Ventus);

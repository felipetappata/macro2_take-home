$(window).on('popover_added', function() {
	 $.each($('[data-toggle="lt_popover"]'), function(key, popoverEl) {
		let matlabCommand = $(popoverEl).attr('data-examplename');
		let openWithCommand = null;
		let match = matlabCommand.match(/openExample\('(.*)'\)/);
		let components = match[1].split('/')[0].split('_');
		if (match) {
			openWithCommand = match[1];
		}
		if (window.ow !== undefined && openWithCommand) {
			let that = this;
			let componentSupported = checkSupport(components);
                if (componentSupported) {
					$(that).popover('destroy')
					$(that).popover({
						title: 'Interactive Task', 
						content: function() {
							let cmd = $(this).attr('data-examplename');
							let content = '<span>In live scripts, tasks like this one let you interactively explore parameters and generate MATLAB code. To use the tasks in this example, <a href="matlab:' + cmd + '">try it in your browser</a>.</span>';
							return content;
						}
					}).on('shown.bs.popover', function (eventShown) {
						let $popup = $('#' + $(eventShown.target).attr('aria-describedby'));
						$popup.find('a').click(function (e) {
							e.preventDefault();
							ow.startOpenWith(openWithCommand);
							ow.loadExample(openWithCommand);
						});
						
					});
				} else {
					$(that).popover('destroy')
					$(that).popover({
						title: 'Interactive Task', 
						content: function() {
							let content = '<span>In live scripts, tasks like this one let you interactively explore parameters and generate MATLAB code. To use the tasks in this example, open the example in MATLAB.</span>';
							return content;
						}
					});
				}
        }
	 });
  });
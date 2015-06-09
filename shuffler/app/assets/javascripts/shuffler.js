// JQuery that allows user to display whatever they're testing themselves on
$(document).ready(function() {
	$(document).on('click', '.action', function() {
		var $this = $(this);
		var target = $this.data('content');
		$('div.action').not($this).each(function() {
			var $other = $(this);
			var otherTarget = $other.data('content');
			$(otherTarget).hide();
		});

		$(target).show();

	});

	$(document).on('click', '#show_del', function() {
		$(".delete").show();
	});
});
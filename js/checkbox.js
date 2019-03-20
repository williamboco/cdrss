window.onload = function() {
	var p = $('.checkAll').parent();
	p.addClass("sorting_disabled");

	$('.checkAll').on('click', function () {

		$(this).closest('table').find('tbody :checkbox')
		.prop('checked', this.checked)
		.closest('tr').toggleClass('selected', this.checked);
	});

}

function selectOne(param) {
	$(param).closest('tr').toggleClass('selected', param.checked);
	$(param).closest('table').find('.checkAll').prop('checked', ($(param).closest('table').find('tbody :checkbox:checked').length ==$(param).closest('table').find('tbody :checkbox').length));

}

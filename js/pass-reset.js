$(document).ready(function() {
	$('.alert').hide();

});

$('form').on('submit', function(event) {
	$form = $(this);

	event.preventDefault();
	console.log($form.serialize());
	$('.alert').hide();
	$form.find('button[type="submit"]').button('loading');
	$.ajax({
		type: 'POST',
		url: $form.attr('action'),
		data: $form.serialize(),
		success: function(response) {
			if(response.includes('reset')) {
				$('.alert-success').html(response).show();
			}else {
				$('.alert-danger').html(response).show();
			}
			$form.find('button[type="submit"]').button('reset');
			console.log(response);

		}
	});
});

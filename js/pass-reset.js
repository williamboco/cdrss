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
			 // $('.alert-success').show();
			if(response == "Error: Invalid email address. Please try again.") {
				$('.alert-danger').html(response).show();
			}else {
				$('.alert-success').html(response).show();
			}
			$form.find('button[type="submit"]').button('reset');
			console.log(response);

		}
	});
});

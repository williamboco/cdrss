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
<<<<<<< HEAD
		//	$('.alert-success').show();
			if(response.includes('success')) {
				$('.alert-success').html(response).show();
			}else {
=======
			 // $('.alert-success').show();
			if(response == "Invalid email address! Please try again.") {
>>>>>>> 3c32b73344f7e748ffd06e6ca3e9d7a6f63f6ba7
				$('.alert-danger').html(response).show();
			}else {
				$('.alert-success').html(response).show();
			}
			$form.find('button[type="submit"]').button('reset');
			console.log(response);

		}
	});
});

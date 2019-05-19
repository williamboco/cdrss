$(document).ready(function() {
	$('.alert').hide();

});

$('form').on('submit', function(event) {
	$form = $(this);

	event.preventDefault();
	console.log($form.serialize());

	$.ajax({
		type: 'POST',
		url: $form.attr('action'),
		data: $form.serialize(),
		success: function(response) {
			response = JSON.parse(response);
			console.log(response);
			if(response[0] == 'success') {
				console.log(response[1]);
				if(response[1] == 'Avp') {
					window.location.replace("home-avp.php");
				}else {
					window.location.replace("home.php");
				}

			}else {
				$('.alert-danger').html(response).show();
			}
		}
	});
});

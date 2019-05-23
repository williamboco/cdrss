$(document).ready(function() {
	$('.alert').hide();

});

$('#logInForm').on('submit', function(event) {
	$form = $(this);

	event.preventDefault();
	console.log($form.serialize());

	$.ajax({
		type: 'POST',
		url: $form.attr('action'),
		data: $form.serialize(),
		success: function(response) {
			var	response = JSON.parse(response);
			console.log(response);
			if(response[0] == 'success') {
				console.log(response[1]);
				if(response[1] == 'Avp') {
					window.location.replace("home-avp.php");
				}else if(response[1] == 'IT') {
					window.location.replace("home-it.php");
				} else {
					window.location.replace("home.php");
				}

			}else {
				$('.alert-danger').html(response).show();
			}
		}
	});
});

$( "#addForm" ).on( "submit", function( event ) {
	var $form = $(this);

	event.preventDefault();
	// Use Ajax to submit form data
	$.ajax({
		type: 'POST',
		url: $form.attr('action'),
		data: $form.serialize(),
		success: function(result) {
			$form[0].reset();
      var result =  JSON.parse(result);
				if(result.includes('success')) {
					alertify.alert(result);
				}else {
					alertify.alert(result);
				}
			}
	});
});

function regForm(el) {
	$('.viewLogin').addClass('hidden');
	$('.viewRegForm').removeClass('hidden');
}
function regFormHide() {
	$('.viewLogin').removeClass('hidden');
	$('.viewRegForm').addClass('hidden');
}

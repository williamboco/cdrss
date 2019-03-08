$(document).ready(function() {
	$('.alert').hide();
	
});

window.onload = function() {
	$form = $("form");
	
	$.ajax({
		type: 'GET',
		url: "ajax/password/check_request_id.php",
		data: {requestID: getParameterByName("rID")},
		success: function(response) {
			if(response == 'error') {
				window.location.replace("index.php");
			}else {
				$form.find('[name="userID"]').val(response);
			}
			
		}
	});
};

$('form').on('submit', function(event) {
	$form = $(this);
	
	$('.alert').hide();

	event.preventDefault();
	console.log($form.serialize());
	
	if(compare($form.find('[name="password1"]').val(), $form.find('[name="password2"]').val())) {
		$('.alert-danger').hide();
		
		$.ajax({
			type: 'POST',
			url: $form.attr('action'),
			data: $form.serialize(),
			success: function(response) {
				if(response == 'success') {
					window.location.replace("home.php");
				}else {
					$('.alert-danger').html(response).show();
				}
			
			}
		});

	}else {
		$('.alert-danger').html('Passwords do not match').show();
	}
	
	
});
	

function compare(a, b) {
	if(a == b) {
		return true;
	}else {
		return false;
	}
}

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}
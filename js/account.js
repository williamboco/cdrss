$(document).ready(function() {
	$('#viewBtn').click();
	
});

$("#profileForm").on("submit", function(event) {
	var $form = $(this);
	event.preventDefault();
    console.log($form.serialize());
	
	$.ajax({
		type: 'POST',
		url: $form.attr("action"),
		data: $form.serialize(),
		success: function(response) {
			//console.log(response);
			
			if(response == 'success') {
				alertify.log(response);
				location.reload();
				/*$form[0].reset();
				location.reload();*/
			}else {
				alertify.log(response);
			}
		}
	});
	
});

$("#passwordForm").on("submit", function(event) {
	var $form = $(this);
	event.preventDefault();
    console.log($form.serialize());
	
	
	if(compare($form.find('[name="password1"]').val(), $form.find('[name="password2"]').val())) {
		$.ajax({
		type: 'POST',
		url: $form.attr("action"),
		data: $form.serialize(),
		success: function(response) {
			//console.log(response);
			
			if(response == 'success') {
				alertify.log(response);
				location.reload();
				//$form[0].reset();
				//location.reload();
			}else {
				alertify.log(response);
			}
		}
	});
	}else {
		alertify.log("Not match");
	}
	
	
});

function viewUser(id) {
	$form = $('form');
	$('.divs').addClass('hidden');
	$('.viewProfile').removeClass('hidden');
	
	
	$.ajax({
        type: "GET",
        url: "ajax/userRead.php",
        data: {
            userID: id
        },
        cache: false,
        success: function(data) {
			var obj = JSON.parse(data);
            //console.log(obj);
			
			$("#userID").html(obj.ID);
			$("#role").html(obj.role);
			$("#email").html(obj.email);
			$("#name").html(obj.firstName + " " + obj.lastName);
			$("#gender").html(obj.gender);
			$("#contact").html(obj.contact);
			$("#dateEmployed").html(obj.dateEmployed);
			$("#passChanged").html(obj.datePassChanged);
			
			$form.find('[name="idNumber"]').val(obj.ID);
			$form.find('[name="firstname"]').val(obj.firstName);
			$form.find('[name="lastname"]').val(obj.lastName);
			$form.find('[name="email"]').val(obj.email);
			$form.find('[name="dateEmployed"]').val(obj.dateEmployed);
			$form.find('[name="contact"]').val(obj.contact);
			
			if(obj.gender == 'Male') {
				$('#gender1').attr("checked", true);
			}else {
				$('#gender2').attr("checked", true);
			}
			
		}
	});
}

function editUser(id) {
	$('.divs').addClass('hidden');
	$('.editProfile').removeClass('hidden');
}

function changePassword() {
	$('.divs').addClass('hidden');
	$('.editPassword').removeClass('hidden');
}

function compare(a, b) {
	if(a == b) {
		return true;
	}else {
		return false;
	}
}

function delAccount(id) {
	$.ajax({
        type: "GET",
        url: "ajax/userDelete.php",
        data: {
            userID: id
        },
        cache: false,
        success: function(response) {
            console.log(response);
			window.location.replace("index.php");
			//location.reload();
			
		}
	});
}
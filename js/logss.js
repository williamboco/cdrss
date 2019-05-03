$(document).ready(function() {
	var t = $('#logsTable').DataTable( {
		"ajax": "ajax/filtered_logs.php?",
		"columnDefs": [ {
			"searchable": false,
			"orderable": false,
			"targets": 0
		} ],
		"columns": [
			{title: "Event", width: "5%"},
			{title: "Date / Time"},
			{title: "Action"},
			{title: "Name"},
			{title: "Role",  width: "20%" , orderable: false},
		],
		"order": [[ 0, 'desc' ]] //1 changed to 2 to hide sort arrow https://datatables.net/forums/discussion/21164/disable-sorting-of-one-column
	} );

	t.on( 'order.dt search.dt', function () {
		t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
			cell.innerHTML = i+1;
		} );
	} ).draw();

});

$("#addForm").on("submit", function(event) {
	var $form = $(this);
	event.preventDefault();
    //console.log($form.serialize());

	$.ajax({
		type: 'POST',
		url: $form.attr("action"),
		data: $form.serialize(),
		success: function(response) {
			console.log(response);

			$('#addModal').modal('hide');
				alertify.alert("Success");
				$form[0].reset();
				refreshUTable();
			/*if(response == 'success') {
				$('#addModal').modal('hide');
				alertify.alert(response);
				$form[0].reset();
				refreshUTable();

			}else {
				alertify.alert(response);
			}*/
		}
	});

});

/*$('input[name="radioButton"]').on("click", confirmDelete() {
	/*if (e.clientX === 0 && e.clientY === 0) {
        console.log("keyboard");
    } else {
        console.log("mouse");
    };
}*/


/*function confirmDelete() {
	$('.confirmDelete').removeClass('hidden');
	$('.viewProfile').addClass('hidden');
}

function cancelDelete() {
	$('.confirmDelete').addClass('hidden');
	$('.viewProfile').removeClass('hidden');
}*/

function viewUser(id) {
	$.ajax({
        type: "GET",
        url: "ajax/userRead.php",
        data: {
            userID: id
        },
        cache: false,
        success: function(data) {
			var obj = JSON.parse(data);
            console.log(obj);
			$("#userID").html(obj.ID);
			$("#role").html(obj.role);
			$("#email").html(obj.email);
			$("#name").html(obj.firstName + " " + obj.lastName);
			$("#gender").html(obj.gender);
			$("#contact").html(obj.contact);
			$("#dateEmployed").html(obj.dateEmployed);
			$("#deleteBtn").val(obj.ID);

		}
	});

	$('#viewModal').modal('show');

}

function deleteUser(id) {
	//alert(id);
	var status = $("input[type='radio'][name='statusType']:checked").val();

	$.ajax({
        type: "GET",
        url: "ajax/userDelete.php",
        data: {
            userID: id,
						statusType: status

        },
        cache: false,
        success: function(response) {
            //console.log(response);
			alertify.alert(response);
			refreshUTable();
		}
	});

	$('#viewModal').modal('hide');
}

function refreshUTable() {
	var datatable = $('#logsTable').dataTable().api();
	$.ajax({
		type: "GET",
		url: "ajax/filtered_logs.php?",
		cache: false,
		success: function(data) {
			var obj = JSON.parse(data);
			obj = obj.data;
			datatable.clear();
			datatable.rows.add(obj);
			datatable.draw();

		}
	});
}

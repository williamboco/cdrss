$(document).ready(function() {
	var t = $('#patientTable').DataTable( {
		 "columnDefs": [ {
		"searchable": false,
		"orderable": false,
		"targets": 0
	} ],
	"columns": [
		{title: "#", width: "5%", className: "dt-center"},
		{title: '<input type="checkbox" class="checkAll" name="checkAll" />', orderable: false, className: "dt-center"},
		{title: 'ID'},
		{title: "Firstname"},
		{title: "Lastname"},
		{title: "Action", orderable: false}
	],
	"order": [[ 2, 'asc' ]]
	} );

	$('.checkAll').on('click', function () {

		$(this).closest('table').find('tbody :checkbox')
		.prop('checked', this.checked)
		.closest('tr').toggleClass('selected', this.checked);
	});

	t.on( 'order.dt search.dt', function () {
		t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
			cell.innerHTML = i+1;
		} );
	} ).draw();

	$('.filters').trigger('change');

} );


$('.filters').on('change', function() {
	var datatable = $('#patientTable').dataTable().api();
	var $form = $('#filter');
	//console.log($form.serialize());

	$.ajax({
		type: "GET",
		url: $form.attr('action'),
		data: $form.serialize(),
		cache: false,
		success: function(data) {
			var obj = JSON.parse(data);
			obj = obj.data;

			datatable.clear();
			datatable.rows.add(obj);
			datatable.draw();
		}
	});
});

$( "#patientAddForm" ).on( "submit", function( event ) {
	var $form = $(this);
	var $patientModal = $("#patientModal");

	event.preventDefault();
	//console.log($form.serialize());

	// Use Ajax to submit form data
	$.ajax({
		type: 'POST',
		url: $form.attr('action'),
		data: $form.serialize(),
		success: function(result) {
			$form[0].reset();
			$patientModal.modal('hide');
			$('.filters').trigger('change');
			window.location.reload();
		}else {
			alertify.alert(result);
			window.location.reload(true);
		}
	});
});

$(document).ready(function() {
	var t = $('#patientTable').DataTable( {
		"columnDefs": [ {
		"searchable": false,
		"orderable": false,
		"targets": 0
	} ],
	"columns": [
		{title: "#", width: "5%", className: "dt-center"},
		{title: '<input type="checkbox" class="checkAll" name="checkAll" />', orderable: false, width: "10%", className: "dt-center"},
		{width: "20%", title: 'ID'},
		{title: "Firstname"},
		{title: "Lastname"},
		{title: "Action", width: "15%", className: "dt-center",orderable: false}
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

	event.preventDefault();
	// Use Ajax to submit form data
	$.ajax({
		type: 'POST',
		url: $form.attr('action'),
		data: $form.serialize(),
		success: function(result) {
			$("#patientModal").modal('hide');
			$('.filters').trigger('change');
			$form[0].reset();

				if(result.includes('success')) {
					alertify.alert(result).set('onok', function(closeEvent){
						window.location.reload(true);
					});
				}else {
					alertify.alert(result);
				}
			}
	});
});

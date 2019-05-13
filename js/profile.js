$(document).ready(function() {

	viewProfile();
	var t = $('#visitTable').DataTable( {
		"ajax": "ajax/profile_visit.php" + location.search,
		"columnDefs": [ {
			"searchable": false,
			"orderable": false,
			"targets": 0
		} ],
		"columns": [
			{title: "#", className: "dt-center"},
			{title: '<input type="checkbox" class="checkAll" name="checkAll" />', orderable: false, className: "dt-center"},
			{title: "Date of Visit"},
			{title: "Complaint"},
			{title: "Medicine Request"},
			{title: "Action", orderable: false}
		],
		"order": [[ 2, 'asc' ]] //1 changed to 2 to hide sort arrow https://datatables.net/forums/discussion/21164/disable-sorting-of-one-column
	} );

	t.on( 'order.dt search.dt', function () {
		t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
			cell.innerHTML = i+1;
		} );
	} ).draw();

});

function refresh() {
	var $form = $('#filter');
	var datatable = $('#visitTable').dataTable().api();
	console.log($form.serialize());

		$.ajax({
			type: "GET",
			url: "ajax/profile_visit.php",
			data: {id:getParameterByName("id")},
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

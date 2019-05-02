$(document).ready(function() {
	setDateRange();

	var t = $('#visitTable').DataTable( {
		"ajax": "ajax/filtered_visits.php?" + $('#filter').serialize() ,
		"columnDefs": [ {
			"searchable": false,
			"orderable": false,
			"targets": 0
		} ],
		"columns": [
			{title: "#", width: "5%", className: "dt-center"},
			{title: '<input type="checkbox" class="checkAll" name="checkAll" />', width: "5%" , orderable: false, className: "dt-center"},
			{title: "ID"},
			{title: "Name", className: "hover"},
			{title: "Complaint"},
			{title: "Medicine / Supply Requested"},
			{title: "Visit Date/Time"},
			{title: "Action", width: "15%" , orderable: false}
		],
		"order": [[ 2, 'asc' ]] //1 changed to 2 to hide sort arrow https://datatables.net/forums/discussion/21164/disable-sorting-of-one-column
	} );

	t.on( 'order.dt search.dt', function () {
		t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
			cell.innerHTML = i+1;
		} );
	} ).draw();

	$('#date1').on('change', function() {
		//alert("Changed");
		var $date1 = $("#date1");
		var $date2 = $("#date2");

		$date2.attr("min", $date1.val());
	});

	$('.filters').on('change', function() {
		refresh();
		visitDate()
	});
	visitDate();
} );

$(function(){
	$('.widget').widgster();
});

$('#filter').find('[name="patientType"]').on('change', function() {
	var text = " ";
	switch(this.value) {
		case 'All':
			text = "All ";
			break;
		case 'shs':
			text = "Senior High School ";
			break;
		case 'coll':
			text = "College ";
			break;
		case 'stud':
			text = "College & Senior High School ";
			break;
		case 'emp':
			text = "Employee ";
			break;
		default:
	}

	$('#filterName').html(text);

});

$(".graphBtn").on('click', function() {
	$(".graphBtn").removeClass('hidden');
	$(this).addClass('hidden');
	$('.tableBtn').toggleClass('hidden');
	$('#graph').toggleClass('hidden');
	$('#table').toggleClass('hidden');
	refresh();

});

function proceedReport() {
	$form = $('#filter');
	console.log($form.serialize());

	window.location="report.php?" + $form.serialize();

}

function refresh() {
	var $form = $('#filter');
		console.log($form.serialize());


		var datatable = $('#visitTable').dataTable().api();
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

		//Medicine Graph
		$.ajax({
			type: "GET",
			url: "ajax/graph_medicine.php",
			data: $('#filter').serialize(),
			cache: false,
			success: function(data) {
				var obj = JSON.parse(data);
				console.log(obj);

				chart.dataProvider = obj;
				chart.validateData();

			}
		});


		//Compaint Graph
		$.ajax({
			type: "GET",
			url: "ajax/graph_complaint.php",
			data: $('#filter').serialize(),
			cache: false,
			success: function(data) {
				var obj = JSON.parse(data);
				//console.log(obj);

				chart2.dataProvider = obj;
				chart2.validateData();

			}
		});
}

function visitDate() {
	var date1 = $('#date1').val();
	var date2 = $('#date2').val();
	date1 = moment(date1).format('LL');
	date2 = moment(date2).format('LL');

	$('#date').html(date1 + " - " + date2);
	console.log(date1 + date2)
}

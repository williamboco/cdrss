$(document).ready(function() {
	setDateRange();

	var t = $('#visitTable').DataTable( {
		"ajax": "ajax/filtered_visits_avp.php?" + $('#filter').serialize() ,
		"columnDefs": [ {
			"searchable": false,
			"ordering": false,
			targets: 0,
			//className: 'reorder',
		//	 "autoWidth": false
		} ],
		"columns": [
			{title: "#", width: "5%", className: "dt-center"},
			{title: '<input type="checkbox" class="checkAll" name="checkAll" />', width: "5%", className: "dt-center"},
			{title: "ID"},
			{title: "Name"},
			{title: "Complaint"},
			{title: "Medicine / Supply Requested"},
			{title: "Visit Date/Time"},
			{title: "Action", width: "5%", orderable: false},
		],
		"order": [[ 6, 'desc' ]],
		//1 changed to 2 to hide sort arrow https://datatables.net/forums/discussion/21164/disable-sorting-of-one-column
	});

	t.on( 'order.dt search.dt', function () {
		t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
			cell.innerHTML = i+1;
		} );
	} ).draw();

/*	t.on( 'column-reorder', function (e, settings, details) {
		var order = t.order();
		console.log(details);

		console.log(order);
	});*/

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
		case 'guest':
			text = "Guest ";
			break;
		default:
	}

	$('#filterName').html(text);

});


	//var table = $('#sortBy').DataTable( {
	//colReorder: true
	//}
 //);

	/*$('.sorts').on('change', function() {
	  var datatable = $('#visitTable').dataTable().api();
		var $form = $('#sortBy');
		var order = datatable.order();
		var sort = $form.find('[name="sortType"]').val();
	//  console.log(sort);
		$.ajax({
			type: "GET",
			url: $form.attr('action'),
			data: $form.serialize(),
			cache: false,
			success: function(data) {

			switch(sort) {
					case 'all':
						datatable.colReorder.order([ 0, 1, 2, 3, 4, 5, 6, 7], true);
						//datatable.colReorder.reset();
					//	datatable.colReorder.enable();
						break;
					case 'sname':
					  datatable.colReorder.order([0, 1, 3, 4, 5, 6, 2, 7], true);
					//	datatable.colReorder.reset();
						break;
					case 'scomp':
						datatable.colReorder.order([0, 1, 4, 5, 6, 2, 3, 7 ], true);
					//	datatable.colReorder.reset();
						break;
					case 'smed':
						datatable.colReorder.order([0, 1, 5, 6, 2, 3, 4, 7 ], true);
					//	datatable.colReorder.reset();
						break;
					case 'sdate':
				    datatable.colReorder.order([ 0, 1, 6, 2, 3, 4, 5, 7], true);
					//	datatable.colReorder.reset();
						break;
					default:
			}
				var obj = JSON.parse(JSON.stringify(data));
			  obj = obj.data;

			  datatable.colReorder.enable();
				datatable.clear();
			//  datatable.rows.add(obj);
				datatable.draw();
	   	}
		});
		refresh();
	//	$('#visitTable').order(datatable);
});*/


$(".graphBtn").on('click', function() {
	$(".graphBtn").removeClass('hidden');
	$(this).addClass('hidden');
	$('.tableBtn').toggleClass('hidden');
	$('#graph').toggleClass('hidden');
	$('#table').toggleClass('hidden');
	refresh();

});

function proceedReport() {
	var $form = $('#filter');
	var role = $form.find('[name="role"]').val();
	var firstName = $form.find('[name="firstName"]').val();

	console.log($form.serialize());
	console.log(role);

	if (role == "Admin") {
		window.location = "report-admin.php?" + $form.serialize();
	} else	if (role=="Physician"){
		window.location="report-avp.php?" + $form.serialize();
	}  	else {
		window.location="report.php?" + $form.serialize();
	}

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

		//Complaint Graph
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

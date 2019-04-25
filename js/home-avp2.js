$(document).ready(function() {
	setDateRange();
	var t = $('#visitTable').DataTable( {
		"ajax": "ajax/filtered_visits_avp.php?" + $('#filter').serialize() ,
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
		"order": [[ 1, 'asc' ]] //1 changed to 2 to hide sort arrow https://datatables.net/forums/discussion/21164/disable-sorting-of-one-column
	} );

	t.on( 'order.dt search.dt', function () {
		t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
			cell.innerHTML = i+1;
		} );
	} ).draw();

	setDateRange();

	$('.filters').on('change', function() {
		/*var $form = $('#filter');
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
				console.log(obj);
				datatable.clear();
				datatable.rows.add(obj);
				datatable.draw();
			}
		});*/
		refresh();
		visitDate();

	});
	visitDate();

});


function viewVisit(id) {
	 $.ajax({
        type: "GET",
        url: "ajax/visitRead.php",
        data: {
            visitID: id
        },
        cache: false,
        success: function(data) {
			var obj = JSON.parse(data);
            console.log(obj);

			$(".visitId").html(obj.Visit.ID);

			$("#complaint").empty();
            $.each(obj.Complaint, function(index, value) {
                $("#complaint").append('<li class="h4">' + value + '</li>');

            });

            $("#medicine").empty();
            $.each(obj.Medicine, function(i) {
                $("#medicine").append('<li class="h4">' + obj.Medicine[i].quantity + "pcs.  " + obj.Medicine[i].name + '</li>');

            });

            $("#remarks").html(obj.Visit.remarks);
            $("#createdBy").html(obj.createdBy);
            $("#dateCreated").html(obj.Visit.dateCreated);
            $("#modifiedBy").html(obj.modifiedBy);
            $("#dateModified").html(obj.Visit.dateModified);
		}
	 });

	 $('#viewModal').modal('show');

}


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

	window.location="report-avp.php?" + $form.serialize();

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
				console.log(obj);

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

$(document).ready(function() {
	
	var date1 = getParameterByName('date1');
	var date2 = getParameterByName('date2');
	var months = diff(moment(date1).format('MMMM YYYY'), moment(date2).format('MMMM YYYY'));
	var filters = {
		patientType: getParameterByName('patientType'),
		months: diff(moment(date1).format('MMMM YYYY'), moment(date2).format('MMMM YYYY'), 1),
		years: diff(moment(date1).format('MMMM YYYY'), moment(date2).format('MMMM YYYY'), 1, 1)
	};

	date1 = moment(date1).format('LL');
	date2 = moment(date2).format('LL');
	console.log(months);
	$('#date').html(date1 + " - " + date2);


	var compData = columnData("Health Complaints", "Complaints", months);
	var medData = columnData("Medicine / Supply", "Total Medicine Dispensed", months);
	//console.log();
	var t = $('#complaintTable').DataTable( {
		 "paging":   false,
        "ordering": false,
        "info":     false,
		"bFilter": false,
		"columnDefs": [ {
			"searchable": false,
			"orderable": false,
			"targets": 0
		} ],
		"columns": compData,
		"order": [[ 0, 'asc' ]] //1 changed to 2 to hide sort arrow https://datatables.net/forums/discussion/21164/disable-sorting-of-one-column
	} );

	var t2 = $('#medicineTable').DataTable( {
		 "paging":   false,
        "ordering": false,
        "info":     false,
		"bFilter": false,
		//"ajax": "ajax/filtered_visits.php?" + $('#filter').serialize() ,
		"columnDefs": [ {
			"searchable": false,
			"orderable": false,
			"targets": 0
		} ],
		"columns": medData,
		"order": [[ 0, 'asc' ]] //1 changed to 2 to hide sort arrow https://datatables.net/forums/discussion/21164/disable-sorting-of-one-column
	} );

	refresh(filters);
	reportLabel();
});


function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}


function diff(from, to, m, y) {
	var monthNames = [ "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December" ];
    var arr = [];
    var datFrom = new Date('1 ' + from);
    var datTo = new Date('1 ' + to);
    var fromYear =  datFrom.getFullYear();
    var toYear =  datTo.getFullYear();
    var diffYear = (12 * (toYear - fromYear)) + datTo.getMonth();

    for (var i = datFrom.getMonth(); i <= diffYear; i++) {
		//custom mod
		if(y) {
			arr.push(Math.floor(fromYear+(i/12)));
		}else if(m) {
			arr.push(i%12+1);
		}else
        arr.push(monthNames[i%12]/* + " " + Math.floor(fromYear+(i/12))*/);

    }

    return arr;
}

function columnData(hl, hr, months) {
	var columns = new Array();

	columns.push({title: hl});
	for(var i = 0; i < months.length; i++) {
		columns.push({title: months[i]});
	}
	columns.push({title: hr, width: "35%", className: "dt-center"});

	return columns;
}

function refresh(filters) {

	var datatable = $('#complaintTable').dataTable().api();
	$.ajax({
		type: "GET",
		url: "ajax/tally.php",
		data: filters,
		cache: false,
		success: function(data) {
			var obj = JSON.parse(data);
			//obj = obj.data;
			console.log(obj);
			datatable.clear();
			datatable.rows.add(obj.data);
			datatable.draw();

			$('#totalComp').html(obj.gTotal);
			var arr = obj.pTotal;
			var vTotal = obj.vTotal;
			var vIDs = {};
			var counts = {};
			//alert(vTotal);
			for (var i = 0; i < arr.length; i++) {
				counts[arr[i]] = 1 + (counts[arr[i]] || 0);
			}
			
			for (var i = 0; i < vTotal.length; i++) {
				vIDs[vTotal[i]] = 1 + (vIDs[vTotal[i]] || 0);
			}
			console.log(vIDs);
			//console.log(Object.keys(counts));
			$('#totalP').html(Object.keys(counts).length);
			$('#totalV').html(Object.keys(vIDs).length);
			
			var ids = Object.keys(counts);
			console.log(ids);
			$.ajax({
				type: "POST",
				url: "ajax/tally_visits.php",
				data: {ids: ids},
				cache: false,
				success: function(data) {
					var data = JSON.parse(data);
					//alert(data);
				}
			});
			
		}
	});


	var datatable2 = $('#medicineTable').dataTable().api();
	$.ajax({
		type: "GET",
		url: "ajax/tally_medicine.php",
		data: filters,
		cache: false,
		success: function(data) {
			var obj = JSON.parse(data);
			//obj = obj.data;
			console.log(obj);
			datatable2.clear();
			datatable2.rows.add(obj.data);
			datatable2.draw();

			$('#totalMed').html(obj.gTotal);
		}
	});

}

function reportLabel() {
	var text = " ";
	switch(getParameterByName('patientType')) {
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
	
	$('#pType').html(text);
}
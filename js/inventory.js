$(document).ready(function() {
	var t = $('#table').DataTable( {

		"columnDefs": [ {
			"searchable": false,
			"orderable": false,
			"targets": [0,2]
		} ],

		"columns": [
			{title: "#", width: "5%", className: "dt-center"},
			{title: '<input type="checkbox" class="checkAll" name="checkAll" />', width: "5%" , orderable: false, className: "dt-center"},
			{title: "", width: "5%", className: "dt-center"},
			{title: "Name", className: "hover"},
			{title: "Available Qty", width: "5%"},
			{title: "Status", width: "10%"},
			{title: "Add/Less", width: "10%"},
			{title: "Qty", width: "5%"},
			{title: "Action", width: "5%"},
			{title: "Total Qty", width: "10%"}
		],

		"order": [[ 3, 'asc' ]] //1 changed to 2 to hide sort arrow https://datatables.net/forums/discussion/21164/disable-sorting-of-one-column

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


	$('.filter').on('click', function() {
		var value = this.value;

		$('#deleteBtn').val(value);
		selectUrl(value);

		$(this).parent().siblings().find('#inventoryBtn').addClass('hidden');
	});


	$('.inventory').on('click', function() {
		var value = this.value;

		$('#deleteBtn').val(value);
		selectUrl(value);

		$(this).parent().siblings().find('#inventoryBtn').removeClass('hidden');

			/*"columns": [
				{title: "Available Qty", width: "5%"},
				{title: "Status", width: "10%"},
				{title: "Add/Less", width: "10%"},
				{title: "Qty", width: "5%"},
				{title: "Action", width: "5%"},
				{title: "Total Qty", width: "10%"}
			],*/

	});


	$('#table tbody').on('click', '.details-control', function () {

		var tr = $(this).closest('tr');
		var row = t.row( tr );

		if ( row.child.isShown() ) {
			row.child.hide();
			tr.removeClass('shown');
		}
		else {
			row.child( format(row.data()) ).show();
			tr.addClass('shown');
		}
	} );

	$('#addBtn').on('click', function() {
		var $addModal = $('#addModal');
		var table = $('#deleteBtn').val();

		$addModal.find('form').hide();
		$addModal.find('#add-' + table).show();

	});

	$(".addForm").on("submit", function(event) {
		var $addModal = $('#addModal');
		var table = $('#deleteBtn').val();
		var $form = $( this );

		// Prevent form submission
		event.preventDefault();
		console.log( $form.serialize() );

		$.ajax({
			type: 'GET',
			url: $form.attr('action'),
			data: $form.serialize(),
			success: function(response) {
				$form[0].reset();
				$addModal.modal('hide');
				alertify.log(response);
				selectUrl(table);

			}
		});

	});

	$(".editForm").on("submit", function(event) {
		var $editModal = $('#editModal');
		var table = $('#deleteBtn').val();
		var $form = $( this );

		// Prevent form submission
		event.preventDefault();
		console.log( $form.serialize() );

		$.ajax({
			type: 'GET',
			url: $form.attr('action'),
			data: $form.serialize(),
			success: function(response) {
				$form[0].reset();
				$editModal.modal('hide');
				alertify.log(response);
				selectUrl(table);
			}
		});
	});
});


$('[name="medicineType"]').on('change', function() {
	var $this = $(this);

	$this.parent().siblings('button').removeClass('hidden');
	$this.siblings().addClass('hidden');
	$this.siblings().find('.form-control').attr('disabled', true);
	if($this.val() == '0') {
		$this.siblings('#medDiv').removeClass('hidden');
		$this.siblings('#medDiv').find('.form-control').attr('disabled', false);

	}else {
		$this.siblings('#supDiv').removeClass('hidden');
		$this.siblings('#supDiv').find('.form-control').attr('disabled', false);
	}

});

function selectUrl(value) {
		var url;
		var headerName;

		switch(value) {
			case "course":
				url = "ajax/table/course.php";
				headerName = "Courses";
				break;
			case "track":
				url = "ajax/table/track.php";
				headerName = "Tracks";
				break;
			case "department":
				url = "ajax/table/department.php";
				headerName = "Departments";
				break;
			case "allergy":
				url = "ajax/table/allergy.php";
				headerName = "Allergies";
				break;
			case "complaint":
				url = "ajax/table/complaint.php";
				headerName = "Complaints";
				break;
			/*case "medicine":
				url = "ajax/table/medicine.php";
				headerName = "Medicines / Supplies";
				break;*/
			default:
				alertify.log("Switch case");
		}

		updateTable(url, headerName);
	}

function format (rowData) {
	console.log(rowData);
	var table = $('#deleteBtn').val();
	table += 'Details.php'
	var url = "ajax/table/" + table;

    var div = $('<div/>')
        .addClass( 'loading' )
        .text( 'Loading...' );

    $.ajax( {
        url: url,
        data: {id: rowData[0]},
        success: function (content) {
			//var obj = JSON.parse(data);
			//obj = obj[0];
			div.html(content).removeClass( 'loading' );
        }
    } );

    return div;
}

function updateTable(url, headerName) {
	var datatable = $('#table').dataTable().api();

	$.ajax({
		type: "GET",
		url: url,
		cache: false,
		success: function(data) {
			var obj = JSON.parse(data);
			datatable.clear();
			datatable.columns(3).header().to$().text(headerName);
			datatable.rows.add(obj);
			datatable.draw();
		}
	});

}
function editRecord() {
	var $editModal = $('#editModal');
	var table = $('#deleteBtn').val();
	var ids = [];


	$("#table tr").each(function() {
        if ($(this).hasClass("selected")) {
            ids.push($(this).find("#ID").attr("value"));
        }
    });

	var count = ids.length;
	if(count >= 1) {
		if(count == 1) {
			var $form = $('#edit-' + table);
			$editModal.modal('show');
			$editModal.find('form').hide();
			$form.show();

			$.ajax({
				type: "GET",
				url: "ajax/table/recordRead.php",
				data: {data: ids[0], table: table},
				cache: false,
				success: function(response){
					var obj = JSON.parse(response);
					var value = obj.ID;

					switch(table) {
						case 'allergy':
							$form.find('input[name="allergyName"]').val(obj.allergyName);
							$form.find('textarea[name="description"]').val(obj.description);
							$form.find('input[name="id"]').val(value);
							console.log(obj);
							break;
						case 'complaint':
							$form.find('input[name="complaintName"]').val(obj.complaintName);
							$form.find('textarea[name="description"]').val(obj.description);
							$form.find('input[name="id"]').val(value);
							console.log(obj);
							break;
						case 'medicine':

							if(obj.isSupply == '0') {
								$form.find('[name="medicineType"]').val('0').trigger('change');
								$form.find('input[name="brandName"]').val(obj.brandName);
								$form.find('input[name="genericName"]').val(obj.genericName);
								$form.find('[name="medicineForm"]').val(obj.type).trigger('change');
							}else {
								$form.find('[name="medicineType"]').val('1').trigger('change');
								$form.find('input[name="supplyName"]').val(obj.genericName);
							}

							$form.find('input[name="id"]').val(value);
							console.log(obj);
							break;
						case 'course':
							$form.find('textarea[name="courseName"]').val(obj.courseName);
							$form.find('input[name="id"]').val(value);
							console.log(obj);
							break;
						case 'track':
							$form.find('textarea[name="trackName"]').val(obj.trackName);
							$form.find('input[name="id"]').val(value);
							console.log(obj);
							break;
						case 'department':
							$form.find('textarea[name="departmentName"]').val(obj.departmentName);
							$form.find('input[name="id"]').val(value);
							console.log(obj);
							break;
					}

				}
			});

		}else {
			alertify.log("Cannot edit multiple records");
		}
	}else {
		alertify.log("No record selected");
	}

}
function delRecord() {
	var table = $('#deleteBtn').val();
	var ids = [];
    $("#table tr").each(function() {
        if ($(this).hasClass("selected")) {
            ids.push($(this).find("#ID").attr("value"));
        }
    });

	var count = ids.length;
	if(count >= 1) {
		var message;
		if(count == 1) {
			message = "Do you want to delete this record?";
		}else {
			message = "Do you want to delete these records?";
		}
		if(getConfirmation(message)) {
			$.ajax({
				type: "GET",
				url: "ajax/table/recordDelete.php",
				data: {data: ids, table: table},
				cache: false,
				success: function(response){
					selectUrl(table);
				}
			});
		}
	}else {
		alertify.log("No record selected");
	}


}

function getConfirmation(message) {
	var retVal = confirm(message);
   if( retVal == true ){
	  return true;
   }
   else{
	  return false;
   }
}

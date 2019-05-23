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
			{title: "Name", className: "hover"}

		],

		"order": [[ 3, 'asc' ]] //1 changed to 2 to hide sort arrow https://datatables.net/forums/discussion/21164/disable-sorting-of-one-column
	} );

	var t2 = $('#medicineTable').DataTable( {

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
			{title: "Available Qty", width: "10%"},
			{title: "Status", width: "15%"},
			{title: "Add/Less", width: "10%"},
			{title: "Qty", width: "5%"},
			{title: "Action", width: "10%"}
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

	t2.on( 'order.dt search.dt', function () {
		t2.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
			cell.innerHTML = i+1;
		} );
	} ).draw();

	$('.filter').on('click', function() {
		var value = this.value;

		$('#deleteBtn').val(value);
		selectUrl(value);
		console.log(value);

		$('.table-responsive').show();
		$('.medicine-responsive').addClass('hidden');
	});

	$('.medicine-filter').on('click', function() {
		var value = this.value;

		$('#deleteBtn').val(value);
		selectUrl(value);
		console.log(value);

		$('.table-responsive').hide();
		$('.medicine-responsive').removeClass('hidden');
	});

  $('.filters').on('click', function() {
  	var datatable = $('#medicineTable').dataTable().api();
  	var status = this.value;

  	$.ajax({
  		type: "GET",
  		url: "ajax/filtered_medicine.php",
  		data: {data: status},
  		cache: false,
  		success: function(data) {
  			// console.log(data);
  			var obj = JSON.parse(data);
  			datatable.clear();
  			format(datatable.rows.add(obj));
  			datatable.draw();
  		}
  	});
  });

	$('#table tbody').on('click', '.details-control', function () {

		var tr = $(this).closest('tr');
		var row = t.row(tr);

		if (row.child.isShown()) {
			row.child.hide();
			tr.removeClass('shown');
		}
		else {
			row.child(format(row.data())).show();
			tr.addClass('shown');
		}
	} );

	$('#medicineTable tbody').on('click', '.details-control', function () {

		var tr = $(this).closest('tr');
		var row = t2.row(tr);

		if (row.child.isShown()) {
			row.child.hide();
			tr.removeClass('shown');
		}
		else {
			row.child(format(row.data())).show();
			tr.addClass('shown');
		}
	} );

	$('#medicineTable tbody').on('change', '[name="isAdd"]', function() {

		var tr = $(this).closest('#medicineTable tr');

		tr.find(':checkbox').prop('checked', true).trigger('change');
		tr.addClass('selected', this.checked);

	} );

	$('#addBtn').on('click', function(event) {
		var $addModal = $('#addModal');
		var table = $('#deleteBtn').val();

		if (table == ''){
			event.stopPropagation();
			alertify.alert("No record selected");
		} else {
			$addModal.find('form').hide();
			$addModal.find('#add-' + table).show();
		}

	});

	$('.addForm').on('submit', function(event) {
		var $addModal = $('#addModal');
		var table = $('#deleteBtn').val();
		var $form = $(this);

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
        if (response.includes("success")){
          alertify.alert(response);
          selectUrl(table);
        } else{
          alertify.alert(response);
        }
			}
		});

	});

	$(".editForm").on("submit", function(event) {
		var $editModal = $('#editModal');
		var table = $('#deleteBtn').val();
		var $form = $(this);

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
        if (response.includes("success")){
          alertify.alert(response);
          selectUrl(table);
        } else{
          alertify.alert(response);
        }
			}
		});
	});

});

$('[name="isSupply"]').on('change', function() {
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
				updateTable(url, headerName);
				break;
			case "track":
				url = "ajax/table/track.php";
				headerName = "Tracks";
				updateTable(url, headerName);
				break;
			case "department":
				url = "ajax/table/department.php";
				headerName = "Departments";
				updateTable(url, headerName);
				break;
			case "allergy":
				url = "ajax/table/allergy.php";
				headerName = "Allergies";
				updateTable(url, headerName);
				break;
			case "complaint":
				url = "ajax/table/complaint.php";
				headerName = "Complaints";
				updateTable(url, headerName);
				break;
			case "medicine":
				url = "ajax/table/medicine.php";
				headerName = "Medicines / Supplies";
				updateMedicineTable(url, headerName);
				break;
			default:
				alertify.alert("Switch case");
		}

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
			console.log(div);
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
			console.log(obj);
			datatable.clear();
			datatable.columns(3).header().to$().text(headerName);
			datatable.rows.add(obj);
			datatable.draw();
		}
	});

}

function updateMedicineTable(url, headerName) {
	var datatable = $('#medicineTable').dataTable().api();

	$.ajax({
		type: "GET",
		url: url,
		cache: false,
		success: function(data) {
			var obj = JSON.parse(data);
			console.log(obj);
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

	$("#medicineTable tr").each(function() {
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
								$form.find('[name="isSupply"]').val('0').trigger('change');
								$form.find('input[name="brandName"]').val(obj.brandName);
								$form.find('input[name="genericName"]').val(obj.genericName);
								$form.find('[name="medicineType"]').val(obj.type).trigger('change');
								$form.find('input[name="medicineDosageQty"]').val(obj.dosageQty);
								$form.find('[name="medicineDosage"]').val(obj.dosage).trigger('change');
                $form.find('input[name="medicineThresholdQty"]').val(obj.thresholdQty);
                $form.find('input[name="medicineCriticalQty"]').val(obj.criticalQty);
							}else {
								$form.find('[name="isSupply"]').val('1').trigger('change');
								$form.find('input[name="supplyName"]').val(obj.genericName);
								$form.find('input[name="supplyDosageQty"]').val(obj.dosageQty);
								$form.find('[name="supplyDosage"]').val(obj.dosage).trigger('change');
                $form.find('input[name="supplyThresholdQty"]').val(obj.thresholdQty);
                $form.find('input[name="supplyCriticalQty"]').val(obj.criticalQty);
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
			alertify.alert("Cannot edit multiple records");
		}
	}else {
		alertify.alert("No record selected");
	}

}

function adjustRecord() {
	var table = $('#deleteBtn').val();
	var ids = [];
	var isAdd;
	var updateQty;
	var tr;

	$("#medicineTable tr").each(function() {
	        if ($(this).hasClass("selected")) {
	            ids.push($(this).find("#ID").attr("value"));
							isAdd = $(this).find('[name="isAdd"]').val();
							updateQty = $(this).find('[name="updateQty"]').val();
							tr = $(this).find('[name="currentQty"]');
	        }
	    });

		var count = ids.length;
		if(count >= 1) {
			if(count == 1) {
				if (isAdd != null && updateQty>0){
					var message = "Do you want to adjust this record?";

					if(getConfirmation(message)) {
						$.ajax({
							type: "GET",
							url: "ajax/table/medicineAdjust.php",
							data: {id: ids[0], isAdd: isAdd, updateQty: updateQty},
							cache: false,
							success: function(response){
								alertify.alert(response);
								selectUrl(table);
							}
						});

						$(tr).css('color', 'blue');
						$(tr).css('font-weight', 'bold');
						setTimeout(function() {
							$(tr).css('color', '');
							$(tr).css('font-weight', '');
						}, 3000);

					}

				} else {
					alertify.alert("Error: Cannot proceed with action");
				}

		}else {
			alertify.alert("Cannot edit multiple records");
		}
	}else {
		alertify.alert("No record selected");
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

		$("#medicineTable tr").each(function() {
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
		alertify.alert("No record selected");
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

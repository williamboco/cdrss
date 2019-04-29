
/* - - - - - - - - - - - - - FORM elements - - - - - - - - - - - - - - - - - */

// Add patient modal on hide event
$("#patientModal").on("hidden.bs.modal", function () {
	var $modal = $(this);

	$modal.find('form')[0].reset();
	$modal.find('.dInput').parent().remove();	//clear dynamic controls
	$modal.find("#profileInfoDiv").addClass("hidden");
	$modal.find("button[form]").addClass("hidden");
});

// Add patient modal on shown event
$("#patientModal").on("shown.bs.modal", function () {
	var $modal = $(this);

	$modal.find('a.addInputAll').click();	//trigger allergy[] add control
	$modal.find('a.addInputCP').click();	//trigger cPerson[] add control

});

//toggle patient type radio button
$("input[name='ptype']:radio").change(function () {
	var $infoDiv = $("#profileInfoDiv");
	var $studDiv = $(".studDiv");
	var $empDiv = $(".empDiv");

	$infoDiv.removeClass("hidden").hide().fadeIn("slow");
	$("button[form]").removeClass("hidden");
	if(this.value =='student') {
		$studDiv.removeClass("hidden").hide().fadeIn("slow");
		$studDiv.find('[name="course"], [name="trackname"]').attr("disabled", true);
		$studDiv.find('[name="studenttype"]').attr("disabled", false);
		$empDiv.find('select').attr("disabled", true);
		$empDiv.hide();
	}else {
		$empDiv.removeClass("hidden").hide().fadeIn("slow");
		$studDiv.find('select').attr("disabled", true);
		$empDiv.find('select').attr("disabled", false);
		$studDiv.hide();
	}
});

//toggle student type radio button
$('select[name=studenttype]').change(function() {
	var $courseDiv = $('#courseDiv');
	var $trackDiv = $('#trackDiv');

	if(this.value == 'college') {
		$trackDiv.hide();
		$trackDiv.find('select').attr('disabled', true);
		$courseDiv.removeClass("hidden").hide().fadeIn("slow");
		$courseDiv.find('select').attr('disabled', false);
	}else {
		$courseDiv.hide();
		$courseDiv.find('select').attr('disabled', true);
		$trackDiv.removeClass("hidden").hide().fadeIn("slow");
		$trackDiv.find('select').attr('disabled', false);
	}

});


// Get course select options...
$.ajax({
	type: "GET",
	url: "ajax/get_course.php",
	cache: false,
	success: function(data){
		var obj = JSON.parse(data);
		var sel = document.getElementById('selCourse');
		for(var i = 0; i < obj.length; i++) {
			var opt = document.createElement('option');
			opt.innerHTML = obj[i].name;
			opt.value = obj[i].name;
			sel.appendChild(opt);
		}
	}
});

// then initialize it through select2 constructor
$("#selCourse").select2({
	tags: true
});

// Get track select options...
$.ajax({
	type: "GET",
	url: "ajax/get_track.php",
	cache: false,
	success: function(data){
		var obj = JSON.parse(data);
		var sel = document.getElementById('selTrack');
		for(var i = 0; i < obj.length; i++) {
			var opt = document.createElement('option');
			opt.innerHTML = obj[i].name;
			opt.value = obj[i].name;
			sel.appendChild(opt);
		}
	}
});

// then construct
$("#selTrack").select2({
	tags: true
});

// Get department select options...
$.ajax({
	type: "GET",
	url: "ajax/get_department.php",
	cache: false,
	success: function(data){
		var obj = JSON.parse(data);
		var sel = document.getElementById('selDep');
		for(var i = 0; i < obj.length; i++) {
			var opt = document.createElement('option');
			opt.innerHTML = obj[i].name;
			opt.value = obj[i].name;
			sel.appendChild(opt);
		}
	}
});

// then construct
$("#selDep").select2({
	tags: true
});

// Get employment type select options
var empType = [{id:"probationary", text: "Probationary"},{id:"fixed", text: "Fixed"},{id:"casual", text: "Casual"}];
$("#selType").select2({
	minimumResultsForSearch: -1,	//disable search
	data: empType
});

$("#selStudType").select2({
	minimumResultsForSearch: -1	//disable search
});


// Allergy select options
$.ajax({
	type: "GET",
	url: "ajax/get_allergy.php",
	cache: false,
	success: function(data){
		var obj = JSON.parse(data);
		//console.log(obj);
		var sel = document.getElementById('selAll');
		for(var i = 0; i < obj.length; i++) {
			var opt = document.createElement('option');
			opt.innerHTML = obj[i].name;
			opt.value = obj[i].name;
			sel.appendChild(opt);
		}
	}
});




//Birthdate input validation
(function() {
                //alert("Anonymous self invoke function");
                var dateObj = new Date();
                var month = dateObj.getUTCMonth() + 1; //months from 1-12
                var day = dateObj.getUTCDate();
                var year = dateObj.getUTCFullYear();

                function zero(number) {
                    var my_string = '' + number;
                    while (my_string.length < 2) {
                        my_string = '0' + my_string;
                    }
                    return my_string;
                }
                var mindate = year - 100 + "-" + zero(month) + "-" + zero(day);
                var maxdate = year - 15 + "-" + zero(month) + "-" + zero(day);
                var inputBirthdate = $("#addForm input[name=birthdate]");
                inputBirthdate.attr("min", mindate);
                inputBirthdate.attr("max", maxdate);

            })();
            var inputBirthdate = $("#addForm input[name=birthdate]");
            inputBirthdate.on("change", function() {
                //alert($(this)[0].checkValidity());
                //alert($(this).attr("min"));
            });


/* - - - - - - - - - - - - - - CRUD functions - - - - - - - - - - - - - - - - - - */
function viewProfile() {
	var id = getParameterByName("id");
	$.ajax({
        type: "GET",
        url: "ajax/patientRead.php",
        data: {patientID: id},
        cache: false,
        success: function(obj){
			var obj = JSON.parse(obj);
			console.log(obj);

			$profile = $("#profileDiv");
			$profile.find("#idNumber").append("<p class='h4'>" + obj.Patient.ID + "</p>");
			$profile.find("#fullName").append("<p class='h4'>" + obj.Patient.firstName + " " + obj.Patient.lastName + "</p>");
			$profile.find("#birthDate").append("<p class='h4'>" + obj.Patient.birthDate + "</p>");
			$profile.find("#gender").append("<p class='h4'>" + obj.Patient.gender + "</p>");
			$profile.find("#contact").append("<p class='h4'>" + obj.Patient.contact + "</p>");

			obj.ContactPerson.forEach(function(item) {
				$profile.find("#cPerson").append("<p class='h4'>" + item.name + "-" + item.contact + "</p>");
			});

			var allergy = '';
			obj.Allergy.forEach(function(item) {
				allergy += item + " ,";
			});
			allergy = allergy.slice(0, -1);
			//alert(allergy);
			$profile.find("#allergy").append("<span class='h4'>" + allergy + "</span>");

			obj.Others.forEach(function(item) {
				if(item.type=="SHS") {
					$profile.find("#otherInfo").append('<p class="small">Academic Track</p><p class="h4">' + item.track + '</p>');
				}else if(item.type=="College") {
					$profile.find("#otherInfo").append('<p class="small">Course</p><p class="h4">' + item.course + '</p>');
				}else {
					$profile.find("#otherInfo").append('<p class="small">Department</p><p class="h4">' + item.department + '</p>');
					$profile.find("#otherInfo").append('<p class="small">Employment Type</p><p class="h4">' + item.employmentType + '</p>');
				}

			});
		}
	 });
}
 function editProfile() {
	 var id = getParameterByName("id");
	 var $form = $('#patientEditForm');

	 $.ajax({
        type: "GET",
        url: "ajax/patientRead.php",
        data: {patientID: id},
        cache: false,
        success: function(obj){
			var obj = JSON.parse(obj);
			//alert(obj.Others[0].type);
			//console.log(obj);
			if(obj.Others[0].type=="Employee") {
				$form.find('input[value="employee"]').click().trigger('change');
				$("#selDep").val(obj.Others[0].department).trigger('change');
				$("#selType").val(obj.Others[0].employmentType).trigger('change');
			}else if(obj.Others[0].type=="SHS") {
				$form.find('input[value="student"]').click().trigger('change');
				$("#selStudType").val("shs").trigger('change');
				$("#selTrack").val(obj.Others[0].track).trigger('change');
			}else {
				$form.find('input[value="student"]').click().trigger('change');
				$('#studRd').click().trigger('change');
				$("#selStudType").val("college").trigger('change');
				$("#selCourse").val(obj.Others[0].course).trigger('change');
			}
			$form.find('input[name="idNumber"]').val(obj.Patient.ID);
			$form.find('input[name="firstname"]').val(obj.Patient.firstName);
			$form.find('input[name="lastname"]').val(obj.Patient.lastName);
			$form.find('input[name="contactnumber"]').val(obj.Patient.contact);
			$form.find('input[name="birthdate"]').val(obj.Patient.birthDate);

			if(obj.Patient.gender == "Male") {
				$('#gender1').attr("checked", true);
			} else {
				$('#gender2').attr("checked", true);
			}


			obj.Allergy.forEach(function(val, i) {
				if(i>0) {
				  $("#selAll").parent().siblings('a').click();
				}
			});
			setTimeout(function() {
				$("#allergyDiv").find('.dInput').each(function(i) {
					var sel = $(this);
					sel.select2().val(obj.Allergy[i]).trigger('change');
				});
			}, 1000);


			var cperson = new Array();
			obj.ContactPerson.forEach(function(val, i) {
				if(i>0) {
				  $(".addInputCP").click();
				}
				cperson.push(obj.ContactPerson[i].name);
				cperson.push(obj.ContactPerson[i].contact);
			});
			setTimeout(function() {
				$("#pDiv").find('.dInput').each(function(i) {
					var input = $(this);
					input.val(cperson[i]);
				});
			}, 1000);


		}
	 });
 }

  function delrecordCheck() {
		var data = [];
		$("#patientTable tr").each(function() {
			if ($(this).hasClass("selected")) {
			data.push($(this).find("#ID").attr("value"));
			}
		});
		console.log(data);
		if(data.length === 0){
			alertify.alert("No record selected.");
			return;
		}else {
			$('#delete-patient').modal('show');
		}
	}
	function delpatient() {
		var data = [];
		$("#patientTable tr").each(function() {
			if ($(this).hasClass("selected")) {
			data.push($(this).find("#ID").attr("value"));
			}
		});
		$.ajax({
		type: "GET",
		url: "ajax/patientDelete.php",
		data: {data : data},
		cache: false,

		success: function(response){
			//alert(response);
			alertify.alert(response);
			dropdownFilter();
		}
	});
	}


$( "#patientEditForm" ).on( "submit", function( event ) {

	var $form = $( this );
	// Prevent form submission
	event.preventDefault();
	//console.log( $form.serialize() );

	// Use Ajax to submit form data
	$.ajax({
		type: 'POST',
		url: $form.attr('action'),
		data: $form.serialize(),
		success: function(response) {
			// ... Process the result ...
			var response = JSON.parse(response);
			console.log(response);

			if(response[0]=='success') {
				//alert("Patient record updated");
				//window.location.href = 'http://localhost/cdrs/profile.php?id=' + response[1];
				location.reload();
			}else {
				alertify.alert (response);
			}

		}
	});
});

function delpatientProfile() {
	var data = [getParameterByName("id")];
	$.ajax({
		type: "GET",
		url: "ajax/patientDelete.php",
		data: {data: data},
		cache: false,
		success: function(response){
		alertify.alert (response);
			window.location.href="patient-list.php";
		}
	});

}


function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

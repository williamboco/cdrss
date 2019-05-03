$(document).ready(function() {

    $('a.addInput').on("click", function(e) {

        e.preventDefault();
        var $this = $(this);
        var limit = $this.parent().attr("value");
        var ctr = $this.parent().children().find('.select2-hidden-accessible').size();

        if (ctr != limit) {
    			var flag = false;
          var $lastTbContainer = $this.closest('.fieldsGroup').children('.tbContainer:last');
    			var $firstTbContainer = $this.closest('.fieldsGroup').children('.tbContainer:first');
    			var $tempVals = new Array();

    			$this.closest('.fieldsGroup').find('.select2-hidden-accessible').each(function(){
    				if(this.value == '') {
    					flag = true;
    					return;
    				}else
    					$tempVals.push(this.value);
    			});
    			/*if(flag) {
    				alertify.alert("Please enter value to current input form");
    				return;
    			}*/

			    var $clone = $firstTbContainer.clone();

    			if (ctr < 1) {
    				$clone.find('button').addClass('hidden');
    				$clone.append('<button type="button" class="btn btn-info" onclick="clearMedInput(this)"><i class="glyphicon glyphicon-repeat"</button>');
    			}

    			$clone.css("display", "");
    			$clone.find('select').css("width", "60%");
    			$clone.find('.formInpt').each(function() {
    				$(this).attr("disabled", false);
    			});

    			if($clone.find('select').hasClass('selComp')) {
    				$clone.find('select').select2({
    					tags: true
    				});
    			}else
    				$clone.find('select').select2();

    			$tempVals.forEach(function(v) {
    				$clone.find('select').find('option').each(function() {
    					if(this.value == v) {
    						$(this).attr("disabled", true);
    					}
    				});
    			});

			    $lastTbContainer.after($clone);

        }else {
			     ("Max reached");
		    }
    });

        $('.fieldsGroup').on('click', 'button.remove', function() {
            $(this).closest('.tbContainer').remove();
        });
});

$('.form').on('change keyup', function() {
  // Remove invalid characters
  var sanitized = $(this).val().replace(/[^0-9]/g, '');
  // Update value
  $(this).val(sanitized);
  alert();
});

$('.quantity').on('change', function() {
	alert();
});

$(".visitDate").on('change', function() {
	var $this = $(this);
	var d1 = new Date($this.val());
	var d2 = new Date();

	if(d1 > d2) {
		$this.val(currentDateTime());
	}

});


/*$('#addVisitForm').find('[name="visitDate"]').on('change', function() {

	var $this = $(this);
	var d1 = new Date($this.val());
	var d2 = new Date();
	if(d1 > d2) {
		$this.val(currentDate());
	}


});*/


function viewVisit(id) {
	complaintOptions();
	medicineOptions();

	var $form = $('#editVisitForm');
	$form.find('input[name="visitID"]').val(id);
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
            $(".fullName").html(obj.Patient.firstName + " " + obj.Patient.lastName);
			      $(".visitId").html(obj.Visit.ID);
            $(".visitDate").html(moment(obj.Visit.visitDate).format('LLLL'));

            $("#complaint").empty();
            $.each(obj.Complaint, function(index, value) {
                $("#complaint").append('<li class="h4">' + value + '</li>');
				        $form.find(".complaintDiv").children('a').click();
            });

            $("#medicine").empty();
            $.each(obj.Medicine, function(i) {
              $("#medicine").append('<li class="h4">' + obj.Medicine[i].quantity + " " + obj.Medicine[i].unit + " " + obj.Medicine[i].name + '</li>');
  				    $form.find(".medicineDiv").children('a').click();
            });

      			var a = obj.Visit.visitDate;
      			var str = [a.slice(0, 10), "T", a.slice(10)].join('');
      			    str = str.replace(/\s/g, '');
      			var datetime = str.substring(0, str.length - 3);

      			$form.find('[name="visitDate"]').val(datetime);

      			$("#remarks").html(obj.Visit.remarks);
                  $("#createdBy").html(obj.createdBy);
                  $("#dateCreated").html(obj.Visit.dateCreated);

      			if(obj.Visit.dateCreated != obj.Visit.dateModified) {
      				$("#modifiedBy").html(obj.modifiedBy);
      				$("#dateModified").html(obj.Visit.dateModified);
      				$("#modifyDiv").show();
      			}else
      				$("#modifyDiv").hide();

            setTimeout(function() {
                $form.find(".complaintDiv").find('.select2-hidden-accessible').each(function(i) {
                    var sel = $(this);
                    sel.select2().val(obj.Complaint[i]).trigger('change');
      		          sel.select2({tags:true});
                });
            }, 100);

      			setTimeout(function() {
                $form.find(".medicineDiv").find('.select2-hidden-accessible').each(function(i) {
                  var sel = $(this);
            			sel.select2().val(obj.Medicine[i].id).trigger('change');
            			sel.select2({tags:true});
                });
                $form.find(".medicineDiv").find('input[name="med[]"]').each(function(i) {
                    var input = $(this);
            			if(this.hasAttribute('disabled')) {

            			}else{
            				input.val(obj.Medicine[i-1].quantity);
            			}
                });

            }, 100);

      			document.getElementById('remarksEdit').value = obj.Visit.remarks;
        }
    });
    $('#btnEdit').attr("value", id);
    $('#viewModal').modal('show');
}


function editVisit(el) {

	$('#viewModal .view').addClass('hidden');
	$('#viewModal .edit').removeClass('hidden');
}
function editFormHide() {
	$('#viewModal .view').removeClass('hidden');
	$('#viewModal .edit').addClass('hidden');
}

function delpatientVisit() {
    var data = [];
    $("#visitTable tr").each(function() {
        if ($(this).hasClass("selected")) {
            data.push($(this).find("#ID").attr("value"));
        }
    });

    $.ajax({
        type: "GET",
        url: "ajax/visitDelete.php",
        data: {
            data: data
        },
        cache: false,
        success: function(response) {

            alertify.alert(response);
            refresh();

        }
    });
}

function delrecordCheck() {

    var data = [];
    $("#visitTable tr").each(function() {
        if ($(this).hasClass("selected")) {
            data.push($(this).find("#ID").attr("value"));
        }
    });

    if (data.length === 0) {
        alertify.alert("No record selected.");
        return;
    } else {
        $('#delete-visit').modal('show');
    }
}

function delvisitCheck() {

    var data = [];
    $("#visitTable tr").each(function() {
        if ($(this).hasClass("selected")) {
            data.push($(this).find("#ID").attr("value"));
        }
    });

    if (data.length === 0) {
        alertify.alert("No record selected.");
        return;
    } else {
        $('#delete-visit').modal('show');
    }
}

$('#addVisitModal').on('show.bs.modal', function() {
	complaintOptions();
	medicineOptions();

  var $form = $('#addVisitForm');
	$form.find('.addInput').click();
  $form.find('[name="visitDate"]').val(currentDateTime());

});

$('#addVisitModal').on('hidden.bs.modal', function() {
	var $form = $('#addVisitForm');
	$form.find('.select2-hidden-accessible').parent(".tbContainer").remove();
	document.getElementById("addVisitForm").reset();
	$form.find('select[name="idNumber"]').val(null).trigger("change");

});

$('#viewModal').on('hidden.bs.modal', function() {

  $('.select2-hidden-accessible').parent(".tbContainer").remove();
	document.getElementById("editVisitForm").reset();
	$('#viewModal .view').removeClass('hidden');
	$('#viewModal .edit').addClass('hidden');


});


/*Select option configs*/

// Quick search styles
function formatRepo(repo) {
    if (repo.loading) return repo.text;
    var avatar_url = "img/person.png"; //<img src='" + avatar_url + "' />

    var markup = "<div class='select2-result-repository clearfix'>" +
        "<div class='select2-result-repository__avatar'></div>" +
        //"<div class='select2-result-repository__meta'>" +
        "<div class='select2-result-repository__title'>" + repo.name + "</div>";

    if (repo.description) {
        markup += "<div class='select2-result-repository__description'>" + repo.description + "</div>";
    }

    /*markup += "<div>" +
    "<div class='select2-result-repository__details'>Gender:  " + repo.gender + "</div>" +
    "<div class='select2-result-repository__details'>Age: " + repo.age + " yrs. old</div>" +
    "<div class='select2-result-repository__details'><i class='fa fa-phone'></i> " + repo.contact + "</div>" +
    "</div>" +
    "</div></div>";*/

    return markup;
}

function formatRepoSelection(repo) {
    return repo.name || repo.id;
}

$("#patientID").on('change', function() {
    var $form = $('#addVisitForm');
    var id = $(this).val();

    $.ajax({
        type: "GET",
        url: "ajax/patientRead.php",
        data: {patientID: id},
        cache: false,
        success: function(data) {
           var obj = JSON.parse(data);
           console.log(obj);

    			if(obj.Allergy.length > 0) {
    				var allergy = '';

    				obj.Allergy.forEach(function(item) {
    				allergy += item + " ,";
    				});
    				allergy = allergy.slice(0, -1);
    				$form.find(".allergy").html('<p class="small">Allergy</p><p class="h4">' + allergy + "</p>");
    			}else {
    				$form.find(".allergy").html('<p class="small">Allergy</p><p class="h4">None</p>');
    			}
        }
    });
});

// Quick search select2 initialization
$("#patientID").select2({
    ajax: {
        url: "ajax/patient_search.php",
        dataType: 'json',
        delay: 250,
        data: function(params) {
            return {
                q: params.term, // search term
                page: params.page
            };
        },
        processResults: function(data, params) {
            // parse the results into the format expected by Select2
            // since we are using custom formatting functions we do not need to
            // alter the remote JSON data, except to indicate that infinite
            // scrolling can be used
            params.page = params.page || 1;
            return {
                results: data.items,
                pagination: {
                    more: (params.page * 30) < data.total_count
                }
            };
        },
        cache: true
    },
    escapeMarkup: function(markup) {
        return markup;
    }, // let our custom formatter work
    minimumInputLength: 1,
    templateResult: formatRepo,
    templateSelection: formatRepoSelection
});


// Complaint select options
function complaintOptions() {
	$.ajax({
		type: "GET",
		url: "ajax/get_complaint.php",
		cache: false,
		success: function(data) {
			var obj = JSON.parse(data);
			var sel = document.getElementsByClassName('selComp');

			for(var i = 0; i < sel.length; i++) {

				sel[i].innerHTML = '';
				var opt = document.createElement('option');
				sel[i].appendChild(opt);
				for (var j = 0; j < obj.length; j++) {
					var opt = document.createElement('option');
					opt.innerHTML = obj[j];
					opt.value = obj[j];
					sel[i].appendChild(opt);
				}

			}

		}
	});
}


// Medicine select options
function medicineOptions() {
	$.ajax({
		type: "GET",
		url: "ajax/get_medicine.php",
		cache: false,
		success: function(data) {
			var obj = JSON.parse(data);
			var sel = document.getElementsByClassName('selMed');

			for(var i = 0; i < sel.length; i++) {

				sel[i].innerHTML = '';
				var opt = document.createElement('option');
				sel[i].appendChild(opt);
				for (var j = 0; j < obj.length; j++) {
					var opt = document.createElement('option');
					opt.innerHTML = obj[j].n;
					opt.value = obj[j].id;
					sel[i].appendChild(opt);
				}

			}
		}
	});
}


$("#addVisitForm").on("submit", function(event) {
	var $form = $(this);
	event.preventDefault();
  console.log($form.serialize());
	console.log("Send to visitCreate.php");

	$.ajax({
		type: 'POST',
		url: "ajax/visitCreate.php",
		data: $form.serialize(),
		success: function(response) {
			// ... Process the result ...
			var response = JSON.parse(response);

			if(response[0]=='success') {
				console.log(response);
				alertify.alert('Patient visit record successfully created');
				$("#addVisitModal").modal('hide');
				refresh();
			}else {
				alertify.alert(response);
			}

		}
	});

});

$("#editVisitForm").on("submit", function(event) {
	var $form = $(this);
	event.preventDefault();
  console.log($form.serialize());
	console.log("Send to visitUpdate.php");

	// Use Ajax to submit form data
	$.ajax({
		type: 'POST',
		url: "ajax/visitUpdate.php",
		data: $form.serialize(),
		success: function(response) {
			// ... Process the result ...
			var response = JSON.parse(response);

			if(response[0]=='success') {
				console.log(response);
				alertify.alert('Patient visit record successfully updated');
				editFormHide();
				$('.select2-hidden-accessible').parent(".tbContainer").remove();
				viewVisit(response[1]);
				refresh();
			}else {
				alertify.alert(response);
			}
		}
	});
});


function clearMedInput(el) {
    $this = $(el);
    $this.siblings("select").val(null).trigger("change");
    $this.siblings("input").val("");

}

function getAllElementsWithAttribute(attribute)
{
  var matchingElements = [];
  var allElements = document.getElementsByTagName('*');
  for (var i = 0, n = allElements.length; i < n; i++)
  {
    if (allElements[i].getAttribute(attribute) !== null)
    {
      // Element exists with attribute. Add to array.
      matchingElements.push(allElements[i]);
    }
  }
  return matchingElements;
}

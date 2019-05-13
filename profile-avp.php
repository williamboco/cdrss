<?php
session_start();
include('includes/dbcon.php');
include('includes/session.php');

if($_SESSION['role'] != 'Admin') {
	header("location: home.php");
}

?>
<html>
<head>
	<link rel="shortcut icon" href="favicon.png" />
	<link href="vendor/bootstrap-sass-3.3.7/assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="vendor/select2-4.0.3/dist/css/select2.min.css" rel="stylesheet">
	<link href="vendor/DataTables/datatables.min.css" rel="stylesheet">
	<link href="vendor/DataTables/DataTables-1.10.18/css/jquery.dataTables.min.css" rel="stylesheet">
	<link href="vendor/alertify.js-master/dist/css/alertify.min.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/customSelect.css" rel="stylesheet">
	<link href="css/animate.css" rel="stylesheet">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	<?php
	  include("includes/navbar-avp.php");
	?>
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-sm-12 card wow slideInLeft">
				<h3>Personal Information</h3>
				<hr>
				<button type="button" class="btn btn-primary" data-toggle="modal"  data-target="#patientModal" onclick="editProfile()">
				<span> <div class="glyphicon glyphicon-pencil"> </div> Edit Profile </span>
				</button>
				<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#delete-modal">
				<span> <div  class="glyphicon glyphicon-remove"> </div> Delete Patient </span>
				</button>
				<br><br><br>
				<div id="profileDiv">
					<div id="idNumber">
						<p class="small">ID Number</p>
					</div>
					<div id="fullName">
						<p class="small">Name</p>
					</div>
					<div id="allergy">
						<p class="small">Allergy</p>
					</div>
					<div id="otherInfo">

					</div>
					<div id="birthDate">
						<p class="small">Birth Date</p>
					</div>
					<div id="gender">
						<p class="small">Gender</p>
					</div>
					<div id="contact">
						<p class="small">Contact Number</p>
					</div>
					<div id="cPerson">
						<p class="small">Person to contact</p>
					</div>
				</div>
			</div>

			<div class="col-lg-8 col-sm-12">
				<!-- Add modal trigger -->
				<div class="row card visithistory wow fadeIn" data-wow-delay="0.5s">
					<h3 class="col-lg-8 col-sm-12"><b>VISIT HISTORY</b></h3>
					<div class="form-group col-lg-4 col-sm-12" style="margin-top:20px;">
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addVisitModal">
						  <span class="glyphicon glyphicon-plus-sign"></span>&nbsp;New Visit
						</button>
						<button type="button" class="btn btn-secondary" onclick="delvisitCheck()">
						  Delete
						</button>
					</div>
				</div>
				<div class="row card visithistory wow fadeIn" data-wow-delay="0.5s">
					<div class="table-responsive">
						<table id="visitTable" class="display" cellspacing="0" width="100%">
						</table>
					</div>
				</div>

			</div>

		</div>
	</div>


	<!-- Add visit modal -->
	<div class="modal fade" id="addVisitModal" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Add New Patient Visit</h4>
			</div>

			<div class="modal-body">
				<form id="addVisitForm">
					<input type="text" name="userID" value="<?php echo $_SESSION['userID'];?>" class="hidden">
					<input type="text" name="idNumber" value="<?php echo $_GET['id'];?>" class="hidden">
					<div class="row">
						<label for="visitDate"><i class="glyphicon glyphicon-calendar"></i><b>  Visit Date & Time</b></label>
						<br>
						<input type="datetime-local" name="visitDate" class="visitDate" required>
					</div><br>

					<div class="fieldsGroup complaintDiv" value="5">
						<label for="complaint[]">Complaint/s</label>
						<div class="tbContainer" style="display: none;margin-bottom: 10px;">
							<select data-placeholder="Complaint" class="selComp formInpt" name="complaint[]" disabled>
								<option></option>
							</select>
							<button class="remove btn btn-warning" type="button"><i class="glyphicon glyphicon-remove"></i></button>
						</div>
						<a href="#" class="addInput"><i class="glyphicon glyphicon-plus"></i> Add</a>
					</div><br>

					<div class="fieldsGroup medicineDiv" value="5">
						<label for="med[]">Medicine requested</label>
						<div class="tbContainer" style="display: none;margin-bottom: 10px;">
							<select data-placeholder="Medicine" class="selMed formInpt" name="med[]" disabled>
								<option></option>
							</select>
							<input type="number" min="1" class="quantity formInpt" name="med[]" placeholder="Qty." style="width: 100px;" disabled>
							<button class="remove btn btn-warning" type="button"><i class="glyphicon glyphicon-remove"></i></button>
						</div>
						<a href="#" class="addInput"><i class="glyphicon glyphicon-plus"></i> Add</a>
					</div><br>

					<div class="form-group">
						<label>Remarks</label>
						<textarea rows="4" class="form-control" name="remarks" placeholder="Remarks" required></textarea>
					</div>
				</form>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				<button type="submit" class="btn btn-primary pull-right" form="addVisitForm">Add Visit</button>
			</div>

		 </div>
		</div>
	</div>


	<!-- View visit Modal -->
	<div class="row">
		<div class="modal fade visit col-sm-12" id="viewModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
				<div class="modal-content visitdtl row">
				  <div class="modal-header col-sm-12">
					<h4 class="modal-title" style="display: inline;">Visit Details</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					  <span aria-hidden="true">&times;</span>
					</button>
				  </div>
				  <div class="modal-body col-sm-12">
						<div id="viewVisitDiv">
							<div class="card col-lg-12">
								<div class="contentheight col-sm-12">
									<b><p> Visit Id</b><br><i class="glyphicon glyphicon-asterisk"></i>  <span class="visitId h4"></span></p>
									<b><p> Visit Date</b><br><span class="visitDate h4"></span></p>
									<b><p>Patient Name</b> <br><i class="glyphicon glyphicon-user"></i>  <span class="fullName h4"></span></p>
								</div>

							  <div class="contentheight view  col-sm-6">
									<b><p>Complaint</p></b>
									<ul id="complaint"></ul>
									<b><p>Medicine Requested</p></b>
									<ul id="medicine"></ul>
								</div>
							</div>
							<div class="view col-sm-12">
									<p>Remarks</p>
									<p id="remarks" class="h4" style="margin-left: 30px;"></p><br>
									<p align="right">Created by <b><span id="createdBy"></span></b> on <span id="dateCreated"></span></p>
									<div id="modifyDiv">
										<p align="right">Modified by <b><span id="modifiedBy"></span></b>		 on <span id="dateModified"></span></p>
									</div><br>
									<hr style="width:100%; margin:0px;">
							</div>
						</div>

						<form id="editVisitForm" class="edit hidden" style="width:80%; margin: 0 auto;">
							<input type="text" name="userID" value="<?php echo $_SESSION['userID'];?>" class="hidden">
							<input type="number" name="visitID" class="hidden">
							<label for="visitDate"><i class="glyphicon glyphicon-calendar"></i> VISIT DATE & TIME</label><br>
								<input type="datetime-local" name="visitDate" class="visitDate" required><br><br>

							<div class="fieldsGroup complaintDiv" value="10">
								<label for="complaint[]">Complaint/s</label>
								<div class="tbContainer" style="display: none;margin-bottom: 10px;">
									<select data-placeholder="Complaint" class="selComp formInpt" name="complaint[]" disabled>
										<option></option>
									</select>
									<button class="remove">Remove</button>
								</div>
								<a href="#" class="addInput">+ Add</a>
							</div><br>

							<div class="fieldsGroup medicineDiv" value="10">
								<label for="med[]">Medicine requested</label>
								<div class="tbContainer" style="display: none;margin-bottom: 10px;">
									<select data-placeholder="Medicine" class="selMed formInpt" name="med[]" disabled>
										<option></option>
									</select>
									<input type="number" min="1" class="quantity formInpt" name="med[]" placeholder="Qty." style="width: 100px;" disabled>
									<button class="remove">Remove</button>
								</div>
								<a href="#" class="addInput">+ Add</a>
							</div><br>

							<div class="form-group">
								<label>Remarks</label>
								<textarea rows="4" class="form-control" name="remarks" id="remarksEdit" placeholder="Remarks" required></textarea>
							</div>
						</form>
				  </div>

				  <div class="modal-footer" class="col-sm-12">
						<div class="view">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" onclick="editVisit(this)" id="btnEdit">Edit  <i class="glyphicon glyphicon-pencil"></i> </button>
						</div>

						<div class="edit hidden">
							<button type="button" class="btn btn-secondary" onclick="editFormHide()">Cancel</button>
							<button type="submit" class="btn btn-primary pull-right" form="editVisitForm">Update Visit</button>
						</div>
				  </div>

				</div>
		  </div>
		</div>
	</div>

	<!-- Update Patient Modal -->
      <div class="modal fade" id="patientModal" role="dialog">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
							  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							  <h4 class="modal-title">Update Patient Profile</h4>
               </div>
               <div class="modal-body">
                  <form class="form-horizontal" id="patientEditForm" action="ajax/patientUpdate.php">
										<input type="number" name="origID" value="<?php echo $_GET['id'];?>" class="hidden">
										<input type="number" name="userID" value="<?php echo $_SESSION['userID'];?>" class="hidden">

                    <div class="form-group">
                      <label class="col-sm-4 control-label">Patient type</label>
                      <div class="col-sm-8">
                         <div class="radio">
                            <label><input type="radio" name="ptype" value="student" required>Student</label>
                            <label><input type="radio" name="ptype" value="employee" required>Employee</label>
                         </div>
                      </div>
                    </div>

										<div id="profileInfoDiv" class="hidden">
                     <div class="form-group">
                        <label class="col-sm-4 control-label">ID Number</label>
                        <div class="col-sm-8">
                           <input type="number" min="1" class="form-control" name="idNumber" pattern=".{5,20}" title="5 to 20 characters" placeholder="Patient ID" required>
                        </div>
                     </div>
                     <div class="form-group">
                        <label class="col-sm-4 control-label">First Name</label>
                        <div class="col-sm-8">
                           <input type="text" class="form-control" name="firstname" placeholder="First name" required>
                        </div>
                     </div>
                     <div class="form-group">
                        <label class="col-sm-4 control-label">Last Name</label>
                        <div class="col-sm-8">
                           <input type="text" class="form-control" name="lastname" placeholder="Last name" required>
                        </div>
                     </div>
                     <div class="form-group">
                        <label class="col-sm-4 control-label">Birth Date</label>
                        <div class="col-sm-8">
                           <input type="date" required class="form-control" name="birthdate" required>
                        </div>
                     </div>
                     <div class="form-group">
                        <label class="col-sm-4 control-label">Contact Number</label>
                        <div class="col-sm-8">
                           <input type="text" class="form-control" min="1" name="contactnumber" pattern=".{0,11}" title="0 to 11 characters" onkeypress='return event.charCode >= 48 && event.charCode <= 57' placeholder="Mobile number/ Landline">
                        </div>
                     </div>
                     <div class="form-group">
                        <label class="col-sm-4 control-label">Gender</label>
                        <div class="col-sm-8">
                           <div class="radio">
                              <input type="radio" name="gender" value="Male" id="gender1" required>
							  								<label for="gender1">Male</label>
                              <input type="radio" name="gender" value="Female" id="gender2" required>
							  								<label for="gender2">Female</label>
                           </div>
                        </div>
                     </div>

                     <div class="studDiv hidden">
                        <div class="form-group">
                           <label class="col-sm-4 control-label">Student Type</label>
						   				 			<div class="col-sm-8">
							   							<select id="selStudType" name="studenttype" data-width="100%" data-placeholder="Select student type" required>
                              	<option></option>
                              	<option value="college">College</option>
                              	<option value="shs">Senior High School</option>
                           		</select>
						   							</div>
                        </div>
                        <div class="form-group hidden" id="courseDiv">
                           <label class="col-sm-4 control-label">Course</label>
						   				 			<div class="col-sm-8">
                           		<select data-width="100%" data-placeholder="Select course" id="selCourse" class="select2 form-control inputStud" name="course" required>
                              	<option></option>
                           		</select>
						   							</div>
                        </div>
                        <div class="form-group hidden" id="trackDiv">
                           <label class="col-sm-4 control-label">Track</label>
						   				 			<div class="col-sm-8">
                           		<select data-width="100%" data-placeholder="Select track" id="selTrack" class="select2 form-control inputStud" name="trackname" required>
                              	<option></option>
                           		</select>
						   							</div>
                        </div>
                    	</div>

											<div class="empDiv hidden">
                        <div class="form-group" id="department_dropdown">
                           <label class="col-sm-4 control-label">Department Name</label>
						   				 			<div class="col-sm-8">
                           		<select data-width="100%" data-placeholder="Select department" id="selDep" class="select2 form-control" name="depart" required>
                              	<option></option>
                           		</select>
						   							</div>
                        </div>
                        <div class="form-group" id="empType_dropdown">
                           <label class="col-sm-4 control-label">Employment Type</label>
						   				 			<div class="col-sm-8">
                           		<select data-width="100%" data-placeholder="Select employment type" id="selType" class="select2 form-control" name="employeeType" style="width: 75%" required>
                              	<option></option>
                           		</select>
						   							</div>
                        </div>
                     </div>

					 				 	 <div class="form-group">
						 				 	<label class="col-sm-4 control-label" for="cPerson[]">Contact Person/s</label>
						 						<div class="fieldsGroup col-sm-8" id="pDiv" value="3">
													<div class="tbContainer" style="display: none !important;margin-bottom: 10px;">
														<input type="text" class="form-control" placeholder="Full name"><br>
														<input type="number" min="1" class="form-control" placeholder="Contact number">
														<button class="remove">Remove</button>
													</div>
													<a href="#" class="addInputCP" value="cPerson[]">+ Add</a>
												</div>
										 </div>
                     <div class="form-group">
											 <label class="col-sm-4 control-label">Allergy/s</label>
											 <div class="fieldsGroup col-sm-8" id="allergyDiv" value="6">
												 <div class="tbContainer" style="display: none !important;margin-bottom: 10px;">
													 <select class="form-control" data-placeholder="Medicine, Food, Etc." id="selAll">
														 <option></option>
													 </select>
													 <button class="remove">Remove</button>
												 </div>
												 <a href="#" class="addInputAll" value="allergy[]">+ Add</a>
											 </div>
										 </div>
               		</div>
							</form>
				</div>

				<div class="modal-footer">
					<button type="submit" class="btn btn-primary pull-right hidden" form="patientEditForm">Submit</button>
					<button data-dismiss="modal" type="button" class="btn btn-inverse pull-right" style="margin-right: 20px;">Cancel</button>
				</div>
      </div>
    </div>
  </div>

	<!-- Delete profile modal -->
	<div class="modal fade" id="delete-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel20" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header no-border">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 class="modal-title fw-bold mt" id="myModalLabel20">Are you sure you want to delete this patient?</h4>
						<p class="fs-mini text-muted mt-sm">
							Press "Confirm Delete" if you are sure to delete the patient from the system. If not, press "Cancel".
						</p>
					</div>

					<div class="modal-footer no-border">
						<button data-dismiss="modal" class="btn btn-default">Cancel</button>
						<button data-dismiss="modal" id="create-event" class="btn btn-primary" name="update" onclick="delpatientProfile();">Confirm Delete</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Delete visit modal -->
	<div class="modal fade" id="delete-visit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel20" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header no-border">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title fw-bold mt" id="myModalLabel20">Are you sure you want to delete this visit?</h4>
					<p class="fs-mini text-muted mt-sm">
						Press "Confirm Delete" if you are sure to delete the visit from the system. If not, press "Cancel".
					</p>
				</div>

				<div class="modal-footer no-border">
					<button data-dismiss="modal" class="btn btn-default">Cancel</button>
					<button data-dismiss="modal" id="create-event" class="btn btn-primary" name="update" onclick="delpatientVisit();">Confirm Delete</button>
				</div>
			</div>
		</div>
	</div>
	<div class="row page-footer wow fadeIn" data-wow-delay="0.7s">
		<footer class="col-lg-12 col-sm-12">
					Clinic Drug-dispense Reporting System.
		</footer>
	</div>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="vendor/bootstrap-sass-3.3.7/assets/javascripts/bootstrap.min.js"></script>
	<script src="vendor/alertify.js-master/dist/js/alertify.js"></script>
	<script src="vendor/select2-4.0.3/dist/js/select2.min.js"></script>
	<script src="vendor/DataTables/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
	<script src="vendor/moment.js"></script>
	<script src="js/dynamic_input.js"></script>
	<script src="js/visit_form.js"></script>
	<script src="js/date.js"></script>
	<script src="js/profileForm.js"></script>
	<script src="js/profile.js"></script>
	<script src="js/checkbox.js"></script>
	<script src="js/wow.min.js"></script>
	<script>
	new WOW().init();
	</script>

</body>
</html>

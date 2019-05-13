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
		 <title>Patient List</title>
    <link rel="shortcut icon" href="favicon.png" />
	  <link href="vendor/bootstrap-sass-3.3.7/assets/css/bootstrap.min.css" rel="stylesheet">
		<link href="vendor/DataTables/datatables.min.css" rel="stylesheet">
		<link href="vendor/DataTables/DataTables-1.10.18/css/jquery.dataTables.min.css" rel="stylesheet">
	  <link href="vendor/select2-4.0.3/dist/css/select2.min.css" rel="stylesheet">
	  <link href="vendor/font-awesome/css/all.min.css" rel="stylesheet">
		<link href="vendor/alertify.js-master/dist/css/alertify.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
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
	      <form class="form-inline card col-lg-12 col-sm-12 wow fadeIn patientfunction" id="filter" action="ajax/filtered_patient.php">
	         <div class="form-group">
	            <label for="filter" class="col-2 col-form-label"><i class="fa fa-filter" aria-hidden="true"></i> Filter&nbsp;</label><br>
	            <select class="form-control filters" name="patientType">
	               <option selected>All</option>
	               <option value="coll">College</option>
	               <option value="shs">Senior High School</option>
	               <option value="stud">All Student</option>
	               <option value="emp">Employee</option>
								 <option value="guest">Guest</option>
	            </select>
	         </div>
	         <!-- Patient modal triggers -->
	         <div class="form-group pull-right" style="margin-top:25px;">
	            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#patientModal">
	            <i class="glyphicon glyphicon-pencil"></i><b> CREATE PATIENT PROFILE</b>
	            </button>
	            <button type="button" class="btn btn-danger" onclick="delrecordCheck()">
	            <i class="glyphicon glyphicon-remove"></i> <b>Delete</b>
	            </button>
	         </div>
	      </form>
			</div>
			<div class="row wow fadeIn" data-wow-delay=".4s" id="table">
				<div class="container">
					<div class="card col-12">
						<div class="tabletheme" style="margin-top: 20px;" >
							<h3>Patient Profiles</h3>
							<h5 id="date"></h5>
							<hr><br>
							<div class="table-responsive">
								<table id="patientTable" class="display" cellspacing="0" width="100%">
			          </table>
						  </div>
						</div>
					</div>
				</div>
			</div>
      <!-- Add  Patient Modal -->
      <div class="modal fade" id="patientModal" data-backdrop="static" data-keyboard="false" role="dialog">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
				  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				  <h4 class="modal-title" id="myModalLabel">Create New Patient Profile</h4>
               </div>
               <div class="modal-body">
                  <form class="form-horizontal" id="patientAddForm" action="ajax/patientCreate.php" method="post">
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
                           <input type="number" min="0" class="form-control" name="contact" maxlength="11" pattern=".{0,11}" title="0 to 11 characters" onkeypress="return event.charCode >= 48 &amp;&amp; event.charCode <= 57" placeholder="Mobile number/ Landline">
                        </div>
                     </div>

                     <div class="form-group">
                        <label class="col-sm-4 control-label">Gender</label>
                        <div class="col-sm-8">
                           <div class="radio">
														  <label for="gender1"><input type="radio" name="gender" value="Male" id="gender1" checked required>Male </label>
														  <label for="gender2"><input type="radio" name="gender" value="Female" id="gender2" required>Female </label>
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
														<input type="number" min="0" class="form-control" maxlength="11" pattern=".{0,11}" title="0 to 11 characters" onkeypress="return event.charCode >= 48 &amp;&amp; event.charCode <= 57" placeholder="Mobile number/ Landline">
														<button class="remove">Remove</button>
													</div>
													<a href="#" class="addInputCP" value="cPerson[]">+ Add</a>
													</div>
											</div>
	                    <div class="form-group">
												<label class="col-sm-4 control-label" for="allergy[]">Allergy/s</label>
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
										  <input type="number" name="userID" value="<?php echo $_SESSION['userID'];?>" class="hidden">
		               </div>
									</form>
							</div>

						<div class="modal-footer">
							<button type="submit" class="btn btn-primary pull-right hidden" form="patientAddForm">Submit</button>
							<button data-dismiss="modal" type="button" class="btn btn-inverse pull-right" style="margin-right: 20px;">Cancel</button>
						</div>
          </div>
       </div>
    </div>

    <!-- Delete Patient Modal -->
		<div class="row">
    <div class="modal fade col-12" id="delete-patient" tabindex="-1" role="dialog" aria-labelledby="myModalLabel20" aria-hidden="true">
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
                <button data-dismiss="modal" id="create-event" class="btn btn-primary" name="update" onclick="delpatient()">Confirm Delete</button>
             </div>
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
	  <script src="vendor/DataTables/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
		<script src="vendor/DataTables/ColReorder-1.5.0/js/dataTables.colReorder.min.js"></script>
	  <script src="vendor/select2-4.0.3/dist/js/select2.min.js"></script>
    <script src="vendor/alertify.js-master/dist/js/alertify.js"></script>
		<script src="js/patient-list.js"></script>
    <script src="js/profileForm.js"></script>
    <script src="js/dynamic_input.js"></script>
    <script src="js/checkbox.js"></script>
		<script src="js/wow.min.js"></script>
	  <script>
	  new WOW().init();
	  </script>
   </body>
</html>

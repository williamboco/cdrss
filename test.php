<?php
session_start();
include('includes/dbcon.php');
include('includes/session.php');

if($_SESSION['role'] == 'Avp') {
	header("location: home-avp.php");
}

?>
<html>
<head>
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  </head>
<body>
	<div class="container">
  <div class="row">
    Date formats: yyyy-mm-dd, yyyymmdd, dd-mm-yyyy, dd/mm/yyyy, ddmmyyyyy
  </div>
  <br />
    <div class="row">
        <div class='col-sm-3'>
            <div class="form-group">
                <div class='input-group date' id='datetimepicker1'>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
    <script type="text/javascript"
     src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js">
    </script> 
    <script type="text/javascript"
     src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/js/bootstrap.min.js">
    </script>
 <script type="text/javascript"
     src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.min.js">
    </script>
    <script type="text/javascript"
     src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/js/bootstrap-datetimepicker.min.js">
    </script>
    <script type="text/javascript">
       $(function () {
   var bindDatePicker = function() {
		$(".date").datetimepicker({
        format:'YYYY-MM-DD',
			icons: {
				time: "fa fa-clock-o",
				date: "fa fa-calendar",
				up: "fa fa-arrow-up",
				down: "fa fa-arrow-down"
			}
		}).find('input:first').on("blur",function () {
			// check if the date is correct. We can accept dd-mm-yyyy and yyyy-mm-dd.
			// update the format if it's yyyy-mm-dd
			var date = parseDate($(this).val());

			if (! isValidDate(date)) {
				//create date based on momentjs (we have that)
				date = moment().format('YYYY-MM-DD');
			}

			$(this).val(date);
		});
	}
   
   var isValidDate = function(value, format) {
		format = format || false;
		// lets parse the date to the best of our knowledge
		if (format) {
			value = parseDate(value);
		}

		var timestamp = Date.parse(value);

		return isNaN(timestamp) == false;
   }
   
   var parseDate = function(value) {
		var m = value.match(/^(\d{1,2})(\/|-)?(\d{1,2})(\/|-)?(\d{4})$/);
		if (m)
			value = m[5] + '-' + ("00" + m[3]).slice(-2) + '-' + ("00" + m[1]).slice(-2);

		return value;
   }
   
   bindDatePicker();
 });
    </script>

</body>
</html>

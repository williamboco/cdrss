function setDateRange() {
	
	var $date1 = $("#date1");
	var $date2 = $("#date2");
	
	$date1.val(currentDate(7,0,0)).trigger('change');
	$date1.attr({min: currentDate(0, 0, 15), max: currentDate()});
    
	$date2.val(currentDate());
	$date2.attr({min: $date1.val(), max: currentDate()});
    
}

function currentDate(d, m, y) {
	var dateObj = new Date();
	if(d || m || y) {
		dateObj.setDate(dateObj.getDate()-d);
		dateObj.setMonth(dateObj.getMonth()-m);
		dateObj.setFullYear(dateObj.getFullYear() - y);
	}

	var month = dateObj.getMonth() + 1; //months from 1-12
	var day = dateObj.getDate();
	var year = dateObj.getFullYear();
	function zero(number) {
		var my_string = '' + number;
		while (my_string.length < 2) {
			my_string = '0' + my_string;
		}
		return my_string;
	}
	var newdate = year + "-" + zero(month) + "-" + zero(day);
	return newdate;
}

function currentDateTime() {
	var dateObj = new Date();
	var month = dateObj.getMonth() + 1; //months from 1-12
	var day = dateObj.getDate();
	var year = dateObj.getFullYear();
	var hour = dateObj.getHours();
	var minute = dateObj.getMinutes();
	function zero(number) {
		var my_string = '' + number;
		while (my_string.length < 2) {
			my_string = '0' + my_string;
		}
		return my_string;
	}
	var newdate = year + "-" + zero(month) + "-" + zero(day) + "T" + zero(hour) + ":" + zero(minute);
	return newdate;
}

function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
}
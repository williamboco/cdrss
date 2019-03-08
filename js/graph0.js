$(document).ready(function() {
	console.log("ready");
	
	
	$(function(){
        $('.widget').widgster();
    })
	
	$('#date1').on('change', function() {
		var $date1 = $("#date1");
		var $date2 = $("#date2");
		
		$date2.attr("min", $date1.val());
		
	});
	/*
	$('.filters').on('change', function() {
		console.log($('#filter').serialize());
		
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
		
		$.ajax({
			type: "GET",
			url: "ajax/graph_complaint.php",
			data: $('#filter').serialize(),
			cache: false,
			success: function(data) {
				var obj = JSON.parse(data);
				console.log(obj);
				
				//chart.dataProvider = obj;
				//chart.validateData();

			}
		});
		
	});
	
	setDateRange();
		*/
});

/*
var chartData = [];
var chartData2 = [{
	"name": "Headache",
	"visits": 9
}];
  
var chart = AmCharts.makeChart("chartdiv", {
  "type": "serial",
  "theme": "light",
  "marginRight": 70,
  "dataProvider": chartData,
  "valueAxes": [{
	"integersOnly": 1,
    "axisAlpha": 0,
    "position": "left",
    "title": "Quantity"
  }],
  "startDuration": 1,
  "graphs": [{
    "balloonText": "<b>[[category]]: [[value]]</b>",
    "fillColorsField": "color",
    "fillAlphas": 0.9,
    "lineAlpha": 0.2,
    "type": "column",
    "valueField": "quantity"
  }],
  "chartCursor": {
    "categoryBalloonEnabled": false,
    "cursorAlpha": 0,
    "zoomable": false
  },
  "categoryField": "name",
  "categoryAxis": {
    "gridPosition": "start",
    "labelRotation": 45
  },
  "export": {
    "enabled": true
  }

});

var chart2 = AmCharts.makeChart("chartdiv2", {
  "type": "serial",
  "theme": "light",
  "marginRight": 70,
  "dataProvider": chartData2,
  "valueAxes": [{
	"integersOnly": 1,
    "axisAlpha": 0,
    "position": "left",
    "title": "Visits"
  }],
  "startDuration": 1,
  "graphs": [{
    "balloonText": "<b>[[category]]: [[value]]</b>",
    "fillColorsField": "color",
    "fillAlphas": 0.9,
    "lineAlpha": 0.2,
    "type": "column",
    "valueField": "visits"
  }],
  "chartCursor": {
    "categoryBalloonEnabled": false,
    "cursorAlpha": 0,
    "zoomable": false
  },
  "categoryField": "name",
  "categoryAxis": {
    "gridPosition": "start",
    "labelRotation": 45
  },
  "export": {
    "enabled": true
  }

});*/

var color = ['#FF0F00', '#FF6600', '#FF9E01', '#FCD202', '#F8FF01', '#B0DE09', '#04D215', '#0D8ECF', '#0D52D1', '#2A0CD0', '#8A0CCF', '#CD0D74', '#754DEB', '#DDDDDD', '#999999', '#333333', '#000000'];

var chart = AmCharts.makeChart("chartdiv", {
    "theme": "light",
    "type": "serial",
	"startDuration": 2,
    "valueAxes": [{
		"integersOnly": 1,
        "position": "left",
        "title": "Medicine Requests"
    }],
    "graphs": [{
        "balloonText": "[[category]]: <b>[[value]]</b>",
        "fillColorsField": "color",
        "fillAlphas": 1,
        "lineAlpha": 0.1,
        "type": "column",
        "valueField": "quantity"
    }],
    "depth3D": 20,
	"angle": 30,
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
    "theme": "light",
    "type": "serial",
	"startDuration": 2,
    "valueAxes": [{
		"integersOnly": 1,
        "position": "left",
        "title": "Number of patients"
    }],
    "graphs": [{
        "balloonText": "[[category]]: <b>[[value]]</b>",
        "fillColorsField": "color",
        "fillAlphas": 1,
        "lineAlpha": 0.1,
        "type": "column",
        "valueField": "visits"
    }],
    "depth3D": 20,
	"angle": 30,
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
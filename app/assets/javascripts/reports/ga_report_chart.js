var reporting_tool = (function(){

	var generate_report = function(data_received, container){
		google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);
	
		function drawChart() {
        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Status');
        data.addColumn('number', 'Count');
        data.addRows(data_received);

        // this is responsible for rendering chart with provided options
        var options = {'title':'Project Status chart',
                       'width':500,
                       'height':400};

        // this method is responsible for creating a chart instance and then rendering in the container provided.
        var chart = new google.visualization.PieChart(document.getElementById(container));
        chart.draw(data, options);
      }

		};

	return {
    generate_pie_report: generate_report
  };

})();
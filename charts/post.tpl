var data_files = [];
var data_commits = [];
var labels = [];
for (var i = 0; i < raw.length; i++) {
	var cur_date = moment(raw[i][0], dateFormat);
	data_files.push({t: cur_date, y: raw[i][1]});
	data_commits.push({t: cur_date, y: raw[i][2]});
	labels.push(raw[i][0]);
}

var ctx = document.getElementById("canvas1").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
		labels: labels,
        datasets: [{
			label: 'Commits',
            data: data_commits,
			type: 'bar',
			backgroundColor: window.chartColors.red,
		}]
    },
	options: {
			scales: {
				xAxes: [{
					type: 'time',
					stacked: true,
					// distribution: 'series',
					ticks: {
						source: 'labels',
					},
				}],
				yAxes: [{
					stacked: true,
					ticks: {
						beginAtZero:true
					}
				}]
			}
		}
});

var ctx2 = document.getElementById("canvas2").getContext('2d');
var myChart2 = new Chart(ctx2, {
    type: 'bar',
    data: {
		labels: labels,
        datasets: [{
			label: 'Changed files',
            data: data_files,
			type: 'bar',
			backgroundColor: window.chartColors.blue,
		}]
    },
	options: {
			scales: {
				xAxes: [{
					type: 'time',
					stacked: true,
					// distribution: 'series',
					ticks: {
						source: 'labels',
					},
				}],
				yAxes: [{
					stacked: true,
					ticks: {
						beginAtZero:true
					}
				}]
			}
		}
});
	</script>
</body>
</html>


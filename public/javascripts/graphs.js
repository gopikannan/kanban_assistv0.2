/**
 * Created by JetBrains RubyMine.
 * User: prakash
 * Date: 12/28/11
 * Time: 10:07 AM
 * To change this template use File | Settings | File Templates.
 */
var chart;
$(document).ready(function() {
    chart = new Highcharts.Chart({
        chart: {
            renderTo: 'demandGraph',
            defaultSeriesType: 'area'
        },

        title: {
            text: 'Demand Graph',
            align:'left',
            style: {
                      font: 'bold 1em Verdana, Arial, sans-serif',
                      color:'#8c8c8c'
            }

        },
        /*
         subtitle: {
         text: 'Source: <a href="http://thebulletin.metapress.com/content/c4120650912x74k7/fulltext.pdf">' +
         'thebulletin.metapress.com</a>'
         },  */
        xAxis: {
            labels: {
                formatter: function() {
                    return this.value; // clean, unformatted number for year
                }
            }
        },
        yAxis: {
            title: {
                text: 'demand'
            },
            labels: {
                formatter: function() {
                    return this.value / 1000 + 'k';
                }
            }
        },
        tooltip: {
            formatter: function() {
                return this.series.name + ' produced <b>' +
                    Highcharts.numberFormat(this.y, 0) + '</b><br/>demand at ' + this.x;
            }
        },
        plotOptions: {
            area: {
                pointStart: 1940,
                marker: {
                    enabled: false,
                    symbol: 'circle',
                    radius: 2,
                    states: {
                        hover: {
                            enabled: true
                        }
                    }
                }
            }
        },
        series: [
            {
                name: 'Sponge',
                data: [null, null, null, null, null, 6 , 11, 32, 110, 235, 369, 640,
                    1005, 1436, 2063, 3057, 4618, 6444, 9822, 15468, 20434, 24126,
                    27387, 29459, 31056, 31982, 32040, 31233, 29224, 27342, 26662,
                    26956, 27912, 28999, 28965, 27826, 25579, 25722, 24826, 24605,
                    24304, 23464, 23708, 24099, 24357, 24237, 24401, 24344, 23586,
                    22380, 21004, 17287, 14747, 13076, 12555, 12144, 11009, 10950,
                    10871, 10824, 10577, 10527, 10475, 10421, 10358, 10295, 10104 ]
            }

        ]
    });

    var playOutputChart;
    playOutputChart = new Highcharts.Chart({

        chart: {
            renderTo: 'playOutputChart',
            defaultSeriesType: 'column'
        },
        title: {
            text: 'Play Output Graph',
            align:'left',
            style: {
                      font: 'bold 1em Verdana, Arial, sans-serif',
                      color:'#8c8c8c'
            }

        },

        xAxis: {
            title:{
              text: 'Reorder point'
            },
            categories: [
                '1',
                '2',
                '3',
                '4',
                '5',
                '6',
                '7',
                '8',
                '9',
                '10',
                '11',
                '12'
            ]
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Costs($)',

            }
        },
        legend: {
            layout: 'horizontal',
            backgroundColor: '#FFFFFF',
            align: 'right',
            verticalAlign: 'top',
            /*
            x: 100,
            y: 70,  */
            floating: true,
            shadow: true
        },
        tooltip: {
            formatter: function() {
                return '' +
                    this.x + ': ' + this.y + ' mm';
            }
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [
            {
                name: 'Total Costs',
                data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

            },
            {
                name: 'Stockout penalty',
                data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]

            },
            {
                name: 'Holding cost',
                data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]

            },
            {
                name: 'Ordering Cost',
                data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]

            }
        ]
    });

});

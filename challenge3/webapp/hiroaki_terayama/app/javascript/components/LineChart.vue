<script>
  import { Line, mixins } from 'vue-chartjs'
  import Labels from '../shared/labels'

  export default {
    mixins: [Line, mixins.reactiveData],
    name: 'LineChart',
    props: ['allData', 'selectedData'],
    data () {
      return {
        chartData: {
          labels: Labels.monthLabels ,
          datasets: [
            {
              label: 'energy production / month(your area)',
              backgroundColor: '#ff3860',
              pointBackgroundColor: 'white',
              borderWidth: 1,
              pointBorderColor: '#249EBF',
              data: [],
            },
            {
              label: 'energy production / month(all area)',
              backgroundColor: 'grey',
              pointBackgroundColor: 'white',
              borderWidth: 1,
              pointBorderColor: '#249EBF',
              data: [],
            },
          ],
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: false
              },
              gridLines: {
                display: true
              }
            }],
            xAxes: [{
              gridLines: {
                display: true
              }
            }]
          },
          legend: {
            display: true
          },
          responsive: true,
          maintainAspectRatio: false
        }
      }
    },
    watch: {
      selectedData () {
        this.updateChart()
      }
    },
    methods: {
      updateChart () {
        const newChartData = Object.assign({}, this.chartData)
        newChartData.datasets[0].data = this.selectedData
        this.chartData = newChartData
      },
      setAllData () {
        const newChartData = Object.assign({}, this.chartData)
        newChartData.datasets[1].data  = this.allData
        this.chartData = newChartData
      }
    },
    mounted () {
      this.setAllData()
      this.renderChart(this.chartData, this.options)
    }
  }
</script>

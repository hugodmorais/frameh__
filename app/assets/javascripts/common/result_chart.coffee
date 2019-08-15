Highcharts.setOptions
  global:
    useUTC: false
  lang:
    loading: 'A carregar...'
    months: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',  'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro']
    shortMonths: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez']
    weekdays: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sabado']

class window.ResultChart
  constructor: (chart_id, options = {}) ->
    @id = chart_id
    @chart_id = '#' + chart_id
    @default_options =
      credits:
        enabled: false
      title:
        text: null
    @chart = null
    @charts = []
    @zoom_callback = ->

  dashboard_index: ->
    options =
      chart:
        type: 'column'
      title:
        align: 'center'
        style:
          fontSize: '13px'
      exporting: {
        enabled: false
      }
      xAxis:
        type: 'category'
      yAxis:
        min: 0
        labels:
          formatter: ->
            Highcharts.numberFormat(@value, 0)
        style:
          color: 'black'
        stackLabels:
          enabled: false
        style:
          fontWeight: 'bold'
        title:
          text: ''
      legend:
        align: 'center'
        verticalAlign: 'bottom'
        symbolRadius: 0
      tooltip:
        pointFormat: '{series.name}: {point.y}<br/>'
      plotOptions:
        series:
          dataLabels:
            color: Highcharts.theme and Highcharts.theme.dataLabelsColor
    @chart = new Highcharts.Chart(@id, $.extend(true, {}, @default_options, options))
    @get_chart_data() 

  dashboard_index_partial: ->
    options =
      chart:
        height: 250
        marginTop: 40
      title:
        align: 'center'
        style: fontSize: '15px'
        floating: true
      subtitle:
        text: 0
        align: 'center'
        verticalAlign: 'middle'
        style:
          fontSize: '14px'
          fontWeight: 'bold'
      exporting: {
        enabled: false
      }
      legend:
        itemDistance: 10
        symbolPadding: 0
        margin: 0
        padding: 0
        itemStyle:
          fontSize: '10px'
          fontWeight: 'normal'
      exporting:
        enabled: false
      plotOptions:
        pie:
          center: ['50%', '50%']
          dataLabels: enabled: false
          showInLegend: true
          innerSize: '70%'
          events: afterAnimate: ->
            y = 20 - @chart.legend.legendHeight / 2
            if @total?
              decimals = @tooltipOptions.valueDecimals || 0
              @chart.setSubtitle(text: Highcharts.numberFormat(@total, decimals), y: y)
            else
              @chart.setSubtitle(text: 0, y: y)
      tooltip:
        headerFormat: ''
        pointFormat: '{point.name}: <b>{point.y}</b>'
        style: width: '150px'

    @chart = new Highcharts.Chart(@id, $.extend(true, {}, @default_options, options))
    @get_chart_data() 

  # ---- Class methods ---- #
  get_chart_data: ->
    @chart.showLoading()
    url = $(@chart_id).data('url')
    $.getJSON url, (data) =>
      if data.categories?
        @chart.xAxis[0].categories = data.categories
      if data.title?
        @chart.setTitle(data.title)
      if data.series?
        while @chart.series.length > 0
          @chart.series[0].remove false
        for object in data.series
          @chart.addSeries(object, false)
      @chart.hideLoading()
      @chart.redraw()


      

  
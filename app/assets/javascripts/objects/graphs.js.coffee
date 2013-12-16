$ ->
  ### 
  # Currently, test graphs for people/show page. Need to genericize these.
  ###

  ###
  Plan: 

  * Set global highcharts options in Highcharts.setOptions
  * Create defaults for each type of chart, i.e. bar, donut.
      See http://stackoverflow.com/a/9607502/76710
  * Override default options as needed on individual charts

  The above depends on the actual chart types we'll be using... TBD ... 
  
  So far, types appear to be:
  
  1. Donut (see below)
  2. Column Graph (see below)
  3. Sparkline (use basic line chart as start, then strip away all labels etc. and reduce size. 
        Start here: http://jsfiddle.net/yTvcd/)
        OR start with basic area chart.. http://www.highcharts.com/demo/area-basic
  4. (maybe?) single stacked line (http://app.uxpin.com/126104a91bc9d9e308cbdd6a5e2cf3f5dbc6f812/1384294#7)
        start here: http://jsfiddle.net/kzRny/

  ###

  Highcharts.setOptions
    colors: ['#fd8f42', '#fda24b', '#fdb454', '#fdc85d', '#bbc8ce', '#a6b6bf']
    credits: false
    chart:
      style:
        fontFamily: '"PT Sans", Helvetica, Arial, sans-serif'
      backgroundColor: null

  donut_defaults = {
    chart:
      renderTo: "donut"
      type: "pie"
      margin: [0,0,0,0]

    colors: ['#fd8f42', '#bbc8ce', '#fdb454', '#a6b6bf']      

    title: false

    yAxis:
      title: 
        text: "Total percent market share"

    # http://api.highcharts.com/highcharts#plotOptions
    # http://api.highcharts.com/highcharts#plotOptions.pie
    plotOptions:
      pie:
        borderWidth: 2
        # Couldn't get border color to work with 'transparent', null, or rgba, so hardcoding hex for now.
        borderColor: '#0e3c6e'
        shadow: false
        startAngle: 210

    tooltip:
      shadow: false
      formatter: ->
        "<b>" + @point.name + "</b>: " + @y + ""

    series: [
      # name: "Game Record"
      data: [["Label", 99], ["Label", 99], ["Label", 99]]
      size: "100%"
      innerSize: "95%"  
      dataLabels:
        enabled: false
    ]
  }

  column_defaults = 
    chart:
      type: "column"
      margin: 0

    title: false
    legend: false
    xAxis:
      categories: ["Wins"]
      labels: false
      lineWidth: 0

    yAxis:
      title: false
      labels: false
      gridLineWidth: 0
    
    tooltip: {}

    plotOptions:
      series: 
        colorByPoint: true
        pointPadding: 0.1
        groupPadding: 0
        borderWidth: 0 

    series: [
      name: "Team"
      data: [120]
    ]

  bar_defaults = 
    chart:
      type: "bar"

    title: false
    legend: false

    xAxis:
      categories: ["Apples", "Oranges", "Pears", "Grapes", "Bananas"]

    yAxis:
      min: 0
      title: false
    legend:
      backgroundColor: "#FFFFFF"
      reversed: true

    plotOptions:
      series:
        stacking: "normal"

    series: [
      name: "John"
      data: [5, 3, 4, 7, 2]
    ,
      name: "Jane"
      data: [2, 2, 3, 2, 1]
    ,
      name: "Joe"
      data: [3, 4, 4, 2, 5]
    ]


  negbar_defaults =
    chart:
        type: "bar"
        height: 200

    title: false
    legend: false

    xAxis: [
      categories: ["Apples", "Oranges", "Pears", "Grapes", "Bananas"]
      reversed: false
      ,

      opposite: true
      reversed: false
      categories: ["Apples", "Oranges", "Pears", "Grapes", "Bananas"]
      linkedTo: 0
    ]

    yAxis:
      min: -10
      max: 10
      title: false
      labels:
        formatter: ->
          return (Math.abs(this.value))

    legend:
      reversed: true

    plotOptions:
      series:
        stacking: "normal"

    series: [
      name: "John"
      data: [1,2,3,4,5]
    ,
      name: "Jane"
      data: [-10,-9,-8,-7,-6]
    ]


  $(".graph.donut").each (i, el) ->
    donut_options = {
      series: [
        data: $(el).data('highcharts-series-data')
      ]
      chart: {
        width: $(el).width(),
        height: $(el).height()
      },
      plotOptions: {
        pie: {
          borderColor: $(el).data('highcharts-plotoptions-pie-bordercolor')
        }
      }
    }

    donut_options = $.extend(true, {}, donut_defaults, donut_options)
    $(el).highcharts(donut_options)
  
  $(".graph.column").each (i, el) ->
    custom_options = {
      series: $(el).data('highcharts-series'),
      xAxis: $(el).data('highcharts-xaxis')
    }
    column_options = $.extend(true, {}, column_defaults, custom_options)
    $(el).highcharts(column_options)


  $(".graph.bar").each (i, el) ->
    console.log bar_defaults.xAxis
    console.log $(el).data('highcharts-xaxis')
    bar_options = $.extend(true, {}, bar_defaults, {})
    bar_options.series = $(el).data('highcharts-series')
    bar_options.xAxis  = $(el).data('highcharts-xaxis')
    $(el).highcharts(bar_options)

  $(".graph.negbar").each (i, el) ->
    console.log negbar_defaults.xAxis
    console.log $(el).data('highcharts-xaxis')
    negbar_options = $.extend(true, {}, negbar_defaults, {})
    negbar_options.series = $(el).data('highcharts-series')
    negbar_options.xAxis = $(el).data('highcharts-xaxis') 
    $(el).highcharts(negbar_options)

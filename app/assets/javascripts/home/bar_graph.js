OM.BarGraph = (() => {
  return {
    renderBarGraph
  }

  function renderBarGraph($parent, report, widthFromParent) {
    let $bar = $parent.find(".bar");
    let fullWidth = widthFromParent ? $parent.width() : $bar.width();
    let graphData = constructGraphData(report);
    let $bars = [];

    for(let i = 0, len = graphData.length; i < len; i++) {
      $bars.push(buildBarGraph(graphData[i], fullWidth));
    }

    $bar.html($bars);
  }

  function constructGraphData(data) {
    let activeCase = {
      count: OM.HomeHelper.activeCase(data),
      className: "ongoing",
      total: data.total_cases
    };

    let recoveredCase = {
      count: data.recovered_cases,
      className: "recovered",
      total: data.total_cases
    };

    let fatalCase = {
      count: data.fatal_cases,
      className: "fatal",
      margin: 0,
      total: data.total_cases
    };

    activeCase.margin = (data.recovered_cases || data.fatal_cases) ? 4 : 0;
    recoveredCase.margin = data.fatal_cases ? 4: 0;

    return [activeCase, recoveredCase, fatalCase];
  }

  function buildBarGraph(graphData, fullWidth) {
    let $bar;
    if (graphData.count > 0) {
      let width = (graphData.count * 1.0) / graphData.total * fullWidth - graphData.margin;

      $bar = $("<div>", { class: `slice ${graphData.className}`, style: `width: ${width}px; margin-right: ${graphData.margin}px;` });
    }
    return $bar;
  }
})();
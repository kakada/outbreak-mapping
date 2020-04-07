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

  function constructGraphData(report) {
    let activeCase = {
      count: OM.HomeHelper.activeCase(report),
      className: "ongoing",
      total: report.total_case
    };

    let recoveredCase = {
      count: report.recovered_case,
      className: "recovered",
      total: report.total_case
    };

    let fatalCase = {
      count: report.death_case,
      className: "fatal",
      margin: 0,
      total: report.total_case
    };

    activeCase.margin = (report.recovered_case || report.death_case) ? 4 : 0;
    recoveredCase.margin = report.death_case ? 4: 0;

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

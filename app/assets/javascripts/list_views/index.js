OM.List_viewsIndex = (() => {
  return {
    init
  }

  function init() {
    bindLocation();
    renderBarGraph();
    $( window ).resize(function() {
      renderBarGraph();
    });
  }

  function bindLocation() {
    $(".area").click(function(e) {
      $(e.currentTarget).toggleClass("selected");
      $(e.currentTarget).next(".region.tab").slideToggle("fast");
      $(e.currentTarget).find("i.fas").toggleClass("fa-caret-down");
      $(e.currentTarget).find("i.fas").toggleClass("fa-caret-up");
      renderBarGraph();
    });
  }

  function renderBarGraph() {
    $.each( $(".bar"), (_i, bar) => {
      let report = $(bar).data("report");
      $parent = $(bar).parent(".info-tile");

      OM.BarGraph.renderBarGraph($parent, report)
    });
  }
})();

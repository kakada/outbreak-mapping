OM.List_viewsIndex = (() => {
  return {
    init
  }

  function init() {
    bindLocation();
  }

  function bindLocation() {
    $(".area").click(function(e) {
      $(e.currentTarget).toggleClass("selected");
      $(e.currentTarget).next(".region.tab").slideToggle("fast");
      $(e.currentTarget).find("i.fas").toggleClass("fa-caret-down");
      $(e.currentTarget).find("i.fas").toggleClass("fa-caret-up");
    });
  }
})();
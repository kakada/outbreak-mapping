OM.FaqsIndex = (() => {
  return {
    init
  }

  function init() {
    OM.Common.MobileMenu.onScrollContainer();

    $(".collapse").on("show.bs.collapse", function(e) {
      let $faq = $(e.currentTarget).parent(".faq-question");
      ($faq).find(".fa-angle-down").removeClass("fa-angle-down").addClass("fa-angle-up");
    });

    $(".collapse").on("hide.bs.collapse", function(e) {
      let $faq = $(e.currentTarget).parent(".faq-question");
      ($faq).find(".fa-angle-up").removeClass("fa-angle-up").addClass("fa-angle-down");
    });
  }
})();
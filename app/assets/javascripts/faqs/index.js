OM.FaqsIndex = (() => {
  return {
    init
  }

  function init() {
    OM.Common.MobileMenu.onScrollContainer();

    $(".collapse").on("show.bs.collapse", function(e) {
      let $faq = $(e.currentTarget).parent(".faq-question");
      ($faq).find(".fa-angle-down").css({"transform": "rotate(180deg)", "transition-duration": "300ms"});
    });

    $(".collapse").on("hide.bs.collapse", function(e) {
      let $faq = $(e.currentTarget).parent(".faq-question");
      ($faq).find(".fa-angle-down").css("transform", "");
    });
  }
})();
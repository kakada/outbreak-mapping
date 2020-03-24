OM.AboutsShow = (() => {
  return {
    init
  }

  function init() {
    initMobile();
  }

  function initMobile() {
    if ($(".mobile").length > 0) {
      onScrollContainer();
    }
  }

  function onScrollContainer() {
    const scrollUp = "scroll-up";
    const scrollDown = "scroll-down";
    const body = document.body;
    let lastScroll = 0;

    $(document).on('scroll', function() {
      const currentScroll = window.pageYOffset;
      if (currentScroll == 0) {
        body.classList.remove(scrollUp);
        return;
      }

      if (currentScroll > lastScroll && !body.classList.contains(scrollDown)) {
        // down
        body.classList.remove(scrollUp);
        body.classList.add(scrollDown);
      } else if (currentScroll < lastScroll && body.classList.contains(scrollDown)) {
        // up
        body.classList.remove(scrollDown);
        body.classList.add(scrollUp);
      }
      lastScroll = currentScroll;
    });
  }

})();

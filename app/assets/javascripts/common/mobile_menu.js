OM.Common={}
OM.Common.MobileMenu = (() => {
  return {
    init,
    onScrollContainer
  }

  function init() {
    initMobile();
  }

  function initMobile() {
    if ($(".mobile .content").length > 0) {
      addEventToCloseLocation();
      addEventToMunu();
      addEventToShare();
    }
  }

  function addEventToShare() {
    $('.btn-share').on('click', function(e) {
      if (navigator.share) {
        navigator.share({
          title: document.title,
          text: "Cambodia event outbreaking",
          url: window.location.href
        }).then(() => console.log('Successful share'))
        .catch(error => console.log('Error sharing:', error));
      }

      e.preventDefault();
    });
  }


  function addEventToCloseLocation() {
    $(".close-location").click(function() {
      closeDropdown()
    });
  }

  function closeDropdown() {
    $(".information").show();
    $(".location-list").removeClass("opening").addClass("closing");
    $(".location-list").removeClass("closing");
    $(".location-list").hide();
  }

  function addEventToMunu() {
    $(".mobile-menu-button").click(function(e) {
      $(".mobile-menu-panel").show();
      $(".mobile-menu-panel").removeClass("closing").addClass("opening");
    });

    $(".mobile-menu .close-button, .mobile-menu-panel .overlay").click(function(e) {
      $(".mobile-menu-panel").addClass("closing");
      $(".mobile-menu-panel").hide();
    });
  }

  function onScrollContainer() {
    if ($(".mobile").length == 0) {
      return;
    }

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

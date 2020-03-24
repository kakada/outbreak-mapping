OM.Common={}
OM.Common.MobileMenu = (() => {
  return {
    init
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
    $('.btn-share').on('click', function() {
      if (navigator.share) {
        navigator.share({
          title: document.title,
          text: "Cambodia event outbreaking",
          url: window.location.href
        }).then(() => console.log('Successful share'))
        .catch(error => console.log('Error sharing:', error));
      }
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
})();

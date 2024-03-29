// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks

//= require jquery3
//= require popper
//= require bootstrap
//= require leaflet
//= require highlight.pack
//= require clipboard.min

//= require application/namespace
//= require application/util

//= require social-share-button

//= require common/mobile_menu
//= require home/helper
//= require home/index
//= require home/bar_graph
//= require abouts/show
//= require list_views/index
//= require developer_guides/index

$(document).on("ready turbolinks:load", () => {
  if (typeof gtag === "function") {
    gtag("config", GA_TRACKING_ID, {
      "page_location": event.data.url
    });
  }

  const currentPage = OM.Util.getCurrentPage();
  if (OM[currentPage]) {
    OM[currentPage].init();
  }

  OM.Common.MobileMenu.init();

  $("[data-toggle='tooltip']").tooltip()

  Rails.refreshCSRFTokens();
});


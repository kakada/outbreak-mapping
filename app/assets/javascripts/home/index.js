OM.HomeIndex = (() => {
  let map = null;
  let eventData = [];
  let markers = {};
  const osmUrl = "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png";
  const osmAttrib="Map data © <a href='https://openstreetmap.org'>OpenStreetMap</a> contributors";
  const cambodiaLat = 12.33233;
  const cambodiaLng = 104.875305;

  return {
    init
  }

  function init() {
    updateHeight();
    eventData = $("#map").data("covid-19");

    _renderMap();
    // _initLegendSliding();
    addEventToReport();
  }

  function _initLegendSliding() {
    $(".btn-slide").on("click", function() {
      posRight = $(this).parents('.slide-wrapper').width() - $(this).parent().width();
      right = '-=' + posRight;

      if(parseInt($('.slide-wrapper').css('right')) != 0) {
        right = '+=' + posRight;
      }

      $('.slide-wrapper').animate({'right': right});
      $(this).find('i').toggleClass('fa-angle-double-right');
    });
  }

  function _renderMap() {
    map = new L.Map('map');
    if (eventData.length) {
      _renderMarker();
    }

    map.setView(new L.LatLng(cambodiaLat, cambodiaLng), 7);

    _renderOSM();
  }

  function _renderOSM() {
    let osm = new L.TileLayer(osmUrl, { minZoom: 7, maxZoom: 15, attribution: osmAttrib });
    map.addLayer(osm);
  }

  function _renderMarker() {
    eventData.forEach( (data) => {
      const extraRadius = data.total / 2.5;
      const latlng = [ data.lat, data.lng];

      let marker = L.circleMarker(latlng, {
        color: "red",
        fillColor: "#fc7a4e",
        fillOpacity: 0.8,
        weight: 1,
        opacity: 1,
        radius: 5 + extraRadius
      }).addTo(map);

      marker.id = data.id;
      markers[data.id] = marker.bindPopup(_buildMarkerPopupContent(data));

      addEventToMarker(marker);
    });
  }

  function addEventToMarker(marker) {
    marker.on("click", function(e) {
      $(`.area#${e.target.id}`).click();
      document.getElementById(e.target.id).scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"});
    });
  }

  function _buildMarkerPopupContent(data) {
    let $content = $("<div>");
    $titleInfo = $("<div>", { class: "title-info-box" }).text(data.location_name);
    $activeCase = buildStatLine(locale.activeCase, "ongoing", data.active);
    $recoveredCase = buildStatLine(locale.recoveredCase, "recovered", data.recovered);
    $fatalCase = buildStatLine(locale.fatalCase, "fatal", data.fatal);
    $content.append([$titleInfo, $activeCase, $recoveredCase, $fatalCase]);

    return $content[0];
  }

  function buildStatLine(caseName, caseClass, count) {
    let $statLine = $("<div>", { class: "stat-line" });
    let $caseLegend = $("<div>", { class: `legend-color ${caseClass}` });
    let $stat = $("<div>", { class: "stat" }).text(caseName);
    let $statCount = $("<div>", { class: "stat-count" }).text(count);
    $statLine.append([$caseLegend, $stat, $statCount]);

    return $statLine;
  }

  function addEventToReport() {
    $(".area").click(function(e) {
      $(".areas .selected").removeClass("selected");
      $area = $(e.currentTarget);
      $area.addClass("selected");

      $("#location-name").text($area.data("location"))
      $(".info-title #confirmed-case").text($area.data("total"))
      $(".legend #active-case").text($area.data("active"));
      $(".legend #recovered-case").text($area.data("recovered"));
      $(".legend #fatal-case").text($area.data("fatal"));

      if ($area.attr("id") == "00") {
        map.closePopup();
      } else {
        markers[$area.attr("id")].openPopup();
      }
    })
  }

  function updateHeight() {
    const mapHeight = $(window).height() - 187;

    $(".user-navbar").css({ "position": "fixed", "top": 0, "width": "100%" })
    $("#map").css({ "height": `${mapHeight}px`, "postion": "absolute", "margin-top": "48px" });
    $(".information").css({ "margin-top": `${mapHeight}px`, "position": "absolute", "min-height": "287px" });
  }
})();

OM.HomeIndex = (() => {
  let map = null;
  let eventData = [];
  const osmUrl = "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png";
  const osmAttrib="Map data © <a href='https://openstreetmap.org'>OpenStreetMap</a> contributors";
  const cambodiaLat = 12.33233;
  const cambodiaLng = 104.875305;

  return {
    init
  }

  function init() {
    eventData = $("#map").data("covid-19");

    _renderMap();
    // _initLegendSliding();
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
    let markers = [];

    eventData.forEach( (data) => {
      const extraRadius = data.total / 2.5;
      const latlng = [ data.lat, data.lng];

      const marker = L.circleMarker(latlng, {
        color: "red",
        fillColor: "#fc7a4e",
        fillOpacity: 0.8,
        weight: 1,
        opacity: 1,
        radius: 5 + extraRadius
      }).addTo(map);

      markers.push(latlng);
      marker.bindPopup(_buildMarkerPopupContent(data));
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

})();

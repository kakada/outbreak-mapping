OM.HomeIndex = (() => {
  let map = null;
  let eventData = [];
  let reports = [];
  let markers = {};
  const osmUrl = "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png";
  const osmAttrib="Map data © <a href='https://openstreetmap.org'>OpenStreetMap</a> contributors";

  return {
    init,
    getReports
  }

  function init() {
    eventData = $("#map").data("covid-19");
    reports = eventData.concat([$("#map").data("summary")]);

    initMobile();
    _renderMap();
    addEventToReport();
    toggleTabDisplay();
    renderOverallCaseGraph();
  }

  function getReports() {
    return reports || $("#map").data("covid-19");
  }

  function _renderMap() {
    map = new L.Map("map", { zoomControl: false });
    L.control.zoom({ position: 'bottomright' }).addTo(map);
    if (eventData.length) {
      _renderMarker();
    }

    map.fitBounds([
      [10.4865436874, 102.3480994],
      [14.5705838078, 107.614547968]
    ])
    _renderOSM();
  }

  function _renderOSM() {
    let osm = new L.TileLayer(osmUrl, { minZoom: 5, maxZoom: 11, attribution: osmAttrib });
    map.addLayer(osm);
  }

  function _renderMarker() {
    eventData.forEach( (data) => {
      const extraRadius = data.total_case / 2.5;
      const latlng = [data.location.latitude, data.location.longitude];

      let marker = L.circleMarker(latlng, {
        color: "red",
        fillColor: "#fc7a4e",
        fillOpacity: 0.8,
        weight: 1,
        opacity: 1,
        radius: 5 + extraRadius
      }).addTo(map);

      marker.id = data.location_code;
      markers[data.location_code] = marker.bindPopup(_buildMarkerPopupContent(data));

      addEventToMarker(marker);
    });
  }

  function addEventToMarker(marker) {
    marker.on("click", function(e) {
      $(`.area#${e.target.id}`).click();
      if (document.getElementById(e.target.id)) {
        document.getElementById(e.target.id).scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"});
      }
    });
  }

  function _buildMarkerPopupContent(data) {
    let $content = $("<div>");
    $titleInfo = $("<div>", { class: "title-info-box" }).text(data.location.name_km);
    $totalCase = buildTotalStatLine(data.total_case);
    $statLineDevider = $("<div>", { class: "stat-line divider" });
    $activeCase = buildStatLine(locale.activeCase, "ongoing", getActiveCase(data));
    $recoveredCase = buildStatLine(locale.recoveredCase, "recovered", data.recovered_case);
    $fatalCase = buildStatLine(locale.fatalCase, "fatal", data.death_case);
    $content.append([$titleInfo, $totalCase, $statLineDevider, $activeCase, $recoveredCase, $fatalCase]);

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

  function buildTotalStatLine(count) {
    let $statLine = $("<div>", { class: "stat-line" });
    let $stat = $("<div>", { class: "stat total" }).text("ចំនួនករណីឆ្លងសរុប");
    let $statCount = $("<div>", { class: "stat-count total" }).text(count);
    $statLine.append([$stat, $statCount]);

    return $statLine;
  }

  function addEventToReport() {
    $(".area").click(function(e) {
      $area = $(e.currentTarget);
      if (!$area.attr("id")) {
        return;
      }

      selectedArea($area);
      updateInfo($area);
      updateChart($area);

      if ($area.attr("id") == "00") {
        map.closePopup();
      } else {
        markers[$area.attr("id")].openPopup();
      }
    })
  }

  function selectedArea($area) {
    $(".areas .selected").removeClass("selected");
    $area.addClass("selected");
  }

  function updateInfo($area) {
    $("#location-name").text($area.data("location"));

    if ($area[0].id == "00") {
      $(".region .info-tile").hide();
    } else {
      $(".region .info-tile").show();
    }

    $(".info-tile #confirmed-case").text($area.data("total"))
    $(".legend #active-case").text($area.data("active"));
    $(".legend #recovered-case").text($area.data("recovered"));
    $(".legend #fatal-case").text($area.data("fatal"));

    var newCases = $area.data("new-cases");
    if (newCases > 0) {
      var $newCase = $("<span>", { class: "new-case" });
      $newCase.text(` (${newCases} ថ្មី)`);
      $(".info-tile #confirmed-case").append($newCase)
      $(".secondary-info .case-count").append($newCase)
    }

    updateDetailInfo($area);
  }

  function updateDetailInfo($area) {
    var detailInfo = $area.data("detail");

    if (detailInfo && detailInfo[0].field_value) {
      $("#case-detail-info").html(detailInfo[0].field_value.replace(/;/g, "<br />"));
    } else {
      $("#case-detail-info").parent(".info-tile").hide();
    }
  }

  function updateHeight() {
    const mapHeight = $(window).height() - 294;
    $("#map").css({ "height": `${mapHeight}px`, "postion": "absolute" });
    $(".information").css({ "margin-top": `${mapHeight}px`, "position": "absolute", "min-height": "294px" });
  }

  function updateChart($area) {
    let id = $area.attr("id");

    let report = reports.find( data => data.location_code == id)
    report.active_case = OM.HomeHelper.activeCase(report);

    let $parent = $(".region.tab").length > 0 ? $(".region.tab") : $(".information");
    OM.BarGraph.renderBarGraph($parent, report);
  }

  function initMobile() {
    if ($(".mobile .content").length > 0) {
      updateHeight();
      addEventToInfoArea();
      addEventToArea();
    }
  }

  function addEventToInfoArea() {
    $(".mobile .information .area").click(function(e) {
      $(".location-list").show();
      $(".location-list").removeClass("closing").addClass("opening");
      $(".content").css("overflow", "hidden");
      $(".information").hide();
    });
  }

  function closeDropdown() {
    $(".information").show();
    $(".location-list").removeClass("opening").addClass("closing");
    $(".location-list").removeClass("closing");
    $(".location-list").hide();
  }

  function addEventToArea() {
    $(".dropdown-options .area").click(function(e) {
      closeDropdown();
      $area = $(e.currentTarget);
      $(".information .area-name").text($area.data("location"));
      $(".secondary-info .case-count").text($area.data("total"));
    });
  }

  function getActiveCase(data) {
    return data.total_case - data.recovered_case - data.death_case
  }

  function toggleTabDisplay() {
    $(".close-region").click(function() {
      $(".tabs").toggleClass("hidden");
      let $closeTabIcon = $(".close-region .fas");
      let caretLeft = "fa-caret-left";
      let caretRight = "fa-caret-right"
      if($closeTabIcon.hasClass(caretLeft)) {
        $closeTabIcon.removeClass(caretLeft).addClass(caretRight);
      } else {
        $closeTabIcon.removeClass(caretRight).addClass(caretLeft);
      }

      window.dispatchEvent(new Event('resize'));
    });
  }

  function renderOverallCaseGraph() {
    let $parent = $(".country.tab");
    if ($parent.length == 0) {
      $parent = $(".information");
    }

    let report = reports.find(x => x.location_code == "00");
    OM.BarGraph.renderBarGraph($parent, report);
  }
})();

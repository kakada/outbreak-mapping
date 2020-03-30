OM.Developer_guidesIndex = (() => {
  return {
    init
  }

  function init() {
    hljs.initHighlighting.called = false;
    hljs.initHighlighting();
    new ClipboardJS('.btn');

    $('button').tooltip({
      trigger: 'click',
      placement: 'bottom'
    });

    function setTooltip(btn, message) {
      $(btn).tooltip('hide')
        .attr('data-original-title', message)
        .tooltip('show');
    }

    function hideTooltip(btn) {
      setTimeout(function() {
        $(btn).tooltip('hide');
      }, 1000);
    }

    // Clipboard

    var clipboard = new ClipboardJS('button');

    clipboard.on('success', function(e) {
      setTooltip(e.trigger, 'Copied!');
      hideTooltip(e.trigger);
    });

    clipboard.on('error', function(e) {
      setTooltip(e.trigger, 'Failed!');
      hideTooltip(e.trigger);
    });
  }

  function initCodeHighlight() {
    hljs.initHighlightingOnLoad();
    // var pres = document.querySelectorAll("pre>code");
    // for (var i = 0; i < pres.length; i++) {
    //     hljs.highlightBlock(pres[i]);
    // }

    // var options = {   // optional
    //     contentSelector: "#ArticleBody",

    //     // CSS class(es) used to render the copy icon.
    //     copyIconClass: "fas fa-copy",
    //     // CSS class(es) used to render the done icon.
    //     checkIconClass: "fas fa-check text-success"
    // };
    // window.highlightJsBadge(options);
  }
})();

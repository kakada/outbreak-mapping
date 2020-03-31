OM.Developer_guidesIndex = (() => {
  return {
    init
  }

  function init() {
    OM.Common.MobileMenu.onScrollContainer();
    initCodeHighlight();
  }

  function initCodeHighlight() {
    hljs.initHighlightingOnLoad();
    hljs.initHighlighting.called = false;
    hljs.initHighlighting();
    new ClipboardJS('.btn');

    $('button').tooltip({
      trigger: 'click',
      placement: 'bottom'
    });

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
})();

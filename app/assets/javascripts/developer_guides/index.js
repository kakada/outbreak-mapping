OM.Developer_guidesIndex = (() => {
  return {
    init
  }

  function init() {
    initCodeHighlight();
  }

  function initCodeHighlight() {
    var pres = document.querySelectorAll("pre>code");
    for (var i = 0; i < pres.length; i++) {
        hljs.highlightBlock(pres[i]);
    }

    var options = {   // optional
        contentSelector: "#ArticleBody",

        // CSS class(es) used to render the copy icon.
        copyIconClass: "fas fa-copy",
        // CSS class(es) used to render the done icon.
        checkIconClass: "fas fa-check text-success"
    };
    window.highlightJsBadge(options);
  }
})();

OM.HomeHelper = ( () => {
  return {
    activeCase
  }

  function activeCase(report) {
    return report.total_case - report.recovered_case - report.death_case
  }
})();

OM.HomeHelper = ( () => {
  return {
    activeCase
  }

  function activeCase(report) {
    return report.total_cases - report.recovered_cases - report.death_cases
  }
})();
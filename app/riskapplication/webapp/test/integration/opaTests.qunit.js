sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'riskmanagement/riskapplication/test/integration/FirstJourney',
		'riskmanagement/riskapplication/test/integration/pages/RisksList',
		'riskmanagement/riskapplication/test/integration/pages/RisksObjectPage'
    ],
    function(JourneyRunner, opaJourney, RisksList, RisksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('riskmanagement/riskapplication') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheRisksList: RisksList,
					onTheRisksObjectPage: RisksObjectPage
                }
            },
            opaJourney.run
        );
    }
);
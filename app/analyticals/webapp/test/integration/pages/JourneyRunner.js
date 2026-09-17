sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"analyticals/test/integration/pages/TicketAnalyticsList",
	"analyticals/test/integration/pages/TicketAnalyticsObjectPage"
], function (JourneyRunner, TicketAnalyticsList, TicketAnalyticsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('analyticals') + '/test/flp.html#app-preview',
        pages: {
			onTheTicketAnalyticsList: TicketAnalyticsList,
			onTheTicketAnalyticsObjectPage: TicketAnalyticsObjectPage
        },
        async: true
    });

    return runner;
});


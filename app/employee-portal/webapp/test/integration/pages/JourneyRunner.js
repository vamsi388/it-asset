sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"employeeportal/test/integration/pages/ServiceRequestsList",
	"employeeportal/test/integration/pages/ServiceRequestsObjectPage"
], function (JourneyRunner, ServiceRequestsList, ServiceRequestsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('employeeportal') + '/test/flp.html#app-preview',
        pages: {
			onTheServiceRequestsList: ServiceRequestsList,
			onTheServiceRequestsObjectPage: ServiceRequestsObjectPage
        },
        async: true
    });

    return runner;
});


sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'customer/test/integration/FirstJourney',
		'customer/test/integration/pages/PassengerList',
		'customer/test/integration/pages/PassengerObjectPage',
		'customer/test/integration/pages/BookingObjectPage'
    ],
    function(JourneyRunner, opaJourney, PassengerList, PassengerObjectPage, BookingObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('customer') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePassengerList: PassengerList,
					onThePassengerObjectPage: PassengerObjectPage,
					onTheBookingObjectPage: BookingObjectPage
                }
            },
            opaJourney.run
        );
    }
);
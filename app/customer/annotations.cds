using TravelService as service from '../../srv/travel-service';


annotate service.Passenger with @(
    UI.LineItem: [
        {
            $Type: 'UI.DataField',
            Value: FullName
        },{
            $Type: 'UI.DataField',
            Value: CountryCode.code
        },{
            $Type: 'UI.DataField',
            Value: CountryCode.descr
        },{
            $Type: 'UI.DataField',
            Value: PostalCode
        }, {
            $Type: 'UI.DataField',
            Value: Street
        },{
            $Type: 'UI.DataField',
            Value: City
        }
    ]);


//ked klikneme na konretneho passengera tu si zadefinujeme policka ktore chceme zobrazit
//nazveme to ako field group s IDckom #
annotate service.Passenger with @(
    UI.FieldGroup #GeneratedGroup1:{
        $Type: 'UI.FieldGroupType',
        Data: [
            {
                $Type: 'UI.DataField',
                Value: CustomerID
            },
             {
                $Type : 'UI.DataField',
                Value : CountryCode_code,
            },
            {
                $Type : 'UI.DataField',
                Value : PostalCode,
            },
            {
                $Type : 'UI.DataField',
                Value : City,
            },
            {
                $Type : 'UI.DataField',
                Value : Street,
            },
        ]
    },
    //tu uz v UI zadefinujeme ze to chceme zobrazit ako jeden blok nazvany label : General Information
    //a target dame nasu fieldfroup s ID ktore sme dali (#GeneratedGroup1)
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'GeneratedFacet1',
            Label: 'General Information',
            Target: '@UI.FieldGroup#GeneratedGroup1'
        },
    ]
);

//toto su policka podla ktorych vieme v prvotnom zobrazenom zozname filtrovat
annotate service.Passenger with @(
    UI.SelectionFields : [
        CountryCode_code,
        City,
        PostalCode
    ]
);

annotate service.Passenger with @(
    //Header Facet je uplne na vrchu stranky pod zvolenym id pasaziera
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Contact Details',
            ID : 'ContactDetails',
            Target : '@UI.FieldGroup#ContactDetails1',
        },],
    UI.FieldGroup #ContactDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
    
        ],
    }
);

annotate service.Passenger with @(
    UI.FieldGroup #ContactDetails1: {
        $Type: 'UI.FieldGroupType',
        Data: [
            {
                $Type: 'UI.DataField',
                Value: to_Booking.to_Customer.FullName, //funguje aj len FullName -- preco sa treba na to takto odkazovat?
                Label: 'FullName'
            },{
                $Type : 'UI.DataField',
                Value : to_Booking.to_Customer.PhoneNumber, //funguje aj PhoneNumber
            },{
                $Type : 'UI.DataField',
                Value : to_Booking.to_Customer.EMailAddress, //funguje aj EMailAddress
            }

        ]
    }
);

//namiesto ID sa nazov karty zmeni na cele meno pasaziera
annotate service.Passenger with @(
    UI.HeaderInfo : {
        TypeName: '{i18n>CustomerID}',
        TypeNamePlural : '{i18n>Customers}',
        Title:{
             $Type : 'UI.DataField',
            Value : FullName,
        }
    }
);




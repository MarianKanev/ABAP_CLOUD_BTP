@EndUserText.label: 'Booking BO Projection view'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZC_RAP_Booking_1234 as projection on ZI_RAP_Booking_1234
{
    key BookingUuid,
    TravelUUID,
    
    @Search.defaultSearchElement: true
    BookingId,
    BookingDate,
    
    @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Customer' , element: 'CustomerID'} } ]
    @Search.defaultSearchElement: true
    
    @ObjectModel.text.element: [ 'CustomerName' ]
    CustomerId,
    _Customer.LastName as CustomerName,
        @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Carrier' , element: 'AirlineID'} } ]

    
    @ObjectModel.text.element: [ 'CarrierName' ]
    CarrierId,
    _Carrier.Name as carriername,
        @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Flight' , element: 'ConnectionID'},
        additionalBinding: [{ localElement: 'CarrierId', element: 'AirlineID' },
                            { localElement: 'FlightDate', element: 'FlightDate', usage: #RESULT  },
                             { localElement: 'FlightPrice', element: 'Price' , usage: #RESULT },
                             { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT  } ] } ]
    
    ConnectionId,
    FlightDate,
    
    @Semantics.amount.currencyCode: 'CurrencyCode'
    FlightPrice,
    
        @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency' , element: 'Currency'} } ]
    CurrencyCode,
    createdBy,
    LastChangedBy,
    LocalLastChanged,
    /* Associations */
    
    _Carrier,
    _Connection,
    _Currency,
    _Customer,
    _Flight,
    _travel : redirected to parent ZC_RAP_TRAVEL_1234
}

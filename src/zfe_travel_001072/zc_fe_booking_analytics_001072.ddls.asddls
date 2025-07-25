@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for Booking Analysis'
@Search.searchable: true
define root view entity zc_fe_booking_analytics_001072
  as projection on zi_fe_booking_analytics_001072
{
  key BookingUUID,
  TravelUUID,
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.9 
  BookingID,
  BookingDate,
  @EndUserText.label: 'Booking Date (Year)'
  BookingDateYear,
  @EndUserText.label: 'Customer'
  @ObjectModel.text.element: [ 'CustomerName' ]
  CustomerID,
  CustomerName,
  @EndUserText.label: 'Airline'
  @ObjectModel.text.element: [ 'CarrierName' ]
  CarrierID,
  CarrierName,
  ConnectionID,
  FlightDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  @Aggregation.default: #SUM
  FlightPrice,
  CurrencyCode,
  @EndUserText.label: 'Agency'
  @ObjectModel.text.element: [ 'AgencyName' ]
  AgencyID,
  AgencyName,
  CreatedBy,
  LastChangedBy,
  LocalLastChangedAt,
  _Travel,
  _Carrier,
  _Customer,
  _Connection
  
}

@AbapCatalog.sqlViewName: 'ZMMK_VIEW_11'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Model View Entity - Read Only'
@Metadata.ignorePropagatedAnnotations: true
define view Z_I_TRAVEL_R_001 as select from /DMO/I_Travel_U
{
    key TravelID,
    AgencyID,
    CustomerID,
    BeginDate,
    EndDate,
    BookingFee,
    TotalPrice,
    CurrencyCode,
    Memo,
    Status,
    LastChangedAt,
    /* Associations */
    _Agency,
    _Booking,
    _Currency,
    _Customer,
    _TravelStatus
}

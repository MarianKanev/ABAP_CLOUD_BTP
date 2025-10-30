@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Travel Model View Entity - Read Only'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

define view entity ZMMK_I_TRAVEL_R_001
  as select from /DMO/I_Travel_U

{
  key TravelID,

      AgencyID,
      CustomerID,
      BeginDate,
      EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
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

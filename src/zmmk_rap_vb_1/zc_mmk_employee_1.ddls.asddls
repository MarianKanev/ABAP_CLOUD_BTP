@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZMMK_EMPLOYEE_1'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_MMK_EMPLOYEE_1
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_MMK_EMPLOYEE_1
  association [1..1] to ZR_MMK_EMPLOYEE_1 as _BaseEntity on $projection.ID = _BaseEntity.ID
{
  key ID,
  Firstname,
  Lastname,
  Age,
  Postalcode,
  Street,
  City,
  Createdbycreatedby,
  Changedby,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LocalLastChanged,
  _BaseEntity
}

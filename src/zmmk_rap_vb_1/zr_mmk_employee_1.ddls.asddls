@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZMMK_EMPLOYEE_1'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_MMK_EMPLOYEE_1
  as select from ZMMK_EMPLOYEE_1 as Employee
{
  key id as ID,
  firstname as Firstname,
  lastname as Lastname,
  age as Age,
  postalcode as Postalcode,
  street as Street,
  city as City,
  createdbycreatedby as Createdbycreatedby,
  changedby as Changedby,
  @Semantics.systemDateTime.lastChangedAt: true
  local_last_changed as LocalLastChanged
}

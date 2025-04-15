@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_DT_JD_ART_02000
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_DT_JD_ART_02000
{
  key IdArt,
  Descr,
  Descr2,
  Color,
  Piezas,
  Stock,
  Url,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt
  
}

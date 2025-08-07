@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exercício 3 - CDS Views'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_FABAP_JUL2025_EXER03_AVA
  as select from /dmo/customer as Customer
{
  key Customer.customer_id          as CustomerID,
      Customer.first_name           as FirstName,
      Customer.last_name            as LastName,

      concat_with_space(
        concat(
          concat_with_space(
            concat( Customer.street, ',')
          , Customer.city, 1 )
        , ' -')
      , Customer.country_code, 1 ) as FullAdress

}

@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Definition Demo'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_FABAP_JUL2025_DEMO01_AVA 
    as select from /dmo/carrier as Carrier
        inner join /dmo/connection as Connection on Carrier.carrier_id = Connection.carrier_id
{
  key Carrier.carrier_id         as CarrierId,
      Carrier.name               as CarrierName,
      Connection.connection_id   as ConnectionId,
      Connection.airport_from_id as AirportFromId,
      Connection.airport_to_id   as AirportToId,
      Connection.departure_time  as DepartureTime,
      Connection.arrival_time    as ArrivalTime,
      Connection.distance        as Distance,
      Connection.distance_unit   as DistanceUnit
}

CLASS zcl_fabap_jul2025_demo04_1_ava DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.

    TYPES gty_conn TYPE STANDARD TABLE OF zi_fabap_jul2025_demo01_ava WITH EMPTY KEY.

    CLASS-METHODS get_data AMDP OPTIONS CDS SESSION CLIENT DEPENDENT
      EXPORTING VALUE(et_data) TYPE gty_conn.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_DEMO04_1_AVA IMPLEMENTATION.


  METHOD get_data BY DATABASE PROCEDURE
   FOR HDB LANGUAGE SQLSCRIPT
   OPTIONS READ-ONLY
   USING zi_fabap_jul2025_demo01_ava.

    et_data = select Connection.carrierid     as CarrierId,
                     Connection.carriername   as CarrierName,
                     Connection.connectionid  as ConnectionId,
                     Connection.airportfromid as AirportFromId,
                     Connection.airporttoid   as AirportToId,
                     Connection.departuretime as DepartureTime,
                     Connection.arrivaltime   as ArrivalTime,
                     Connection.distance      as Distance,
                     Connection.distanceunit  as DistanceUnit
     from zi_fabap_jul2025_demo01_ava   as Connection;
  ENDMETHOD.
ENDCLASS.

CLASS zcl_fabap_jul2025_exer17_ava DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER17_AVA IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
**********************************************************************
* De forma a manter como backup o código original do exercício, foi comentado e resolvido abaixo
**********************************************************************
*    DATA lt_flights  TYPE TABLE OF /dmo/flight.
*    DATA lt_bookings TYPE TABLE OF /dmo/booking.
*
*    SELECT * FROM /dmo/flight INTO TABLE @lt_flights.
*
*    SELECT * FROM /dmo/booking
*      FOR ALL ENTRIES IN @lt_flights
*      WHERE carrier_id    = @lt_flights-carrier_id
*        AND connection_id = @lt_flights-connection_id
*      INTO TABLE @lt_bookings.
*
*    LOOP AT lt_flights INTO DATA(ls_flight).
*      LOOP AT lt_bookings INTO DATA(ls_booking)
*           WHERE     carrier_id    = ls_flight-carrier_id
*                 AND connection_id = ls_flight-connection_id.
*        out->write( |Voo { ls_booking-carrier_id } { ls_booking-connection_id }: { ls_booking-flight_date }| ).
*      ENDLOOP.
*    ENDLOOP.

    SELECT carrier_id, connection_id
      FROM /dmo/flight
      INTO TABLE @DATA(lt_flights).

    SELECT carrier_id, connection_id, flight_date
      FROM /dmo/booking
      FOR ALL ENTRIES IN @lt_flights
      WHERE carrier_id    = @lt_flights-carrier_id
        AND connection_id = @lt_flights-connection_id
      INTO TABLE @DATA(lt_bookings).

    SORT lt_flights BY carrier_id
                       connection_id.
    SORT lt_bookings BY carrier_id
                        connection_id.

    LOOP AT lt_flights INTO DATA(ls_flights).

      IF NOT line_exists( lt_bookings[ carrier_id    = ls_flights-carrier_id
                                       connection_id = ls_flights-connection_id ] ).
        CONTINUE.
      ENDIF.
      DATA(lv_index) = line_index( lt_bookings[ carrier_id    = ls_flights-carrier_id
                                                connection_id = ls_flights-connection_id ] ).

      LOOP AT lt_bookings FROM lv_index INTO DATA(ls_booking).
        IF ls_booking-carrier_id <> ls_flights-carrier_id OR ls_booking-connection_id <> ls_flights-connection_id.
          EXIT.
        ENDIF.
        out->write( |Voo { ls_booking-carrier_id } { ls_booking-connection_id }: { ls_booking-flight_date }| ).
      ENDLOOP.

    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

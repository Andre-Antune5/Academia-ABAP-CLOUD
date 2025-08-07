CLASS zcl_fabap_jul2025_exer13_ava DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER13_AVA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
**********************************************************************
* Todos os comentários com * foram criados por mim
* Todos os comentários com " já vinham no exercício
**********************************************************************


    " ----------------------------------------------------------------------
    " Tópico: Inline Declarations
    " Descrição: Declaração de variáveis antes do ABAP 7.40.
    " ----------------------------------------------------------------------
*    DATA lv_carrid  TYPE /dmo/carrier_id.
*    DATA lv_version TYPE string.
*
*    lv_carrid = 'AA'.
*    out->write( |Old Version - Carrier ID: { lv_carrid }| ).
*
*    TYPES: BEGIN OF ty_flight_old,
*             carrid      TYPE /dmo/carrier_id,
*             connid      TYPE /dmo/connection_id,
*             flight_date TYPE /dmo/flight_date,
*           END OF ty_flight_old.
*
*    DATA lt_flights_old TYPE STANDARD TABLE OF ty_flight_old WITH EMPTY KEY.
*    DATA ls_flight_old  TYPE ty_flight_old.
*
*    ls_flight_old-carrid      = 'LH'.
*    ls_flight_old-connid      = '0400'.
*    ls_flight_old-flight_date = '20250725'.
*    APPEND ls_flight_old TO lt_flights_old.
*
*    LOOP AT lt_flights_old INTO ls_flight_old.
*      CONCATENATE lv_version ls_flight_old-carrid ls_flight_old-connid INTO lv_version SEPARATED BY '-'.
*      out->write( lv_version ).
*    ENDLOOP.
*
*    DATA lt_flights_select_old TYPE STANDARD TABLE OF /dmo/flight.
*
*    SELECT * FROM /dmo/flight
*      INTO TABLE @lt_flights_select_old
*      UP TO 2 ROWS.
*
*    " DESCRIBE LINES lt_flights_select_old lines lv_lines. ( Old )
*    out->write( |Old Version - Flights found (SELECT): { lines( lt_flights_select_old ) }| ).

    DATA(lv_carrid) = 'AA'.
##NO_TEXT    out->write( |New Version - Carrier ID: { lv_carrid }| ).

    TYPES: BEGIN OF ty_flight_new,
            carrid      TYPE /dmo/carrier_id,
            connid      TYPE /dmo/connection_id,
            flight_date TYPE /dmo/flight_date,
           END OF ty_flight_new.

    DATA lt_flights_new TYPE STANDARD TABLE OF ty_flight_new WITH EMPTY KEY.
    lt_flights_new = VALUE #( ( carrid      = 'LH'
                                connid      = '0400'
                                flight_date = '20250725' ) ).

    LOOP AT lt_flights_new INTO DATA(ls_flight_new).
##NO_TEXT        out->write( |New Version - Flight: { ls_flight_new-carrid }-{ ls_flight_new-connid }| ).
    ENDLOOP.

##NO_TEXT    SELECT * "#EC CI_NOWHERE
                      "#EC CI_NOORDER
        FROM /dmo/flight
        INTO TABLE @DATA(lt_flights_select_new)
        UP TO 2 ROWS.
##NO_TEXT    out->write( |New Version - Flights found (SELECT): { lines( lt_flights_select_new ) }| ).

    " ----------------------------------------------------------------------
    " Tópico: Table Expressions
    " Descrição: Acesso a linhas de tabelas internas antes do ABAP 7.40.
    " ----------------------------------------------------------------------
*    DATA ls_flight_expr_old TYPE ty_flight_new.
*    DATA lv_first           TYPE string.
*    DATA lv_flight          TYPE string.
*
*    READ TABLE lt_flights_old INTO ls_flight_expr_old INDEX 1.
*
*    CONCATENATE 'Old Version - First Flight:'
*              ls_flight_expr_old-carrid
*              ls_flight_expr_old-connid
*              ls_flight_expr_old-flight_date
*                INTO lv_first SEPARATED BY ' '.
*
*    IF sy-subrc = 0.
*      out->write( lv_first ).
*    ENDIF.
*
*    DATA ls_flight_key_old TYPE ty_flight_old.
*
*    READ TABLE lt_flights_old INTO ls_flight_key_old WITH KEY carrid = 'LH'
*                                                              connid = '0400'.
*
*    IF sy-subrc = 0.
*
*      CONCATENATE 'Old Version - Flight LH-0400:'
*                ls_flight_key_old-carrid
*                ls_flight_key_old-connid
*                  INTO lv_flight SEPARATED BY '-'.
*
*      out->write( lv_flight ).
*    ENDIF.

    TRY.
            DATA(ls_flight_expr_new) = lt_flights_new[ 1 ].
##NO_TEXT            out->write( |New Version - First Flight: { ls_flight_expr_new-carrid }-{ ls_flight_expr_new-connid }| ).
        CATCH cx_sy_itab_line_not_found.
##NO_TEXT            out->write( |O primeiro voo não foi encontrado| ).
    ENDTRY.

    TRY.
            DATA(ls_flight_key_new) = lt_flights_new[ carrid = 'LH' connid = '0400' ].
##NO_TEXT            out->write( |New Version - Flight LH-0400: { ls_flight_key_new-carrid }-{ ls_flight_key_new-connid }| ).
        CATCH cx_sy_itab_line_not_found.
##NO_TEXT            out->write( |O voo LH-0400 não foi encontrado| ).
    ENDTRY.



    " ----------------------------------------------------------------------
    " Tópico: Conversion Operator CONV
    " Descrição: Conversão de tipos de dados antes do ABAP 7.40.
    " ----------------------------------------------------------------------
*    DATA lv_char_old  TYPE c LENGTH 10 VALUE '12345'.
*    DATA lv_int_old   TYPE i.
*    DATA lv_conc      TYPE string.
*    DATA lv_char_conv TYPE c LENGTH 10.
*
*    lv_int_old = lv_char_old.
*    lv_char_conv = lv_int_old.
*
*    CONCATENATE 'Old Version - Converted to INT:'
*               lv_char_conv
*                INTO lv_conc.
*
*    out->write( lv_conc ).

    DATA(lv_char_new) = '12345'.
    DATA(lv_int_new) = CONV i( lv_char_new ).
##NO_TEXT    out->write( |New Version - Converted to INT: { lv_int_new }| ).

    " ----------------------------------------------------------------------
    " Tópico: Value Operator VALUE
    " Descrição: Inicialização de estruturas e tabelas internas antes do ABAP 7.40.
    " ----------------------------------------------------------------------
*    DATA ls_connection_old TYPE /dmo/connection.
*    DATA lv_conn           TYPE string.
*
*    ls_connection_old-airport_from_id = 'FRA'.
*    ls_connection_old-airport_to_id   = 'JFK'.
*
*    CONCATENATE 'Old Version - Connection:'
*              ls_connection_old-airport_from_id
*              ls_connection_old-airport_to_id
*                INTO lv_conn SEPARATED BY '-'.
*
*    out->write( lv_conn ).
*
*    DATA lt_flights_value_old TYPE STANDARD TABLE OF ty_flight_old.
*
*    APPEND INITIAL LINE TO lt_flights_value_old ASSIGNING FIELD-SYMBOL(<fs_flight_value>).
*
*    <fs_flight_value>-carrid      = 'UA'.
*    <fs_flight_value>-connid      = '0001'.
*    <fs_flight_value>-flight_date = '20250725'.
*
*    out->write( |Old Version - Flights count (VALUE): { lines( lt_flights_value_old ) }| ).

    DATA(ls_connection_new) = VALUE /dmo/connection( airport_from_id = 'FRA'
                                                     airport_to_id   = 'JFK' ).

##NO_TEXT    out->write( |New Version - Connection: { ls_connection_new-airport_from_id }-{ ls_connection_new-airport_to_id }| ).

    DATA lt_flights_value_new TYPE SORTED TABLE OF ty_flight_new WITH NON-UNIQUE KEY carrid.
    lt_flights_value_new = VALUE #( ( carrid = 'UA' connid = '0001' flight_date = '20250725' )
                                    ( carrid = 'DL' connid = '0002' flight_date = '20250726' ) ).

##NO_TEXT    out->write( |New Version - Flights count (VALUE): { lines( lt_flights_value_new ) }| ).

    " ----------------------------------------------------------------------
    " Tópico: LOOP X FOR operator
    " Descrição: Criação de tabelas internas com loops explícitos antes do ABAP 7.50.
    " ----------------------------------------------------------------------
*    DATA lt_flights_for_old TYPE STANDARD TABLE OF ty_flight_old.
*    DATA lv_lines           TYPE i.
*    DATA lv_linn_conv       TYPE c LENGTH 100.
*
*    SELECT carrier_id, connection_id, flight_date
*      FROM /dmo/flight
*      INTO TABLE @lt_flights_for_old.
*
*    LOOP AT lt_flights_value_old INTO ls_flight_old WHERE carrid = 'UA'.
*      APPEND ls_flight_old TO lt_flights_for_old.
*    ENDLOOP.
*
*    " DESCRIBE LINES lt_flights_for_old lines lv_lines. (
*    lv_lines = lines( lt_flights_for_old ).
*    lv_linn_conv = lv_lines.
*
*    out->write( lv_linn_conv ).

    DATA(lt_flights_for_new) = FILTER #( lt_flights_value_new WHERE carrid = CONV #( 'UA' ) ).
##NO_TEXT    out->write( |New Version - Flights for UA (FOR): { lines( lt_flights_for_new ) }| ).

    " ----------------------------------------------------------------------
    " Tópico: Reduction operator REDUCE
    " Descrição: Redução de tabelas internas com loops explícitos antes do ABAP 7.50.
    " ----------------------------------------------------------------------
*    DATA lv_sum_old     TYPE i VALUE 0.
*    DATA lt_numbers_old TYPE STANDARD TABLE OF i WITH EMPTY KEY.
*    DATA lv_number_conv TYPE c LENGTH 100.
*
*    APPEND 1 TO lt_numbers_old.
*    APPEND 2 TO lt_numbers_old.
*    APPEND 3 TO lt_numbers_old.
*
*    LOOP AT lt_numbers_old INTO DATA(lv_number_old).
*      lv_sum_old += lv_number_old.
*    ENDLOOP.
*
*    lv_number_conv = lv_sum_old.
*
*    CONCATENATE 'Old Version - Sum:'
*                 lv_number_conv
*                INTO lv_number_conv SEPARATED BY ' '.
*
*    out->write( lv_number_conv ).

    TYPES ty_numbers_tt TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    DATA(lt_numbers_new) = VALUE ty_numbers_tt( ( 1 ) ( 2 ) ( 3 ) ).

    DATA(lv_sum_new) = REDUCE i( INIT total = 0
                                 FOR num IN lt_numbers_new
                                 NEXT total += num ).

 ##NO_TEXT   out->write( |New Version - Sum: { lv_sum_new }| ).

    " ----------------------------------------------------------------------
    " Tópico: Conditional operators COND and SWITCH
    " Descrição: Expressões condicionais com IF/ELSEIF/ELSE e CASE antes do ABAP 7.40.
    " ----------------------------------------------------------------------
*    DATA lv_status_old TYPE string.
*    DATA lv_code_old   TYPE i VALUE 1.
*    DATA lv_code_conv  TYPE c LENGTH 20.
*
*    IF lv_code_old = 1.
*      lv_status_old = 'Success'.
*    ELSEIF lv_code_old = 2.
*      lv_status_old = 'Warning'.
*    ELSE.
*      lv_status_old = 'Error'.
*    ENDIF.
*
*    CONCATENATE 'Old Version - Status (IF/ELSEIF/ELSE):'
*                lv_status_old
*                INTO lv_code_conv SEPARATED BY ' '.
*
*    out->write( lv_code_conv ).
*
*    DATA lv_status_case_old TYPE c LENGTH 10.
*    DATA lv_code_case_old   TYPE i VALUE 2.
*    DATA lv_code_conv2      TYPE c LENGTH 20.
*
*    CASE lv_code_case_old.
*      WHEN 1.
*        lv_status_case_old = 'Success'.
*      WHEN 2.
*        lv_status_case_old = 'Warning'.
*      WHEN OTHERS.
*        lv_status_case_old = 'Error'.
*    ENDCASE.
*
*    CONCATENATE 'Old Version - Status (CASE):'
*                lv_status_case_old
*                INTO lv_code_conv2 SEPARATED BY ' '.
*
*    out->write( lv_code_conv2 ).

    DATA(lv_code_new) = 1.
##NO_TEXT    DATA(lv_status_cond) = COND string( WHEN lv_code_new = 1 THEN 'Success'
                                        WHEN lv_code_new = 2 THEN 'Warning'
                                        ELSE 'Error' ).
##NO_TEXT    out->write( |New Version - Status (COND): { lv_status_cond }| ).

    lv_code_new = 2.
##NO_TEXT    DATA(lv_status_switch) = SWITCH string( lv_code_new WHEN 1 THEN 'Success'
                                                        WHEN 2 THEN 'Warning'
                                                        ELSE 'Error' ).
##NO_TEXT    out->write( |New Version - Status (SWITCH): { lv_status_switch }| ).

    " ----------------------------------------------------------------------
    " Tópico: Strings
    " Descrição: Manipulação de strings antes do ABAP 7.40.
    " ----------------------------------------------------------------------
*    DATA lv_var1_str_old   TYPE string       VALUE 'Hello'.
*    DATA lv_var2_str_old   TYPE string       VALUE 'World'.
*    DATA lv_result_str_old TYPE string.
*    DATA lv_sub_old_conv   TYPE c LENGTH 100.
*
*    CONSTANTS lc_str TYPE string VALUE 'Old Version - Concatenation (Strings)'.
*
*    CONCATENATE lc_str lv_var1_str_old lv_var2_str_old INTO lv_result_str_old SEPARATED BY space.
*
*    out->write( lv_result_str_old ).
*
*    DATA lv_string_sub_old TYPE string VALUE 'ABCDEFG'.
*    DATA lv_sub_old        TYPE string.
*
*    lv_sub_old = lv_string_sub_old+0(3).
*
*    CONCATENATE 'Old Version - Substring (Strings):' lv_sub_old INTO lv_sub_old_conv SEPARATED BY space.
*
*    out->write( lv_sub_old_conv ).

    DATA(lv_var1_str_new) = 'ABAP'.
    DATA(lv_var2_str_new) = '7.40'.
##NO_TEXT    out->write( |New Version - String Template (Strings): Welcome to { lv_var1_str_new } { lv_var2_str_new }!| ).

    DATA(lv_string_sub_new) = '0080003371'.
##NO_TEXT    out->write( |New Version - Embedded Expression (ALPHA) (Strings): { lv_string_sub_new ALPHA = OUT }| ).

    " ----------------------------------------------------------------------
    " Tópico: Loop at Group By
    " Descrição: Agrupamento de dados em loops de tabelas internas antes do ABAP 7.50.
    " ----------------------------------------------------------------------
*    TYPES: BEGIN OF ty_flight_group_old,
*             carrid TYPE /dmo/carrier_id,
*             connid TYPE /dmo/connection_id,
*             price  TYPE /dmo/flight_price,
*           END OF ty_flight_group_old.
*
*    DATA lt_flights_group_old TYPE STANDARD TABLE OF ty_flight_group_old WITH EMPTY KEY.
*    DATA ls_flight_group_old  TYPE ty_flight_group_old.
*
*    APPEND INITIAL LINE TO lt_flights_group_old ASSIGNING FIELD-SYMBOL(<fs_flight_group>).
*    <fs_flight_group>-carrid = 'LH'.
*    <fs_flight_group>-connid = '0400'.
*    <fs_flight_group>-price  = '100'.
*
*    APPEND INITIAL LINE TO lt_flights_group_old ASSIGNING <fs_flight_group>.
*    <fs_flight_group>-carrid = 'LH'.
*    <fs_flight_group>-connid = '0401'.
*    <fs_flight_group>-price  = '150'.
*
*    APPEND INITIAL LINE TO lt_flights_group_old ASSIGNING <fs_flight_group>.
*    <fs_flight_group>-carrid = 'UA'.
*    <fs_flight_group>-connid = '0001'.
*    <fs_flight_group>-price  = '200'.
*
*    DATA lv_current_carrid_group  TYPE /dmo/carrier_id.
*    DATA lv_total_price_group_old TYPE /dmo/flight_price.
*    DATA lv_total_price_conv      TYPE c LENGTH 100.
*
*    SORT lt_flights_group_old BY carrid.
*
*    LOOP AT lt_flights_group_old INTO ls_flight_group_old.
*      AT NEW carrid.
*        IF lv_current_carrid_group IS NOT INITIAL.
*          lv_total_price_conv = lv_total_price_group_old.
*
*          CONCATENATE 'Old Version - Carrier'
*                    lv_current_carrid_group
*                    'Total Price (Group By):'
*                    lv_total_price_conv
*                      INTO lv_total_price_conv SEPARATED BY space.
*
*          out->write( lv_total_price_conv ).
*        ENDIF.
*        lv_current_carrid_group = ls_flight_old-carrid.
*        lv_total_price_group_old = 0.
*      ENDAT.
*      lv_total_price_group_old += ls_flight_group_old-price.
*    ENDLOOP.
*    IF lv_current_carrid_group IS NOT INITIAL.
*
*      lv_total_price_conv = lv_total_price_group_old.
*
*      CONCATENATE 'Old Version - Carrier'
*                lv_current_carrid_group
*                'Total Price (Group By):'
*                lv_total_price_conv
*                  INTO lv_total_price_conv SEPARATED BY space.
*
*      out->write(
*          |Old Version - Carrier { lv_current_carrid_group } Total Price (Group By): { lv_total_price_group_old }| ).
*
*    ENDIF.

    TYPES: BEGIN OF ty_flight_group_new,
            carrid TYPE /dmo/carrier_id,
            connid TYPE /dmo/connection_id,
            price  TYPE /dmo/flight_price,
           END OF ty_flight_group_new.

    DATA lt_flights_group_new TYPE STANDARD TABLE OF ty_flight_group_new WITH EMPTY KEY.
    lt_flights_group_new = VALUE #( ( carrid = 'LH' connid = '0400' price = '100' )
                                    ( carrid = 'LH' connid = '0401' price = '150' )
                                    ( carrid = 'UA' connid = '0001' price = '200' ) ).

    LOOP AT lt_flights_group_new INTO DATA(ls_flight_group)
         GROUP BY ls_flight_group-carrid INTO DATA(ls_grouped_flights).

      DATA(lv_total_price_group_new) = REDUCE /dmo/flight_price( INIT total = 0
                                                                 FOR flight IN GROUP ls_grouped_flights
                                                                 NEXT total += flight-price ).

##NO_TEXT      out->write( |New Version - Carrier { ls_grouped_flights } Total Price (Group By): { lv_total_price_group_new }| ).

    ENDLOOP.

    " ----------------------------------------------------------------------
    " Tópico: Filter
    " Descrição: Filtragem de tabelas internas com loops explícitos antes do ABAP 7.40.
    " ----------------------------------------------------------------------
*    DATA: lt_flights_filter_old TYPE STANDARD TABLE OF ty_flight_old.
*
*    LOOP AT lt_flights_value_old INTO ls_flight_old WHERE carrid = 'UA'.
*      APPEND ls_flight_old TO lt_flights_filter_old.
*    ENDLOOP.
*
*    out->write( |Old Version - Filtered flights (Filter): { lines( lt_flights_filter_old ) }| ).

    DATA(lt_flights_filter_new) = FILTER #( lt_flights_value_new USING KEY primary_key
                                                                 WHERE carrid = CONV #( 'LH' ) ).

##NO_TEXT    out->write( |New Version - Filtered flights (LH): { lines( lt_flights_filter_new ) }| ).

  ENDMETHOD.
ENDCLASS.

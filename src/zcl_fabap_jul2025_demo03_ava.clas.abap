CLASS zcl_fabap_jul2025_demo03_ava DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_DEMO03_AVA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    SELECT * FROM zi_fabap_jul2025_demo03_ava
      INTO TABLE @DATA(lt_connect).

    out->write( lt_connect ).
  ENDMETHOD.
ENDCLASS.

CLASS zcl_fabap_jul2025_exer04_2_ava DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER04_2_AVA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Tabelas
    DATA t_data type zcl_fabap_jul2025_exer04_1_ava=>gty_connection.

* Estruturas

* Variáveis

**********************************************************************

    zcl_fabap_jul2025_exer04_1_ava=>get_data( IMPORTING e_data = t_data ).

    out->write( t_data ).

  ENDMETHOD.
ENDCLASS.

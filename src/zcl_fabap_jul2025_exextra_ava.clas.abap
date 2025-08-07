CLASS zcl_fabap_jul2025_exextra_ava DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXEXTRA_AVA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Tabelas
    DATA t_dados1 TYPE TABLE OF zi_fabap_jul2025_exer01_ava.
    DATA t_dados2 TYPE TABLE OF zi_fabap_jul2025_exer02_ava.
    DATA t_dados3 TYPE TABLE OF zi_fabap_jul2025_exer03_ava.

* Estruturas

* Variáveis
    DATA linha   TYPE string.

    FIELD-SYMBOLS <linha1> LIKE LINE OF t_dados1.
    FIELD-SYMBOLS <linha2> LIKE LINE OF t_dados2.
    FIELD-SYMBOLS <linha3> LIKE LINE OF t_dados3.

**********************************************************************

    out->write( '╔════════════════════════════════════════════════════════════════════════════════════════════════╗' ).
    out->write( '║ Exercício 1                                                                                    ║' ).

    SELECT * FROM zi_fabap_jul2025_exer01_ava
        INTO TABLE @t_dados1.

    out->write( '╠════════════╦═══════════════╦═════════════╦════════════════════════════════════════╦════════════╣' ).
    out->write( '║ Carrier ID ║ Connection ID ║ Flight Date ║ Name                                   ║ Percentage ║' ).
    out->write( '╠════════════╬═══════════════╬═════════════╬════════════════════════════════════════╬════════════╣' ).

    LOOP AT t_dados1 ASSIGNING <linha1>.
      linha = |║ { <linha1>-CarrierId WIDTH = 10 } ║ { <linha1>-ConnectionId WIDTH = 13 } ║ { <linha1>-FlightDate WIDTH = 11 } ║ { <linha1>-Name WIDTH = 38 } ║ { <linha1>-Percentage WIDTH = 10 } ║|.
      out->write( linha ).
    ENDLOOP.

    out->write( '╠════════════╩═══════════════╩═════════════╩════════════════════════════════════════╩═══╦════════╝' ).
    out->write( '║ Exercício 2                                                                           ║' ).


    SELECT * FROM zi_fabap_jul2025_exer02_ava
      INTO TABLE @t_dados2.

    out->write( '╠════════════╦══════════════════╦══════════════╦════════════════════════════════════════╣' ).
    out->write( '║ Carrier ID ║ Connection Count ║ Max Distance ║ Carrier Name                           ║' ).
    out->write( '╠════════════╬══════════════════╬══════════════╬════════════════════════════════════════╣' ).

    LOOP AT t_dados2 ASSIGNING <linha2>.
      linha = |║ { <linha2>-CarrierId WIDTH = 10 } ║ { <linha2>-ConnectionCount WIDTH = 16 } ║ { <linha2>-MaxDistance WIDTH = 12 } ║ { <linha2>-CarrierName WIDTH = 38 } ║|.
      out->write( linha ).
    ENDLOOP.

    out->write( '╠════════════╩══════════════════╩══════════════╩════════════════════════════════════════╩═════════════╗' ).
    out->write( '║ Exercício 3                                                                                         ║' ).

    SELECT * FROM zi_fabap_jul2025_exer03_ava
      INTO TABLE @t_dados3.

    out->write( '╠═════════════╦════════════╦════════════════╦═════════════════════════════════════════════════════════╣' ).
    out->write( '║ Customer ID ║ First Name ║ Last Name      ║ Full Address                                            ║' ).
    out->write( '╠═════════════╬════════════╬════════════════╬═════════════════════════════════════════════════════════╣' ).

    LOOP AT t_dados3 ASSIGNING <linha3>.
      linha = |║ { <linha3>-CustomerID WIDTH = 11 } ║ { <linha3>-FirstName WIDTH = 10 } ║ { <linha3>-LastName WIDTH = 14 } ║ { <linha3>-FullAdress WIDTH = 55 } ║|.
      out->write( linha ).
    ENDLOOP.

    out->write( '╚═════════════╩════════════╩════════════════╩═════════════════════════════════════════════════════════╝' ).

  ENDMETHOD.
ENDCLASS.

CLASS zcl_fabap_jul2025_exer03_ava DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER03_AVA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Tabelas

* Estruturas

* Variáveis
    DATA o_produto TYPE REF TO lcl_produto.

**********************************************************************

    o_produto = lcl_produto=>create_produto( i_codigo = '001'
                               i_nome = 'Produto 1'
                               i_preco = '100' ).

    out->write( '╔════════════════════════════╗' ).
    out->write( '║ Produto                    ║' ).
    out->write( '╠════════════════════════════╣' ).
    out->write( '║Código: ' && |{ o_produto->get_codigo( ) WIDTH = 21 }| && '║' ).
    out->write( '║Nome: '   && |{ o_produto->get_nome( ) WIDTH = 23 }| && '║' ).
    out->write( '║Preço: '  && |{ o_produto->get_preco( ) WIDTH = 22 }| && '║' ).
    out->write( '╚════════════════════════════╝' ).

  ENDMETHOD.
ENDCLASS.

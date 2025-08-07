CLASS zcl_fabap_jul2025_exer01_e_ava DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER01_E_AVA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Tabelas

* Estruturas

* Variáveis
    DATA o_produto          TYPE REF TO zcl_fabap_jul2025_exer01_ava.
    DATA v_quantidade_error TYPE string.
    DATA v_check            TYPE abap_bool.

**********************************************************************

    o_produto = NEW #( i_codigo = '001'
                       i_nome   = 'Produto 1'
                       i_preco  = '100' ).

    out->write( '╔════════════════════════════╗' ).
    out->write( '║ Construção do produto      ║' ).
    out->write( '╠════════════════════════════╣' ).
    out->write( '║Código: '               && |{ o_produto->get_codigo( ) WIDTH = 21 }| && '║' ).
    out->write( '║Nome: '                 && |{ o_produto->get_nome( ) WIDTH = 23 }| && '║' ).
    out->write( '║Preço: '                && |{ o_produto->get_preco( ) WIDTH = 22 }| && '║' ).
    out->write( '║Quantidade em Stock: '  && |{ o_produto->get_quantstock( ) WIDTH = 8 }| && '║' ).
    out->write( '║Valor Total do Stock: ' && |{ o_produto->calcular_valor_total_stock( ) WIDTH = 7 }| && '║' ).
    out->write( '╠════════════════════════════╣' ).
    out->write( '║ Adicionar Stock            ║' ).
    out->write( '╚════════════════════════════╝' ).
    o_produto->add_stock( 25 ).
    out->write( 'Quantidade em Stock (após adicionar): ' && o_produto->get_quantstock( ) ).
    out->write( 'Valor Total do Stock: '                 && o_produto->calcular_valor_total_stock( ) ).

* Remover Stock
    " Remover stock com erro propositado
    out->write( '╔═════════════════════════════╗' ).
    out->write( '║ Remover Stock (V1 com erro) ║' ).
    out->write( '╚═════════════════════════════╝' ).
    o_produto->remove_stock(
                    EXPORTING i_valor = 30
                    EXCEPTIONS
                        ex_quantidade_error = 1
                        OTHERS = 2 ).
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
          WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
          INTO v_quantidade_error.
      out->write( v_quantidade_error ).
    ELSE.
      out->write( 'Quantidade removida com sucesso.' ).
      out->write( 'Quantidade em Stock (após remover): ' && o_produto->get_quantstock( ) ).
    ENDIF.

    " Remover stock sem erro
    out->write( '╔═════════════════════════════╗' ).
    out->write( '║ Remover Stock (V1 sem erro) ║' ).
    out->write( '╚═════════════════════════════╝' ).
    o_produto->remove_stock(
                    EXPORTING i_valor = 10
                    EXCEPTIONS
                        ex_quantidade_error = 1
                        OTHERS = 2 ).
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
          WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
          INTO v_quantidade_error.
      out->write( v_quantidade_error ).
    ELSE.
      out->write( 'Quantidade removida com sucesso.' ).
      out->write( 'Quantidade em Stock (após remover): ' && o_produto->get_quantstock( ) ).
    ENDIF.

* Remover Stock V2
    " Remover Stock V2 com erro propositado
    out->write( '╔═════════════════════════════╗' ).
    out->write( '║ Remover Stock (V2 com erro) ║' ).
    out->write( '╚═════════════════════════════╝' ).
    v_check = o_produto->remove_stock_v2( 30 ).

    IF v_check = abap_true.
      out->write( 'Quantidade removida com sucesso.' ).
      out->write( 'Quantidade em Stock (após remover): ' && o_produto->get_quantstock( ) ).
    ELSE.
      out->write( 'Quantidade a remover excede a quantidade em stock.' ).
    ENDIF.

    " Remover Stock V2 sem erro
    out->write( '╔═════════════════════════════╗' ).
    out->write( '║ Remover Stock (V2 sem erro) ║' ).
    out->write( '╚═════════════════════════════╝' ).
    v_check = o_produto->remove_stock_v2( 10 ).

    IF v_check = abap_true.
      out->write( 'Quantidade removida com sucesso.' ).
      out->write( 'Quantidade em Stock (após remover): ' && o_produto->get_quantstock( ) ).
    ELSE.
      out->write( 'Quantidade a remover excede a quantidade em stock.' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.

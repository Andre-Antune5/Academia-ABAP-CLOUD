*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

* Classes Locais
** Classe Produto
CLASS lcl_produto DEFINITION
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        i_codigo TYPE string
        i_nome   TYPE string
        i_preco  TYPE decfloat16.

    CLASS-METHODS create_produto
      IMPORTING
        i_codigo TYPE string
        i_nome   TYPE string
        i_preco  TYPE decfloat16
      RETURNING VALUE(ro_produto) TYPE REF TO lcl_produto.

    METHODS add_stock
      IMPORTING i_valor TYPE i.

    METHODS remove_stock
      IMPORTING  i_valor TYPE i
      RETURNING VALUE(r_check) TYPE abap_bool.


    METHODS calcular_valor_total_stock
      RETURNING VALUE(r_total) TYPE decfloat16.

    METHODS get_codigo RETURNING VALUE(r_codigo) TYPE string.
    METHODS get_nome RETURNING VALUE(r_nome) TYPE string.
    METHODS get_preco RETURNING VALUE(r_preco) TYPE decfloat16.
    METHODS get_quantstock RETURNING VALUE(r_quantstock) TYPE decfloat16.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA gv_codigo     TYPE string.
    DATA gv_nome       TYPE string.
    DATA gv_preco      TYPE decfloat16.
    DATA gv_quantstock TYPE i.

ENDCLASS.



CLASS lcl_produto IMPLEMENTATION.

  METHOD constructor.

    gv_codigo = i_codigo.
    gv_nome = i_nome.
    gv_preco = i_preco.

  ENDMETHOD.

  METHOD create_produto.

    ro_produto = NEW #( i_codigo = i_codigo
                        i_nome = i_nome
                        i_preco = i_preco ).

  ENDMETHOD.

  METHOD add_stock.

    gv_quantstock += i_valor.

  ENDMETHOD.

  METHOD remove_stock.

    IF i_valor <= gv_quantstock.
      gv_quantstock -= i_valor.
      r_check = abap_true.
    ELSE.
      r_check = abap_false.
    ENDIF.

  ENDMETHOD.

  METHOD calcular_valor_total_stock.

    r_total = gv_preco * gv_quantstock.

  ENDMETHOD.

  METHOD get_codigo.

    r_codigo = gv_codigo.

  ENDMETHOD.

  METHOD get_nome.

    r_nome = gv_nome.

  ENDMETHOD.

  METHOD get_preco.

    r_preco = gv_preco.

  ENDMETHOD.

  METHOD get_quantstock.

    r_quantstock = gv_quantstock.

  ENDMETHOD.

ENDCLASS.

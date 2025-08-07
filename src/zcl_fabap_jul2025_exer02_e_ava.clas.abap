CLASS zcl_fabap_jul2025_exer02_e_ava DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02_E_AVA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Tabelas
    DATA t_funcionarios  TYPE TABLE OF REF TO zcl_fabap_jul2025_exer02_1_ava.

* Estruturas

* Variáveis
    DATA o_funcionario   TYPE REF TO zcl_fabap_jul2025_exer02_1_ava.
    DATA o_func_integral TYPE REF TO zcl_fabap_jul2025_exer02_2_ava.
    DATA o_func_horista  TYPE REF TO zcl_fabap_jul2025_exer02_3_ava.

**********************************************************************

    o_func_integral = NEW #( i_nome = 'Abreu'
                             i_id = '001'
                             i_salario_base = '1500'
                             i_bonus = '250' ).
    APPEND o_func_integral TO t_funcionarios.

    o_func_horista = NEW #( i_nome = 'Filipa'
                             i_id = '002'
                             i_salario_base = '10'
                             i_horas = '176' ).
    APPEND o_func_horista TO t_funcionarios.

    out->write( '╔═════════════════════╗' ).
    out->write( '║ Funcionários        ║' ).
    LOOP AT t_funcionarios INTO o_funcionario.
      out->write( '╠═════════════════════╣' ).
      out->write( o_funcionario->exibir_dados( ) ).
      out->write( '║ Salário Final: ' && |{ o_funcionario->calcular_salario( ) WIDTH = 6 }| && '║' ).
    ENDLOOP.
    out->write( '╚═════════════════════╝' ).

  ENDMETHOD.
ENDCLASS.

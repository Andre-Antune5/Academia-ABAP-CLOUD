CLASS zcl_fabap_jul2025_exer02_1_ava DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        i_nome         TYPE string
        i_id           TYPE string
        i_salario_base TYPE decfloat16.

    METHODS calcular_salario
      RETURNING VALUE(r_salario) TYPE decfloat16.

    METHODS exibir_dados
      RETURNING VALUE(r_dados) TYPE string.

  PROTECTED SECTION.

    DATA gv_nome         TYPE string.
    DATA gv_id           TYPE string.
    DATA gv_salario_base TYPE decfloat16.

  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02_1_AVA IMPLEMENTATION.


  METHOD calcular_salario.

    r_salario = gv_salario_base.

  ENDMETHOD.


  METHOD constructor.

    gv_nome = i_nome.
    gv_id = i_id.
    gv_salario_base = i_salario_base.

  ENDMETHOD.


  METHOD exibir_dados.

    r_dados = '║ Nome: ' && |{ gv_nome WIDTH = 15 }| && '║' && cl_abap_char_utilities=>newline &&
              '║ ID: ' && |{ gv_id WIDTH = 17 }| && '║' && cl_abap_char_utilities=>newline &&
              '║ Salário: ' && |{ gv_salario_base WIDTH = 12 }| && '║'.

  ENDMETHOD.
ENDCLASS.

CLASS zcl_hello_world_mmk_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HELLO_WORLD_MMK_1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    out->write( |Hello World!   ({ cl_abap_context_info=>get_user_alias( ) })| ).
    out->write( |System Date -  ({ cl_abap_context_info=>get_system_date( ) })| ).
    TRY.
        out->write( |System URL -   ({ cl_abap_context_info=>get_system_url( ) })|  ).
      CATCH cx_abap_context_info_error.
        "handle exception
    ENDTRY.


"       SELECT * FROM snwd INTO TABLE @DATA(it_snwd) UP TO 10 ROWS.

  ENDMETHOD.
ENDCLASS.

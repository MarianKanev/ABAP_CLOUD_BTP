CLASS zcl_mmk_global_01 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA carrier_id    TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

    CLASS-DATA conn_counter TYPE i.

    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_mmk_global_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*  DATA connection_1 TYPE REF TO zcl_mmk_global_01.
*  DATA connection_2 TYPE REF TO zcl_mmk_global_01.

    DATA connection  TYPE REF TO zcl_mmk_global_01.
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA connections TYPE TABLE OF REF TO zcl_mmk_global_01.

    " First Instance
    " ---------------------------------------------------------------------

    connection = NEW #( ).

    connection->carrier_id    = 'LH'.
    connection->connection_id = '0400'.

    APPEND connection TO connections.

    " Second Instance
    " ---------------------------------------------------------------------
    connection = NEW #( ).

    connection->carrier_id    = 'AA'.
    connection->connection_id = '0017'.

    APPEND connection TO connections.

    " Third Instance
    " ---------------------------------------------------------------------
    connection = NEW #( ).

    connection->carrier_id    = 'SQ'.
    connection->connection_id = '0001'.

    APPEND connection TO connections.
  ENDMETHOD.
ENDCLASS.

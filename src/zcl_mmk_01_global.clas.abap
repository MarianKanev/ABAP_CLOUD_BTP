CLASS zcl_mmk_01_global DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mmk_01_global IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA: connection TYPE REF TO lcl_connection.

   connection->carrier_id = 'LH'.
   connection->connection_id = '0400'.

  ENDMETHOD.
ENDCLASS.

CLASS zcl_mmk_rap_eml_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_MMK_RAP_EML_1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    "STEP 1 - READ
*    READ ENTITIES OF zi_rap_travel_1234
*    ENTITY Travel
*    WITH VALUE #( ( TravelUUID = '08C70F00131F0D4B17000B02CFCF0ECB ) )
*    RESULT data(travels).
*    out->write( travels ).

*    "STEP 2 - READ with FIELDS
*    READ ENTITIES OF zi_rap_travel_1234
*    ENTITY Travel
*    FIELDS ( AgencyID CustomerID )
*    WITH VALUE #( ( TravelUUID = '08C70F00131F0D4B17000B02CFCF0ECB' ) )
*    RESULT data(travels).
*
*    out->write( travels ).

*    "STEP 3 - READ with ALL FIELDS
*    READ ENTITIES OF zi_rap_travel_1234
*    ENTITY Travel
*    ALL FIELDS WITH VALUE #( ( TravelUUID = '08C70F00131F0D4B17000B02CFCF0ECB' ) )
*    RESULT data(travels).


*    "STEP 4 - READ by Associations
*    READ ENTITIES OF zi_rap_travel_1234
*    ENTITY Travel BY \_Booking
*    ALL FIELDS WITH VALUE #( ( TravelUUID = '08C70F00131F0D4B17000B02CFCF0ECB' ) )
*    RESULT data(travels).

    "STEP 5 - Unsuccessful READ
*    READ ENTITIES OF zi_rap_travel_1234
*    ENTITY Travel
*    ALL FIELDS WITH VALUE #( ( TravelUUID = '111111111111111111111111111111111111' ) )
*    RESULT DATA(travels)
*    FAILED DATA(failed)
*    REPORTED DATA(reported).
*
*    out->write( travels ).
*    out->write( failed ).
*    out->write( reported ).
*


**    "STEP 6 - MODIFY Update
*
*    MODIFY ENTITIES OF zi_rap_travel_1234
*    ENTITY travel
*    UPDATE
*    SET FIELDS WITH VALUE
*    #( ( TravelUUID = '08C70F00131F0D4B17000B02CFCF0ECB' Description = 'I like RAP@openSAP' ) )
*    FAILED DATA(failed)
*    REPORTED DATA(reported).
*
*    out->write( 'Update done.' ).
*
*    "STEP 6 - Commit entities
*
*    COMMIT ENTITIES
*        RESPONSE OF zi_rap_travel_1234
*        FAILED DATA(failed_commit)
*        REPORTED DATA(reported_commit).
*


*    "STEP 7 - MODIFY Create

        MODIFY ENTITIES OF ZI_RAP_Travel_1
          ENTITY travel
            CREATE
              SET FIELDS WITH VALUE
                #( ( %cid        = 'MyContentID_1'
                     AgencyID    = '70012'
                     CustomerID  = '14'
                     BeginDate   = cl_abap_context_info=>get_system_date( )
                     EndDate     = cl_abap_context_info=>get_system_date( ) + 10
                     Description = 'I like RAP@openSAP' ) )

         MAPPED DATA(mapped)
         FAILED DATA(failed)
         REPORTED DATA(reported).

        out->write( mapped-travel ).

        COMMIT ENTITIES
          RESPONSE OF ZI_RAP_Travel_1
          FAILED     DATA(failed_commit)
          REPORTED   DATA(reported_commit).

        out->write( 'Create done' ).


  ENDMETHOD.
ENDCLASS.

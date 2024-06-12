CLASS zcl_mmk_abapcloud_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mmk_abapcloud_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    SELECT FROM I_CountryText FIELDS Country, CountryName, CountryShortName, Language
    WHERE Language = @sy-langu ORDER BY CountryName
    INTO TABLE @DATA(lt_countries).

    out->write( lt_countries ).

    SELECT * FROM I_CurrencyText WHERE Language = @sy-langu INTO TABLE @DATA(lt_currencies).
    out->write( lt_currencies ). " comment



  ENDMETHOD.

ENDCLASS.

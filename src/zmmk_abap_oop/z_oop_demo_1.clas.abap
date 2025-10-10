
" Declaration part
CLASS z_oop_demo_1 DEFINITION
  PUBLIC                       " Makes the class a global class in the class library.
  FINAL                        " Means that no subclasses can be derived from this class.
  CREATE PUBLIC.               " This class can be instantiated anywhere it is visible.

  " Here go the declarations for all components and visibility sections.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    DATA out TYPE REF TO if_oo_adt_classrun_out.
ENDCLASS.


CLASS z_oop_demo_1 IMPLEMENTATION.
    METHOD if_oo_adt_classrun~main.
    " Implementation part of the interface method MAIN
    me->out = out.
    out->write( 'Hello, World! This is my first ABAP Object Oriented Program.' ).
  ENDMETHOD.
ENDCLASS.

CLASS zcl_jd_art_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_jd_art_02 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " Deficion de tablas internas Locales.
    DATA: lti_art TYPE STANDARD TABLE OF zdt_jd_art_02.

*----------------------------------------------------------------*


    lti_art = VALUE #(
                     ( client = sy-mandt
                       id_art = '0001'
                       descr  = 'Mini colores'
                       descr2 = 'Un mini estuche con mini colores'
                       color  = 'Varios'
                       piezas = 12
                       stock  = 10
                       url    = 'https://lalibreteria.mx/cdn/shop/products/la-libreteria-mini-colores-estuche-01_600x.jpg?v=1676577703' )

                     ( client = sy-mandt
                       id_art = '0002'
                       descr  = 'Monthy Planner'
                       descr2 = 'Un mini estuche con mini colores'
                       color  = 'Negro'
                       piezas = 1
                       stock  = 100
                       url    = 'https://lalibreteria.mx/cdn/shop/products/la-libreteria-Libreta-MonthyPlanner-3_204e518f-b0a5-4ed1-a5c3-676dd8e98a6f_600x.jpg?v=1588283579' )

                      ( client = sy-mandt
                       id_art = '0003'
                       descr  = 'Muji Hexagonal'
                       descr2 = 'Water-Based Twin Pen'
                       color  = 'Varios'
                       piezas = 5
                       stock  = 20
                       url    = 'https://lalibreteria.mx/cdn/shop/products/la-libreteria-Muji-Marcatexto-1_600x.jpg?v=1638637910' )

                      ( client = sy-mandt
                       id_art = '0004'
                       descr  = 'Lapiz'
                       descr2 = 'Lapiz Social Hb'
                       color  = 'Varios'
                       piezas = 1
                       stock  = 1
                       url    = 'https://lalibreteria.mx/cdn/shop/products/la-libreteria-social-hb-cafe-claro_600x.jpg?v=1617141325' )

                     ).

    INSERT zdt_jd_art_02 FROM TABLE @lti_art.
    IF sy-subrc = 0.
      out->write( 'Insert successful' ).
    ELSE.
      out->write( 'Insert wrong' ).
    ENDIF.


  ENDMETHOD.

ENDCLASS.

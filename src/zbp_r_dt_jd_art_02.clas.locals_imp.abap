CLASS lhc_zr_dt_jd_art_02000 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR ZrDtJdArt02000
        RESULT result,
      stock_validation FOR VALIDATE ON SAVE
        IMPORTING keys FOR ZrDtJdArt02000~stock_validation.
ENDCLASS.

CLASS lhc_zr_dt_jd_art_02000 IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD stock_validation.

    DATA: failed_record   LIKE LINE OF failed-zrdtjdart02000,
          reported_record LIKE LINE OF reported-zrdtjdart02000.

*--------------------------------------------------------------*

    READ ENTITIES OF zr_dt_jd_art_02000 IN LOCAL MODE
    ENTITY ZrDtJdArt02000
    FIELDS  ( Stock )
    WITH CORRESPONDING #( Keys )
    RESULT DATA(it_art).

    LOOP AT it_art ASSIGNING FIELD-SYMBOL(<lfs_art>).

      IF <lfs_art>-Stock < 0 OR <lfs_art>-Stock IS INITIAL.

        failed_record-%tky = <lfs_art>-%tky.
        APPEND failed_record TO failed-zrdtjdart02000.

        reported_record-%tky = <lfs_art>-%tky.
        reported_record-%msg =
            new_message(
              id       = 'ZCL_MSJ_JD_ART_01'
              number   = '001'
              severity = if_abap_behv_message=>severity-error
              v1       = <lfs_art>-Stock
            ).

         APPEND reported_record to reported-zrdtjdart02000.


      ENDIF.

    ENDLOOP.


  ENDMETHOD.

ENDCLASS.

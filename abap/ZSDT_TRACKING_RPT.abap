REPORT zsdt_tracking_rpt.

TABLES: zsdt_sales, zsdt_delivery.

TYPES: BEGIN OF ty_report,
         sales_order   TYPE char10,
         item_no       TYPE numc6,
         customer_id   TYPE char10,
         customer_name TYPE char40,
         material_id   TYPE char18,
         material_desc TYPE char40,
         order_date    TYPE dats,
         req_qty       TYPE p LENGTH 7 DECIMALS 3,
         net_value     TYPE p LENGTH 8 DECIMALS 2,
         delivery_no   TYPE char10,
         delivery_date TYPE dats,
         deliv_qty     TYPE p LENGTH 7 DECIMALS 3,
         deliv_status  TYPE char20,
         shipment_no   TYPE char10,
         ship_date     TYPE dats,
         carrier       TYPE char30,
         ship_status   TYPE char20,
         final_status  TYPE char20,
       END OF ty_report.

DATA: gt_report TYPE STANDARD TABLE OF ty_report,
      gs_report TYPE ty_report.

SELECT-OPTIONS: s_order FOR zsdt_sales-sales_order,
                s_cust  FOR zsdt_sales-customer_id,
                s_date  FOR zsdt_sales-order_date.

PARAMETERS: p_status TYPE char20 DEFAULT 'ALL'.

START-OF-SELECTION.
  PERFORM get_data.
  PERFORM calculate_status.
  PERFORM display_report.

FORM get_data.
  CLEAR gt_report.

  SELECT a~sales_order,
         a~item_no,
         a~customer_id,
         c~customer_name,
         a~material_id,
         m~material_desc,
         a~order_date,
         a~req_qty,
         a~net_value,
         d~delivery_no,
         d~delivery_date,
         d~deliv_qty,
         d~status,
         sh~shipment_no,
         sh~ship_date,
         sh~carrier,
         sh~status
    FROM zsdt_sales AS a
    LEFT OUTER JOIN zsdt_customer AS c
      ON c~customer_id = a~customer_id
    LEFT OUTER JOIN zsdt_material AS m
      ON m~material_id = a~material_id
    LEFT OUTER JOIN zsdt_delivery AS d
      ON d~sales_order = a~sales_order
    LEFT OUTER JOIN zsdt_shipment AS sh
      ON sh~delivery_no = d~delivery_no
    INTO CORRESPONDING FIELDS OF TABLE @gt_report
    WHERE a~sales_order IN @s_order
      AND a~customer_id IN @s_cust
      AND a~order_date IN @s_date.
ENDFORM.

FORM calculate_status.
  LOOP AT gt_report ASSIGNING FIELD-SYMBOL(<ls_report>).
    IF <ls_report>-shipment_no IS INITIAL.
      IF <ls_report>-delivery_no IS INITIAL.
        <ls_report>-final_status = 'ORDERED'.
      ELSEIF <ls_report>-deliv_status IS INITIAL.
        <ls_report>-final_status = 'DELIVERY CREATED'.
      ELSE.
        <ls_report>-final_status = <ls_report>-deliv_status.
      ENDIF.
    ELSEIF <ls_report>-ship_status = 'DELIVERED'.
      <ls_report>-final_status = 'DELIVERED'.
    ELSE.
      <ls_report>-final_status = <ls_report>-ship_status.
    ENDIF.
  ENDLOOP.

  IF p_status <> 'ALL'.
    DELETE gt_report WHERE final_status <> p_status.
  ENDIF.
ENDFORM.

FORM display_report.
  IF gt_report IS INITIAL.
    MESSAGE 'No tracking records found for the selection.' TYPE 'I'.
    RETURN.
  ENDIF.

  TRY.
      DATA(lo_alv) = cl_salv_table=>factory( r_container = cl_gui_container=>default_screen
                                              t_table      = gt_report ).
      lo_alv->get_functions( )->set_all( abap_true ).
      lo_alv->get_columns( )->set_optimize( abap_true ).
      lo_alv->get_display_settings( )->set_striped_pattern( abap_true ).
      lo_alv->display( ).
    CATCH cx_salv_msg INTO DATA(lx_salv).
      MESSAGE lx_salv->get_text( ) TYPE 'E'.
  ENDTRY.
ENDFORM.

" Portfolio note:
" This report demonstrates Open SQL, joins, selection screens,
" internal tables, modularization and SALV reporting.
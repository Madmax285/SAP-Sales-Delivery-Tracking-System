REPORT zsdt_sample_data.

" Development/demo data loader.
" Execute only in a sandbox/development system.

DATA: ls_customer TYPE zsdt_customer,
      ls_material TYPE zsdt_material,
      ls_sales    TYPE zsdt_sales,
      ls_delivery TYPE zsdt_delivery,
      ls_shipment TYPE zsdt_shipment.

ls_customer = VALUE #( customer_id = 'C10001'
                       customer_name = 'Acme Industries'
                       city = 'Hyderabad'
                       country = 'IN' ).
INSERT zsdt_customer FROM ls_customer.

ls_customer = VALUE #( customer_id = 'C10002'
                       customer_name = 'Global Retail'
                       city = 'Bengaluru'
                       country = 'IN' ).
INSERT zsdt_customer FROM ls_customer.

ls_material = VALUE #( material_id = 'MAT-1001'
                       material_desc = 'Industrial Pump'
                       unit_price = '25000.00' ).
INSERT zsdt_material FROM ls_material.

ls_material = VALUE #( material_id = 'MAT-1002'
                       material_desc = 'Control Valve'
                       unit_price = '12000.00' ).
INSERT zsdt_material FROM ls_material.

ls_sales = VALUE #( sales_order = '5000000001'
                    item_no = '000010'
                    customer_id = 'C10001'
                    material_id = 'MAT-1001'
                    order_date = sy-datum - 5
                    req_qty = '4'
                    net_value = '100000.00' ).
INSERT zsdt_sales FROM ls_sales.

ls_sales = VALUE #( sales_order = '5000000002'
                    item_no = '000010'
                    customer_id = 'C10002'
                    material_id = 'MAT-1002'
                    order_date = sy-datum - 2
                    req_qty = '10'
                    net_value = '120000.00' ).
INSERT zsdt_sales FROM ls_sales.

ls_delivery = VALUE #( delivery_no = '8000000001'
                       sales_order = '5000000001'
                       delivery_date = sy-datum - 3
                       deliv_qty = '4'
                       status = 'DELIVERED' ).
INSERT zsdt_delivery FROM ls_delivery.

ls_delivery = VALUE #( delivery_no = '8000000002'
                       sales_order = '5000000002'
                       delivery_date = sy-datum - 1
                       deliv_qty = '10'
                       status = 'IN TRANSIT' ).
INSERT zsdt_delivery FROM ls_delivery.

ls_shipment = VALUE #( shipment_no = '9000000001'
                       delivery_no = '8000000001'
                       ship_date = sy-datum - 3
                       carrier = 'BlueDart Logistics'
                       status = 'DELIVERED' ).
INSERT zsdt_shipment FROM ls_shipment.

ls_shipment = VALUE #( shipment_no = '9000000002'
                       delivery_no = '8000000002'
                       ship_date = sy-datum
                       carrier = 'DHL Logistics'
                       status = 'IN TRANSIT' ).
INSERT zsdt_shipment FROM ls_shipment.

COMMIT WORK.
MESSAGE 'Sample tracking data loaded.' TYPE 'S'.
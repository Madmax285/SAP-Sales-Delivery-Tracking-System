# Data Model

## 1. ZSDT_CUSTOMER

| Field | Key | Description |
|---|---|---|
| MANDT | Yes | Client |
| CUSTOMER_ID | Yes | Customer number |
| CUSTOMER_NAME | No | Customer name |
| CITY | No | City |
| COUNTRY | No | Country |

## 2. ZSDT_MATERIAL

| Field | Key | Description |
|---|---|---|
| MANDT | Yes | Client |
| MATERIAL_ID | Yes | Material number |
| MATERIAL_DESC | No | Material description |
| UNIT_PRICE | No | Unit price |

## 3. ZSDT_SALES

| Field | Key | Description |
|---|---|---|
| MANDT | Yes | Client |
| SALES_ORDER | Yes | Sales order number |
| ITEM_NO | Yes | Item number |
| CUSTOMER_ID | No | Customer reference |
| MATERIAL_ID | No | Material reference |
| ORDER_DATE | No | Order date |
| REQ_QTY | No | Requested quantity |
| NET_VALUE | No | Net order value |

## 4. ZSDT_DELIVERY

| Field | Key | Description |
|---|---|---|
| MANDT | Yes | Client |
| DELIVERY_NO | Yes | Delivery number |
| SALES_ORDER | No | Related sales order |
| DELIVERY_DATE | No | Delivery date |
| DELIV_QTY | No | Delivered quantity |
| STATUS | No | Delivery status |

## 5. ZSDT_SHIPMENT

| Field | Key | Description |
|---|---|---|
| MANDT | Yes | Client |
| SHIPMENT_NO | Yes | Shipment number |
| DELIVERY_NO | No | Related delivery |
| SHIP_DATE | No | Shipment date |
| CARRIER | No | Carrier name |
| STATUS | No | Shipment status |

## Tracking Logic

The report joins sales, delivery, shipment, customer, and material information using the custom keys. The final status is derived from the latest available logistics stage:

1. No delivery -> `ORDERED`
2. Delivery exists but shipment is not complete -> delivery status
3. Shipment exists -> shipment status
4. Shipment status `DELIVERED` -> `DELIVERED`

The design intentionally keeps the model simple enough for a beginner/intermediate ABAP portfolio project while demonstrating relational data modelling.
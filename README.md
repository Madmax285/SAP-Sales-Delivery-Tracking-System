# SAP Sales & Delivery Tracking System

A portfolio-ready SAP ABAP project that demonstrates an end-to-end sales order, delivery, shipment, and status tracking workflow.

## Business Problem

Sales teams need one place to track an order from creation through delivery and shipment. This project models that workflow using custom SAP tables, ABAP reports, validation logic, and ALV reporting.

## Workflow

`Sales Order -> Delivery -> Shipment -> Delivered`

The system supports:
- Sales order creation and tracking
- Customer and material references
- Delivery status tracking
- Shipment status tracking
- Quantity and delivery-date validation
- Order-status calculation
- ALV-style reporting
- Exception/status reporting

## SAP / ABAP Concepts Demonstrated

- ABAP reports
- Internal tables and work areas
- Open SQL
- Custom transparent tables (`Z*` objects)
- Selection screens
- Modularization with FORM routines
- CASE/IF validation
- Date handling
- Aggregation and status calculation
- ALV reporting concepts
- Message handling
- DDIC-oriented data modelling

## Proposed Custom Objects

| Object | Purpose |
|---|---|
| `ZSDT_CUSTOMER` | Customer master data |
| `ZSDT_MATERIAL` | Material master data |
| `ZSDT_SALES` | Sales order header/item data |
| `ZSDT_DELIVERY` | Delivery information |
| `ZSDT_SHIPMENT` | Shipment information |
| `ZSDT_TRACKING` | Derived tracking/status data |
| `ZSDT_TRACKING_RPT` | Main tracking report |

## Repository Structure

```text
SAP-Sales-Delivery-Tracking-System/
├── README.md
├── docs/
│   ├── DATA_MODEL.md
│   └── TEST_CASES.md
└── abap/
    ├── ZSDT_TRACKING_RPT.abap
    ├── ZSDT_TABLE_DEFINITIONS.txt
    └── ZSDT_SAMPLE_DATA.abap
```

## How to Implement in SAP

1. Create the custom DDIC tables using the definitions in `abap/ZSDT_TABLE_DEFINITIONS.txt`.
2. Activate the tables.
3. Load the sample records from `abap/ZSDT_SAMPLE_DATA.abap` or enter equivalent data in your SAP system.
4. Create executable report `ZSDT_TRACKING_RPT` using `abap/ZSDT_TRACKING_RPT.abap`.
5. Activate and execute the report.
6. Use the selection screen to filter by sales order, customer, delivery status, or date.

> Note: This is a training/portfolio implementation using custom Z tables. It does not claim to replace standard SAP SD transactions such as VA01, VL01N, or VL03N.

## Resume Description

**SAP ABAP – Sales & Delivery Tracking System:** Developed a custom SAP ABAP solution to track sales orders through delivery and shipment stages using custom DDIC tables, Open SQL, validation logic, modularized FORM routines, and ALV-oriented reporting.

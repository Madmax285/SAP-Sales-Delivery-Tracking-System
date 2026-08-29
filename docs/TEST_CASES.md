# Test Cases

| ID | Scenario | Expected Result |
|---|---|---|
| TC01 | Execute report with no filters | All available tracking records are displayed |
| TC02 | Filter by sales order | Only matching order/item records are displayed |
| TC03 | Filter by customer | Only matching customer orders are displayed |
| TC04 | Order has no delivery | Final status = `ORDERED` |
| TC05 | Delivery exists without shipment | Final status follows delivery stage |
| TC06 | Shipment exists with `IN TRANSIT` | Final status = `IN TRANSIT` |
| TC07 | Shipment exists with `DELIVERED` | Final status = `DELIVERED` |
| TC08 | No records match filters | Informational message is displayed |
| TC09 | Filter by final status | Only selected status records are displayed |

## Demo Flow

1. Create/activate the five DDIC tables.
2. Run the sample-data loader in a development system.
3. Execute `ZSDT_TRACKING_RPT`.
4. Leave filters empty and verify the complete order-to-delivery view.
5. Enter a sales order in the selection screen.
6. Change `P_STATUS` from `ALL` to `DELIVERED` or `IN TRANSIT` and verify filtering.

## Portfolio Evidence to Capture

- SE11 table definitions
- Report selection screen
- ALV output with sample records
- One filtered result
- GitHub repository structure

These screenshots can be added to the README later as project evidence.
# IvoryHaya – Application Code

This folder contains the source code of the **IvoryHaya Online Abaya Store** web application.

## Technology Stack

- ASP.NET Web Forms
- C#
- .NET Framework
- HTML
- CSS
- JavaScript
- SQL Server

## Application Pages

### Authentication

- `Login.aspx` – User login
- `Register.aspx` – New user registration

### Customer Pages

- `Products.aspx` – Browse and search products
- `Cart.aspx` – Manage shopping cart
- `Orders.aspx` – View customer orders
- `Recommendation.aspx` – Product recommendations

### Admin Pages

- `Dashboard.aspx` – Admin dashboard
- `ManageUsers.aspx` – Manage users
- `ManageProducts.aspx` – Manage products
- `ManageOrders.aspx` – Manage orders
- `CustomerSegmentation.aspx` – Customer segmentation

### Salesperson / Inventory Pages

- `Inventory.aspx` – Inventory management
- `DemandForecast.aspx` – Demand forecasting

## Important Files

### `Web.config`

Contains application configuration and the SQL Server database connection string.

### `.aspx`

ASP.NET Web Forms pages that define the user interface.

### `.aspx.cs`

C# code-behind files that contain application logic and event handling.

### `.designer.cs`

Automatically generated files used by ASP.NET Web Forms for server-side controls.

### `.csproj`

Contains project configuration and references.

## Application Flow

```text
User
  │
  ▼
Login / Registration
  │
  ▼
Role Verification
  │
  ├── Admin
  │     ├── Manage Users
  │     ├── Manage Products
  │     ├── Manage Orders
  │     └── Customer Segmentation
  │
  ├── Salesperson
  │     ├── Inventory
  │     └── Demand Forecast
  │
  └── Customer
        ├── Browse Products
        ├── Search Products
        ├── Add to Cart
        ├── Place Order
        └── View Orders

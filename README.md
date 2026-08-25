# IADProject – IvoryHaya

## Internet Application Development Project

**IvoryHaya** is a web-based e-commerce application developed as a semester project for the **Internet Application Development (IAD)** course.

The application is designed for an online **Abaya store**, allowing customers to browse products, add items to a cart, place orders, and view their orders. The system also provides administrative and salesperson functionality for managing products, users, orders, inventory, and sales-related information.

## Technologies Used

- ASP.NET Web Forms
- C#
- .NET Framework
- SQL Server
- HTML
- CSS
- JavaScript
- Bootstrap
- Visual Studio

## User Roles

The system supports three main user roles:

### Admin
- Manage users
- Manage products
- Manage orders
- Manage product inventory
- View customer segmentation
- Manage overall store operations

### Salesperson
- View and track inventory
- Monitor stock levels
- Update inventory information
- View inventory statistics
- Notify the administrator regarding inventory

### Customer
- Register and log in
- Browse products
- Search for products
- View product details
- Add products to cart
- Place orders
- Select payment method
- View previous orders

## Main Features

- User registration and login
- Role-based access
- Product management
- Product search
- Shopping cart
- Order management
- Inventory management
- Customer segmentation
- Demand forecasting
- Product recommendations
- Payment method selection
- Database-driven web application
- Input validation
- Secure database connectivity

## Project Structure

```text
IADProject/
│
├── Database/
│   ├── IvoryHaya.sql
│   └── README.md
│
├── IADProject/
│   ├── Login.aspx
│   ├── Register.aspx
│   ├── Dashboard.aspx
│   ├── Products.aspx
│   ├── Cart.aspx
│   ├── Orders.aspx
│   ├── Inventory.aspx
│   ├── ManageProducts.aspx
│   ├── ManageOrders.aspx
│   ├── ManageUsers.aspx
│   ├── CustomerSegmentation.aspx
│   ├── DemandForecast.aspx
│   ├── Recommendation.aspx
│   ├── Web.config
│   └── ...
│
├── .gitignore
├── IADProject.slnx
└── README.md

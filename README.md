# Retail Store Database

This repository contains SQL scripts and a sample database schema for a retail store. The database includes tables for customers, products, orders, and order items.

## Table Structures

### Customers
- CustomerID: Unique identifier for each customer
- FirstName: First name of the customer
- LastName: Last name of the customer
- Email: Email address of the customer
- DateOfBirth: Date of birth of the customer

### Products
- ProductID: Unique identifier for each product
- ProductName: Name of the product
- Price: Price of the product

### Orders
- OrderID: Unique identifier for each order
- CustomerID: ID of the customer who placed the order (foreign key referencing CustomerID in Customers table)
- OrderDate: Date when the order was placed

### OrderItems
- OrderItemID: Unique identifier for each order item
- OrderID: ID of the order to which the item belongs (foreign key referencing OrderID in Orders table)
- ProductID: ID of the product ordered (foreign key referencing ProductID in Products table)
- Quantity: Quantity of the product ordered

## Sample Queries

1. List all customers.
2. Find all orders placed in January 2023.
3. Get the details of each order, including the customer name and email.
4. List the products purchased in a specific order (e.g., OrderID = 1).
5. Calculate the total amount spent by each customer.
6. Find the most popular product (the one that has been ordered the most).
7. Get the total number of orders and the total sales amount for each month in 2023.
8. Find customers who have spent more than $1000.

## Usage

1. Clone this repository to your local machine.
2. Open the SQL file containing the database schema in your preferred SQL database management tool.
3. Run the SQL script to create the database schema and insert sample data.
4. Execute the sample queries to retrieve information from the database.

## Contributors

- Sandeep Dara

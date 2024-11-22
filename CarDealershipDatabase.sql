DROP DATABASE cardealershipdatabase;

CREATE DATABASE cardealershipdatabase;

USE cardealershipdatabase;

CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phone VARCHAR(12) NOT NULL
);

CREATE TABLE vehicles (
    vin VARCHAR(17) PRIMARY KEY,
    year INT NOT NULL,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    vehicleType VARCHAR(50) NOT NULL,
    color VARCHAR(50) NOT NULL,
    odometer INT NOT NULL,
    price DOUBLE NOT NULL,
    vehiclesold BOOLEAN DEFAULT FALSE
);

CREATE TABLE inventory (
    dealership_id INT,
    vin VARCHAR(17),
    PRIMARY KEY (dealership_id, vin),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id) ON DELETE CASCADE,
    FOREIGN KEY (vin) REFERENCES vehicles(vin) ON DELETE CASCADE
);

CREATE TABLE sales_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dealership_id INT,
    vin VARCHAR(17),
    sale_date DATE NOT NULL,
    sale_price DOUBLE NOT NULL,
    customer_name VARCHAR(100),
    customer_phone VARCHAR(15),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

CREATE TABLE lease_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dealership_id INT,
    vin VARCHAR(17),
    lease_start_date DATE NOT NULL,
    lease_end_date DATE NOT NULL,
    monthly_payment DOUBLE NOT NULL,
    customer_name VARCHAR(100),
    customer_phone VARCHAR(15),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

INSERT INTO dealerships (name, address, phone)
VALUES
    ('City Motors', '123 Main St, Cityville, CA', '123-456-7890'),
    ('AutoWorld', '456 Market Rd, Townsville, TX', '987-654-3210'),
    ('Luxury Cars', '789 Prestige Ave, Luxor, NY', '555-123-4567'),
    ('Elite Autos', '101 Luxury Blvd, Beverly Hills, CA', '310-555-1111'),
    ('Prime Car Sales', '202 Auto Mall, Springfield, IL', '217-555-2222'),
    ('Global Motors', '303 International Dr, Chicago, IL', '312-555-3333'),
    ('Exotic Wheels', '404 High End Rd, Miami, FL', '305-555-4444'),
    ('Auto Nation', '505 Vehicle St, Dallas, TX', '214-555-5555'),
    ('Speedway Motors', '606 Raceway Ave, Daytona, FL', '407-555-6666'),
    ('DriveTime Motors', '707 Car Ave, Phoenix, AZ', '602-555-7777');

INSERT INTO vehicles (vin, year, make, model, vehicleType, color, odometer, price, vehiclesold)
VALUES
    ('WBA3A9C57DF123456', 2020, 'BMW', '3 Series', 'Sedan', 'Red', 15000, 35000.00, FALSE),
    ('WDDGF4HB1DR123789', 2021, 'Mercedes-Benz', 'C-Class', 'Sedan', 'Blue', 5000, 45000.00, FALSE),
    ('ZFF79ALA5J0234567', 2022, 'Ferrari', '488 GTB', 'Coupe', 'Yellow', 2000, 250000.00, FALSE),
    ('JF2SJAAEXH1234567', 2020, 'Subaru', 'Forester', 'SUV', 'Green', 15000, 25000.00, FALSE),
    ('WA1L2AFP0D1234567', 2021, 'Audi', 'Q5', 'SUV', 'Black', 5000, 40000.00, FALSE),
    ('WP0AB2A91CS123456', 2022, 'Porsche', '911', 'Coupe', 'White', 2000, 100000.00, FALSE),
    ('1C4PJMCX4KD564739', 2019, 'Jeep', 'Cherokee', 'SUV', 'Silver', 30000, 28000.00, FALSE),
    ('WMWXP9C58J2A12345', 2020, 'Mini Cooper', 'Cooper', 'Hatchback', 'Blue', 10000, 25000.00, FALSE),
    ('5UXWX9C56H1234567', 2021, 'BMW', 'X5', 'SUV', 'Black', 5000, 55000.00, FALSE),
    ('WDBUF56J69A123456', 2019, 'Mercedes-Benz', 'E-Class', 'Sedan', 'Silver', 20000, 42000.00, FALSE);

INSERT INTO inventory (dealership_id, vin)
VALUES
    (1, 'WBA3A9C57DF123456'),
    (1, 'WDDGF4HB1DR123789'),
    (2, 'ZFF79ALA5J0234567'),
    (3, 'JF2SJAAEXH1234567'),
    (1, 'WA1L2AFP0D1234567'),
    (2, 'WP0AB2A91CS123456'),
    (3, '1C4PJMCX4KD564739'),
    (1, 'WMWXP9C58J2A12345'),
    (2, '5UXWX9C56H1234567'),
    (3, 'WDBUF56J69A123456');

INSERT INTO sales_contracts (dealership_id, vin, sale_date, sale_price, customer_name, customer_phone)
VALUES
    (1, 'WBA3A9C57DF123456', '2024-05-15', 24000.00, 'John Doe', '321-654-9870'),
    (2, 'WDDGF4HB1DR123789', '2024-06-10', 33000.00, 'Jane Smith', '555-987-1234'),
    (3, 'ZFF79ALA5J0234567', '2024-07-20', 21000.00, 'Alice Johnson', '555-321-6549'),
    (4, 'JF2SJAAEXH1234567', '2024-08-01', 28000.00, 'Bob Brown', '321-987-6542'),
    (5, 'WA1L2AFP0D1234567', '2024-09-12', 35000.00, 'Chris Green', '555-876-4321'),
    (6, 'WP0AB2A91CS123456', '2024-10-10', 22000.00, 'David Wilson', '987-654-3210'),
    (7, '1C4PJMCX4KD564739', '2024-11-01', 24000.00, 'Eva Taylor', '555-234-5678'),
    (8, 'WMWXP9C58J2A12345', '2024-12-15', 33000.00, 'Frank Lewis', '555-567-1234'),
    (9, '5UXWX9C56H1234567', '2025-01-10', 21500.00, 'Grace Smith', '321-654-9876'),
    (10, 'WDBUF56J69A123456', '2025-02-01', 28500.00, 'Henry Adams', '555-876-5432');

-- Insert 10 different lease contracts into the lease_contracts table
INSERT INTO lease_contracts (dealership_id, vin, lease_start_date, lease_end_date, monthly_payment, customer_name, customer_phone)
VALUES
    (1, 'WBA3A9C57DF123456', '2024-05-01', '2025-05-01', 300.00, 'John Doe', '321-654-9870'),
    (2, 'WDDGF4HB1DR123789', '2024-06-01', '2025-06-01', 400.00, 'Jane Smith', '555-987-1234'),
    (3, 'ZFF79ALA5J0234567', '2024-07-01', '2025-07-01', 500.00, 'Alice Johnson', '555');
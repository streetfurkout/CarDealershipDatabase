DROP DATABASE cardealershipdatabase;

CREATE DATABASE cardealershipdatabase;

USE cardealershipdatabase;



CREATE TABLE dealerships (
dealership_id int auto_increment PRIMARY KEY,
name varchar(50) NOT NULL,
address varchar(50) NOT NULL,
phone varchar(12) NOT NULL
);

CREATE TABLE vehicles (
vin varchar(17) PRIMARY KEY,
year int NOT NULL,
make varchar(50) NOT NULL,
model varchar(50) NOT NULL,
vehicleType varchar(50) NOT NULL,
color varchar(50) NOT NULL,
odometer int NOT NULL,
price double NOT NULL,
vehiclesold BOOLEAN DEFAULT FALSE
);

CREATE TABLE inventory (
dealership_id int,
vin varchar(17),
PRIMARY KEY (dealership_id, vin),
FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
FOREIGN KEY (vin) REFERENCES vehicles(vin)
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

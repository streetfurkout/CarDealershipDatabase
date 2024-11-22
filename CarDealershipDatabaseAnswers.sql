-- Question 1
SELECT * 
FROM cardealershipdatabase.dealerships;

-- Question 2
SELECT v.vin, v.year, v.make, v.model, v.vehicleType, v.color, v.odometer, v.price
FROM vehicles v
JOIN inventory i ON v.vin = i.vin
JOIN dealerships d ON i.dealership_id = d.dealership_id
WHERE d.name = 'City Motors';  -- Replace 'City Motors' with the dealership name you're searching for

-- Question 3
SELECT v.vin, v.year, v.make, v.model, v.vehicleType, v.color, v.odometer, v.price, v.vehiclesold
FROM vehicles v
WHERE v.vin = 'WBA3A9C57DF123456';  -- Replace this VIN with the VIN you're searching for

-- Question 4
SELECT d.dealership_id, d.name, d.address, d.phone
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
WHERE i.vin = 'WBA3A9C57DF123456';  -- Replace this VIN with the VIN you're searching for


-- Question 5
SELECT DISTINCT d.dealership_id, d.name, d.address, d.phone
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v ON i.vin = v.vin
WHERE v.vehicleType = 'SUV';  -- Replace 'SUV' with the car type you're searching for

-- Question 6
SELECT s.id, s.sale_date, s.sale_price, s.customer_name, s.customer_phone, v.make, v.model, v.year
FROM sales_contracts s
JOIN dealerships d ON s.dealership_id = d.dealership_id
JOIN vehicles v ON s.vin = v.vin
WHERE d.name = 'City Motors'  -- Replace with the name of the dealership you're interested in
AND s.sale_date BETWEEN '2024-01-01' AND '2024-12-31';  -- Replace with your desired date range


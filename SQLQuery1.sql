-- Drop the tables if they already exist
IF OBJECT_ID('menu_table', 'U') IS NOT NULL
    DROP TABLE menu_table;

IF OBJECT_ID('suppliers', 'U') IS NOT NULL
    DROP TABLE suppliers;

-- Create the suppliers table
CREATE TABLE suppliers (
    supplier_id INT IDENTITY(1,1) PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL,
    contact_info VARCHAR(255),
    address TEXT
);

-- Create the menu_table with foreign key reference to suppliers
CREATE TABLE menu_table (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    availability_status VARCHAR(50) DEFAULT 'Available',
    description TEXT,
    manufacture_date DATE,
    expiry_date DATE,
    supplier_id INT,
    CONSTRAINT fk_supplier FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Drop the tables if they already exist
IF OBJECT_ID('menu_table', 'U') IS NOT NULL
    DROP TABLE menu_table;

IF OBJECT_ID('suppliers', 'U') IS NOT NULL
    DROP TABLE suppliers;

-- Create the suppliers table
CREATE TABLE suppliers (
    supplier_id INT IDENTITY(1,1) PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL,
    contact_info VARCHAR(255),
    address TEXT
);

-- Insert a sample supplier into suppliers (do this first)
INSERT INTO suppliers (supplier_name, contact_info, address)
VALUES ('PharmaSupplier Ltd', '123-456-7890', '123 Main St, Pharma City');

-- Create the menu_table with foreign key reference to suppliers
CREATE TABLE menu_table (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    availability_status VARCHAR(50) DEFAULT 'Available',
    description TEXT,
    manufacture_date DATE,
    expiry_date DATE,
    supplier_id INT,
    CONSTRAINT fk_supplier FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
-- Insert new suppliers into suppliers table
INSERT INTO suppliers (supplier_name, contact_info, address)
VALUES 
    ('HealthCare Suppliers Co.', '987-654-3210', '456 Elm St, Pharma Town'),
    ('Global Pharma Partners', '555-123-4567', '789 Pine St, Health City');

-- Insert new products into menu_table
-- Ensure that you reference existing supplier_ids (1, 2, and 3 based on previous inserts)
INSERT INTO menu_table (product_name, category, price, availability_status, description, manufacture_date, expiry_date, supplier_id)
VALUES 
    ('Ibuprofen', 'Painkiller', 29.99, 'Available', 'Used for pain relief and inflammation', '2024-01-15', '2026-01-15', 1),
    ('Amoxicillin', 'Antibiotic', 99.99, 'Available', 'Used to treat various infections', '2024-02-01', '2026-02-01', 2);


-- Insert a sample record into menu_table
-- Now that the supplier has been added, you can reference it
INSERT INTO menu_table (product_name, category, price, availability_status, description, manufacture_date, expiry_date, supplier_id)
VALUES ('Paracetamol', 'Painkiller', 49.99, 'Available', 'Used for pain relief and fever reduction', '2024-01-10', '2026-01-10', 1);

-- Get details for suppliers table
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'suppliers';

-- Get details for menu_table
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'menu_table';

SELECT * FROM suppliers;
-- Insert new suppliers into suppliers table
INSERT INTO suppliers (supplier_name, contact_info, address)
VALUES 
    ('HealthCare Suppliers Co.', '987-654-3210', '456 Elm St, Pharma Town'),
    ('Global Pharma Partners', '555-123-4567', '789 Pine St, Health City'),
    ('MediSupply Inc.', '111-222-3333', '321 Oak St, Health Village'),
    ('PharmaLink', '444-555-6666', '654 Maple St, Pharma Center'),
    ('CureAll Distributors', '777-888-9999', '987 Birch St, Wellness Town');

-- Insert new products into menu_table
INSERT INTO menu_table (product_name, category, price, availability_status, description, manufacture_date, expiry_date, supplier_id)
VALUES 
    ('Ibuprofen', 'Painkiller', 29.99, 'Available', 'Used for pain relief and inflammation', '2024-01-15', '2026-01-15', 1),
    ('Amoxicillin', 'Antibiotic', 99.99, 'Available', 'Used to treat various infections', '2024-02-01', '2026-02-01', 2),
    ('Metformin', 'Diabetes', 49.99, 'Available', 'Used to control blood sugar levels', '2024-03-01', '2026-03-01', 3),
    ('Lisinopril', 'Blood Pressure', 59.99, 'Available', 'Used to treat high blood pressure', '2024-04-01', '2026-04-01', 4),
    ('Simvastatin', 'Cholesterol', 69.99, 'Available', 'Used to lower cholesterol levels', '2024-05-01', '2026-05-01', 5);

	SELECT * FROM suppliers;



CREATE TABLE pathology_tests (
    test_id INT PRIMARY KEY IDENTITY(1,1),
    test_name VARCHAR(100) NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    doctor VARCHAR(100) NOT NULL,
    payment_status VARCHAR(20) CHECK (payment_status IN ('Paid', 'Pending', 'Cancelled')) NOT NULL
);
INSERT INTO pathology_tests (test_name, cost, doctor, payment_status) VALUES
('Complete Blood Count', 150.00, 'Dr. Sharma', 'Paid'),
('Liver Function Test', 200.00, 'Dr. Mehta', 'Pending'),
('Thyroid Function Test', 180.00, 'Dr. Verma', 'Paid'),
('Blood Sugar Test', 100.00, 'Dr. Gupta', 'Cancelled'),
('Lipid Profile', 250.00, 'Dr. Singh', 'Paid');
SELECT * FROM pathology_tests;

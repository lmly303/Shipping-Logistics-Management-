-- Active: 1721017226150@@localhost@3306@shipping_logistics
CREATE DATABASE shipping_logistics;
USE shipping_logistics;

CREATE TABLE Sender (
    userID INT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(30) NOT NULL,
    city VARCHAR(30) NOT NULL,
    country VARCHAR(30) NOT NULL
);

CREATE TABLE Receiver (
    receiverID INT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(30) NOT NULL,
    city VARCHAR(30) NOT NULL,
    country VARCHAR(30) NOT NULL
);

CREATE TABLE Delivery (
    transportID INT PRIMARY KEY,
    transportMethod VARCHAR(20) NOT NULL,
    costPerUnit DECIMAL(7,2) NOT NULL
);

CREATE TABLE Package (
    userID INT NOT NULL,
    receiverID INT NOT NULL,
    transportID INT NOT NULL,
    orderID INT PRIMARY KEY,
    dateReceived DATE NOT NULL,
    deliveryDate DATE NOT NULL,
    weight DECIMAL(7,2) NOT NULL,
    FOREIGN KEY (userID) REFERENCES Sender(userID),
    FOREIGN KEY (receiverID) REFERENCES Receiver(receiverID),
    FOREIGN KEY (transportID) REFERENCES Delivery(transportID)
);

CREATE TABLE Billing (
    transactionID INT PRIMARY KEY,
    cost DECIMAL NOT NULL,
    description VARCHAR(40) NOT NULL,
    orderID INT,
    FOREIGN KEY (orderID) REFERENCES Package(orderID)
);

CREATE TABLE Tracking (
    trackingID INT PRIMARY KEY,
    origin VARCHAR(30) NOT NULL,
    currentLocation VARCHAR(30) NOT NULL,
    destination VARCHAR(30) NOT NULL,
    date DATE NOT NULL,
    orderID INT,
    FOREIGN KEY (orderID) REFERENCES Package(orderID)
);

-- Inserting data into Sender table --
INSERT INTO Sender (userID, name, email, phone, address, city, country)
VALUES (201, 'Walter Scott', 'walterscott@gmail.com', '202555130', 'Orchard Avenue', 'Denver', 'United States');
INSERT INTO Sender (userID, name, email, phone, address, city, country)
VALUES (202, 'Walker Adams', 'walkeradams@gmail.com', '202555169', 'Crescent Street', 'Miami', 'United States');
INSERT INTO Sender (userID, name, email, phone, address, city, country)
VALUES (203, 'Larry Nelson', 'larrynelson@gmail.com', '202555172', 'Laurel Drive', 'San Francisco', 'United States');
INSERT INTO Sender (userID, name, email, phone, address, city, country)
VALUES (204, 'Thanishekaran Adith', 'santoshadith@gmail.com', '44567389', 'Dubai Downtown', 'Dubai', 'United Arab Emirates');
INSERT INTO Sender (userID, name, email, phone, address, city, country)
VALUES (205, 'Soumyajit Das', 'soumyajit1998@gmail.com', '8756873435', 'Park Street', 'Kolkata', 'India');
INSERT INTO Sender (userID, name, email, phone, address, city, country)
VALUES (206, 'Aditya Santosh', 'adityasan45@yahoo.com', '8789743214', 'White Street', 'Mumbai', 'India');
INSERT INTO Sender (userID, name, email, phone, address, city, country)
VALUES (207, 'Emily Cabler', 'emilycabler@gmail.com', '33590886', 'Route 30', 'London', 'United Kingdom');
INSERT INTO Sender (userID, name, email, phone, address, city, country)
VALUES (208, 'Samar Garg', 'gargsamar2001@gmail.com', '8997664545', 'Crescent Street', 'Delhi', 'India');
INSERT INTO Sender (userID, name, email, phone, address, city, country)
VALUES (209, 'Abdul Azeem', 'azeemshaik123@gmail.com', '34345050', 'Lusail Main', 'Doha', 'Qatar');
INSERT INTO Sender (userID, name, email, phone, address, city, country)
VALUES (210, 'Kenneth Brown', 'kennethbrown@yahoo.com', '234443115', 'Route 30', 'Manchester', 'United Kingdom');


-- Inserting data into Receiver table
INSERT INTO Receiver (receiverID, name, phone, address, city, country) 
VALUES 
(301, 'Venkatesh Thota', '7995708966', 'Venkat Nagar Park', 'Kakinada', 'India'),
(302, 'Karthik Rekhapalli', '8179409631', 'Navabharat Nagar', 'Rajahmundry', 'India'),
(303, 'Hamid Ahmed', '8765554345', 'Main Road', 'Warangal', 'India'),
(304, 'Jimmy Carter', '707578432', 'Malibu Drive', 'Malibu', 'United States'),
(305, 'Dio Brando', '320840284', 'Northern Suburb Road', 'London', 'United Kingdom'),
(306, 'Jotaro Kujo', '283082483', 'Tokyo Circle', 'Tokyo', 'Japan'),
(307, 'Rajesh Kumar', '4342940910', 'Kritipur', 'Kathmandu', 'Nepal'),
(308, 'RD Sharma', '8448948993', 'Marine Drive', 'Mumbai', 'India'),
(309, 'Jauwaad Shams', '9573590856', 'Deira', 'Riyadh', 'Saudi Arabia'),
(310, 'Keshav Ganesh', '50456778', 'Village Road', 'Manama', 'Bahrain');


-- Inserting data into Delivery table
INSERT INTO Delivery (transportID, transportMethod, costPerUnit) VALUES 
(1, 'AIR', 300),
(2, 'SEA', 50),
(3, 'LAND', 150),
(4, 'EXPRESS AIR', 450),
(5, 'EXPRESS SEA', 90),
(6, 'EXPRESS LAND', 250);


-- Inserting data into PACKAGE table
INSERT INTO PACKAGE (USERID, RECEIVERID, TRANSPORTID, ORDERID, DATERECEIVED, DELIVERYDATE, WEIGHT) 
VALUES (201, 301, 2, 101, '2021-03-10', '2021-05-10', 150.00);
INSERT INTO PACKAGE (USERID, RECEIVERID, TRANSPORTID, ORDERID, DATERECEIVED, DELIVERYDATE, WEIGHT) 
VALUES (202, 302, 3, 102, '2021-04-05', '2021-04-28', 10.00);
INSERT INTO PACKAGE (USERID, RECEIVERID, TRANSPORTID, ORDERID, DATERECEIVED, DELIVERYDATE, WEIGHT) 
VALUES (203, 303, 2, 103, '2021-04-15', '2021-06-16', 120.00);
INSERT INTO PACKAGE (USERID, RECEIVERID, TRANSPORTID, ORDERID, DATERECEIVED, DELIVERYDATE, WEIGHT) 
VALUES (204, 304, 5, 104, '2021-04-20', '2021-06-05', 200.00);
INSERT INTO PACKAGE (USERID, RECEIVERID, TRANSPORTID, ORDERID, DATERECEIVED, DELIVERYDATE, WEIGHT) 
VALUES (202, 305, 1, 105, '2021-04-24', '2021-05-04', 18.00);
INSERT INTO PACKAGE (USERID, RECEIVERID, TRANSPORTID, ORDERID, DATERECEIVED, DELIVERYDATE, WEIGHT) 
VALUES (205, 306, 4, 106, '2021-04-29', '2021-05-03', 9.00);
INSERT INTO PACKAGE (USERID, RECEIVERID, TRANSPORTID, ORDERID, DATERECEIVED, DELIVERYDATE, WEIGHT) 
VALUES (206, 307, 6, 107, '2021-04-07', '2021-04-30', 30.00);
INSERT INTO PACKAGE (USERID, RECEIVERID, TRANSPORTID, ORDERID, DATERECEIVED, DELIVERYDATE, WEIGHT) 
VALUES (206, 307, 3, 108, '2021-04-02', '2021-05-10', 0.50);
INSERT INTO PACKAGE (USERID, RECEIVERID, TRANSPORTID, ORDERID, DATERECEIVED, DELIVERYDATE, WEIGHT) 
VALUES (207, 308, 4, 109, '2021-04-30', '2021-05-05', 20.00);
INSERT INTO PACKAGE (USERID, RECEIVERID, TRANSPORTID, ORDERID, DATERECEIVED, DELIVERYDATE, WEIGHT) 
VALUES (208, 309, 1, 110, '2021-04-22', '2021-05-09', 6.00);
INSERT INTO PACKAGE (USERID, RECEIVERID, TRANSPORTID, ORDERID, DATERECEIVED, DELIVERYDATE, WEIGHT) 
VALUES (209, 310, 1, 111, '2021-04-19', '2021-05-04', 10.00);
INSERT INTO PACKAGE (USERID, RECEIVERID, TRANSPORTID, ORDERID, DATERECEIVED, DELIVERYDATE, WEIGHT) 
VALUES (210, 309, 4, 112, '2021-04-29', '2021-05-06', 11.00);


-- Inserting data into BILLING table
INSERT INTO BILLING (TRANSACTIONID, COST, DESCRIPTION, ORDERID) VALUES 
(401, 7500, 'SCOOTER', 101),
(402, 1500, 'BOOKS', 102),
(403, 6000, 'TREADMILL', 103),
(404, 18000, 'MOTOR BIKE', 104),
(405, 5400, 'FRIDGE', 105),
(406, 4050, 'AC', 106),
(407, 7500, 'WASHING MACHINE', 107),
(408, 75, 'DOCUMENTS', 108),
(409, 9000, 'BED', 109),
(410, 1800, 'SPEAKER', 110),
(411, 3000, 'COMPUTER', 111),
(412, 4950, 'SOFA', 112);


-- Inserting data into TRACKING table
INSERT INTO TRACKING (TRACKINGID, ORIGIN, CURRENTLOCATION, DESTINATION, DATE, ORDERID) VALUES 
(501, 'United States', 'United Kingdom', 'India', '2021-05-04', 101),
(502, 'United States', 'United Kingdom', 'India', '2021-04-26', 102),
(503, 'United States', 'United Kingdom', 'India', '2021-06-14', 103),
(504, 'United Arab Emirates', 'Italy', 'United States', '2021-06-03', 104),
(505, 'United States', 'Iceland', 'United Kingdom', '2021-05-02', 105),
(506, 'India', 'New Zealand', 'Japan', '2021-05-02', 106),
(507, 'India', 'Bhutan', 'Nepal', '2021-04-28', 107),
(508, 'India', 'Bhutan', 'Nepal', '2021-05-08', 108),
(509, 'United Kingdom', 'Saudi Arabia', 'India', '2021-05-03', 109),
(510, 'India', 'United Arab Emirates', 'Saudi Arabia', '2021-05-07', 110),
(511, 'Qatar', 'Oman', 'Bahrain', '2021-05-02', 111),
(512, 'United Kingdom', 'Azerbaijan', 'India', '2021-05-04', 112);

-- Commands to see the schema of tables.
desc Billing;
desc Delivery;
desc Package;
DESC Receiver;
DESC Sender;
desc Tracking;


-- Commands to see the tables data.
SELECT * from Billing ;
SELECT * from Delivery ;
SELECT * from Package ;
SELECT * FROM Receiver ;
SELECT * FROM Sender ;
SELECT * FROM Tracking ;



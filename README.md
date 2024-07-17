# Shipping & Logistics Management Project

This project involves the design and implementation of a database management system (DBMS) to store and manage logistics data for a shipping company. The system allows both the shipment company and its users to access detailed information about packaged items, including sender and receiver details, package dimensions, shipment costs, and tracking information. Unique IDs are assigned to various entities like orders, billings, and tracking details to ensure seamless data retrieval and updates. The DBMS enhances user experience by providing live tracking of packages and efficient billing management.

## Features

- **User Management:** Store sender and receiver details, including name, email, phone number, and address.
- **Package Management:** Track package details such as weight, dimensions, order date, and delivery date.
- **Cost Management:** Calculate shipment costs based on the mode of transportation and other factors.
- **Tracking:** Provide live tracking of packages with origin, current location, and destination details.
- **Billing:** Manage and store billing details for each shipment.

## Functional Dependencies

1. **Sender**
   - UserID → {Name, Email, Phone, Address, City, Country}

2. **Package**
   - OrderID → {UserID, ReceiverID, TransportID, Weight, DateReceived, DeliveryDate}

3. **Delivery**
   - TransportID → {TransportMethod, CostPerUnit}
   - TransportMethod → {TransportID, CostPerUnit}

4. **Billing**
   - TransactionID → {Cost, Description, OrderID}

5. **Tracking**
   - TrackingID → {Origin, CurrentLocation, Destination, Date, OrderID}

6. **Receiver**
   - ReceiverID → {Name, Phone, Address, City, Country}

## Normalization

### Tables

1. **Sender Table**
   - **Attributes:** UserID (Primary Key), Name, Email, Phone, Address, City, Country
   - **Normalization:** BCNF (Boyce-Codd Normal Form)

2. **Package Table**
   - **Attributes:** UserID (Foreign Key), ReceiverID (Foreign Key), TransportID (Foreign Key), OrderID (Primary Key), DateReceived, DeliveryDate, Weight
   - **Normalization:** BCNF

3. **Delivery Table**
   - **Attributes:** TransportID (Primary Key), TransportMethod, CostPerUnit
   - **Normalization:** BCNF

4. **Billing Table**
   - **Attributes:** OrderID (Foreign Key), TransactionID (Primary Key), Description, Cost
   - **Normalization:** BCNF

5. **Tracking Table**
   - **Attributes:** OrderID (Foreign Key), TrackingID (Primary Key), Origin, Current Location, Destination, Date
   - **Normalization:** BCNF

6. **Receiver Table**
   - **Attributes:** ReceiverID (Primary Key), Name, Phone, Address, City, Country
   - **Normalization:** BCNF

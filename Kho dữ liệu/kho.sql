CREATE TABLE Item_Dim (
    Item_ID INT PRIMARY KEY,
    Description VARCHAR(255),
    Size VARCHAR(50),
    Weight DECIMAL(10,2),
    Price DECIMAL(10,2)
);
CREATE TABLE Time_Dim (
    Time_ID Int PRIMARY KEY,
    Quarter Int,
    Year INT
);
CREATE TABLE Location_Dim (
    City_ID INT PRIMARY KEY,
    City_Name VARCHAR(255),
    State VARCHAR(100)
);
CREATE TABLE Customer_Dim (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(255),
    City_ID INT,
    TypeCustomerID INT,
	TypeCustomer VARCHAR(255)
);
CREATE TABLE Store_Dim (
    Store_ID INT PRIMARY KEY,
    City_ID INT,
    Phone_Number VARCHAR(15),
    FOREIGN KEY (City_ID) REFERENCES Location_Dim(City_ID)
);


CREATE TABLE Sale_Fact (
    Time_ID INT,
    Item_ID INT,
    Store_ID INT,
	Customer_ID INT,
    Total_quantity INT,
    Total_amount DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customer_Dim(Customer_ID),
    FOREIGN KEY (Item_ID) REFERENCES Item_Dim(Item_ID),
    FOREIGN KEY (Store_ID) REFERENCES Store_Dim(Store_ID),
    FOREIGN KEY (Time_ID) REFERENCES Time_Dim(Time_ID)
);
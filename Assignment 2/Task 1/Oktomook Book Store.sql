CREATE database IF NOT EXISTS `OktomookBookStore`;
USE `OktomookBookStore`;

CREATE TABLE Customers (
	customerNumber INT auto_increment,
    firstName varchar(60),
    lastName varchar(60),
    Address varchar(255),
    city varchar(60),
    State ENUM('QLD', 'VIC', 'NSW', 'WA', 'TAS', 'NT'),
    postcode INT,
    region varchar(60),
    email varchar(255),
PRIMARY KEY(customerNumber)
);

CREATE TABLE Publishers (
	pubID varchar(8) NOT NULL UNIQUE,
    `name` varchar(60),
    contact varchar(60),
    phone INT,
PRIMARY KEY(pubID)
);

CREATE TABLE Books (
	ISBN varchar(13) NOT NULL UNIQUE,
    title varchar(60),
    pubDate date CHECK (pubDate LIKE '--/--/----'),
    PubID varchar(8),
    Cost decimal(8,2),
    Retail INT,
    Discount INT,
    category varchar(60) NOT NULL CHECK (category IN ('Fitness', 'Children', 'Computer', 'Cooking', 'Business', 'Literature')),
PRIMARY KEY(ISBN),
FOREIGN KEY(pubID) REFERENCES Publishers(pubID)
);

CREATE TABLE OrdersItems (
	orderNumber INT auto_increment,
    itemNumber INT,
    ISBN varchar(13) NOT NULL UNIQUE,
    quantity INT,
    paidEach DECIMAL(8,2),
PRIMARY KEY(orderNumber)
);


CREATE TABLE Orders (
	orderNumber INT auto_increment,
    customerNumber INT,
    orderDate date CHECK (orderDate LIKE '--/--/----'),
    shipDate date CHECK (shipDate LIKE '--/--/----'),
    street varchar(255),
    city varchar(60),
    state varchar(60),
    postCode INT,
    shipCost DECIMAL(5,2),
PRIMARY KEY(orderNumber),
FOREIGN KEY(customerNumber) REFERENCES Customers(customerNumber),
FOREIGN KEY(orderNumber) REFERENCES OrderItems(orderNumber)
);

CREATE TABLE Author (
	authorID varchar(8) NOT NULL UNIQUE,
    firstName varchar(60),
    lastName varchar(60),
PRIMARY KEY(authorID)
);

CREATE TABLE Wrote (
	ISBN varchar(13) NOT NULL UNIQUE,
    authorID varchar(8),
PRIMARY KEY(ISBN,authorID),
FOREIGN KEY(authorID) REFERENCES Author(authorID),
FOREIGN KEY(ISBN) REFERENCES Books(ISBN)
);
    


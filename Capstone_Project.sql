-- Users
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    location VARCHAR(100)
);

INSERT INTO Users (user_id, name, email, phone, location) VALUES
(1, 'Ravi Sharma', 'ravi@example.com', '9876543210', 'Mumbai'),
(2, 'Priya Mehta', 'priya@example.com', '9898989898', 'Delhi'),
(3, 'Amit Patel', 'amit@example.com', '8765432109', 'Ahmedabad'),
(4, 'Sneha Rao', 'sneha@example.com', '9123456780', 'Bangalore'),
(5, 'Vikram Joshi', 'vikram@example.com', '9012345678', 'Pune'),
(6, 'Divya Singh', 'divya@example.com', '9823456789', 'Hyderabad'),
(7, 'Rahul Jain', 'rahul@example.com', '9811111111', 'Chennai'),
(8, 'Anita Desai', 'anita@example.com', '9833333333', 'Kolkata'),
(9, 'Karan Verma', 'karan@example.com', '9844444444', 'Mumbai'),
(10, 'Neha Kapoor', 'neha@example.com', '9855555555', 'Delhi');

SELECT * FROM Users;

-- Restaurants
CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1)
);

INSERT INTO Restaurants (restaurant_id, name, location, cuisine, rating) VALUES
(1, 'Pizza Palace', 'Mumbai', 'Italian', 4.3),
(2, 'Delhi Biryani House', 'Delhi', 'Indian', 4.1),
(3, 'Burger Hub', 'Bangalore', 'American', 3.9),
(4, 'Sushi Central', 'Hyderabad', 'Japanese', 4.6),
(5, 'Pasta Point', 'Pune', 'Italian', 4.2),
(6, 'Tandoori Treats', 'Chennai', 'North Indian', 4.0),
(7, 'Wok Express', 'Mumbai', 'Chinese', 4.1),
(8, 'Wrap World', 'Kolkata', 'Mexican', 3.8),
(9, 'Healthy Bowl', 'Ahmedabad', 'Healthy', 4.4),
(10, 'Biryani Express', 'Delhi', 'Indian', 4.3);

SELECT * FROM Restaurants;

-- Menu
CREATE TABLE Menu (
    menu_id INT PRIMARY KEY,
    restaurant_id INT,
    item_name VARCHAR(100),
    price DECIMAL(8,2),
    is_available BOOLEAN,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

INSERT INTO Menu (menu_id, restaurant_id, item_name, price, is_available) VALUES
(1, 1, 'Margherita Pizza', 180, TRUE),
(2, 1, 'Pepperoni Pizza', 250, TRUE),
(3, 2, 'Chicken Biryani', 220, TRUE),
(4, 2, 'Veg Biryani', 180, TRUE),
(5, 3, 'Cheese Burger', 150, TRUE),
(6, 4, 'California Roll', 300, FALSE),
(7, 5, 'Penne Alfredo', 210, TRUE),
(8, 6, 'Paneer Tikka', 200, TRUE),
(9, 7, 'Veg Noodles', 170, TRUE),
(10, 8, 'Mexican Wrap', 190, FALSE);

SELECT * FROM Menu;

-- Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    restaurant_id INT,
    order_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

INSERT INTO Orders (order_id, user_id, restaurant_id, order_date, status) VALUES
(1, 1, 1, '2024-10-01', 'Delivered'),
(2, 2, 2, '2024-10-02', 'Delivered'),
(3, 3, 3, '2024-10-03', 'Cancelled'),
(4, 4, 4, '2024-10-04', 'Delivered'),
(5, 5, 5, '2024-10-05', 'Delivered'),
(6, 6, 1, '2024-10-06', 'Pending'),
(7, 7, 2, '2024-10-07', 'Delivered'),
(8, 8, 6, '2024-10-08', 'Delivered'),
(9, 9, 7, '2024-10-09', 'Pending'),
(10, 10, 8, '2024-10-10', 'Delivered');

SELECT * FROM Orders;

-- Order_Items
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    menu_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (menu_id) REFERENCES Menu(menu_id)
);

INSERT INTO Order_Items (order_item_id, order_id, menu_id, quantity) VALUES
(1, 1, 1, 2),
(2, 1, 2, 1),
(3, 2, 3, 1),
(4, 2, 4, 1),
(5, 3, 5, 2),
(6, 4, 6, 1),
(7, 5, 7, 1),
(8, 6, 1, 1),
(9, 7, 3, 2),
(10, 8, 8, 1);

SELECT * FROM Order_Items;

-- Reviews
CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    user_id INT,
    restaurant_id INT,
    rating DECIMAL(2,1),
    review_text TEXT,
    review_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

INSERT INTO Reviews (review_id, user_id, restaurant_id, rating, review_text, review_date) VALUES
(1, 1, 1, 4.5, 'Delicious pizza and quick delivery!', '2024-10-01'),
(2, 2, 2, 4.0, 'Great biryani taste!', '2024-10-02'),
(3, 3, 3, 3.5, 'Burger was okayish.', '2024-10-03'),
(4, 4, 4, 5.0, 'Sushi was fresh and tasty.', '2024-10-04'),
(5, 5, 5, 4.2, 'Loved the pasta!', '2024-10-05'),
(6, 6, 1, 4.0, 'Pizza was good but could be hotter.', '2024-10-06'),
(7, 7, 2, 4.1, 'Authentic taste!', '2024-10-07'),
(8, 8, 6, 4.0, 'Tandoori was amazing!', '2024-10-08'),
(9, 9, 7, 3.9, 'Decent noodles.', '2024-10-09'),
(10, 10, 8, 3.7, 'Wrap was a bit dry.', '2024-10-10');

SELECT * FROM Reviews;


-- Q2: List all restaurants along with their location and cuisine

SELECT name, location, cuisine
FROM Restaurants;

-- Q3: List all Menu items with their prices and availability for the restaurant named "Pizza Palace".

SELECT m.item_name, m.price, m.is_available
FROM Menu m
JOIN Restaurants r ON m.restaurant_id = r.restaurant_id
WHERE r.name = 'Pizza Palace';

-- Q4: Display the total number of users in each location.

SELECT location, COUNT(*) AS total_users
FROM Users
GROUP BY location;

-- Q5: List all orders with user name, restaurant name, and number of items in the order.

SELECT u.name AS user_name, r.name AS restaurant_name, COUNT(oi.menu_id) AS item_count
FROM Orders o
JOIN Users u ON o.user_id = u.user_id
JOIN Restaurants r ON o.restaurant_id = r.restaurant_id
JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY u.name, r.name, o.order_id;

-- Q6: Find the average rating of each restaurant and list them in descending order.

SELECT restaurant_id, AVG(rating) AS avg_rating
FROM Reviews
GROUP BY restaurant_id
ORDER BY avg_rating DESC;

-- Q7: Find the users who have never placed an order.

SELECT *
FROM Users
WHERE user_id NOT IN (
    SELECT DISTINCT user_id FROM Orders
);

-- Q8: Update all menu items by increasing their price by 10% where the current price is below 200.

UPDATE Menu
SET price = price * 1.10
WHERE price < 200;

SELECT * FROM Menu;

-- Q9: Find all restaurants that serve more menu items than the average number of items across all restaurants.

SELECT restaurant_id
FROM Menu
GROUP BY restaurant_id
HAVING COUNT(*) > (
    SELECT AVG(item_count) FROM (
        SELECT COUNT(*) AS item_count
        FROM Menu
        GROUP BY restaurant_id
    ) AS avg_counts
);

-- Q10: Get the top 3 most ordered items across all restaurants.

SELECT m.item_name, COUNT(*) AS order_count
FROM Order_Items oi
JOIN Menu m ON oi.menu_id = m.menu_id
GROUP BY m.item_name
ORDER BY order_count DESC
LIMIT 3;

-- Q11: Create a function get_total_order_amount(order_id) that calculates and returns the total bill amount.

CREATE OR REPLACE FUNCTION get_total_order_amount(order_id INT)
RETURNS DECIMAL(10, 2) AS $$
DECLARE
    total_amount DECIMAL(10, 2) := 0;
BEGIN
    -- Calculate the total amount
    SELECT SUM(m.price * oi.quantity) INTO total_amount
    FROM Order_Items oi
    JOIN Menu m ON oi.menu_id = m.menu_id
    WHERE oi.order_id = get_total_order_amount.order_id;  -- disambiguate here

    RETURN total_amount;
END;
$$ LANGUAGE plpgsql;

SELECT get_total_order_amount(1);

-- Q12: Write a stored procedure place_order that accepts a user_id, restaurant_id, 
-- and a list of item_ids with quantities and inserts records into the Orders and Order_Items tables.

DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
    order_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id INT,
    restaurant_id INT,
    order_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CALL place_order(5, 2, ARRAY[4, 5], ARRAY[2, 1]);


-- Q13: Create a trigger that updates the restaurant's average rating in the Restaurants table whenever a new review is inserted into the Reviews table.

CREATE OR REPLACE FUNCTION update_avg_rating()
RETURNS TRIGGER AS $$
BEGIN
    -- Calculate the new average rating for the restaurant
    UPDATE Restaurants
    SET rating = (
        SELECT AVG(rating)
        FROM Reviews
        WHERE restaurant_id = NEW.restaurant_id
    )
    WHERE restaurant_id = NEW.restaurant_id;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Now create the trigger that calls the function after each insert into Reviews
CREATE TRIGGER update_average_rating
AFTER INSERT ON Reviews
FOR EACH ROW
EXECUTE FUNCTION update_avg_rating();

INSERT INTO Reviews (review_id, user_id, restaurant_id, rating, review_text, review_date)
VALUES (11, 1, 1, 4.8, 'Great pizza again!', '2024-05-13');

SELECT restaurant_id, name, rating
FROM Restaurants
WHERE restaurant_id = 1;

SELECT * 
FROM Reviews
WHERE restaurant_id = 1;













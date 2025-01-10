-- Train Booking Database Queries

-- 1. Create Tables
CREATE TABLE train_station (
    id INT PRIMARY KEY,
    station_name VARCHAR(255) NOT NULL
);

CREATE TABLE schedule (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE train_journey (
    id INT PRIMARY KEY,
    schedule_id INT,
    name VARCHAR(255),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

CREATE TABLE journey_station (
    journey_id INT,
    station_id INT,
    stop_order INT,
    departure_time DATETIME,
    PRIMARY KEY (journey_id, station_id),
    FOREIGN KEY (journey_id) REFERENCES train_journey(id),
    FOREIGN KEY (station_id) REFERENCES train_station(id)
);

CREATE TABLE carriage_class (
    id INT PRIMARY KEY,
    class_name VARCHAR(255),
    seating_capacity INT
);

CREATE TABLE journey_carriage (
    journey_id INT,
    carriage_class_id INT,
    position INT,
    PRIMARY KEY (journey_id, carriage_class_id),
    FOREIGN KEY (journey_id) REFERENCES train_journey(id),
    FOREIGN KEY (carriage_class_id) REFERENCES carriage_class(id)
);

CREATE TABLE carriage_price (
    schedule_id INT,
    carriage_class_id INT,
    price DECIMAL(10, 2),
    PRIMARY KEY (schedule_id, carriage_class_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id),
    FOREIGN KEY (carriage_class_id) REFERENCES carriage_class(id)
);

CREATE TABLE passenger (
    id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    password VARCHAR(255)
);

CREATE TABLE booking_status (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE booking (
    id INT PRIMARY KEY,
    passenger_id INT,
    status_id INT,
    booking_date DATE,
    starting_station_id INT,
    ending_station_id INT,
    train_journey_id INT,
    ticket_class_id INT,
    amount_paid DECIMAL(10, 2),
    ticket_no INT,
    seat_no INT,
    FOREIGN KEY (passenger_id) REFERENCES passenger(id),
    FOREIGN KEY (status_id) REFERENCES booking_status(id),
    FOREIGN KEY (starting_station_id) REFERENCES train_station(id),
    FOREIGN KEY (ending_station_id) REFERENCES train_station(id),
    FOREIGN KEY (train_journey_id) REFERENCES train_journey(id),
    FOREIGN KEY (ticket_class_id) REFERENCES carriage_class(id)
);

-- 2. Insert Sample Data
INSERT INTO train_station (id, station_name) VALUES
(1, 'Penn Station'),
(2, 'South Station');

INSERT INTO schedule (id, name) VALUES
(1, 'Weekday'),
(2, 'Weekend');

INSERT INTO train_journey (id, schedule_id, name) VALUES
(1, 1, '9:05 Penn Station to South Station'),
(2, 2, '12:45 Chicago to Washington DC');

INSERT INTO journey_station (journey_id, station_id, stop_order, departure_time) VALUES
(1, 1, 1, '2025-01-06 09:05:00'),
(1, 2, 2, '2025-01-06 11:15:00');

INSERT INTO carriage_class (id, class_name, seating_capacity) VALUES
(1, 'First Class', 50),
(2, 'Business', 100),
(3, 'Economy', 200);

INSERT INTO journey_carriage (journey_id, carriage_class_id, position) VALUES
(1, 1, 1),
(1, 2, 2),
(1, 3, 3);

INSERT INTO carriage_price (schedule_id, carriage_class_id, price) VALUES
(1, 1, 200.00),
(1, 2, 150.00),
(1, 3, 100.00);

INSERT INTO passenger (id, first_name, last_name, email_address, password) VALUES
(1, 'John', 'Doe', 'john.doe@mail.com', 'password123'),
(2, 'Jane', 'Smith', 'jane.smith@mail.com', 'securepass');

INSERT INTO booking_status (id, name) VALUES
(1, 'Active'),
(2, 'Cancelled');

INSERT INTO booking (id, passenger_id, status_id, booking_date, starting_station_id, ending_station_id, train_journey_id, ticket_class_id, amount_paid, ticket_no, seat_no) VALUES
(1, 1, 1, '2025-01-06', 1, 2, 1, 1, 200.00, 101, 1),
(2, 2, 1, '2025-01-06', 1, 2, 1, 2, 150.00, 102, 2);

-- 3. Test Queries

-- Retrieve all train journeys and their schedules
SELECT tj.id, tj.name AS journey_name, s.name AS schedule_name
FROM train_journey tj
JOIN schedule s ON tj.schedule_id = s.id;

-- Retrieve bookings for a specific passenger
SELECT b.id AS booking_id, b.booking_date, ts.station_name AS start_station, te.station_name AS end_station, cc.class_name, b.amount_paid
FROM booking b
JOIN train_station ts ON b.starting_station_id = ts.id
JOIN train_station te ON b.ending_station_id = te.id
JOIN carriage_class cc ON b.ticket_class_id = cc.id
WHERE b.passenger_id = 1;

-- List available carriages and their seating capacity for a journey
SELECT jc.journey_id, cc.class_name, cc.seating_capacity
FROM journey_carriage jc
JOIN carriage_class cc ON jc.carriage_class_id = cc.id
WHERE jc.journey_id = 1;

CREATE TABLE IF NOT EXISTS Trips (
    id INTEGER,
    client_id INTEGER,
    driver_id INTEGER,
    city_id INTEGER,
    status TEXT CHECK(status IN ('completed', 'cancelled_by_driver', 'cancelled_by_client')),
    request_at TEXT
);

CREATE TABLE IF NOT EXISTS Users (
    users_id INTEGER,
    banned TEXT,
    role TEXT CHECK(role IN ('client', 'driver', 'partner'))
);

INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES (1, 1, 10, 1, 'completed', '2013-10-01');
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES (2, 2, 11, 1, 'cancelled_by_driver', '2013-10-01');
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES (3, 3, 12, 6, 'completed', '2013-10-01');
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES (4, 4, 13, 6, 'cancelled_by_client', '2013-10-01');
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES (5, 1, 10, 1, 'completed', '2013-10-02');
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES (6, 2, 11, 6, 'completed', '2013-10-02');
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES (7, 3, 12, 6, 'completed', '2013-10-02');
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES (8, 2, 12, 12, 'completed', '2013-10-03');
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES (9, 3, 10, 12, 'completed', '2013-10-03');
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES (10, 4, 13, 12, 'cancelled_by_driver', '2013-10-03');

INSERT INTO Users (users_id, banned, role) VALUES (1, 'No', 'client');
INSERT INTO Users (users_id, banned, role) VALUES (2, 'Yes', 'client');
INSERT INTO Users (users_id, banned, role) VALUES (3, 'No', 'client');
INSERT INTO Users (users_id, banned, role) VALUES (4, 'No', 'client');
INSERT INTO Users (users_id, banned, role) VALUES (10, 'No', 'driver');
INSERT INTO Users (users_id, banned, role) VALUES (11, 'No', 'driver');
INSERT INTO Users (users_id, banned, role) VALUES (12, 'No', 'driver');
INSERT INTO Users (users_id, banned, role) VALUES (13, 'No', 'driver');

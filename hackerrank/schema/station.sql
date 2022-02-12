CREATE TABLE if not exists `station` (
    `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `city` varchar(21) not null,
    `state` VARCHAR(2) not null,
    `lat_n` int,
    `long_w` int
) DEFAULT CHARSET UTF8;
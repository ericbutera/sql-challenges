insert into video_store.movie (name) values 
('Jurassic Park'),
('Tron: Legacy'),
('Revival of F');

insert into video_store.customer (name) values 
('eric'),
('pooh');

insert into video_store.inventory (movie_id, isbn, note) values
(1, 'JP-01', null),
(1, 'JP-02', null),
(2, 'TRON-01', null),
(2, 'TRON-02', null),
(2, 'TRON-03', null),
(2, 'TRON-04', null),
(3, 'ROF-01', null);

insert into video_store.rental
(inventory_id, customer_id, date_out, date_due, date_returned, late_fee)
values
(1, 1, NOW() - interval '60 day', NOW() - interval '58 day', NOW() - interval '56 day', 2.00), -- historical rental, returned 2 days late
(1, 1, NOW() - interval '28 day', NOW() - interval '26 day', NOW() - interval '26 day', null), -- historical rental, returned on time
(1, 1, NOW(), NOW() + interval '2 day', null, null), -- eric rented jurassic park
(3, 1, NOW(), NOW() + interval '2 day', null, null), -- eric rented tron
(4, 1, NOW(), NOW() + interval '2 day', null, null); -- pooh rented tron

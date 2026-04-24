USE btth;

create table Users(
	user_id int primary key,
    user_name varchar(50)
);
create table Hotels (
	hotel_id int primary key,
    rating tinyint
);
create table Bookings(
	booking_id int primary key,
    status varchar(10),
    total_price double,
    user_id int,
    hotel_id int,
    foreign key (user_id) references Users(user_id),
    foreign key (hotel_id) references Hotels(hotel_id)
);

SELECT * FROM bookings;
SELECT * FROM hotels;
SELECT * FROM users;

-- Lấy tên khách hàng, hạng khách sạn, số tiền khách đã chi
-- 1. Lấy tên tất cả khách hàng
SELECT users.user_name, hotels.rating, SUM(bookings.total_price)
FROM users
JOIN bookings ON bookings.user_id = users.user_id
JOIN hotels ON hotels.hotel_id = bookings.hotel_id
GROUP BY hotels.rating, users.user_name
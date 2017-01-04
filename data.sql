delete from order_item__takeaway_order;

delete from order_item__table_order;

delete from order_item;

delete from item;

delete from food_class;

delete from table_order;

delete from takeaway_order;

delete from user;

delete from room_table__reservation;

delete from reservation;

delete from room_table;

insert into user(id, billing_address, email, gender, nick_name, password, phone_number, points, vip_status)
values(0, 'Weggenstein Strasse, 10', 'sarkmg@gmail.com', 'F', 'Burgers', '1234', '0123456789', 99999, 1);

insert into user(id, billing_address, email, gender, nick_name, password, phone_number, points, vip_status)
values(1, 'Rainerum', 'mpancaldi@gmail.com', 'F', 'Panini', '4321', '0123456789', 99999, 1);

insert into user(id, billing_address, email, gender, nick_name, password, phone_number, points, vip_status)
values(2, 'Idk', 'wsperandio@gmail.com', 'M', 'Werner', '0000', '0123456789', 99999, 1);

insert into user(id, billing_address, email, gender, nick_name, password, phone_number, points, vip_status)
values(3, 'Somewhere', 'gmail@gmail.com', 'M', 'Fluffy', 'password', '0123456789', 0, 0);

insert into user(id, billing_address, email, gender, nick_name, password, phone_number, points, vip_status)
values(4, 'Nowhere', 'obsoleteemailaddress@hotmail.it', 'F', 'CryingMonkey', '1234', '9876543210', 25, 0);

insert into user(id, billing_address, email, gender, nick_name, password, phone_number, points, vip_status)
values(5, 'Anywhere', 'fakeemail@gmail.com', 'Apache Helicopter', 'Nickname', 'sadness2016', '0123456789', 42, 0);

insert into user(id, billing_address, email, gender, nick_name, password, phone_number, points, vip_status)
values(6, 'Everywhere', 'jc@gmail.com', 'M', 'Jesus', '333', '0123456789', 1000, 1);

insert into user(id, billing_address, email, gender, nick_name, password, phone_number, points, vip_status)
values(7, 'Areallylongroadnamefornoparticularreason, 296', 'email@gmail.com', 'Unsure', 'Thisisusernameiswaytoolongbutidontcare', '000000000000000000000000000000000000000000', '0123456789', 0, 0);

insert into food_class(id, name)
values(0, 'Burger');

insert into food_class(id, name)
values(1, 'Salad');

insert into food_class(id, name)
values(2, 'Pizza');

insert into food_class(id, name)
values(3, 'Chinese');

insert into food_class(id, name)
values(4, 'Drink');

insert into food_class(id, name)
values(5, 'Dessert');

insert into item(id, available, name, price, foodClass_id)
values(0, true, 'Margherita', 5, 2);

insert into item(id, available, name, price, foodClass_id)
values(1, false, 'Marinara', 5.5, 2);

insert into item(id, available, name, price, foodClass_id)
values(2, true, 'Cheeseburger', 6, 0);

insert into item(id, available, name, price, foodClass_id)
values(3, true, 'Chicken Burger', 4.5, 0);

insert into item(id, available, name, price, foodClass_id)
values(4, false, 'Double Chesseburger', 6.8, 0);

insert into item(id, available, name, price, foodClass_id)
values(5, true, 'Capricciosa', 6.5, 2);

insert into item(id, available, name, price, foodClass_id)
values(6, true, 'Chicken Salad', 4.6, 1);

insert into item(id, available, name, price, foodClass_id)
values(7, false, 'Tomato Salad', 3.5, 1);

insert into item(id, available, name, price, foodClass_id)
values(8, false, 'Rice Salad', 4, 1);

insert into item(id, available, name, price, foodClass_id)
values(9, true, 'Potato Salad', 3, 1);

insert into item(id, available, name, price, foodClass_id)
values(10, true, 'Dumplings', 3.5, 3);

insert into item(id, available, name, price, foodClass_id)
values(11, false, 'Riso alla Cantonese', 4, 3);

insert into item(id, available, name, price, foodClass_id)
values(12, true, 'Coca Cola', 2, 4);

insert into item(id, available, name, price, foodClass_id)
values(13, true, 'Sprite', 2, 4);

insert into item(id, available, name, price, foodClass_id)
values(14, false, 'Natural Water', 1.5, 4);

insert into item(id, available, name, price, foodClass_id)
values(15, true, 'Fizzy Water', 1.8, 4);

insert into item(id, available, name, price, foodClass_id)
values(16, true, 'Beer', 2, 4);

insert into item(id, available, name, price, foodClass_id)
values(17, false, 'Red Wine', 2.5, 4);

insert into item(id, available, name, price, foodClass_id)
values(18, true, 'White Wine', 2.5, 4);

insert into item(id, available, name, price, foodClass_id)
values(19, true, 'Brownies', 2.5, 5);

insert into item(id, available, name, price, foodClass_id)
values(20, true, 'Ice Cream', 1.5, 5);

insert into item(id, available, name, price, foodClass_id)
values(21, false, 'Sundae', 1, 5);

insert into item(id, available, name, price, foodClass_id)
values(22, true, 'Mysterious Soup', 0.5, 3);

insert into item(id, available, name, price, foodClass_id)
values(23, false, 'Diavola', 7, 2);

insert into item(id, available, name, price, foodClass_id)
values(24, true, 'Hawaiian Pizza', 0, 2);

insert into item(id, available, name, price, foodClass_id)
values(25, true, 'Agrodolce Chicken', 4, 3);

insert into order_item(id, comment, quantity, item_id)
values(0, '', 2, 12);

insert into order_item(id, comment, quantity, item_id)
values(1, 'This is disgusting.', 5, 24);

insert into order_item(id, comment, quantity, item_id)
values(2, '', 1, 1);

insert into order_item(id, comment, quantity, item_id)
values(3, '', 2, 0);

insert into order_item(id, comment, quantity, item_id)
values(4, '', 4, 3);

insert into order_item(id, comment, quantity, item_id)
values(5, '', 1, 20);

insert into order_item(id, comment, quantity, item_id)
values(6, 'I have nothing interesting to say.', 3, 11);

insert into order_item(id, comment, quantity, item_id)
values(7, '', 1, 6);

insert into order_item(id, comment, quantity, item_id)
values(8, '', 1, 9);

insert into order_item(id, comment, quantity, item_id)
values(9, '', 2, 17);

insert into order_item(id, comment, quantity, item_id)
values(10, '', 1, 12);

insert into order_item(id, comment, quantity, item_id)
values(11, '6', 6, 6);

insert into order_item(id, comment, quantity, item_id)
values(12, '', 1, 10);

insert into order_item(id, comment, quantity, item_id)
values(13, '', 2, 21);

insert into order_item(id, comment, quantity, item_id)
values(14, 'Hello Youtube', 2, 25);

insert into order_item(id, comment, quantity, item_id)
values(15, '', 1, 0);

insert into order_item(id, comment, quantity, item_id)
values(16, '', 3, 7);

insert into order_item(id, comment, quantity, item_id)
values(17, '', 1, 5);

insert into order_item(id, comment, quantity, item_id)
values(18, '', 1, 22);

insert into order_item(id, comment, quantity, item_id)
values(19, 'Just kidding.', 0, 24);

insert into order_item(id, comment, quantity, item_id)
values(20, '', 2, 0);

insert into order_item(id, comment, quantity, item_id)
values(21, 'This is an extremely long comment exclusively to test how long comments look.', 1, 3);

insert into order_item(id, comment, quantity, item_id)
values(22, 'Yo.', 1, 16);

insert into order_item(id, comment, quantity, item_id)
values(23, '', 2, 23);

insert into order_item(id, comment, quantity, item_id)
values(24, '', 1, 8);

insert into order_item(id, comment, quantity, item_id)
values(25, 'I voted Trump.', 5, 24);

insert into order_item(id, comment, quantity, item_id)
values(26, '', 1, 20);

insert into order_item(id, comment, quantity, item_id)
values(27, '', 2, 18);

insert into order_item(id, comment, quantity, item_id)
values(28, '', 1, 25);

insert into order_item(id, comment, quantity, item_id)
values(29, '', 2, 13);

insert into order_item(id, comment, quantity, item_id)
values(30, '', 3, 15);

insert into order_item(id, comment, quantity, item_id)
values(31, '', 1, 11);

insert into order_item(id, comment, quantity, item_id)
values(32, '', 2, 4);

insert into order_item(id, comment, quantity, item_id)
values(33, '', 2, 7);

insert into order_item(id, comment, quantity, item_id)
values(34, '', 1, 9);

insert into order_item(id, comment, quantity, item_id)
values(35, ':)', 4, 13);

insert into order_item(id, comment, quantity, item_id)
values(36, '', 1, 10);

insert into order_item(id, comment, quantity, item_id)
values(37, '', 3, 16);

insert into order_item(id, comment, quantity, item_id)
values(38, '', 2, 6);

insert into order_item(id, comment, quantity, item_id)
values(39, 'No pickles. I hate pickles.', 1, 2);

insert into order_item(id, comment, quantity, item_id)
values(40, '', 1, 14);

insert into order_item(id, comment, quantity, item_id)
values(41, '', 2, 8);

insert into order_item(id, comment, quantity, item_id)
values(42, '', 1, 0);

insert into order_item(id, comment, quantity, item_id)
values(43, '', 2, 1);

insert into order_item(id, comment, quantity, item_id)
values(44, '', 2, 19);

insert into order_item(id, comment, quantity, item_id)
values(45, '', 1, 5);

insert into order_item(id, comment, quantity, item_id)
values(46, '', 1, 10);

insert into table_order(id, status)
values(0, 'completed');

insert into table_order(id, status)
values(1, 'completed');

insert into table_order(id, status)
values(2, 'completed');

insert into table_order(id, status)
values(3, 'pending');

insert into table_order(id, status)
values(4, 'pending');

insert into table_order(id, status)
values(5, 'completed');

insert into table_order(id, status)
values(6, 'completed');

insert into table_order(id, status)
values(7, 'pending');

insert into table_order(id, status)
values(8, 'completed');

insert into table_order(id, status)
values(9, 'completed');

insert into table_order(id, status)
values(10, 'completed');

insert into table_order(id, status)
values(11, 'completed');

insert into table_order(id, status)
values(12, 'pending');

insert into table_order(id, status)
values(13, 'pending');

insert into table_order(id, status)
values(14, 'completed');

insert into table_order(id, status)
values(15, 'pending');

insert into table_order(id, status)
values(16, 'pending');

insert into table_order(id, status)
values(17, 'completed');

insert into takeaway_order(id, address, comment, cost, status, guest_id)
values(0, 'Upstairs', 'I live at the 18th floor. Ring twice, I have hearing problems.', 10, 'in delivery', 5);

insert into takeaway_order(id, address, comment, cost, status, guest_id)
values(1, 'Same as billing address', '', 25.6, 'completed', 1);

insert into takeaway_order(id, address, comment, cost, status, guest_id)
values(2, 'Edge of the world, 9', '', 10.1, 'completed', 7);

insert into takeaway_order(id, address, comment, cost, status, guest_id)
values(3, '324 Main Street, Riley, KS', 'No comment.', 0, 'completed', 0);

insert into takeaway_order(id, address, comment, cost, status, guest_id)
values(4, 'Purposelylongstreetname, 38', '', 15.22, 'completed', 4);

insert into takeaway_order(id, address, comment, cost, status, guest_id)
values(5, 'Thisplacedoesntactuallyexist, 999', '...', 5, 'completed', 3);

insert into takeaway_order(id, address, comment, cost, status, guest_id)
values(6, 'Thisplacedoesntactuallyexist, 999', '', 99.99, 'in delivery', 3);

insert into takeaway_order(id, address, comment, cost, status, guest_id)
values(7, 'What if I leave this field empty.', 'What do I even write here', 13, 'in delivery', 2);

insert into takeaway_order(id, address, comment, cost, status, guest_id)
values(8, 'Opposite building', '', 22.2, 'pending', 1);

insert into takeaway_order(id, address, comment, cost, status, guest_id)
values(9, '', '', 4.5, 'pending', 2);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(0, '', '2016-12-01 19:00', '2016-12-01 20:00', null);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(1, '', '2016-12-11 20:00', '2016-12-11 22:00', 0);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(2, '', '2016-12-11 19:00', '2016-12-11 20:00', null);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(3, '', '2016-12-13 19:11', '2016-12-13 19:12', 0);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(4, '', '2016-12-13 20:00', '2016-12-13 21:00', 2);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(5, '', '2016-12-13 20:30', '2016-12-13 23:00', 7);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(6, '', '2016-12-14 20:30', '2016-12-14 21:30', null);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(7, '', '2016-12-15 19:00', '2016-12-15 20:00', 7);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(8, '', '2016-12-15 18:00', '2016-12-11 22:00', 4);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(9, '', '2016-12-15 20:30', '2016-12-11 22:00', null);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(10, '', '2016-12-15 19:00', '2016-12-15 21:00', null);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(11, '', '2016-12-16 19:30', '2016-12-16 20:00', 1);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(12, '', '2016-12-16 20:00', '2016-12-16 23:00', 1);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(13, '', '2016-12-16 20:30', '2016-12-16 22:00', null);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(14, '', '2016-12-16 21:00', '2016-12-16 21:45', 3);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(15, '', '2016-12-17 20:15', '2016-12-17 21:30', null);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(16, '', '2016-12-18 19:00', '2016-12-18 20:00', null);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(17, '', '2016-12-18 20:00', '2016-12-18 22:30', 0);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(18, '', '2016-12-18 19:45', '2016-12-18 21:30', null);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(19, '', '2016-12-18 21:00', '2016-12-18 22:30', null);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(20, '', '2016-12-19 20:00', '2016-12-19 20:45', 2);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(21, '', '2016-12-20 20:30', '2016-12-20 22:00', 0);

insert into reservation(id, comment, start_date, end_date, guest_user_id)
values(22, '', '2016-12-20 20:45', '2016-12-20 22:30', 7);

insert into order_item__takeaway_order(takeaway_order_id, order_item_id)
values(0, 36);

insert into order_item__takeaway_order(takeaway_order_id, order_item_id)
values(1, 37);

insert into order_item__takeaway_order(takeaway_order_id, order_item_id)
values(1, 38);

insert into order_item__takeaway_order(takeaway_order_id, order_item_id)
values(2, 39);

insert into order_item__takeaway_order(takeaway_order_id, order_item_id)
values(4, 40);

insert into order_item__takeaway_order(takeaway_order_id, order_item_id)
values(4, 41);

insert into order_item__takeaway_order(takeaway_order_id, order_item_id)
values(5, 42);

insert into order_item__takeaway_order(takeaway_order_id, order_item_id)
values(6, 43);

insert into order_item__takeaway_order(takeaway_order_id, order_item_id)
values(7, 44);

insert into order_item__takeaway_order(takeaway_order_id, order_item_id)
values(8, 45);

insert into order_item__takeaway_order(takeaway_order_id, order_item_id)
values(9, 46);

insert into order_item__table_order(table_order_id, order_item_id)
values(0, 0);

insert into order_item__table_order(table_order_id, order_item_id)
values(1, 1);

insert into order_item__table_order(table_order_id, order_item_id)
values(2, 2);

insert into order_item__table_order(table_order_id, order_item_id)
values(2, 3);

insert into order_item__table_order(table_order_id, order_item_id)
values(2, 4);

insert into order_item__table_order(table_order_id, order_item_id)
values(3, 5);

insert into order_item__table_order(table_order_id, order_item_id)
values(4, 6);

insert into order_item__table_order(table_order_id, order_item_id)
values(5, 7);

insert into order_item__table_order(table_order_id, order_item_id)
values(6, 8);

insert into order_item__table_order(table_order_id, order_item_id)
values(7, 9);

insert into order_item__table_order(table_order_id, order_item_id)
values(8, 10);

insert into order_item__table_order(table_order_id, order_item_id)
values(8, 11);

insert into order_item__table_order(table_order_id, order_item_id)
values(8, 12);

insert into order_item__table_order(table_order_id, order_item_id)
values(8, 13);

insert into order_item__table_order(table_order_id, order_item_id)
values(8, 14);

insert into order_item__table_order(table_order_id, order_item_id)
values(8, 15);

insert into order_item__table_order(table_order_id, order_item_id)
values(9, 16);

insert into order_item__table_order(table_order_id, order_item_id)
values(9, 17);

insert into order_item__table_order(table_order_id, order_item_id)
values(9, 18);

insert into order_item__table_order(table_order_id, order_item_id)
values(9, 19);

insert into order_item__table_order(table_order_id, order_item_id)
values(9, 20);

insert into order_item__table_order(table_order_id, order_item_id)
values(10, 21);

insert into order_item__table_order(table_order_id, order_item_id)
values(11, 22);

insert into order_item__table_order(table_order_id, order_item_id)
values(11, 23);

insert into order_item__table_order(table_order_id, order_item_id)
values(12, 24);

insert into order_item__table_order(table_order_id, order_item_id)
values(12, 25);

insert into order_item__table_order(table_order_id, order_item_id)
values(12, 26);

insert into order_item__table_order(table_order_id, order_item_id)
values(12, 27);

insert into order_item__table_order(table_order_id, order_item_id)
values(12, 28);

insert into order_item__table_order(table_order_id, order_item_id)
values(12, 29);

insert into order_item__table_order(table_order_id, order_item_id)
values(13, 30);

insert into order_item__table_order(table_order_id, order_item_id)
values(14, 31);

insert into order_item__table_order(table_order_id, order_item_id)
values(15, 32);

insert into order_item__table_order(table_order_id, order_item_id)
values(16, 33);

insert into order_item__table_order(table_order_id, order_item_id)
values(16, 34);

insert into order_item__table_order(table_order_id, order_item_id)
values(17, 35);

insert into room_table(id, category, room, seats)
values(0, 'Categoria 1', 1, 4);

insert into room_table(id, category, room, seats)
values(1, 'Categoria 2', 1, 4);

insert into room_table(id, category, room, seats)
values(2, 'Categoria 3', 1, 4);

insert into room_table(id, category, room, seats)
values(3, 'Categoria 1', 2, 4);

insert into room_table(id, category, room, seats)
values(4, 'Categoria 1', 2, 6);

insert into room_table(id, category, room, seats)
values(5, 'Categoria 2', 3, 8);

insert into room_table(id, category, room, seats)
values(6, 'Categoria 1', 3, 6);

insert into room_table(id, category, room, seats)
values(7, 'Categoria 2', 4, 12);

insert into room_table(id, category, room, seats)
values(8, 'Categoria 3', 4, 4);

insert into room_table(id, category, room, seats)
values(9, 'Categoria 2', 4, 6);

insert into room_table(id, category, room, seats)
values(10, 'Categoria 1', 5, 10);

insert into room_table__reservation(reservation_id, room_table_id)
values(0, 3);

insert into room_table__reservation(reservation_id, room_table_id)
values(1, 2);

insert into room_table__reservation(reservation_id, room_table_id)
values(1, 0);

insert into room_table__reservation(reservation_id, room_table_id)
values(2, 2);

insert into room_table__reservation(reservation_id, room_table_id)
values(3, 9);

insert into room_table__reservation(reservation_id, room_table_id)
values(3, 6);

insert into room_table__reservation(reservation_id, room_table_id)
values(4, 4);

insert into room_table__reservation(reservation_id, room_table_id)
values(4, 0);

insert into room_table__reservation(reservation_id, room_table_id)
values(5, 1);

insert into room_table__reservation(reservation_id, room_table_id)
values(6, 10);

insert into room_table__reservation(reservation_id, room_table_id)
values(6, 3);

insert into room_table__reservation(reservation_id, room_table_id)
values(7, 1);

insert into room_table__reservation(reservation_id, room_table_id)
values(8, 2);

insert into room_table__reservation(reservation_id, room_table_id)
values(9, 0);

insert into room_table__reservation(reservation_id, room_table_id)
values(10, 2);

insert into room_table__reservation(reservation_id, room_table_id)
values(10, 3);

insert into room_table__reservation(reservation_id, room_table_id)
values(10, 5);

insert into room_table__reservation(reservation_id, room_table_id)
values(11, 1);

insert into room_table__reservation(reservation_id, room_table_id)
values(12, 5);

insert into room_table__reservation(reservation_id, room_table_id)
values(13, 7);

insert into room_table__reservation(reservation_id, room_table_id)
values(14, 9);

insert into room_table__reservation(reservation_id, room_table_id)
values(14, 6);

insert into room_table__reservation(reservation_id, room_table_id)
values(15, 1);

insert into room_table__reservation(reservation_id, room_table_id)
values(16, 0);

insert into room_table__reservation(reservation_id, room_table_id)
values(17, 8);

insert into room_table__reservation(reservation_id, room_table_id)
values(18, 5);

insert into room_table__reservation(reservation_id, room_table_id)
values(18, 3);

insert into room_table__reservation(reservation_id, room_table_id)
values(19, 2);

insert into room_table__reservation(reservation_id, room_table_id)
values(20, 0);

insert into room_table__reservation(reservation_id, room_table_id)
values(21, 8);

insert into room_table__reservation(reservation_id, room_table_id)
values(21, 9);

insert into room_table__reservation(reservation_id, room_table_id)
values(22, 4);
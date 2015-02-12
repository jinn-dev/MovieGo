-- 회원
INSERT INTO users (user_id, user_pwd, user_email, user_birthday, user_coupon, user_point) VALUES ('a', 'a', '910326', '', 'n', '0');
INSERT INTO users (user_id, user_pwd, user_email, user_birthday, user_coupon, user_point) VALUES ('b', 'b', '911029', '', 'n', '0');
INSERT INTO users (user_id, user_pwd, user_email, user_birthday, user_coupon, user_point) VALUES ('c', 'c', '900922', '', 'n', '100');

-- 극장
INSERT INTO theaters (theater_name) VALUES ('건대');
INSERT INTO theaters (theater_name) VALUES ('강변');
INSERT INTO theaters (theater_name) VALUES ('군자');

-- 상영영화
INSERT INTO nowmovies (movie_code, theater_id, movie_time) VALUES ('20124070', '1', '2015-02-20');
INSERT INTO nowmovies (movie_code, theater_id, movie_time) VALUES ('20124400', '2', '2015-02-21');
INSERT INTO nowmovies (movie_code, theater_id, movie_time) VALUES ('20124032', '3', '2015-02-22');
INSERT INTO nowmovies (movie_code, theater_id, movie_time) VALUES ('20128687', '1', '2015-02-23');
INSERT INTO nowmovies (movie_code, theater_id, movie_time) VALUES ('20111686', '2', '2015-02-24');


-- 좌석정보
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('1', '1', '1');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('2', '1', '2');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('3', '1', '3');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('4', '2', '1');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('5', '2', '2');

-- 예약정보
INSERT INTO reservationinfo (reservationinfo_id, seat_id, reservation_id) VALUES ('1', '20', '1');
INSERT INTO reservationinfo (reservationinfo_id, seat_id, reservation_id) VALUES ('2', '21', '1');

-- 예약디테일
INSERT INTO reservations (reservation_id, user_id, reservation_num, reservation_price) VALUES ('1', 'a', '2', '10000');
INSERT INTO reservations (reservation_id, user_id, reservation_num, reservation_price) VALUES ('2', 'b', '1', '50000');
INSERT INTO reservations (reservation_id, user_id, reservation_num, reservation_price) VALUES ('3', 'c', '1', '5000');
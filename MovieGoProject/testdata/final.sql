-- 회원
INSERT INTO users (user_id, user_pwd, user_email, user_birthday, user_coupon, user_point) VALUES ('a', 'a', 'a@gmail.com', '910326', 'n', '0');
INSERT INTO users (user_id, user_pwd, user_email, user_birthday, user_coupon, user_point) VALUES ('b', 'b', 'b@gmail.com', '911029', 'n', '50');
INSERT INTO users (user_id, user_pwd, user_email, user_birthday, user_coupon, user_point) VALUES ('c', 'c', 'c@gmail.com', '900222', 'n', '100');

-- 극장
INSERT INTO theaters (theater_name) VALUES ('건대점');
INSERT INTO theaters (theater_name) VALUES ('강변점');
INSERT INTO theaters (theater_name) VALUES ('군자점');

--상영영화
INSERT INTO nowmovies (movie_code, theater_id, movie_time) VALUES ('20149401', '1', to_date('2015-02-26 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (movie_code, theater_id, movie_time) VALUES ('20149401', '1', to_date('2015-02-26 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (movie_code, theater_id, movie_time) VALUES ('20149401', '1', to_date('2015-02-27 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (movie_code, theater_id, movie_time) VALUES ('20149401', '1', to_date('2015-02-27 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (movie_code, theater_id, movie_time) VALUES ('20149401', '1', to_date('2015-02-28 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (movie_code, theater_id, movie_time) VALUES ('20149401', '1', to_date('2015-02-28 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--좌석테이블
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '1');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '2');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '3');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '4');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '5');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '6');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '7');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '8');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '9');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '10');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '11');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '12');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '13');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '14');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '15');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '16');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '17');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '18');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '19');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '20');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '21');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '22');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '23');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '24');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '25');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '26');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '27');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '28');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '29');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '30');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '31');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '32');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '33');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '34');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '35');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '36');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '37');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '38');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '39');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '40');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '41');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '42');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '43');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '44');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '45');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '46');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '47');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '48');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '49');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '50');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '51');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '1', '52');
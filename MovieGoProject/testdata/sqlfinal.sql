--관리자
INSERT INTO users (user_id, user_pwd, user_email, user_birthday, user_coupon, user_point) VALUES ('admin', 'admin', 'admin@gmail.com', '910326');

-- 회원
INSERT INTO users (user_id, user_pwd, user_email, user_birthday) VALUES ('a', 'a', 'a@gmail.com', '910326');
INSERT INTO users (user_id, user_pwd, user_email, user_birthday) VALUES ('sooyeonlee', 'soo12', 'sooyeon@gmail.com', '910326');
INSERT INTO users (user_id, user_pwd, user_email, user_birthday) VALUES ('anda5468', 'anda12', 'anda@gmail.com', '911029');
INSERT INTO users (user_id, user_pwd, user_email, user_birthday) VALUES ('kjeun', 'kjeun12', 'kjeun@gmail.com', '900922');

-- 극장
INSERT INTO theaters (theater_name) VALUES ('건대점');
INSERT INTO theaters (theater_name) VALUES ('강변점');
INSERT INTO theaters (theater_name) VALUES ('군자점');

-- 영화
INSERT INTO movies (movie_code, movie_title_kr, movie_title_eng, movie_genre, movie_nation, movie_open_date, movie_director, movie_img_url, movie_grade, movie_story, movie_actor1, movie_actor2, movie_actor3, movie_actor4) VALUES ('20149401', '스폰지밥 3D', 'The SpongeBob Movie: Sponge Out of Water', '애니메이션', '미국', '20150218', '폴 티비트', 'http://cfile18.uf.daum.net/C110x160/2128994C54C8915E23B3A9', '', '', '', '', '', '');
INSERT INTO movies (movie_code, movie_title_kr, movie_title_eng, movie_genre, movie_nation, movie_open_date, movie_director, movie_img_url, movie_grade, movie_story, movie_actor1, movie_actor2, movie_actor3, movie_actor4) VALUES ('20140110', '킹스맨 : 시크릿 에이전트', 'Kingsman: The Secret Service', '액션', '미국', '20150211', '매튜 본', 'http://cfile78.uf.daum.net/C110x160/2478DE4B54DABBF02304E0', '', '', '', '', '', '');
INSERT INTO movies (movie_code, movie_title_kr, movie_title_eng, movie_genre, movie_nation, movie_open_date, movie_director, movie_img_url, movie_grade, movie_story, movie_actor1, movie_actor2, movie_actor3, movie_actor4) VALUES ('20149951', '빅 히어로', 'Big Hero 6', '애니메이션', '미국', '20150121', '돈 할', 'http://cfile17.uf.daum.net/C110x160/240FFE4E54BE8A5937ED74', '', '', '', '', '', '');
INSERT INTO movies (movie_code, movie_title_kr, movie_title_eng, movie_genre, movie_nation, movie_open_date, movie_director, movie_img_url, movie_grade, movie_story, movie_actor1, movie_actor2, movie_actor3, movie_actor4) VALUES ('20141962', '이미테이션 게임', 'The Imitation Game', '드라마', '영국', '20150217', '모튼 틸덤', 'http://cfile16.uf.daum.net/C110x160/262C844E54BCA75E34A909', '', '', '', '', '', '');
INSERT INTO movies (movie_code, movie_title_kr, movie_title_eng, movie_genre, movie_nation, movie_open_date, movie_director, movie_img_url, movie_grade, movie_story, movie_actor1, movie_actor2, movie_actor3, movie_actor4) VALUES ('20144322', '도라에몽 : 스탠 바이 미', 'Stand by Me Doraemon', '애니메이션', '일본', '20150212', '야마자키 다카시', 'http://t1.daumcdn.net/movie/62d001f1302cb8bcfa555d30beb3cc2ba6887cc9', '', '', '', '', '', '');
INSERT INTO movies (movie_code, movie_title_kr, movie_title_eng, movie_genre, movie_nation, movie_open_date, movie_director, movie_img_url, movie_grade, movie_story, movie_actor1, movie_actor2, movie_actor3, movie_actor4) VALUES ('20137048', '국제시장', 'Ode to My Father', '드라마', '한국', '20141217', '윤제균', 'http://cfile76.uf.daum.net/C110x160/2502AF49546B09E61FB5F1', '', '', '', '', '', '');

-- 상영영화
-- 건대점 상영영화(스폰지밥, 킹스맨, 빅히어로, 국제시장)
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '1', to_date('2015-03-07 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '1', to_date('2015-03-07 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '1', to_date('2015-03-08 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '1', to_date('2015-03-08 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '1', to_date('2015-03-09 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '1', to_date('2015-03-09 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '1', to_date('2015-03-10 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '1', to_date('2015-03-10 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '1', to_date('2015-03-07 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '1', to_date('2015-03-07 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '1', to_date('2015-03-08 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '1', to_date('2015-03-08 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '1', to_date('2015-03-09 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '1', to_date('2015-03-09 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '1', to_date('2015-03-10 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '1', to_date('2015-03-10 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '1', to_date('2015-03-07 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '1', to_date('2015-03-07 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '1', to_date('2015-03-08 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '1', to_date('2015-03-08 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '1', to_date('2015-03-09 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '1', to_date('2015-03-09 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '1', to_date('2015-03-10 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '1', to_date('2015-03-10 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20137048', '1', to_date('2015-03-07 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20137048', '1', to_date('2015-03-07 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20137048', '1', to_date('2015-03-08 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20137048', '1', to_date('2015-03-08 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20137048', '1', to_date('2015-03-09 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20137048', '1', to_date('2015-03-09 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20137048', '1', to_date('2015-03-10 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20137048', '1', to_date('2015-03-10 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));

--강변점 상영영화(스펀지밥, 킹스맨, 빅히어로, 이미테이션 게임)
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '2', to_date('2015-03-07 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '2', to_date('2015-03-07 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '2', to_date('2015-03-08 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '2', to_date('2015-03-08 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '2', to_date('2015-03-09 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '2', to_date('2015-03-09 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '2', to_date('2015-03-10 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '2', to_date('2015-03-10 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '2', to_date('2015-03-07 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '2', to_date('2015-03-07 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '2', to_date('2015-03-08 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '2', to_date('2015-03-08 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '2', to_date('2015-03-09 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '2', to_date('2015-03-09 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '2', to_date('2015-03-10 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '2', to_date('2015-03-10 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '2', to_date('2015-03-07 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '2', to_date('2015-03-07 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '2', to_date('2015-03-08 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '2', to_date('2015-03-08 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '2', to_date('2015-03-09 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '2', to_date('2015-03-09 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '2', to_date('2015-03-10 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '2', to_date('2015-03-10 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20141962', '2', to_date('2015-03-07 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20141962', '2', to_date('2015-03-07 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20141962', '2', to_date('2015-03-08 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20141962', '2', to_date('2015-03-08 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20141962', '2', to_date('2015-03-09 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20141962', '2', to_date('2015-03-09 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20141962', '2', to_date('2015-03-10 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20141962', '2', to_date('2015-03-10 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));



--군자점 상영영화(스펀지밥, 킹스맨, 빅히어로, 도라에몽)
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '3', to_date('2015-03-07 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '3', to_date('2015-03-07 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '3', to_date('2015-03-08 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '3', to_date('2015-03-08 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '3', to_date('2015-03-09 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '3', to_date('2015-03-09 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '3', to_date('2015-03-10 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149401', '3', to_date('2015-03-10 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '3', to_date('2015-03-07 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '3', to_date('2015-03-07 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '3', to_date('2015-03-08 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '3', to_date('2015-03-08 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '3', to_date('2015-03-09 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '3', to_date('2015-03-09 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '3', to_date('2015-03-10 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20140110', '3', to_date('2015-03-10 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '3', to_date('2015-03-07 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '3', to_date('2015-03-07 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '3', to_date('2015-03-08 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '3', to_date('2015-03-08 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '3', to_date('2015-03-09 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '3', to_date('2015-03-09 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '3', to_date('2015-03-10 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20149951', '3', to_date('2015-03-10 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));

INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20144322', '3', to_date('2015-03-07 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20144322', '3', to_date('2015-03-07 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20144322', '3', to_date('2015-03-08 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20144322', '3', to_date('2015-03-08 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20144322', '3', to_date('2015-03-09 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20144322', '3', to_date('2015-03-09 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20144322', '3', to_date('2015-03-10 06:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO nowmovies (nowmovie_id, movie_code, theater_id, movie_time) VALUES ('', '20144322', '3', to_date('2015-03-10 18:00:00', 'yyyy-mm-dd hh24:mi:ss'));



-- 좌석정보
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
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '1');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '2');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '3');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '4');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '5');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '6');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '7');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '8');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '9');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '10');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '11');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '12');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '13');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '14');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '15');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '16');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '17');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '18');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '19');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '20');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '21');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '22');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '23');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '24');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '25');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '26');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '27');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '28');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '29');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '30');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '31');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '32');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '33');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '34');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '35');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '36');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '37');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '38');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '39');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '40');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '41');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '42');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '43');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '44');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '45');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '46');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '47');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '48');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '49');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '50');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '51');
INSERT INTO seatinfo (seat_id, nowmovie_id, seat_no) VALUES ('', '2', '52');




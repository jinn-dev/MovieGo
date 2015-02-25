-- 회원
INSERT INTO users (user_id, user_pwd, user_email, user_birthday, user_coupon, user_point) VALUES ('a', 'a', 'a@gmail.com', '910326', 'n', '0');
INSERT INTO users (user_id, user_pwd, user_email, user_birthday, user_coupon, user_point) VALUES ('b', 'b', 'b@gmail.com', '911029', 'n', '50');
INSERT INTO users (user_id, user_pwd, user_email, user_birthday, user_coupon, user_point) VALUES ('c', 'c', 'c@gmail.com', '900222', 'n', '100');

-- 극장
INSERT INTO theaters (theater_name) VALUES ('건대점');
INSERT INTO theaters (theater_name) VALUES ('강변점');
INSERT INTO theaters (theater_name) VALUES ('군자점');

-- 영화
INSERT INTO movies (movie_code, movie_title_kr, movie_title_eng, movie_genre, movie_nation, movie_open_date, movie_director, movie_img_url, movie_story, movie_actor1, movie_actor2, movie_actor3, movie_actor4) VALUES ('20149401', '스폰지밥 3D', 'The SpongeBob Movie: Sponge Out of Water', '애니메이션', '미국', '20150218', '폴 티비트', 'http://cfile18.uf.daum.net/C110x160/2128994C54C8915E23B3A9', '비키니 시티의 최고 메뉴 ‘게살 버거’의 특급 레시피가 사라졌다! 레시피를 되찾기 위해 최초로 육.지.상.륙! 비키니 시티의 최고 인기 메뉴 ‘게살 버거’ 어느 날, ‘게살 버거’의 특급 레시피가 사라지자 비키니 시티는 혼란에 빠지게 된다. 스폰지밥과 친구들은 해적 ‘버거수염’에게 특급 레시피가 있다는 사실을 알게 되고 레시피를 되찾기 위해 인간 세상으로 모험을 떠나게 되는데… 마법의 주문으로 거대하고 생생해진 슈퍼 히어로 스폰지밥! 상상 그 이상의 웃음이 넘치는 인간 세상 모험에 흡수된다!', '전태열', '이인성', '최한', '전광주');
INSERT INTO movies (movie_code, movie_title_kr, movie_title_eng, movie_genre, movie_nation, movie_open_date, movie_director, movie_img_url, movie_story, movie_actor1, movie_actor2, movie_actor3, movie_actor4) VALUES ('20140110', '킹스맨 : 시크릿 에이전트', 'Kingsman: The Secret Service', '액션', '미국', '20150211', '매튜 본', 'http://cfile78.uf.daum.net/C110x160/2478DE4B54DABBF02304E0', '세상에서 가장 위험한 면접이 시작된다! 높은 IQ, 주니어 체조대회 2년 연속 우승! 그러나 학교 중퇴, 해병대 중도 하차. 동네 패싸움에 직장은 가져본 적도 없이 별볼일 없는 루저로 낙인 찍혔던 ‘그’가 ‘젠틀맨 스파이’로 전격 스카우트 됐다! 전설적 베테랑 요원 해리 하트(콜린 퍼스)는 경찰서에 구치된 에그시(태런 애거튼)를 구제한다. 탁월한 잠재력을 알아본 그는 에그시를 전설적 국제 비밀정보기구 ‘킹스맨’ 면접에 참여시킨다. 아버지 또한 ‘킹스맨’의 촉망 받는 요원이었으나 해리 하트를 살리기 위해 죽었다는 사실을 알게 된 에그시. 목숨을 앗아갈 만큼 위험천만한 훈련을 통과해야 하는 킹스맨 후보들. 최종 멤버 발탁을 눈 앞에 둔 에그시는 최고의 악당 발렌타인(사무엘 L. 잭슨)을 마주하게 되는데… <엑스맨: 퍼스트 클래스> 감독과 마블 코믹스 인기작가의 만남! 스파이 액션의 새로운 시대가 열린다!', '콜린 퍼스', '태런 애거튼', '사무엘 L. 잭슨', '마이클 케인');
INSERT INTO movies (movie_code, movie_title_kr, movie_title_eng, movie_genre, movie_nation, movie_open_date, movie_director, movie_img_url, movie_story, movie_actor1, movie_actor2, movie_actor3, movie_actor4) VALUES ('20149951', '빅 히어로', 'Big Hero 6', '애니메이션', '미국', '20150121', '돈 할', 'http://cfile17.uf.daum.net/C110x160/240FFE4E54BE8A5937ED74', '천재 공학도 ‘테디’가 개발한 힐링로봇 ‘베이맥스’! ‘테디’의 동생이자 로봇 전문가인 ‘히로’는 도시가 파괴될 위기에 처하자 ‘베이맥스’를 슈퍼히어로로 업그레이드 하는데… 과연 이들은 도시의 위험을 막아낼 수 있을까?', '다니엘 헤니', '라이언 포터', '스캇 애짓', '');
INSERT INTO movies (movie_code, movie_title_kr, movie_title_eng, movie_genre, movie_nation, movie_open_date, movie_director, movie_img_url, movie_story, movie_actor1, movie_actor2, movie_actor3, movie_actor4) VALUES ('20148188', '쎄시봉', 'Cest Si Bon', '멜로/로맨스', '한국', '20150205', '김현석', 'http://cfile16.uf.daum.net/C110x160/26021C4854C764C82BDE41', '한국 포크 음악계의 전설이 된 ‘트윈폴리오’에 제 3의 멤버가 있었다?! 한국 음악계에 포크 열풍을 일으킨 조영남, 이장희, 윤형주, 송창식 등을 배출한 음악감상실 ‘쎄시봉’, 젊음의 거리 무교동 최고의 핫플레이스였던 그곳에서 ‘마성의 미성’ 윤형주와 ‘타고난 음악천재’ 송창식이 평생의 라이벌로 처음 만나게 된다. ‘쎄시봉’ 사장은 이들의 가수 데뷔를 위해 트리오 팀 구성을 제안하고, 자칭 ‘쎄시봉’의 전속 프로듀서 이장희는 우연히 오근태의 중저음 목소리를 듣고 그가 두 사람의 빈틈을 채워줄 ‘숨은 원석’임을 직감한다. 기타 코드조차 제대로 잡지 못하는 ‘통영촌놈’ 오근태는 이장희의 꼬임에 얼떨결에 ‘트리오 쎄시봉’의 멤버로 합류하게 되고 그 시절, 모든 남자들의 마음을 사로잡은 ‘쎄시봉’의 뮤즈 민자영에게 첫눈에 반해 그녀를 위해 노래를 부르기로 결심하는데.... 그 시절, 젊음의 거리 무교동을 주름잡던 음악감상실 ‘쎄시봉’` 모두의 마음을 사로잡은 단 한명의 뮤즈 그리고 잊지 못할 가슴 시린 첫사랑의 기억...', '김윤석', '정우', '김희애', '한효주');
INSERT INTO movies (movie_code, movie_title_kr, movie_title_eng, movie_genre, movie_nation, movie_open_date, movie_director, movie_img_url, movie_story, movie_actor1, movie_actor2, movie_actor3, movie_actor4) VALUES ('20136888', '강남 1970', 'Gangnam Blues', '액션', '한국', '20150121', '유하', 'http://cfile19.uf.daum.net/C110x160/2753B04F54B2AF9F22DA33', '1970년, 강남땅을 향한 위험한 욕망이 춤추기 시작한다! 호적도 제대로 없는 고아로, 넝마주이 생활을 하며 친형제처럼 살던 종대(이민호)와 용기(김래원). 유일한 안식처였던 무허가촌의 작은 판자집마저 빼앗기게 된 두 사람은 건달들이 개입된 전당대회 훼방 작전에 얽히게 되고 그 곳에서 서로를 잃어버린다. “땅 종대, 돈 용기! 끝까지 한번 가 보자!” 3년 후, 자신을 가족으로 받아 준 조직 두목 출신 길수(정진영)의 바람과 달리, 잘 살고 싶다는 꿈 하나로 건달 생활을 하게 되는 종대. 정보와 권력의 수뇌부에 닿아있는 복부인 민마담(김지수)과 함께 강남 개발의 이권다툼에 뛰어든 종대는 명동파의 중간보스가 된 용기와 재회하고, 두 사람은 정치권까지 개입된 의리와 음모, 배신의 전쟁터. 그 한 가운데에 놓이게 되는데…', '이민호', '김래원', '정진영', '설현');
INSERT INTO movies (movie_code, movie_title_kr, movie_title_eng, movie_genre, movie_nation, movie_open_date, movie_director, movie_img_url, movie_story, movie_actor1, movie_actor2, movie_actor3, movie_actor4) VALUES ('20137048', '국제시장', 'Ode to My Father', '드라마', '한국', '20141217', '윤제균', 'http://cfile76.uf.daum.net/C110x160/2502AF49546B09E61FB5F1', '1950년 한국전쟁을 지나 부산으로 피란 온 ‘덕수’(황정민 분)의 다섯 식구, 전쟁 통에 헤어진 아버지를 대신해야 했던 ‘덕수’는 고모가 운영하는 부산 국제시장의 수입 잡화점 ‘꽃분이네’서 일하며 가족의 생계를 꾸려 나간다. 모두가 어려웠던 그때 그 시절, 남동생의 대학교 입학 등록금을 벌기 위해 이역만리 독일에 광부로 떠난 ‘덕수’는 그곳에서 첫사랑이자 평생의 동반자 ‘영자’(김윤진 분)를 만난다. 그는 가족의 삶의 터전이 되어버린 ‘꽃분이네’ 가게를 지키기 위해 ‘선장’이 되고 싶었던 오랜 꿈을 접고 다시 한번 전쟁이 한창이던 베트남으로 건너가 기술 근로자로 일하게 되는데… 가족을 위해 굳세게 살아온 그때 그 시절, 가장 평범한 아버지의 가장 위대한 이야기가 시작된다!', '황정민', '김윤진', '오달수', '정진영');
INSERT INTO movies (movie_code, movie_title_kr, movie_title_eng, movie_genre, movie_nation, movie_open_date, movie_director, movie_img_url, movie_story, movie_actor1, movie_actor2, movie_actor3, movie_actor4) VALUES ('20149570', '조선명탐정 : 사라진 놉의 딸', 'Detective K: Secret of the Lost Island', '사극', '한국', '20150211', '김석윤', 'http://cfile118.uf.daum.net/C110x160/265E384954AE4C3003AB6B', '우리가 또 나설 차례인가! 정조 19년. 한때는 왕의 밀명을 받던 특사였으나 무슨 이유인지 왕에게 미운 털이 박혀 외딴 섬에 유배되어 버린 조선 제일의 명탐정 김민. 찾아오는 이라곤 지난 날 함께 했던 파트너 서필과 매일 같이 동생을 찾아달라며 오는 어린 소녀뿐이다. 그러던 중 김민은 조선 전역에 불량은괴가 유통되고 있다는 소식을 접하게 되고, 이로 인해 잠자고 있던 탐정 본능이 꿈틀거리기 시작한다. 결국 유배지 이탈이라는 초강수를 두며 불량은괴 유통사건과 행방불명 된 소녀의 동생을 찾기 위해 본격 수사에 착수하게 된다. 사상 최초로 동시에 두 사건 해결에 나선 조선 명탐정 김민과 서필! 그러나 정체를 알 수 없는 미모의 여인 히사코로 인해 명콤비의 수사는 더욱 혼선을 빚는다. 과연 이들은 의문의 두 사건을 해결하고, 화려한 옛 영광을 되찾을 수 있을까? 조선 제일의 명탐정 콤비, 김민과 서필이 돌아왔다! “위기의 조선. 우리에게 한번 더 맡겨보시지요!”', '김명민', '오달수', '', '');


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
-- 회원
INSERT INTO users (user_id, user_pwd, user_email, user_birthday, user_coupon, user_point) VALUES ('a', '1', 'a', '', 'n', '0');
INSERT INTO users (user_id, user_pwd, user_email, user_birthday, user_coupon, user_point) VALUES ('b', '1', 'b', '', 'n', '0');


-- 게시판
INSERT INTO customerboards (user_id, board_title, board_content) VALUES ('a', '테스트중2', '내용 불러오기 성공2');


-- 댓글
INSERT INTO comments (board_id, user_id, comment_content) VALUES ('2', 'a', 'hihi');
INSERT INTO comments (board_id, user_id, comment_content) VALUES ('2', 'a', 'hello');



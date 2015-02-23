package com.mvg.dao;

import java.util.List;

import com.mvg.entity.SeatInfo;

public interface SeatInfoDao {
	
	//모든 좌석 정보의 수
	int getAllSeatInfoCount();
	
	//모든 좌석 정보 얻어오기
	List<SeatInfo> getAllSeatInfo();
	
	//좌석 정보 추가
	int insertSeatInfo(SeatInfo seatInfo);
	
	//좌석 정보 수정
	int updateSeatInfo(SeatInfo seatInfo);
	
	//좌석 정보 삭제
	int deleteSeatInfo(int seatId);
	
	//좌석 정보 하나 얻어오기
	SeatInfo getSeatInfoBySeatId(int seatId);
	
	//상영하는영화의 좌석정보
	List<SeatInfo> getSeatInfoByNMovieId(int nowmovieId);
	
	//nowmovieId와 좌석이름으로 좌석mapping-> seatid반환
	int getSeatId(int nowmovieId, String seatName);
	
	//좌석을 다시 이름으로
	String getSeatName(int seatId);
	
}
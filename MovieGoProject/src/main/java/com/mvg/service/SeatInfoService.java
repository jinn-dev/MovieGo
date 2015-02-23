package com.mvg.service;

import java.util.List;

import com.mvg.entity.SeatInfo;

public interface SeatInfoService {

	// 모든 좌석 정보의 수
	int getAllSeatInfoCntService();

	// 모든 좌석 정보 얻어오기
	List<SeatInfo> getAllSeatInfoService();

	// 좌석 정보 추가
	int insertSeatInfoService(SeatInfo seatInfo);

	// 좌석 정보 수정
	int updateSeatInfoService(SeatInfo seatInfo);

	// 좌석 정보 삭제
	int deleteSeatInfoService(int seatId);

	// 좌석 정보 하나 얻어오기
	SeatInfo getSInfoBySIdService(int seatId);

	// 상영하는영화의 좌석정보
	List<SeatInfo> getSInfoByNMovieIdService(int nowmovieId);

	//nowmovieId와 좌석이름으로 좌석mapping-> seatid반환
	int getSeatIdService(int nowmovieId, String seatName);
	
	//다시 좌석이름으로
	String getSeatNameService(int seatId);

}

package com.mvg.dao;

import java.util.List;

import com.mvg.entity.ReservationInfo;

public interface ReservationInfoDao {
	
	//모든 디테일개수
	int getAllReservationInfoCount();
	
	//모든 디테일가져오기
	List<ReservationInfo> getAllReservationInfo();
	
	//reservationId로 가져오기
	List<ReservationInfo> getReservationInfoByRId(int reservationId);
	
	//seatId로 가져오기
	ReservationInfo getReservationInfoBySeatId(int seatId);
	
	//디테일 추가
	int insertReservationInfo(ReservationInfo reservationInfo);
	
	//디테일 삭제
	int deleteReservationInfo(int reservationId);
	
}

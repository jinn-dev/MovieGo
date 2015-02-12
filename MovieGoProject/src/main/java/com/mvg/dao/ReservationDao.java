package com.mvg.dao;

import java.util.List;

import com.mvg.entity.Reservation;

public interface ReservationDao {

	//모든 예약의 수 얻어오기
	int getAllReservationCount();
	
	//모든 예약 가져오기
	List<Reservation> getAllReservations();
	
	//예약에 예약정보 붙이기는 impl안에서 할것
	
	//모든 예약에 예약정보 붙인거 가져오기
	List<Reservation> getAllReservationsWithInfo();

	//예약 정보 없는 예약 하나 가져오기
	Reservation getReservationByRId(int reservationId);
	
	//예약 정보 붙인 예약 하나 가져오기
	Reservation getReservationByRIdWithInfo(int reservationId);
	
	//회원별 예약정보 
	List<Reservation> getReservationByUserId(String userId);
	
	//회원별 예약+정보붙인거
	List<Reservation> getReservationByUserIdWithInfo(String userId);
	
	//예약 추가
	int insertReservation(Reservation reservation);
	
	//예약 삭제
	int deleteReservation(int reservationId);
	
}

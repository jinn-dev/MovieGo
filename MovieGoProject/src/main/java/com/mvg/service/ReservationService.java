package com.mvg.service;

import java.util.List;

import com.mvg.entity.Reservation;

public interface ReservationService {

	//모든 예약의 수 
	public int getAllRCntService();
	
	//모든 예약 얻어오기
	public List<Reservation> getAllRService();
	
	//모든 예약+예약정보 얻어오기
	public List<Reservation> getAllRWithInfoService();
	
	//예약 아이디로 예약 조회
	public Reservation getRByRIdService(int reservationId);
	
	//예약 아이디로 예약+예약정보 조회
	public Reservation getRByRIdWithInfoService(int reservationId);
	
	//회원 아이디로 예약 조회
	public List<Reservation> getRByUserIdService(String userId);
	
	//회원 아이디로 예약+예약정보 조회
	public List<Reservation> getRByUserIdWithInfoService(String userId);
	
	//예약 추가
	public int insertRService(Reservation reservation);
	
	//예약 삭제
	public int deleteRService(int reservationId);
}

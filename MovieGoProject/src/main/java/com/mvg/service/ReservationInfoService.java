package com.mvg.service;

import java.util.List;

import com.mvg.entity.ReservationInfo;

public interface ReservationInfoService {
	// 모든 디테일개수
	int getAllRInfoCntService();

	// 모든 디테일가져오기
	List<ReservationInfo> getAllRInfoService();

	// reservationId로 가져오기
	List<ReservationInfo> getRInfoByRIdService(int reservationId);

	// seatId로 가져오기
	ReservationInfo getRInfoBySeatIdService(int seatId);

	// 예약된좌석 가져오기
	List<ReservationInfo> getRInfoByNMIdService(int nowmovieId);

	// 디테일 추가
	int insertRInfoService(ReservationInfo reservationInfo);

	// 디테일 삭제
	int deleteRInfoService(int reservationId);

}

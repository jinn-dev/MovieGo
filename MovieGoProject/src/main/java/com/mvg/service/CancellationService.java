package com.mvg.service;

import java.util.List;

import com.mvg.entity.Cancellation;

public interface CancellationService {

	// 모든 취소내역의 수
	// int getAllCancelCntService();

	// 모든 취소내역 얻어오기
	// List<Cancellation> getAllCancelService();

	// 하나의 취소내역 얻어오기
	// Cancellation getCancelByCId(int cancelId);

	// 아이디별 취소내역
	List<Cancellation> getCancelByUserIdService(String userId);

	// 좌석별 취소내역
	// List<Cancellation> getCancelBySeatIdService(int seatId);

	// 취소 추가
	int insertCancelService(Cancellation cancellation);
}

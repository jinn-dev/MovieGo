package com.mvg.dao;

import java.util.List;

import com.mvg.entity.Cancellation;

public interface CancellationDao {
	
	//모든 취소내역의 수
	//int getAllCancellationCount();
	
	//모든 취소내역 얻어오기
	//List<Cancellation> getAllCancellations();
	
	//하나의 취소내역 얻어오기
	//Cancellation getCancellationByCancelId(int cancelId);
	
	//아이디별 취소내역
	List<Cancellation> getCancellationByUserId(String userId);
	
	//좌석별 취소내역
	//List<Cancellation> getCancellationBySeatId(int seatId);
	
	// 취소 추가
	int insertCancellation(Cancellation cancellation);
	
}

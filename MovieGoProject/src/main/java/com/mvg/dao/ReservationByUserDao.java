package com.mvg.dao;

import java.util.List;

import com.mvg.entity.ReservationByUser;

public interface ReservationByUserDao {

	List<ReservationByUser> getAllRByUserId(String userId);
	
	ReservationByUser getAllRByRId(int reservationId);
	
	int cancelYN(String movieTime);
}

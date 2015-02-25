package com.mvg.service;

import java.util.List;

import com.mvg.entity.ReservationByUser;

public interface ReservationByUserService {
	
	List<ReservationByUser> getAllRByUIdService(String userId);
	
	int cancelYNService(String movieTime);
	
	ReservationByUser getAllRByRIdService(int reservationId);
	
}

package com.mvg.service;

import java.util.List;

import com.mvg.entity.ReservationByUser;

public interface ReservationByUserService {
	
	List<ReservationByUser> getAllRByUIdService(String userId);
	
	public int cancelYNService(String movieTime);
	
}

package com.mvg.service;

import java.util.List;

import com.mvg.entity.CancellationByUser;

public interface CancellationByUserService {

	List<CancellationByUser> getCListByUIdService(String userId);
	
}

package com.mvg.dao;

import java.util.List;

import com.mvg.entity.CancellationByUser;

public interface CancellationByUserDao {

	List<CancellationByUser> getCListByUserId(String userId);
}

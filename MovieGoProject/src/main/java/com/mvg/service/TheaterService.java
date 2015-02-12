package com.mvg.service;

import java.util.List;

import com.mvg.entity.Theater;

public interface TheaterService {
	// 모든 극장의 수 얻어오기
	Integer getTheaterCntService();

	// 모든 극장 얻어오기
	List<Theater> getAllTheatersService();

	// 극장 추가
	int insertTheaterService(Theater theater);

	// 극장 수정
	int updateTheaterService(Theater theater);

	// 극장 삭제
	int deleteTheaterService(int theaterId);

	// 하나의 극장 불러오기
	Theater getTheaterByIdService(int theaterId);

	Theater getTheaterByNameService(String theaterName);
}

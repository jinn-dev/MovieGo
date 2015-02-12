package com.mvg.dao;

import java.util.List;

import com.mvg.entity.Theater;

public interface TheaterDao {
	//모든 극장의 수 얻어오기
	Integer getTheaterCount();
	
	//모든 극장 얻어오기
	List<Theater> getAllTheaters();
	
	//극장 추가
	int insertTheater(Theater theater);
	
	//극장 수정
	int updateTheater(Theater theater);
	
	//극장 삭제
	int deleteTheater(int theaterId);
	
	//하나의 극장 불러오기
	Theater getTheaterById(int theaterId);
	
	Theater getTheaterByName(String theaterName);
	
}

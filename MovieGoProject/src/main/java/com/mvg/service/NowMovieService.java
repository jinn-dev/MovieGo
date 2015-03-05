package com.mvg.service;

import java.util.List;
import java.util.Map;

import com.mvg.entity.Movie;
import com.mvg.entity.NowMovie;

public interface NowMovieService {
	// 현재 상영중인 영화의 수
	int getAllNMovieCntService();

	// 상영중인 영화 모두 얻어오기
	List<NowMovie> getAllNMoviesService();

	// 영화별 상영영화 얻어오기
	List<NowMovie> getNMovieByMCodeService(String movieCode);
	
	//상영영화이름
	Map<String, String> getAllNMovieNamesService(int theaterId);
	
	//영화관, 영화로 상영시간 얻어오기
	List<String> getNMovieTimeByThAndMovieService(int theaterId, String movieCode);
	
	//상영영화아이디얻어오기
	public int getNMovieIdByNMovieService(int theaterId, String movieCode, String movieTime);
	
	//영화시간이쁘게
	public String getMTimeAmPmService(String movieTime);
	
	// 상영하려는 영화 추가
	int insertNMovieService(Movie movie);

	// 상영중인 영화 수정
	int updateNMovieService(Movie movie);

	// 상영 종료 영화 삭제
	int deleteNMovieService(String movieCode);
	
	//예매하기 버튼 생성하기 위해 현재 상여중인 영화인지 구별
	List<NowMovie> getAllDistictNowMovieCodes();
}

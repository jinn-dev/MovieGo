package com.mvg.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvg.entity.SeatInfo;

@Repository
public class SeatInfoDaoImpl implements SeatInfoDao {

	
	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(SeatInfoDaoImpl.class);
	}
	
	private final String namespace = "com.mvg.mappers.seatinfoMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getAllSeatInfoCount() {
		String stmt = namespace + "getAllSeatInfoCount";
		int cnt = sqlSession.selectOne(stmt);
		return cnt;
	}

	@Override
	public List<SeatInfo> getAllSeatInfo() {
		String stmt = namespace + "getAllSeatInfo";
		List<SeatInfo> seats = sqlSession.selectList(stmt);
		return seats;
	}

	@Override
	public int insertSeatInfo(SeatInfo seatInfo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateSeatInfo(SeatInfo seatInfo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSeatInfo(int seatId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public SeatInfo getSeatInfoBySeatId(int seatId) {
		String stmt = namespace + "getSeatInfoBySeatId";
		SeatInfo seat = sqlSession.selectOne(stmt, seatId);
		return seat;
	}

	@Override
	public List<SeatInfo> getSeatInfoByNMovieId(int nowmovieId) {
		String stmt = namespace + "getSeatInfoByNMovieId";
		List<SeatInfo> seats = sqlSession.selectList(stmt, nowmovieId);
		return seats;
	}

}

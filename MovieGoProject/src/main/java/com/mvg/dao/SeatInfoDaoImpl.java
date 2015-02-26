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

	@Override
	public int getSeatId(int nowmovieId, String seatName) {
		SeatInfo si = new SeatInfo();
		si.setNowmovieId(nowmovieId);
		String row = seatName.substring(0,1);
		String num = seatName.replace(row, "");
		int seatNo = Integer.parseInt(num);
		if (row.equals("A")) {
			seatNo += (13*0);
		}
		else if (row.equals("B")) {
			seatNo += (13*1);
		}
		else if (row.equals("C")) {
			seatNo += (13*2);
		}
		else if (row.equals("D")) {
			seatNo += (13*3);
		}
		SeatInfo sinfo = new SeatInfo();
		sinfo.setNowmovieId(nowmovieId);
		sinfo.setSeatNo(seatNo);
		String stmt = namespace + "getSeatId";
		int seatId = sqlSession.selectOne(stmt, sinfo);
		logger.trace("결과"+seatId);
		return seatId;
	}

	@Override
	public String getSeatName(int seatId) {
		String[] row = {"A", "B", "C", "D"};
		String seatName = "";
		int sid = seatId;
		for (int i=0;i<row.length;i++) {
			if (seatId/14==i) {
				seatName = row[i];
				sid = sid-(13*i);
			}
		}
		seatName = seatName.concat(Integer.toString(sid));
		return seatName;
	}
}

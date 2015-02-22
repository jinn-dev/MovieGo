package com.mvg.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvg.controller.MyPageController;
import com.mvg.entity.Evaluation;

@Repository
public class EvaluationDaoImpl implements EvaluationDao {
	private final static Logger logger;
	static {
		logger = LoggerFactory.getLogger(EvaluationDaoImpl.class);
	}
	
	private final String namespace = "com.mvg.mappers.evaluationMapper.";
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public int getAllEvaluationCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Evaluation> getAllEvaluations() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Evaluation> getEvaluationByUserId(String userId) {
		String stmt = namespace + "selectEvaluationById";
		List<Evaluation> result = sqlSession.selectList(stmt, userId);
		return result;
	}

	@Override
	public List<Evaluation> getEvaluationByMovieCode(String movieCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertEvaluation(Evaluation evaluation) {
		int result = -1;
		String stmt = namespace + "insertEvaluation";
		result = sqlSession.insert(stmt, evaluation);
		return result;
	}

	@Override
	public int deleteEvaluation(int evId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateEvaluation(Evaluation evaluation) {
		int result = -1;
		String stmt = namespace + "updateEvaluation";
		result = sqlSession.update(stmt, evaluation);
		return result;
	}

	@Override
	public int selectEvaluationByMovieCode(String movieCode, String userId) {
		
		String stmt = namespace + "selectEvaluationByMovieCode";
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("movieCode", movieCode);
		map.put("userId", userId);
		int result = sqlSession.selectOne(stmt, map);
		
		return result;
	}

	@Override
	public int updateRating(Evaluation evaluation) {
		int result = -1;
		String stmt = namespace + "updateRating";
		result = sqlSession.update(stmt, evaluation);
		return result;
	}

	@Override
	public int selectEvId(String movieCode, String userId) {
		String stmt = namespace + "selectEvId";
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("movieCode", movieCode);
		map.put("userId", userId);
		int result = sqlSession.selectOne(stmt, map);
		return result;
	}

}

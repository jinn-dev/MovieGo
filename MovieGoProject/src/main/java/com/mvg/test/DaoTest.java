package com.mvg.test;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.mvg.dao.CustomerBoardDao;
import com.mvg.dao.MovieDao;
import com.mvg.dao.NowMovieDao;

public class DaoTest {

	private static final Logger logger = LoggerFactory.getLogger(DaoTest.class);
	
	public static void main(String[] args) {
		ApplicationContext ctx = new GenericXmlApplicationContext("/spring/application-config.xml");
		
		SqlSessionTemplate temp = ctx.getBean(SqlSessionTemplate.class);
		logger.trace("temp: " + temp);
		
		DataSource source = ctx.getBean(DataSource.class);
		logger.trace("dataSource: " + source);
		
		CustomerBoardDao dao = ctx.getBean(CustomerBoardDao.class);
		logger.trace("모든 글 불러오기"+dao.getAllBoard());
		
		MovieDao dao2 = ctx.getBean(MovieDao.class);
		logger.trace("수업: 모든영화 불러오기 "+dao2.getAllMovies());
	}
}

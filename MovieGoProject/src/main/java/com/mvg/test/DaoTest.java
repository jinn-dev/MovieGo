package com.mvg.test;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.mvg.dao.CustomerBoardDao;

public class DaoTest {

	private static final Logger logger = LoggerFactory.getLogger(DaoTest.class);
	
	public static void main(String[] args) {
		ApplicationContext ctx = new GenericXmlApplicationContext("application-config.xml");
		SqlSessionTemplate temp = ctx.getBean(SqlSessionTemplate.class);
		CustomerBoardDao dao = ctx.getBean(CustomerBoardDao.class);
		logger.trace("모든 글 불러오기"+dao.getAllBoard());
	}
}

package com.mvg.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class InterCeptor extends HandlerInterceptorAdapter {
	
	 @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	        try {
	        	// user 세션 null 일 경우 로그인 페이지로 이동
	            if(request.getSession().getAttribute("user") == null ){
	                    response.sendRedirect(request.getContextPath()+"/main"); 
	                    return false;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        //user 세션 존재시 정상적으로 컨트롤러 호출
	        return true;
	    }
	 
}

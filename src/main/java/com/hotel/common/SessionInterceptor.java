package com.hotel.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.edu.mapper.RoomMapper;
import com.hotel.vo.Room;

public class SessionInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession(false);
		String userid = (session != null)? (String) session.getAttribute("user_id") : null;
		
		if (session != null && userid != null) {
			if (userid.equals("sanghoon")) return true;
		}
		
		response.sendRedirect(request.getContextPath() + "/login_form" );
		return false;
		
	}

	
	
}

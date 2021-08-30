package com.hotel.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptor extends HandlerInterceptorAdapter {

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

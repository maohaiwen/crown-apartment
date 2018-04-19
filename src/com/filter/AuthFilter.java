package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Users;

public class AuthFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		HttpSession session = request.getSession();
		
		String uri = request.getRequestURI();
		
		if((uri.contains(".js") && !uri.contains(".jsp")) || uri.contains(".css") || uri.contains(".jpg") || uri.contains(".png")){
			chain.doFilter(request, response);
			return;
		}
		
		Users user = (Users) session.getAttribute("user");
		
		if(uri.endsWith("/admin/login.jsp") || uri.endsWith("/admin/dologin.jsp")){
			chain.doFilter(request, response);
			return;
		}
		
		if(uri.contains("/admin/")){
			if (user != null){
				chain.doFilter(request, response);
				return;
			}else{
				response.sendRedirect("/crown-department/admin/login.jsp");
			}
		}else{
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}

package com.springbootjsp.filter;

import org.springframework.core.annotation.Order;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@Order(1)
//@WebFilter(filterName = "LoginFilter", urlPatterns = "/*" )
//public class LoginFilter implements Filter {
//	@Override
//	protected void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain) {
//		String path = req.getServletPath();
//		path = path.substring(1);
//
//		//没有权限访问的页面
//		String noAuthority = getFilterConfig().getInitParameter("noAuthority");
//
//		String[] noAuthorityArray = noAuthority.split(",");
//		HttpSession session = req.getSession();
//		for (String str : noAuthorityArray) {
//			if (str.equals(path)) {
//				try {//如果是没有设置访问权限的路径，则调用下一个过滤器
//					chain.doFilter(req, resp);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		}
//
//		try {
//			Object user = req.getSession().getAttribute("user");
//			if (user != null) {//如果用户已经登录
//				chain.doFilter(req, resp);
//			}else {
//				resp.sendRedirect("/");
//				return;
//			}
//		}catch (Exception e){
//			e.printStackTrace();
//		}
//
//	}
//
//	@Override
//	protected void init() {
//
//	}
//
//	@Override
//	public void init(FilterConfig filterConfig) throws ServletException {
//
//	}
//
//	@Override
//	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
//
//	}
//
//	@Override
//	public void destroy() {
//
//	}
////}
@Order(1)
@WebFilter(filterName = "LoginFilter", urlPatterns = "/*" )
public class LoginFilter implements Filter{

	//排除不拦截的url
	private static final String[] excludePathPatterns = { "/login","logout","loginView","registerView","register","static/"};

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;

		// 获取请求url地址，不拦截excludePathPatterns中的url
		String url = req.getRequestURI();
		for (String excludePathPattern : excludePathPatterns) {
			if(url.contains(excludePathPattern)|| url.equals("/")) {
				//放行，相当于第一种方法中LoginInterceptor返回值为true
				chain.doFilter(request, response);
			}
		}

		try {
			Object user = req.getSession().getAttribute("user");
			if (user != null) {//如果用户已经登录
				chain.doFilter(req, res);
			}else {//当前用户不存在返回首页
				res.sendRedirect("/");
				return;
			}
		}catch (Exception e){

		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}

}
package www.zhizunbao.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import www.zhizunbao.dto.manage.Manage;

public class ZhiZunBaoInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//super.preHandle(request, response, handler);
		boolean flag=false;
		Manage man = (Manage) request.getSession().getAttribute("man");
		if(null!=man){
			flag=true;
		}else{
			String msg="登录超时请重新登录";
			request.setAttribute("error", msg);
			request.getRequestDispatcher("/adminLogin/toLogin").forward(request, response);
		}
		return flag;
	}
	
	
	
}

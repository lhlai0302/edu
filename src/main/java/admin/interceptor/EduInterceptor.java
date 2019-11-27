package admin.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

public class EduInterceptor implements HandlerInterceptor {

    //除了注册和登录页面，进入其他页面之前，检查session是否有userId值
    //若为空，则返回登录页
    private static final String[] IGNORE_URI ={"/login","/register","/index"};

    public void afterCompletion(
            HttpServletRequest request,HttpServletResponse response,
            Object handler, Exception ex)throws Exception {
    }

    public void postHandle(
            HttpServletRequest request, HttpServletResponse response,
            Object handler,	ModelAndView mv) throws Exception {
        String user = ""+ request.getSession().getAttribute("user");
        if(user == null) {
            System.out.println("登录才能访问");
        }
        else{
            System.out.println(user);
        }
    }

    public boolean preHandle(
            HttpServletRequest request, HttpServletResponse response,
            Object handler)	throws Exception {
        boolean flag = false;
        //获取请求的路径进行判断
        String servletPath = request.getServletPath();
        String userId = ""+request.getSession().getAttribute("userId");
        // 判断请求是否需要拦截
        for (String s : IGNORE_URI) {
            if (servletPath.contains(s)) {
                flag = true;
                break;
            }
        }
        if (!flag){
            if(userId == null){
                response.sendRedirect("index.jsp");
            }
            else{
                flag = true;
            }
        }
        return flag;
    }
}

package CCTV.Tmall.Interceptor;

import CCTV.Tmall.Service.CategoryService;


import CCTV.Tmall.Service.OrderItemService;
import CCTV.Tmall.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;

import java.io.IOException;
import java.util.Arrays;


public class LoginInterceptor extends HandlerInterceptorAdapter {
    @Autowired
    CategoryService categoryService;
    @Autowired
    OrderItemService orderItemService;

    /**
     * 在业务处理器处理请求之前被调用
     * 如果返回false
     *     从当前的拦截器往回执行所有拦截器的afterCompletion(),再退出拦截器链
     * 如果返回true
     *    执行下一个拦截器,直到所有的拦截器都执行完毕
     *    再执行被拦截的Controller
     *    然后进入拦截器链,
     *    从最后一个拦截器往回执行所有的postHandle()
     *    接着再从最后一个拦截器往回执行所有的afterCompletion()
     */
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {

        HttpSession session = request.getSession();
        //得到servlet的上下文的路径：http://localhost:8888/tmall_ssm/forehome   就是项目名tmall_ssm
        String contextPath = session.getServletContext().getContextPath();
        //不需要登录就可以浏览的
        String[] noNeedAuthPage = new String[]{
                "home", "checkLogin", "Register", "loginAjax", "login", "product", "category", "search"
        };
        //返回包含工程名的当前页面全路径，eg:/XXXXX/course/index.jsp===》/course/index.jsp
        //idea里设置tomcat里面的deployment的application context就是设置/tmall_ssm的
        String uri = request.getRequestURI();
        //3 去掉前缀/tmall_ssm
        uri = StringUtils.remove(uri, contextPath);
        //4 如果访问的地址是/fore开头。 判断uri是否是fore开头
        if (uri.startsWith("/fore")) {
            //4.1 取出fore后面的字符串，比如是forecart,那么就取出cart
            //对uri的开头/fore进行分割
            String method = StringUtils.substringAfterLast(uri, "/fore");
            //4.2 判断cart是否是在noNeedAuthPage,如果不在，那么就需要进行是否登录验证
            //当得到的字符method，不存在在noNeedAuthPage数组里面，则说明需要进行登录验证
            //数组里面都是不需要登录验证的字符。
            if (!Arrays.asList(noNeedAuthPage).contains(method)) {
                //4.3 从session中取出“user”对象
                User user = (User) session.getAttribute("user");
                if (null == user) {
                    //4.4 如果对象不存在，就客户端跳转到login.jsp上
                    response.sendRedirect("loginPage");
                    return false;
                }
            }
        }

        return true;
    }

    /**
     * 在业务处理器处理请求执行完成后,生成视图之前执行的动作
     * 可在modelAndView中加入数据，比如当前时间
     */
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {

    }


    /**
     * 在DispatcherServlet完全处理完请求后被调用,可用于清理资源等
     * <p>
     * 当有拦截器抛出异常时,会从当前拦截器往回执行所有的拦截器的afterCompletion()
     */
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {

    }
}

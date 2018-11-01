package CCTV.Tmall.Filter;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EncodingFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        /*ServletRequest 类型的，不支持setCharacterEncoding，所以要先强制转换为HttpServletRequest*/
        HttpServletRequest request2 = (HttpServletRequest) request;
        HttpServletResponse response2 = (HttpServletResponse) response;

        request2.setCharacterEncoding("UTF-8");
        chain.doFilter(request2,response2);
    }

    @Override
    public void destroy() {

    }
}

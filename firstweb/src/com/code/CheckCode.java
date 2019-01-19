package com.code;

/**
 * Created by 94888 on 2019/1/2.
 */
        import java.io.IOException;
        import java.io.PrintWriter;
        import javax.servlet.ServletException;
        import javax.servlet.annotation.WebServlet;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import javax.servlet.http.HttpSession;

//https://github.com/mrsevent/StudentInfo.git
@WebServlet("/checkCode")
public class CheckCode extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String sessionCode = request.getSession().getAttribute("code").toString();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        if (code != null && !"".equals(code) && sessionCode != null && !"".equals(sessionCode)) {
            if (code.equalsIgnoreCase(sessionCode)) {
                System.out.println("sessionCode="+sessionCode+"并1且"+"code="+code);
                out.print("正确！");
                out.flush();
            } else {
                System.out.println("sessionCode="+sessionCode+"并2且"+"code="+code);
                out.print("错误！");
                out.flush();
            }
        }else {
            System.out.println("sessionCode="+sessionCode+"并3且"+"code="+code);
            out.print("空！");
            out.flush();
        }
    }

}
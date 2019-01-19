package com.servlet;

import com.Dao.NewsDao;
import com.Dao.impl.NewsDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by 94888 on 2019/1/3.
 */
public class registerServlet extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException,IOException{
        doPost(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException,IOException{
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String telephone = request.getParameter("telephone");
        NewsDao newsDao = new NewsDaoImpl();
        response.setContentType("text/html;charset=utf-8");
        if(id == null){
            System.out.println("id不能为空！");
            response.getWriter().print("id不能为空！");
        }else{
            if (newsDao.getPart(id)){
                response.getWriter().print("用户名已存在！");
                response.setHeader("refresh","1;url=http://localhost:8080/hello/login.jsp");
            }else{
                newsDao.add(id, password,gender,telephone);
                response.getWriter().print("注册成功！");
                response.setHeader("refresh","1;url=http://localhost:8080/hello/login.jsp");
            }
        }
    }
}

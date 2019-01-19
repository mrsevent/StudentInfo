package com.servlet;

import com.Dao.BaseDao;
import com.Dao.NewsDao;
import com.Dao.impl.NewsDaoImpl;
import com.entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by 94888 on 2019/1/17.
 */
public class editStudentInfoServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //修改
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String id = null;
        HttpSession httpSession = req.getSession();
        id = httpSession.getAttribute("id").toString();
        String password = req.getParameter("password");
        String gender = req.getParameter("gender");
        String telephone = req.getParameter("telephone");
        NewsDao newsDao = new NewsDaoImpl();
        newsDao.update(id,password,gender,telephone);
        //查询
        PrintWriter out = resp.getWriter();
        resp.setHeader("refresh","0;url=http://localhost:8080/hello/vatuu/StudentinfoEdit.jsp");

    }
}

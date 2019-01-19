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
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by 94888 on 2019/1/5.
 */
public class loginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String id = req.getParameter("id");
        String password = req.getParameter("password");
        String dbpassword = null;
        NewsDao newsDao = new NewsDaoImpl();
        ResultSet rs = newsDao.getAll(id);
        User user = new User();
        HttpSession session = req.getSession();
        try {
            if(rs.next()){
                dbpassword = rs.getString("password");
                rs.previous();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        user.setId(id);
        user.setPassword(dbpassword);
        resp.setContentType("text/html;charset=UTF-8");//服务器发给客户端的是以utf-8编码，所以要告诉客户端以utf-8解码才不乱码
        if (!newsDao.getPart(id)){
            resp.getWriter().print("用户名不存在！");
            resp.setHeader("refresh","1;url=http://localhost:8080/hello/login.jsp");
        }else{
            try{
                if (rs.next()){
                    if(password.equals(user.getPassword())){
                        resp.getWriter().print("登录成功！");
                        session.setAttribute("id",user.getId());
                        session.setAttribute("password",user.getPassword());
//                        resp.setContentType("ISO-8859-1");//客户端以ISO-8859-1编码，所以客户端以utf-8解码会乱码，所以要改变编码方式
                        req.getRequestDispatcher("index.jsp").forward(req,resp);
                    }else{
                        resp.getWriter().print("密码不正确！");
                        resp.setHeader("refresh","2;url=http://localhost:8080/hello/login.jsp");
                    }
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
    }
}

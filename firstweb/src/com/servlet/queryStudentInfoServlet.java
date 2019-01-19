package com.servlet;

import com.Dao.BaseDao;
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
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

/**
 * Created by 94888 on 2019/1/12.
 */
public class queryStudentInfoServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = null;
        String password = null;
        String gender = null;
        String telephone = null;
        HttpSession httpSession = req.getSession();
        id = httpSession.getAttribute("id").toString();
        NewsDaoImpl newsDaoImpl = new NewsDaoImpl();
        ResultSet resultSet = null;
        User user = new User();
        resp.setCharacterEncoding("utf-8");
        try{
            resultSet = newsDaoImpl.getAll(id);
//            ResultSetMetaData rsmd = resultSet.getMetaData();
            if (resultSet.next()){
//                for(int i = 1; i <= rsmd.getColumnCount();i++){
//                    String colname = rsmd.getColumnName(i);
//                    String colvalue = resultSet.getString(i);
//                    System.out.println(colname+"="+colvalue);
//                }
                password = resultSet.getString("password");
                gender = resultSet.getString("gender");
                telephone = resultSet.getString("telephone");
            }
            user.setId(id);
            user.setPassword(password);
            PrintWriter out = resp.getWriter();
            out.print("?id="+id+"?password="+password+"?gender="+gender+"?telephone="+telephone);
            out.flush();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

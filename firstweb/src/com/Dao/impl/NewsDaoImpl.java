package com.Dao.impl;

import com.Dao.BaseDao;
import com.Dao.NewsDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by 94888 on 2019/1/4.
 */
public class NewsDaoImpl extends BaseDao implements NewsDao {
    Connection cnt = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public ResultSet getAll(String id){
        String sql = "select * from studentinfo where id = ?";
        Object[] params = {id};
        rs = executeQuery(sql,params);
        return rs;
    }
    public ResultSet getPassword(String id){
        String sql = "select password from studentinfo where id = ?";
        Object[] params = {id};
        rs = executeQuery(sql,params);
        return rs;
    }
    public boolean getPart(String id){
        String sql = "select id from studentinfo where id = ?";
        Object[] params = {id};
        try{
            if(this.executeQuery(sql,params).next()){
                return true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }
    public void add(String id,String password,String gender,String telephone){
        if(id == null){
            System.out.println("id不能为空，添加失败！");
        }else {
            String sql = "insert into studentinfo (id,password,gender,telephone)values(?,?,?,?)";
            Object[] params = {id, password,gender,telephone};
            int i = this.executeUpdate(sql, params);
            if (i > 0) {
                System.out.println("添加成功！");
            }
        }
    }
    public void delete(){
    }
    public void update(String id,String password,String gender,String telephone){
        String sql = "update studentinfo set password = ? , gender = ? , telephone = ? where id = ?";
        Object[] params = {password,gender,telephone,id};
        int i = this.executeUpdate(sql,params);
        if(i > 0){
            System.out.println("修改成功！");
        }
    }
}

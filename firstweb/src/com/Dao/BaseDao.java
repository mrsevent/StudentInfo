package com.Dao;

import java.sql.*;

/**
 * Created by 94888 on 2019/1/3.
 */
public class BaseDao {
    Connection cnt = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public boolean getConnection(){
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8";
        String username = "root";
        String password = "";
        try{
            Class.forName(driver);
            cnt = DriverManager.getConnection(url,username,password);
        }catch (SQLException e){
            e.printStackTrace();
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        return true;
    }
    public boolean closeResourse(){
        if(rs!=null){
            try{
                rs.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
        if (ps!=null){
            try{
                ps.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
        if (cnt!=null){
            try{
                cnt.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
        return true;
    }
    public int executeUpdate(String sql, Object[] params){
        int updateRows = 0;
        if (this.getConnection()){
            try{
                ps = cnt.prepareStatement(sql);
                for (int i = 0; i < params.length; i++){
                    ps.setObject(i+1,params[i]);
                }
                updateRows = ps.executeUpdate();
            }catch (SQLException e){
                e.printStackTrace();
            }
        return updateRows;
        }
        return updateRows;
    }
    public ResultSet executeQuery(String sql,Object [] params){
        if (this.getConnection()){
            try{
                ps = cnt.prepareStatement(sql);
                for (int i = 0;i < params.length;i++){
                    ps.setObject(i+1,params[i]);
                }
                rs = ps.executeQuery();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
        return rs;
    }
    public static void main(String[] args){
        BaseDao baseDao = new BaseDao();
        baseDao.getConnection();
    }
}

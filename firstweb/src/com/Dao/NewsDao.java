package com.Dao;

import java.sql.ResultSet;

/**
 * Created by 94888 on 2019/1/4.
 */
public interface NewsDao {
    //查询全部信息
    public ResultSet getAll(String id);
    //验证密码是否正确
    public ResultSet getPassword(String id);
    //查询id是否存在
    public boolean getPart(String id);
    public void add(String id,String password,String gender,String telephone);
    public void delete();
    public void update(String id,String password,String gender,String telephone);
}

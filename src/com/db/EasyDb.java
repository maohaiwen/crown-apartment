package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.bean.Page;


public class EasyDb<T> {

	private Connection conn = null;
	
	private String tableName = null;
	
	private PreparedStatement ps = null;
	
	private ResultSet rs = null;

	public EasyDb<T> getConnection(){
		try {
			Class.forName(JDBC.DRIVERNAME);
			conn = DriverManager.getConnection(
					JDBC.URL,
					JDBC.USERNAME,
					JDBC.PASSWORD);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return this;
	}
	
	public void closeAll(){
		if(null != rs){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(null != ps){
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(null != conn){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public EasyDb<T> setTable(String tableName){
		this.tableName = tableName;
		return this;
	}
	
	public T queryOne(T t){
		getConnection();
		StringBuffer sql = new StringBuffer("select * from " + tableName + " where 1=1 ");
		T result = null;
		if(t != null){
			List<JdbcMap> properties = null;
			try {
				properties = ReflectionUtil.getProperties(t);
				JdbcUtil.getQueryConditions(sql, properties);
				ps = conn.prepareStatement(sql.toString());
				rs = ps.executeQuery();
				result = (T) ReflectionUtil.getOne(t, rs);
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				closeAll();
			}
		}
		return result;
	}
	
	public void insert(T t){
		getConnection();
		StringBuffer sql = new StringBuffer("insert into " + tableName );
		List<JdbcMap> properties = null;
		try {
			properties = ReflectionUtil.getProperties(t);
			JdbcUtil.getInsertConditions(sql, properties);
			ps = conn.prepareStatement(sql.toString());
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll();
		}
	}
	
	public void update(T t){
		getConnection();
		StringBuffer sql = new StringBuffer("update " + tableName + " set ");
		List<JdbcMap> properties = null;
		try {
			properties = ReflectionUtil.getProperties(t);
			JdbcUtil.getUpdateConditions(sql, properties);
			ps = conn.prepareStatement(sql.toString());
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll();
		}
	}
	public void updatere(){
		getConnection();
		String sql = "update house_enquire set recommend = 0; ";
		try {
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll();
		}
	}
	public void delete(Integer id){
		getConnection();
		String sql = "delete from "+tableName + " where id = '" + id + "'";
		try {
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll();
		}
	}
	public int count(){
		int total = 0;
		getConnection();
		String sql ="select count(*) count from " + tableName;
		try {
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			if(rs.next()){
				total = rs.getInt(1);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeAll();
		}
		return total;
	}
	
	public List<T> queryList(T t,Like like,OrderBy orderBy){
		getConnection();
		StringBuffer sql = new StringBuffer("select * from " + tableName + " where 1=1 ");
		List<T> result = null;
		if(t != null){
			List<JdbcMap> properties = null;
			try {
				properties = ReflectionUtil.getProperties(t);
				JdbcUtil.getQueryListConditions(sql, properties,orderBy,like,null);
				ps = conn.prepareStatement(sql.toString());
				rs = ps.executeQuery();
				result =  ReflectionUtil.getList(t, rs);
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				closeAll();
			}
		}
		return result;
	}
	
	public Page<T> queryPage(T t,Like like,OrderBy orderBy,Page<T> page){
		getConnection();
		StringBuffer Listsql = new StringBuffer("select * from " + tableName + " where 1=1 ");
		StringBuffer Countsql = new StringBuffer("select count(*) count from " + tableName + " where 1=1 ");
		List<T> result = null;
		if(t != null){
			List<JdbcMap> properties = null;
			try {
				properties = ReflectionUtil.getProperties(t);
				JdbcUtil.getQueryPageConditions(Listsql, properties,orderBy,like,page);
				ps = conn.prepareStatement(Listsql.toString());
				rs = ps.executeQuery();
				result =  ReflectionUtil.getList(t, rs);
				page.setResult(result);
				
				JdbcUtil.getQueryListConditions(Countsql, properties, null, like,null);
				ps = conn.prepareStatement(Countsql.toString());
				rs = ps.executeQuery();
				int total = 0;
				if(rs.next()){
					total = rs.getInt(1);
				}
				page.setTotalcount(total);
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				closeAll();
			}
		}
		return page;
	}
	
	public Page<T> queryPage(T t,Like like,OrderBy orderBy,List<Between> betweens,Page<T> page){
		getConnection();
		StringBuffer Listsql = new StringBuffer("select * from " + tableName + " where 1=1 ");
		StringBuffer Countsql = new StringBuffer("select count(*) count from " + tableName + " where 1=1 ");
		List<T> result = null;
		if(t != null){
			List<JdbcMap> properties = null;
			try {
				properties = ReflectionUtil.getProperties(t);
				JdbcUtil.getQueryPageConditions(Listsql, properties,orderBy,like,betweens,page);
				ps = conn.prepareStatement(Listsql.toString());
				rs = ps.executeQuery();
				result =  ReflectionUtil.getList(t, rs);
				page.setResult(result);
				
				JdbcUtil.getQueryListConditions(Countsql, properties, null, like,betweens);
				ps = conn.prepareStatement(Countsql.toString());
				rs = ps.executeQuery();
				int total = 0;
				if(rs.next()){
					total = rs.getInt(1);
				}
				page.setTotalcount(total);
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				closeAll();
			}
		}
		return page;
	}
}

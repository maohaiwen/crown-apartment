package com.db;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

public class ReflectionUtil {

	public static List<JdbcMap> getProperties(Object o) throws Exception{
		Class<?> clazz = o.getClass();
		Field[] fields = clazz.getDeclaredFields();
		List<JdbcMap> resultList = new ArrayList<JdbcMap>();
		for(Field f:fields){
			String key = f.getName();
			PropertyDescriptor pd = new PropertyDescriptor(key, clazz);
			Object value = pd.getReadMethod().invoke(o);
			if(value != null){
				JdbcMap map = new JdbcMap();
				map.setKey(key);
				map.setValue(value);
				resultList.add(map);
			}
		}
		return resultList;
	}

	@SuppressWarnings("unchecked")
	public static <T> T getOne(T t,ResultSet rs) throws Exception{
		Class<?> clazz = t.getClass();
		T resultObj = null;
		if(rs.next()){
			ResultSetMetaData rsmd = rs.getMetaData();
			int count=rsmd.getColumnCount();
			resultObj = (T) clazz.newInstance();
			for(int i=0;i<count;i++){
				String key = rsmd.getColumnName(i+1);
				Object value = rs.getObject(key);
				PropertyDescriptor pd;
				try {
					pd = new PropertyDescriptor(key, clazz);
				} catch (IntrospectionException e) {
					continue;
				}
				Method method = pd.getWriteMethod();
				method.invoke(resultObj, value);
			}
		}
		return resultObj;
	}
	
	@SuppressWarnings("unchecked")
	public static <T> List<T> getList(T t,ResultSet rs) throws Exception{
		Class<?> clazz = t.getClass();
		List<T> resultList = new ArrayList<T>();
		T resultObj = null;
		while(rs.next()){
			ResultSetMetaData rsmd = rs.getMetaData();
			int count=rsmd.getColumnCount();
			resultObj = (T) clazz.newInstance();
			for(int i=0;i<count;i++){
				String key = rsmd.getColumnName(i+1);
				Object value = rs.getObject(key);
				PropertyDescriptor pd;
				try {
					pd = new PropertyDescriptor(key, clazz);
				} catch (IntrospectionException e) {
					continue;
				}
				Method method = pd.getWriteMethod();
				method.invoke(resultObj, value);
			}
			resultList.add(resultObj);
		}
		return resultList;
	}

}

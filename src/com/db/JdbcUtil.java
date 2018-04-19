package com.db;

import java.util.List;

import com.bean.Page;

public class JdbcUtil {

	public static void getQueryConditions(StringBuffer sql, List<JdbcMap> properties){
		if(null != properties && properties.size() > 0){
			for(JdbcMap map:properties){
				sql.append(" and " + map.getKey() + " = '" + map.getValue() + "'");
			}
		}
		System.out.println(sql.toString());
	}
	
	public static void getQueryListConditions(StringBuffer sql, List<JdbcMap> properties,OrderBy orderBy,Like like,List<Between> betweens){
		if(null != properties && properties.size() > 0){
			for(JdbcMap map:properties){
				sql.append(" and " + map.getKey() + " = '" + map.getValue() + "'");
			}
		}
		if(null != like && like.getKey() != null && like.getValue() != null){
			sql.append(" and " + like.getKey() + " like ");
			if(like.isPre()){
				sql.append(" '%");
			}
			sql.append(like.getValue());
			if(like.isAfter()){
				sql.append("%'");
			}
		}
		if(null != betweens && betweens.size() > 0){
			for(Between between : betweens){
				if(null != between && between.getField() != null){
					sql.append(" and " + between.getField());
					if(between.getBetween() != null){
						sql.append(" >= " + between.getBetween());
					}
					if(between.getAnd() != null){
						sql.append(" and " + between.getField());
						sql.append(" <= " + between.getAnd());
					}
				}
			}
		}
		if(orderBy != null && orderBy.getField() != null){
			sql.append(" order by " + orderBy.getField());
			if(!orderBy.isAsc()){
				sql.append(" desc");
			}
		}
		System.out.println(sql.toString());
	}
	
	public static void getInsertConditions(StringBuffer sql, List<JdbcMap> properties){
		if(null != properties && properties.size() > 0){
			sql.append(" (");
			for(int i=0;i<properties.size();i++){
				if(i != properties.size() -1){
					sql.append(properties.get(i).getKey() + ",");
				}else{
					sql.append(properties.get(i).getKey());
				}
			}
			sql.append(" ) values ( ");
			for(int i=0;i<properties.size();i++){
				if(i != properties.size() -1){
					sql.append( "'" + properties.get(i).getValue() + "'" + ",");
				}else{
					sql.append("'" + properties.get(i).getValue() + "'");
				}
			}
			sql.append(")");
			System.out.println(sql.toString());
		}
	}
	
	public static void getUpdateConditions(StringBuffer sql, List<JdbcMap> properties){
		String condition = null;
		if(null != properties && properties.size() > 0){
			for(int i=0;i<properties.size();i++){
				if(properties.get(i).getKey().equals("id")){
					condition = " where id = '" + properties.get(i).getValue() + "'";
				}else{
					if(i != properties.size() -1){
						sql.append(properties.get(i).getKey() + " = '" + properties.get(i).getValue() + "',");
					}else{
						sql.append(properties.get(i).getKey() + " = '" + properties.get(i).getValue() + "'");
					}
				}
			}
			sql.append(condition);
			System.out.println(sql.toString());
		}
	}
	
	public static void getQueryPageConditions(StringBuffer sql, List<JdbcMap> properties,OrderBy orderBy,Like like,Page<?> page){
		if(null != properties && properties.size() > 0){
			for(JdbcMap map:properties){
				sql.append(" and " + map.getKey() + " = '" + map.getValue() + "'");
			}
		}
		if(null != like && like.getKey() != null && like.getValue() != null){
			sql.append(" and " + like.getKey() + " like ");
			if(like.isPre()){
				sql.append(" '%");
			}
			sql.append(like.getValue());
			if(like.isAfter()){
				sql.append("%'");
			}
		}
		if(orderBy != null && orderBy.getField() != null){
			sql.append(" order by " + orderBy.getField());
			if(!orderBy.isAsc()){
				sql.append(" desc");
			}
		}
		if(page != null){
			sql.append(" limit " + page.getFirstResult() + " ," + page.getPerpagecount());
		}
		System.out.println(sql.toString());
	}
	
	public static void getQueryPageConditions(StringBuffer sql, List<JdbcMap> properties,OrderBy orderBy,Like like,List<Between> betweens,Page<?> page){
		if(null != properties && properties.size() > 0){
			for(JdbcMap map:properties){
				sql.append(" and " + map.getKey() + " = '" + map.getValue() + "'");
			}
		}
		if(null != like && like.getKey() != null && like.getValue() != null){
			sql.append(" and " + like.getKey() + " like ");
			if(like.isPre()){
				sql.append(" '%");
			}
			sql.append(like.getValue());
			if(like.isAfter()){
				sql.append("%'");
			}
		}
		if(null != betweens && betweens.size() > 0){
			for(Between between : betweens){
				if(null != between && between.getField() != null){
					sql.append(" and " + between.getField());
					if(between.getBetween() != null){
						sql.append(" >= " + between.getBetween());
					}
					if(between.getAnd() != null){
						sql.append(" and " + between.getField());
						sql.append(" <= " + between.getAnd());
					}
				}
			}
		}
		if(orderBy != null && orderBy.getField() != null){
			sql.append(" order by " + orderBy.getField());
			if(!orderBy.isAsc()){
				sql.append(" desc");
			}
		}
		if(page != null){
			sql.append(" limit " + page.getFirstResult() + " ," + page.getPerpagecount());
		}
		System.out.println(sql.toString());
	}
}

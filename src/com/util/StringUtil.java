package com.util;

import java.io.UnsupportedEncodingException;

public class StringUtil {

	public static String[] jsArrayToStringArray(String arr){
		arr = arr.substring(1,arr.length() - 1);
		String[] arrs = arr.split(",");
		return arrs;
	}
	
	public static String convertString(String str){
		if(str != null && !str.equals(""))
		try {
			str = new String(str.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return str;
	}
	public static boolean isInt(String str){
		   int temp = 0; 
		   try{
		       temp = Integer.parseInt(str);
		     }catch(Exception e){
		       return false;
		    }
		  return true;
		}
}

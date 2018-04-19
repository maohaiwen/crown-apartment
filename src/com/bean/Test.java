package com.bean;

import com.db.EasyDb;

public class Test {

	public static void main(String[] args) {
		EasyDb<Users> util = new EasyDb<Users>();
		Users user = new Users();
		user.setUserName("admin");
		user.setPassWord("123456");
		Users user1 = util.setTable("users").queryOne(user);
		System.out.println(user1.getUserName());
	}
}

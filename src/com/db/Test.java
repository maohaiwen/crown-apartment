package com.db;

public class Test {
	
	public static void main(String[] args) {
		Test1 t = new Test1();
		t.setId(1);
		t.setName("杨小儿");
		EasyDb<Test1> util = new EasyDb<Test1>();
		util.setTable("test").queryOne(t);
	}
	
}

class Test1{
	private Integer id;
	
	private String name;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
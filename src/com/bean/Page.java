package com.bean;

import java.util.List;

public class Page<T> {
	
	public Page(int curpage,int perpagecount){
		this.curpage = curpage;
		this.perpagecount = perpagecount;
	}
	private List<T> result;	//结果列表
	private int curpage = 1;	//当前页
	private int perpagecount = 8;	//每页条目数
	private int firstResult;	//oracle中的firstResult
	private int totalcount = 1;	//总条目数
	private int pagecount = 1;	//页数 
	private String url = "";
	
	public int getPagecount() {
		if(totalcount%perpagecount == 0){
			pagecount = totalcount/perpagecount;
		}else{
			pagecount = totalcount/perpagecount + 1;
		}
		return pagecount;
	}
	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}
	public int getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	public int getFirstResult() {
		firstResult = (curpage-1)*perpagecount;
		return firstResult;
	}
	public void setFirstResult(int firstResult) {
		this.firstResult = firstResult;
	}
	public List<T> getResult() {
		return result;
	}
	public void setResult(List<T> result) {
		this.result = result;
	}
	public int getCurpage() {
		return curpage;
	}
	public void setCurpage(int curpage) {
		this.curpage = curpage;
	}
	public int getPerpagecount() {
		return perpagecount;
	}
	public void setPerpagecount(int perpagecount) {
		this.perpagecount = perpagecount;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getAdminBean(){
		if (this.getPagecount() == 0) {
			return "未查询到数据";
		} else {
			StringBuffer pageCode = new StringBuffer("<div style='font-size:18px;font-family:微软雅黑;float:right;margin-right:10%;'><ul>");
			pageCode.append("<li style='list-style-type:none;float:left;margin-left:5px;'><a href='" + this.getUrl() + "?curpage=1" + "'>首页</a></li>");
			if (this.getCurpage() == 1) {
				pageCode.append("<li style='list-style-type:none;float:left;margin-left:5px;' class=");
				pageCode.append("disabled");
				pageCode.append("><a style='font-size:25px;cursor:pointer;'>&laquo;</a></li>");
			}
			if (this.getCurpage() > 1) {
				pageCode.append("<li style='list-style-type:none;float:left;margin-left:5px;'><a style='font-size:25px;cursor:pointer;' href='" + this.getUrl() + "?curpage=" + (this.getCurpage() - 1) + "'>&laquo;</a></li>");
			}
			for (int i = this.getCurpage() - 2; i <= this.getCurpage() + 2; i++) {
				if (i < 1 || i > this.getPagecount()) {
					continue;
				}
				if (i == this.getCurpage()) {
					pageCode.append("<li style='list-style-type:none;float:left;margin-left:5px;' class=");
					pageCode.append("active");
					pageCode.append("><a>" + i + "</a></li>");
				} else {
					pageCode.append("<li style='list-style-type:none;float:left;margin-left:5px;'><a href='" + this.getUrl() + "?curpage=" + i + "'>" + i + "</a></li>");
				}
			}
			if (this.getCurpage() < this.getPagecount()) {
				pageCode.append("<li style='list-style-type:none;float:left;margin-left:5px;'><a style='cursor:pointer;font-size:25px;' href='" + this.getUrl() + "?curpage=" + (this.getCurpage() + 1) + "'>&raquo;</a></li>");
			}
			if (this.getCurpage() == this.getPagecount()) {
				pageCode.append("<li style='list-style-type:none;float:left;margin-left:5px;' class=");
				pageCode.append("disabled");
				pageCode.append("><a style='cursor:pointer;font-size:25px;'>&raquo;</a></li>");
			}
			pageCode.append("<li style='list-style-type:none;float:left;margin-left:5px;'><a href='" + this.getUrl() + "?curpage=" + this.getPagecount() + "'>尾页</a></li>");
			pageCode.append("</ul></div>");
			return pageCode.toString();
		}
	}
	public String getWebBean(){
		
		return "";
	}
}

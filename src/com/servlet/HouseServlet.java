package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.bean.House;
import com.bean.Img;
import com.bean.Page;
import com.db.Between;
import com.db.EasyDb;
import com.db.JDBC;
import com.db.Like;
import com.db.OrderBy;

public class HouseServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String flag = req.getParameter("flag");
		if(flag.equals("queryPage")){
			pageQuery(req,resp);
		}
		if(flag.equals("queryOne")){
			queryOne(req,resp);
		}
		if(flag.equals("queryExpire")){
			queryExpire(req,resp);
		}
	}

	public void pageQuery(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		String curpage = req.getParameter("curpage");
		String perpagecount = req.getParameter("perpagecount");
		String orderby = req.getParameter("orderby");
		String district = req.getParameter("district");
		String maxmoney = req.getParameter("maxmoney");
		String minmoney = req.getParameter("minmoney");
		String minshi = req.getParameter("minshi");
		String maxshi = req.getParameter("maxshi");
		
		String keywords = req.getParameter("keywords");
		String type = req.getParameter("type");
		EasyDb<House> util = new EasyDb<House>();
		Like like = new Like();
		OrderBy orderBy = new OrderBy();
		Between between = new Between();
		Between between1 = new Between();
		List<Between> betweens = new ArrayList<Between>();
		if(orderby != null && !orderby.equals("")){
			orderBy.setField(orderby);
			orderBy.setAsc(false);
		}
		House house = new House();
		house.setState(0);
		if(district  != null && !district.equals("")){
			house.setDistrict(district);
		}
		if(minmoney != null && !minmoney.equals("")){
			between.setField("money");
			between.setBetween(Integer.parseInt(minmoney));
		}
		if(maxmoney != null && !maxmoney.equals("")){
			between.setField("money");
			between.setAnd(Integer.parseInt(maxmoney));
		}
		if(minshi != null && !minshi.equals("")){
			between1.setField("shi");
			between1.setBetween(Integer.parseInt(minshi));
		}
		if(maxshi != null && !maxshi.equals("")){
			between1.setField("shi");
			between1.setAnd(Integer.parseInt(maxshi));
		}
		betweens.add(between);
		betweens.add(between1);
		if(keywords != null &&  !keywords.equals("") ){
			like.setKey("describes");
			like.setAfter(true);
			like.setPre(true);
			like.setValue(keywords);
		}
		if(type != null && !type.equals("")){
			house.setType(Integer.parseInt(type));
		}
		Page<House> pages = new Page<House>(Integer.parseInt(curpage),Integer.parseInt(perpagecount));
		pages = util.setTable("house_enquire").queryPage(house, like, orderBy,betweens, pages);
		List<House> houses = pages.getResult();
		EasyDb<Img> imgUtil = new EasyDb<Img>();
		if(houses != null && houses.size() > 0){
			for(House h:houses){
				Img img = new Img();
				img.setHouseId(h.getUuid());
				List<Img> imgs = imgUtil.setTable("imgs").queryList(img, null, null);
				h.setImgs(imgs);
			}
		}
		resp.setCharacterEncoding("UTF-8");
		PrintWriter pw = resp.getWriter();
		JSONObject json = JSONObject.fromObject(pages);
		json.remove("adminBean");
		pw.write(json.toString());
		pw.close();
	}

	public void queryOne(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		String id = req.getParameter("id");
		House house = new House();
		if(id != null && !id.equals("")){
			house.setId(Integer.parseInt(id));
		}
		EasyDb<House> util = new EasyDb<House>();
		house = util.setTable("house_enquire").queryOne(house);
		EasyDb<Img> imgUtil = new EasyDb<Img>();
		if(house != null){
			Img img = new Img();
			img.setHouseId(house.getUuid());
			List<Img> imgs = imgUtil.setTable("imgs").queryList(img, null, null);
			house.setImgs(imgs);
		}
		resp.setCharacterEncoding("UTF-8");
		PrintWriter pw = resp.getWriter();
		JSONObject json = JSONObject.fromObject(house);
		pw.write(json.toString());
		pw.close();
	}
	
	public void queryExpire(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		Date now = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String date = formatter.format(now);
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<House> houseList = null;
		try {
			Class.forName(JDBC.DRIVERNAME);
			conn = DriverManager.getConnection(
					JDBC.URL,
					JDBC.USERNAME,
					JDBC.PASSWORD);
			String sql = "select id,uuid,serial from house_enquire where state = ? and expire_date <= ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, 2);
			ps.setString(2, date);
			rs = ps.executeQuery();
			House house = null;
			houseList = new ArrayList<House>();
			while(rs.next()){
				house = new House();
				house.setId(rs.getInt(1));
				house.setUuid(rs.getString(2));
				house.setSerial(rs.getString(3));
				houseList.add(house);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		resp.setCharacterEncoding("UTF-8");
		PrintWriter pw = resp.getWriter();
		JSONArray json = JSONArray.fromObject(houseList);
		pw.write(json.toString());
		pw.close();
	}
	
	public static void main(String[] args) throws IOException {
		HouseServlet hs = new HouseServlet();
		hs.queryExpire(null, null);
	}
}

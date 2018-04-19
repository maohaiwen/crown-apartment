package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.HouseBean;
import com.bean.MyHousePro;

 

public class MyCartServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest request, HttpServletResponse response)

           throws ServletException, IOException {

       String cartop=request.getParameter("cartop");

       if (cartop.equals("add")) {

            String id=request.getParameter("id");

            String pageNow=request.getParameter("pageNow");

            MyHousePro mcp=(MyHousePro)request.getSession().getAttribute("mycart");

            if (mcp==null) {

            //第一次购物，创建一个购物车，同时加入session

            mcp=new MyHousePro();

            request.getSession().setAttribute("mycart", mcp);

           }

            if (id!=null) {

             mcp.addHouse(id);

           }       

            List<HouseBean> al=mcp.showMyHouse();

            request.setAttribute("alist", al);

            request.setAttribute("pageNow", pageNow);

            request.getRequestDispatcher("mycart.jsp").forward(request, response);           

       }else if (cartop.equals("delete")) {

           MyHousePro mcp=(MyHousePro)request.getSession().getAttribute("mycart");

           String id=request.getParameter("id");

           String pageNow=request.getParameter("pageNow");

           mcp.deleteBook(id);

            List<HouseBean> al=mcp.showMyHouse();

            request.setAttribute("alist", al);

            request.setAttribute("pageNow", pageNow);

            request.getRequestDispatcher("mycart.jsp").forward(request, response);           

       }else if (cartop.equals("deleteall")) {

           String pageNow=request.getParameter("pageNow");

           MyHousePro mcp=(MyHousePro)request.getSession().getAttribute("mycart");

           if (mcp==null) {

              request.setAttribute("pageNow", pageNow);

              request.getRequestDispatcher("index.jsp").forward(request, response);

           }else {

              mcp.deleteAllBooks();

              request.setAttribute("pageNow", pageNow);

              request.getRequestDispatcher("index.jsp").forward(request, response);            

           }
       }else if(cartop.equals("detail")){
    	   request.getRequestDispatcher("mycart.jsp").forward(request, response);
       }
 

    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)

           throws ServletException, IOException {       

        this.doGet(request, response);

    }

 

}


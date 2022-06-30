package com.example.demo2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name = "DIscount",value = "/discount")
public class Discount extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int price= Integer.parseInt(req.getParameter("price"));
        int rate= Integer.parseInt(req.getParameter("discount"));
        PrintWriter printWriter=resp.getWriter();
        printWriter.println("So tien duoc giam la: "+price*rate*0.01);
    }
}

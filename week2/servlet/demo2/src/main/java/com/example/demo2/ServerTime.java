package com.example.demo2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "time", value = "/time")

public class ServerTime extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Date now=new Date();
        now.getTime();
        SimpleDateFormat dateFormat=new SimpleDateFormat("hh:mm:ss dd/MM/yyyy");
        PrintWriter printWriter =resp.getWriter();
        printWriter.println("Thoi gian hien tai la:"+dateFormat.format(now));
    }
}

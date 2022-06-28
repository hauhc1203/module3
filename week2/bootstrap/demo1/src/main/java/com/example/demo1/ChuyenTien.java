package com.example.demo1;

import sun.rmi.server.Dispatcher;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "chuyenTien", value = "/chuyenTien")
public class ChuyenTien extends HttpServlet {
    private String message;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("chuyenTien.html");

        requestDispatcher.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int tien= Integer.parseInt(req.getParameter("soTien"));

        PrintWriter writer = resp.getWriter();

        writer.println("So tien cua ban la: " + tien*23000 );
    }

    public void destroy() {
    }
}
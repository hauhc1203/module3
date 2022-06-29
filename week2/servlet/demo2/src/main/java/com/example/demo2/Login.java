package com.example.demo2;

import java.io.*;
import java.net.http.HttpClient;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "login", value = "/login")
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher= req.getRequestDispatcher("LoginForm.html");
        requestDispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName=req.getParameter("userName");
        String pass=req.getParameter("pass");
        PrintWriter   writer = resp.getWriter();


        if (userName.equals("hauhc1203")&&pass.equals("hauhc")){
            writer.println("Dang nhap thanh cong!");
            writer.println("xin chao, "+userName);

        }else {
            writer.println("Tai khoan hoac mat khau khong chinh xac");
        }
    }

    public void destroy() {
    }
}
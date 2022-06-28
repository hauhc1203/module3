package com.example.demo;

import javax.servlet.http.HttpServlet;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

@Path("/hello-world")
public class HelloResource  extends HttpServlet {
    @GET
    @Produces("text/plain")
    public String hello() {
        return "Hello, World!";
    }
}
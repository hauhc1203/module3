package servlet;



import dao.LopDAO;
import model.Lop;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/lop")
public class LopServlet extends HttpServlet {

    ArrayList<Lop> lops=new ArrayList<>();
    LopDAO lopDAO=new LopDAO();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        lops=lopDAO.selectAllLops();
        req.setAttribute("lops",lops);
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/lop.jsp");
        requestDispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

}

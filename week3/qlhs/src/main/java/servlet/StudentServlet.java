package servlet;

import dao.LopDAO;
import dao.StudentDao;
import model.HocSinh;
import model.Lop;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;


@WebServlet(urlPatterns = "/student")
public class StudentServlet extends HttpServlet {

    ArrayList<HocSinh> hocSinhs=new ArrayList<>();
    ArrayList<Lop> lops=new ArrayList<>();
    StudentDao studentDao=new StudentDao();
    LopDAO lopDAO=new LopDAO();
    @Override
    public void init(ServletConfig config) throws ServletException {
        hocSinhs=studentDao.selectAllHocSinhs();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String action=req.getParameter("action");
            int id;

            RequestDispatcher requestDispatcher;
            if (action== null){
                action="";
            }
            switch (action){
                case "create":
                    lops=lopDAO.selectAllLops();
                    req.setAttribute("lops",lops);
                    requestDispatcher=req.getRequestDispatcher("/createHS.jsp");
                    break;
                case "edit":

                    id= Integer.parseInt(req.getParameter("id"));
                    HocSinh hs=studentDao.selectHocSinh(id);
                    lops=lopDAO.selectAllLops();
                    req.setAttribute("lops",lops);
                    req.setAttribute("hs",hs);
                    requestDispatcher=req.getRequestDispatcher("/editHS.jsp");
                    break;
                case "delete":
                    id= Integer.parseInt(req.getParameter("id"));
                    deleteHS(id);
                    hocSinhs=studentDao.selectAllHocSinhs();
                    requestDispatcher=req.getRequestDispatcher("/hocsinh.jsp");
                    break;
                default:
                    hocSinhs=studentDao.selectAllHocSinhs();
                    requestDispatcher=req.getRequestDispatcher("/hocsinh.jsp");


            }



            req.setAttribute("hocSinhs",hocSinhs);

            requestDispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int msv;
        req.setCharacterEncoding("utf-8");
        String key= req.getParameter("key");
        String name=req.getParameter("name");
        String email=req.getParameter("email");
        String ngaysinh=req.getParameter("birthday");
        String diachi=req.getParameter("diachi");
        String sdt=req.getParameter("sdt");
        String malop=req.getParameter("malop");
        String acction=req.getParameter("action");
        switch (acction){
            case "create":
                inSert(create(name,email,ngaysinh,diachi,sdt,malop));
                hocSinhs=studentDao.selectAllHocSinhs();

                break;
            case "edit":
                msv= Integer.parseInt(req.getParameter("id"));
                editHS(msv,name,email,ngaysinh,diachi,sdt,malop);
                hocSinhs=studentDao.selectAllHocSinhs();
                break;
            case "search":
                key = "%"+key+"%";
                hocSinhs=studentDao.search(key);
                break;
        }
        req.setAttribute("hocSinhs",hocSinhs);
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/hocsinh.jsp");
        requestDispatcher.forward(req,resp);
    }

    public void deleteHS(int id){
        try {
            System.out.println(studentDao.deleteHocSinh(id));;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void inSert(HocSinh hocSinh){
        try {
            studentDao.insertHocSinh(hocSinh);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public HocSinh create(String name,String email, String ngaysinh, String diachi,   String sdt,  String malop){
       return new HocSinh(name,ngaysinh,diachi,sdt,email,Integer.parseInt(malop));

    }
    public void editHS(int id,String name,String email, String ngaysinh, String diachi,   String sdt,  String malop){
        try {
            studentDao.updateHocSinh(new HocSinh(id,name,ngaysinh,diachi,sdt,email,Integer.parseInt(malop)));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



}

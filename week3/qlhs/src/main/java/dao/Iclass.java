package dao;



import model.HocSinh;
import model.Lop;

import java.sql.SQLException;
import java.util.ArrayList;

public interface Iclass {
    public void insertLop(Lop lop) throws SQLException;

    public Lop selectLop(int id);

    public ArrayList<Lop> selectAllLops();

    public boolean deleteLop(int id) throws SQLException;

    public boolean updateLop(HocSinh hocSinh) throws SQLException;
}
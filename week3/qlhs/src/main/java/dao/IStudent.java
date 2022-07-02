package dao;



import model.HocSinh;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IStudent {
    public void insertHocSinh(HocSinh hocSinh) throws SQLException;

    public HocSinh selectHocSinh(int id);

    public ArrayList<HocSinh> selectAllHocSinhs();

    public boolean deleteHocSinh(int id) throws SQLException;

    public boolean updateHocSinh(HocSinh hocSinh) throws SQLException;
}
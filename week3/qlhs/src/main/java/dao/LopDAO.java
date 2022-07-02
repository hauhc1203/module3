package dao;

import connect.ConnectDB;
import model.HocSinh;
import model.Lop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LopDAO implements Iclass{



    private static final String SELECT_ALL_LOP = "select * from Lop";

    @Override
    public void insertLop(Lop lop) throws SQLException {

    }

    @Override
    public Lop selectLop(int id) {
        return null;
    }

    @Override
    public ArrayList<Lop> selectAllLops() {
        ArrayList<Lop> lops =new ArrayList<>();
        try (Connection connection= ConnectDB.getConnect(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_LOP)){
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id=rs.getInt("MALOP");
                String name = rs.getString("TenLop");
                int soLuong=rs.getInt("SoSV");
                lops.add(new Lop(id,name,soLuong));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return lops;
    }

    @Override
    public boolean deleteLop(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateLop(HocSinh hocSinh) throws SQLException {
        return false;
    }
}

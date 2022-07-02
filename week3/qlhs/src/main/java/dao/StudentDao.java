package dao;

import connect.ConnectDB;
import model.HocSinh;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StudentDao implements IStudent{



    private static final String INSERT_HS_SQL = "INSERT INTO HocSinh (TenHS, BirthDay, Address,SDT,Email,MaLOP) VALUES (?,?,?,?,?,?);";
    private static final String SELECT_ALL_HS = "select * from HocSinh;";
    private static final String DELETE_HS_SQL = "delete from HocSinh where MSV = ?;";
    private static final String SELECT_HS_SQL = "select * from HocSinh  where MSV = ?;";

    private  static  final String UPDATE_HS_SQL="UPDATE HocSinh SET TenHS=?,BirthDay=?,Address=?,SDT=?,Email=?,MaLOP=? where MSV=?;";

    @Override
    public void insertHocSinh(HocSinh hocSinh) throws SQLException {
        try (Connection connection= ConnectDB.getConnect(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_HS_SQL)){
            preparedStatement.setString(1,hocSinh.getTenHS());
            preparedStatement.setString(2,hocSinh.getNgaySinh());
            preparedStatement.setString(3,hocSinh.getDiaChi());
            preparedStatement.setString(4,hocSinh.getSdt());
            preparedStatement.setString(5,hocSinh.getEmail());
            preparedStatement.setInt(6,hocSinh.getMalop());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {

        }
    }

    @Override
    public HocSinh selectHocSinh(int id) {

        try (Connection connection= ConnectDB.getConnect(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_HS_SQL)){
            preparedStatement.setInt(1,id);
            ResultSet resultSet= preparedStatement.executeQuery();
            resultSet.next();
            int msv=resultSet.getInt("MSV");
            String name=resultSet.getString("TenHS");
            String ngaySinh=resultSet.getString("BirthDay");
            String diachi=resultSet.getString("Address");
            String sdt=resultSet.getString("SDT");
            String email=resultSet.getString("Email");
            int malop=resultSet.getInt("MaLOP");
            return  new HocSinh(msv,name,ngaySinh,diachi,sdt,email,malop);
        } catch (SQLException e) {

        }

        return null;
    }

    @Override
    public ArrayList<HocSinh> selectAllHocSinhs() {
        ArrayList<HocSinh> hocSinhs =new ArrayList<>();
        try (Connection connection= ConnectDB.getConnect(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_HS)){
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id=rs.getInt("MSV");
                String name = rs.getString("TenHS");
                String birthDay = rs.getString("BirthDay");
                String address = rs.getString("Address");
                String sdt = rs.getString("SDT");
                String email = rs.getString("Email");
                int maLop=rs.getInt("MaLOP");
                hocSinhs.add(new HocSinh(id,name,birthDay,address,sdt,email,maLop));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return hocSinhs;
    }

    @Override
    public boolean deleteHocSinh(int id) throws SQLException {
        try (Connection connection= ConnectDB.getConnect(); PreparedStatement preparedStatement = connection.prepareStatement(DELETE_HS_SQL)){
                preparedStatement.setInt(1,id);
                preparedStatement.execute();
                return true;

        } catch (SQLException e) {
            return false;
        }
    }

    @Override
    public boolean updateHocSinh(HocSinh hocSinh) throws SQLException {
        try (Connection connection= ConnectDB.getConnect(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_HS_SQL)){
            preparedStatement.setString(1,hocSinh.getTenHS());
            preparedStatement.setString(2,hocSinh.getNgaySinh());
            preparedStatement.setString(3,hocSinh.getDiaChi());
            preparedStatement.setString(4,hocSinh.getSdt());
            preparedStatement.setString(5,hocSinh.getEmail());
            preparedStatement.setInt(6,hocSinh.getMalop());
            preparedStatement.setInt(7,hocSinh.getId());
            preparedStatement.executeUpdate();
            return true;

        } catch (SQLException e) {

        }
        return false;
    }
}

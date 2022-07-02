package dao;

import connect.ConnectDB;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO implements IUserDAO{




    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_ALL_USER = "select * from users";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";



    @Override
    public void insertUser(User user) throws SQLException {

    }

    @Override
    public User selectUser(int id) {
        return null;
    }

    @Override
    public ArrayList<User> selectAllUsers() {
        ArrayList<User> users=new ArrayList<>();
        try (Connection connection=ConnectDB.getConnect();PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER)){
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()){
                    int id=rs.getInt("id");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String country = rs.getString("country");
                    users.add(new User(id,name,email,country));
                }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return users;
    }

        @Override
    public boolean deleteUser(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return false;
    }

}

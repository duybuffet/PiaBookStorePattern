/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.user;

import helper.DbConnect;
import dao.user.UserDAO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import entity.user.Address;
import entity.user.NameSurname;
import entity.user.User;

/**
 *
 * @author Tcat
 */
public class UserDAO {

    public UserDAO() {
    }

    public void addUser(User u) throws SQLException {
        Address address = u.getAddress();
        NameSurname nameSurname = u.getNameSurname();
        String queryInsertAddress = "INSERT INTO tbladdress (house_no, town, district, city) VALUES (?,?,?,?)";
        String queryInsertName = "INSERT INTO tblnamesurname (first_name, mid_name, last_name) VALUES (?,?,?)";
        String queryInsertUser = "INSERT INTO tbluser (username, password, email, dob, gender, permission, address_id, name_surname_id) VALUES(?,?,?,?,?,?,?,?)";
        PreparedStatement ps = null;
        ResultSet r = null;
        int addressId = 0;
        int nameSurnameId = 0;

        /* insert address */
        ps = DbConnect.getConnection().prepareStatement(queryInsertAddress);
        ps.setString(1, address.getHouseNo());
        ps.setString(2, address.getTown());
        ps.setString(3, address.getDistrict());
        ps.setString(4, address.getCity());
        ps.executeUpdate();

        r = ps.getGeneratedKeys();
        if (r.next()) {
            addressId = r.getInt(1);
        }

        /* insert name surname */
        ps = DbConnect.getConnection().prepareStatement(queryInsertName);
        ps.setString(1, nameSurname.getFirstName());
        ps.setString(2, nameSurname.getMidName());
        ps.setString(3, nameSurname.getLastName());
        ps.executeUpdate();

        r = ps.getGeneratedKeys();
        if (r.next()) {
            nameSurnameId = r.getInt(1);
        }

        /* insert user */
        ps = DbConnect.getConnection().prepareStatement(queryInsertUser);
        ps.setString(1, u.getUsername());
        ps.setString(2, u.getPass());
        ps.setString(3, u.getEmail());
        ps.setString(4, u.getDob());
        ps.setInt(5, u.getGender());
        ps.setInt(6, u.getPermission());
        ps.setInt(7, addressId);
        ps.setInt(8, nameSurnameId);
        ps.executeUpdate();

    }

    public User login(String username, String password) throws SQLException {
        User user = null;
        String query = "SELECT\n"
                + "	u.id,\n"
                + "	u.username,\n"
                + "	u.password,\n"
                + "	u.email,\n"
                + "	u.dob,\n"
                + "	u.gender,\n"
                + "	ad.house_no,\n"
                + "	ad.town,\n"
                + "	ad.district,\n"
                + "	ad.city,\n"
                + "	surname.first_name,\n"
                + "	surname.mid_name,\n"
                + "	surname.last_name,\n"
                + "	u.permission\n"
                + "FROM\n"
                + "	tbluser u\n"
                + "INNER JOIN tbladdress ad ON ad.id = u.address_id\n"
                + "INNER JOIN tblnamesurname surname ON u.name_surname_id = surname.id\n"
                + "WHERE\n"
                + "	username = ?\n"
                + "AND password = ?";

        PreparedStatement ps = DbConnect.getConnection().prepareStatement(query);
        ps.setString(1, username);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            user = new User(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getInt(6),
                    new Address(
                            rs.getString(7),
                            rs.getString(8),
                            rs.getString(9),
                            rs.getString(10)
                    ),
                    new NameSurname(
                            rs.getString(11),
                            rs.getString(12),
                            rs.getString(13)
                    ),
                    rs.getInt(14)
            );
        }

        return user;
    }

    public User getUser(int id) throws SQLException {
        User user = null;
        String query = "SELECT\n"
                + "	u.id,\n"
                + "	u.username,\n"
                + "	u.password,\n"
                + "	u.email,\n"
                + "	u.dob,\n"
                + "	u.gender,\n"
                + "	ad.house_no,\n"
                + "	ad.town,\n"
                + "	ad.district,\n"
                + "	ad.city,\n"
                + "	surname.first_name,\n"
                + "	surname.mid_name,\n"
                + "	surname.last_name,\n"
                + "	u.permission\n"
                + "FROM\n"
                + "	tbluser u\n"
                + "INNER JOIN tbladdress ad ON ad.id = u.address_id\n"
                + "INNER JOIN tblnamesurname surname ON u.name_surname_id = surname.id\n"
                + "WHERE\n"
                + "	u.id = ?\n";

        PreparedStatement ps = DbConnect.getConnection().prepareStatement(query);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return new User(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getInt(6),
                    new Address(
                            rs.getString(7),
                            rs.getString(8),
                            rs.getString(9),
                            rs.getString(10)
                    ),
                    new NameSurname(
                            rs.getString(11),
                            rs.getString(12),
                            rs.getString(13)
                    ),
                    rs.getInt(14)
            );
        }

        return user;
    }

}

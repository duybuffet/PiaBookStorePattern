package dao.book;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import helper.DbConnect;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import entity.book.Category;

/**
 *
 * @author Tcat
 */
public class CategoryDAO {

    public CategoryDAO() {
    }

    public ArrayList<Category> getAllCategories() throws SQLException {
        String query = "SELECT * FROM tblcategory";
        ArrayList<Category> arrCate = new ArrayList();
        PreparedStatement ps = DbConnect.getConnection().prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            arrCate.add(new Category(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3))
            );
        }
        
        return arrCate;
    }

    public Category getCategoryByName(String name) throws SQLException {
        String query = "SELECT * FROM tblcategory WHERE category_name = '" + name + "'";
        Category cate = null;
        PreparedStatement ps = DbConnect.getConnection().prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            cate = new Category(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3));
        }
        
        return cate;
    }

    public Category getCategoryById(int id) throws SQLException {
        String query = "SELECT * FROM tblcategory where id = ?";
        Category cate = null;
        PreparedStatement ps = DbConnect.getConnection().prepareStatement(query);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            cate = new Category(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3));
        }
        
        return cate;
    }

    public void addCategory(Category cate) throws SQLException {
        String query = "INSERT INTO tblcategory(category_name, description) VALUES(?, ?)";
        PreparedStatement ps = DbConnect.getConnection().prepareStatement(query);
        ps.setString(1, cate.getName());
        ps.setString(2, cate.getDescription());
        ps.executeUpdate();
        
    }

    public void editCategory(Category cate) throws SQLException {
        String query = "UPDATE tblcategory SET category_name = ?, description = ? WHERE id = " + cate.getId();
        PreparedStatement ps = DbConnect.getConnection().prepareStatement(query);
        ps.setString(1, cate.getName());
        ps.setString(2, cate.getDescription());
        ps.executeUpdate();
        
    }
}

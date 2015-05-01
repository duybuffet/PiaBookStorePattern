package dao.book;

import helper.DbConnect;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import entity.book.Author;

public class AuthorDAO {

    public AuthorDAO() {
    }

    public ArrayList<Author> getAllAuthor() throws SQLException {
        String query = "SELECT * FROM tblauthor";
        ArrayList<Author> arrAuthor = new ArrayList();
        PreparedStatement ps = DbConnect.getConnection().prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("author_name");
            String gender = rs.getString("gender");
            String description = rs.getString("description");

            Author author = new Author(id, name, gender, description);

            arrAuthor.add(author);
        }
        
        return arrAuthor;
    }

    public Author getAuthorByName(String name) throws SQLException {
        Author author = null;
        String sql = "SELECT * FROM tblauthor WHERE author_name = '" + name + "'";

        PreparedStatement ps = DbConnect.getConnection().prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String gender = rs.getString("gender");
            String description = rs.getString("description");

            author = new Author(id, name, gender, description);
        }
        
        return author;
    }

    public Author getAuthorById(int id) throws SQLException {
        Author author = null;
        String sql = "SELECT * FROM tblauthor WHERE id = ?";

        PreparedStatement ps = DbConnect.getConnection().prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String name = rs.getString("author_name");
            String gender = rs.getString("gender");
            String description = rs.getString("description");

            author = new Author(id, name, gender, description);
        }
        
        return author;
    }

    public void addAuthor(Author author) throws SQLException {
        String query = "INSERT INTO tblauthor(author_name, gender, description) VALUES(?, ?, ?)";

        PreparedStatement ps = DbConnect.getConnection().prepareStatement(query);
        ps.setString(1, author.getAuthorName());
        ps.setString(2, author.getGender());
        ps.setString(3, author.getDescription());
        ps.executeUpdate();
        
    }

    public void editAuthor(Author author) throws SQLException {
        String query = "UPDATE tblauthor SET author_name = ?, gender = ?, description = ? WHERE id = " + author.getId();
        PreparedStatement ps = DbConnect.getConnection().prepareStatement(query);
        ps.setString(1, author.getAuthorName());
        ps.setString(2, author.getGender());
        ps.setString(3, author.getDescription());
        ps.executeUpdate();
        
    }
}

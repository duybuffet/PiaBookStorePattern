package dao.book;

import helper.DbConnect;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import entity.book.Publisher;



public class PublisherDAO {

    public PublisherDAO() {
    }

    public ArrayList<Publisher> getAllPublisher() throws SQLException {
        String query = "SELECT * FROM tblpublisher";
        ArrayList<Publisher> arrPublisher = new ArrayList();
        PreparedStatement ps = DbConnect.getConnection().prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("publisher_name");
            String address = rs.getString("address");
            String description = rs.getString("description");

            Publisher publisher = new Publisher(id, name, address, description);

            arrPublisher.add(publisher);
        }
        
        return arrPublisher;
    }

    public Publisher getPublisherByName(String name) throws SQLException {
        Publisher publisher = null;
        String sql = "SELECT * from tblpublisher WHERE publisher_name = '" + name + "'";
        PreparedStatement ps = DbConnect.getConnection().prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String address = rs.getString("address");
            String description = rs.getString("description");

            publisher = new Publisher(id, name, address, description);

        }
        
        return publisher;
    }

    public Publisher getPublisherById(int id) throws SQLException {
        Publisher publisher = null;
        String sql = "SELECT * FROM tblpublisher WHERE id = ?";
        PreparedStatement ps = DbConnect.getConnection().prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String name = rs.getString("publisher_name");
            String address = rs.getString("address");
            String description = rs.getString("description");

            publisher = new Publisher(id, name, address, description);

        }
        

        return publisher;
    }

    public void addPublisher(Publisher publisher) throws SQLException {
        String query = "insert into tblpublisher(publisher_name, address, description) values(?, ?, ?)";
        PreparedStatement ps = DbConnect.getConnection().prepareStatement(query);
        ps.setString(1, publisher.getName());
        ps.setString(2, publisher.getAddress());
        ps.setString(3, publisher.getDescription());
        ps.executeUpdate();
        
    }

    public void editPublisher(Publisher publisher) throws SQLException {
        String query = "UPDATE tblpublisher SET publisher_name = ?, address = ?, description = ? WHERE id = " + publisher.getId();
        PreparedStatement ps = DbConnect.getConnection().prepareStatement(query);
        ps.setString(1, publisher.getName());
        ps.setString(2, publisher.getAddress());
        ps.setString(3, publisher.getDescription());
        ps.executeUpdate();
        
    }
}

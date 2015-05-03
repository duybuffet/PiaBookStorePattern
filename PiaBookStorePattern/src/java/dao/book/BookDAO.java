package dao.book;

import helper.DbConnect;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import entity.book.Author;
import entity.book.Book;
import entity.book.Category;
import entity.book.Publisher;
import entity.book.Title;

public class BookDAO {

    public BookDAO() {
    }

    public Book getBookById(int bookId) throws SQLException {
        String query = "SELECT id, display_price, published_date, description, stock_qtt, image_url, title_id, category_id, author_id, publisher_id FROM tblbook WHERE id = " + bookId;
        AuthorDAO authorDAO = new AuthorDAO();
        PublisherDAO publisherDAO = new PublisherDAO();
        CategoryDAO cateDAO = new CategoryDAO();
        TitleDAO titleDAO = new TitleDAO();
        ResultSet set = null;
        PreparedStatement ps = null;
        Book book = null;
        ps = DbConnect.getConnection().prepareStatement(query);
        set = ps.executeQuery();
        if (set.next()) {
            book = new Book(
                    set.getInt("id"),
                    set.getString("image_url"),
                    set.getInt("stock_qtt"),
                    set.getFloat("display_price"),
                    set.getString("published_date"),
                    set.getString("description"),
                    titleDAO.getTitle(set.getInt("title_id")),
                    cateDAO.getCategoryById(set.getInt("category_id")),
                    authorDAO.getAuthorById(set.getInt("author_id")),
                    publisherDAO.getPublisherById(set.getInt("publisher_id"))
            );
        }
        return book;
    }
    
    public ArrayList<Book> searchBook(Book book) throws SQLException {
        ArrayList<Book> listBook = new ArrayList<>();
        String query = ""
                + "SELECT b.id, b.display_price, b.stock_qtt, b.published_date, b.description, b.image_url, t.id AS title_id, t.name AS title, c.id AS category_id, c.category_name AS category, a.id AS author_id, a.author_name AS author "
                + "FROM tblbook b "
                + "INNER JOIN tblcategory c ON (b.category_id = c.id) "
                + "INNER JOIN tbltitle t ON (b.title_id = t.id) "
                + "INNER JOIN tblauthor a ON (b.author_id = a.id) "
                + "WHERE t.name LIKE '%" + book.getTitle().getName() + "%' "
                + "AND a.author_name LIKE '%" + book.getAuthor().getAuthorName() + "%' "
                + "AND c.category_name LIKE '%" + book.getCategory().getName() + "%'"
        ;        
        System.out.println(query);
        ResultSet set = null;
        PreparedStatement ps = null;
        
        ps = DbConnect.getConnection().prepareStatement(query);
        set = ps.executeQuery();
        while (set.next()) {
            book = new Book(
                    set.getInt("id"),
                    set.getString("image_url"),
                    set.getInt("stock_qtt"),
                    set.getFloat("display_price"),
                    set.getString("published_date"),
                    set.getString("description"),
                    new Title(set.getInt("title_id"), set.getString("title"), ""),
                    new Category(set.getInt("category_id"),set.getString("category"), ""),
                    new Author(set.getInt("author_id"), set.getString("author"), "", ""),
                    null
            );
            listBook.add(book);
        }
        return listBook;
    }

    public ArrayList<Book> getAllBook() throws SQLException {
        String query = "SELECT id, display_price, published_date, description, stock_qtt, image_url, title_id, category_id, author_id, publisher_id FROM tblbook";
        AuthorDAO authorDAO = new AuthorDAO();
        PublisherDAO publisherDAO = new PublisherDAO();
        CategoryDAO cateDAO = new CategoryDAO();
        TitleDAO titleDAO = new TitleDAO();
        ResultSet set = null;
        PreparedStatement ps = null;
        ArrayList<Book> arrBook = new ArrayList();
        ps = DbConnect.getConnection().prepareStatement(query);
        set = ps.executeQuery();
        while (set.next()) {
            arrBook.add(new Book(
                    set.getInt("id"),
                    set.getString("image_url"),
                    set.getInt("stock_qtt"),
                    set.getFloat("display_price"),
                    set.getString("published_date"),
                    set.getString("description"),
                    titleDAO.getTitle(set.getInt("title_id")),
                    cateDAO.getCategoryById(set.getInt("category_id")),
                    authorDAO.getAuthorById(set.getInt("author_id")),
                    publisherDAO.getPublisherById(set.getInt("publisher_id"))
            ));
        }
        return arrBook;
    }

    public void addBook(Book book) throws SQLException {
        Title title = book.getTitle();
        Category cate = book.getCategory();
        Author author = book.getAuthor();
        Publisher publisher = book.getPublisher();

        String sqlInsertTitle = "INSERT INTO tbltitle(name, description) VALUES(?, ?)";
        PreparedStatement psInsertTitle = DbConnect.getConnection().prepareStatement(sqlInsertTitle, Statement.RETURN_GENERATED_KEYS);
        psInsertTitle.setString(1, title.getName());
        psInsertTitle.setString(2, title.getDescription());
        psInsertTitle.executeUpdate();

        ResultSet r = psInsertTitle.getGeneratedKeys();
        if (r.next()) {
            int idTitle = r.getInt(1);
            title.setId(idTitle);
        }

        String sql = "INSERT INTO tblbook(display_price, published_date, description, stock_qtt, image_url, title_id, category_id, author_id, publisher_id) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement ps = null;
        ps = DbConnect.getConnection().prepareStatement(sql);
        ps.setFloat(1, book.getPrice());
        ps.setString(2, book.getPublishedDate());
        ps.setString(3, book.getDescription());
        ps.setInt(4, book.getStockQtt());
        ps.setString(5, book.getImageUrl());
        ps.setInt(6, title.getId());
        ps.setInt(7, cate.getId());
        ps.setInt(8, author.getId());
        ps.setInt(9, publisher.getId());
        

        ps.executeUpdate();
    }
}

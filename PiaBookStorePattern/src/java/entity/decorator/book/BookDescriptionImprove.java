/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entity.decorator.book;

import entity.book.Author;
import entity.book.Book;
import entity.book.Category;
import entity.book.Publisher;
import entity.book.Title;
import entity.book.Translator;

/**
 *
 * @author Duy Buffet
 */
public class BookDescriptionImprove extends BookDecorator {
    private Book book;

    public BookDescriptionImprove(Book book) {
        this.book = book;        
    }
    
    @Override
    public String getDescription() {
        return "Description about this book <br>" + book.getDescription();
    }

    @Override
    public int getBookId() {
        return book.getBookId(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getImageUrl() {
        return book.getImageUrl(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int getStockQtt() {
        return book.getStockQtt(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public float getPrice() {
        return book.getPrice(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getPublishedDate() {
        return book.getPublishedDate(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Title getTitle() {
        return book.getTitle(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Category getCategory() {
        return book.getCategory(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Author getAuthor() {
        return book.getAuthor(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Translator getTranslator() {
        return book.getTranslator(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Publisher getPublisher() {
        return book.getPublisher(); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}

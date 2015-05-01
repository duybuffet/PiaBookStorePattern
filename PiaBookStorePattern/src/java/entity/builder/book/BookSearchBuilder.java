/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entity.builder.book;

import java.util.HashMap;

/**
 *
 * @author Duy Buffet
 */
public class BookSearchBuilder implements BookBuilder {
    private HashMap<Integer, Object> actions;
    private BookSearchBuildable book;

    public BookSearchBuilder() {
        book = new BookSearchBuildable();
        actions = new HashMap<>();
    }        
    
    @Override
    public void addTitle(String title) {
        actions.put(new Integer(1), title);
    }

    @Override
    public void addCategory(String name) {
        actions.put(new Integer(2), name);
    }

    @Override
    public void addAuthor(String name) {
        actions.put(new Integer(3), name);
    }

    @Override
    public void addPrice(Float price) {
        actions.put(new Integer(4), price);
    }

    @Override
    public BookBuildable getBook() {
        book.loadActions(actions);
        return book;
    }
    
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entity.builder.book;

import entity.book.Author;
import entity.book.Book;
import entity.book.Category;
import entity.book.Title;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 *
 * @author Duy Buffet
 */
public class BookSearchBuildable implements BookBuildable {
    private HashMap<Integer, Object> actions;
    private Book book = new Book();
    @Override
    public void produce() {
        Iterator itr = actions.entrySet().iterator();
        while (itr.hasNext()) {
            Map.Entry pair = (Map.Entry) itr.next();
            int choice = (Integer)pair.getKey();
            switch (choice) {
                case 1:
                    Title title = new Title();
                    title.setName(String.valueOf(pair.getValue()));
                    book.setTitle(title);
                    break;
                    
                case 2:
                    Category cat = new Category(String.valueOf(pair.getValue()), null);
                    book.setCategory(cat);
                    break;
                    
                case 3:
                    Author author = new Author();
                    author.setAuthorName(String.valueOf(pair.getValue()));
                    book.setAuthor(author);
                    break;
                    
                case 4:
                    Float price = (float)pair.getValue();
                    book.setPrice(price);
                    break;
                    
                default:
                    break;
            }
        }
    }

    void loadActions(HashMap<Integer, Object> actions) {
        this.actions = actions;
    }
    
    public Book getBook() {
        return book;
    }
    
}

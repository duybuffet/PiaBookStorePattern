/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entity.builder.book;

import entity.book.Book;

/**
 *
 * @author Duy Buffet
 */
public interface BookBuildable {
    public void produce();
    public Book getBook();
}

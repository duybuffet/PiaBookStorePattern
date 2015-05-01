/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entity.decorator.book;

import entity.book.Book;

/**
 *
 * @author Duy Buffet
 */
public abstract class BookDecorator extends Book {
    @Override
    public abstract String getDescription();
}

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
public class Test {
    public static void main(String[] args) {
        BookBuilder builder = null;
        BookBuildable bookBuildable = null;
        Book book = null;
       
        builder = new BookSearchBuilder();
        
        builder.addAuthor("Duy");
        builder.addPrice(205F);
        builder.addTitle("4 van dam duoi bien");
        builder.addCategory("khoa hoc vien tuong");
        
        bookBuildable = builder.getBook();
        bookBuildable.produce();
        book = bookBuildable.getBook();
        
        System.out.println(book.getTitle().getName());
    }
}

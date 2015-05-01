/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package entity.builder.book;

/**
 *
 * @author Duy Buffet
 */
public interface BookBuilder {
    public void addTitle(String title);
    public void addCategory(String name);
    public void addAuthor(String name);
    public void addPrice(Float price);
    public BookBuildable getBook();
}

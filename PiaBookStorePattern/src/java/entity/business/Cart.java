package entity.business;

import java.util.HashMap;
import entity.book.Book;

public class Cart {

    private HashMap<Integer, Integer> listBook;

    public Cart() {
        listBook = new HashMap<>();
    }

    public void addToCart(Book book) {
        if (listBook.containsKey(book.getBookId())) {
            int qtt = listBook.get(book.getBookId()) + 1;
            listBook.remove(book.getBookId());
            listBook.put(book.getBookId(), qtt);
        } else {
            listBook.put(book.getBookId(), 1);
        }
    }

    public boolean changeQuantity(Book book, int qtt) {
        boolean flag = true;
        if (listBook.containsKey(book.getBookId())) {
            if (qtt < 0) {
                flag = false;
            } else if (qtt == 0) {
                listBook.remove(book.getBookId());
            } else {
                listBook.remove(book.getBookId());
                listBook.put(book.getBookId(), qtt);
            }
        }
        return flag;
    }

    public HashMap<Integer, Integer> getListBook() {
        return listBook;
    }

    public void setListBook(HashMap<Integer, Integer> listBook) {
        this.listBook = listBook;
    }    
}

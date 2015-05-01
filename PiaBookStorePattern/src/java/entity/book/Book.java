package entity.book;

public class Book extends Document {

    private int bookId;
    private String imageUrl;
    private int stockQtt;
    
    public Book() {
    }

    public Book(float price, String publishedDate,
            String description, Title title, Category category, Author author, Publisher publisher, String imageUrl) {
        super(price, publishedDate, description, title, category,
                author, publisher);
        this.imageUrl = imageUrl;
    }

    public Book(int bookId, String imageUrl, int stockQtt, float price, String publishedDate, String description, Title title, Category category, Author author, Publisher publisher) {
        super(price, publishedDate, description, title, category, author, publisher);
        this.bookId = bookId;
        this.imageUrl = imageUrl;
        this.stockQtt = stockQtt;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getStockQtt() {
        return stockQtt;
    }

    public void setStockQtt(int stockQtt) {
        this.stockQtt = stockQtt;
    }
        
}

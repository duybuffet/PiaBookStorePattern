package entity.book;

public class Book {

    private int bookId;
    private String imageUrl;
    private int stockQtt;
    private float price;
    private String publishedDate;
    private String description;
    private Title title;
    private Category category;
    private Author author;   
    private Publisher publisher;
    
    public Book() {
    }       

    public Book(int bookId, String imageUrl, int stockQtt, float price, String publishedDate, String description, Title title, Category category, Author author, Publisher publisher) {
        this.bookId = bookId;
        this.imageUrl = imageUrl;
        this.stockQtt = stockQtt;
        this.price = price;
        this.publishedDate = publishedDate;
        this.description = description;
        this.title = title;
        this.category = category;
        this.author = author;
        this.publisher = publisher;
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
    
    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getPublishedDate() {
        return publishedDate;
    }

    public void setPublishedDate(String publishedDate) {
        this.publishedDate = publishedDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Title getTitle() {
        return title;
    }

    public void setTitle(Title title) {
        this.title = title;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }
    
    public Publisher getPublisher() {
        return publisher;
    }

    public void setPublisher(Publisher publisher) {
        this.publisher = publisher;
    }
        
}

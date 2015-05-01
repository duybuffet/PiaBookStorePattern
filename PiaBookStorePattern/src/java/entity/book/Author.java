package entity.book;

public class Author {

    private int id;
    private String authorName;
    private String gender;
    private String description;

    public Author() {
    }

    public Author(String authorName, String gender, String description) {
        this.authorName = authorName;
        this.gender = gender;
        this.description = description;
    }

    public Author(int id, String authorName, String gender,
            String description) {
        this.id = id;
        this.authorName = authorName;
        this.gender = gender;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}

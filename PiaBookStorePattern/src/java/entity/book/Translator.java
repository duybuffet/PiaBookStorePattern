package entity.book;

public class Translator {

    private String translatorId;
    private String translatorName;
    private String description;
    private boolean gender;

    public Translator() {
    }

    public Translator(String translatorId, String translatorName,
            String description, boolean gender) {
        this.translatorId = translatorId;
        this.translatorName = translatorName;
        this.description = description;
        this.gender = gender;
    }

    public String getTranslatorId() {
        return translatorId;
    }

    public void setTranslatorId(String translatorId) {
        this.translatorId = translatorId;
    }

    public String getTranslatorName() {
        return translatorName;
    }

    public void setTranslatorName(String translatorName) {
        this.translatorName = translatorName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    @Override
    public String toString() {
        return "Translator [translatorId=" + translatorId + ", translatorName="
                + translatorName + ", description=" + description + ", gender="
                + gender + "]";
    }

}

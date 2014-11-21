import java.io.Serializable;

/**
 * Created by xiaomin on 2014/11/17.
 */
public class MyRSSItem implements Serializable{
    private String author;
    private String title;
    private String description;
    private String link;
    private String pubDate;
    public void setAuthor(String author)
    {
        this.author=author;
    }
    public void setTitle(String title)
    {
        this.title=title;
    }
    public  void setDescription(String description)
    {
        this.description=description;
    }
    public  void setLink(String link)
    {
        this.link=link;
    }

    public void setPubDate(String pubDate) {
        this.pubDate = pubDate;
    }
    public String getAuthor()
    {
        return  author;
    }
    public String getTitle()
    {
        return  title;
    }
    public  String getDescription()
    {
        return description;
    }

    public String getLink() {
        return link;
    }

    public String getPubDate() {
        return pubDate;
    }



}

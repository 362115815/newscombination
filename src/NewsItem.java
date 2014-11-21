/**
 * Created by xiaomin on 2014/11/20.
 */
public class NewsItem {
    private String title;
    private String description;
    private String pubDate;
    public String img;
    public  String link;

    public  void setLink(String link)
    {
        this.link=link;
    }
    public  void setImg(String img)
    {
        this.img=img;
    }

    public  void setPubDate(String pubDate)
    {
        this.pubDate=pubDate;
    }
    public  void setTitle(String title)
    {
        this.title=title;
    }
    public void setDescription(String description)
    {
        this.description=description;
    }
    public  String getLink()
    {
        return link;
    }
    public  String getImg()
    {
        return img;
    }
    public String getPubDate(){
        return pubDate;
    }
    public String getTitle()
    {
        return title;
    }
    public String getDescription() {
        return description;
    }
}

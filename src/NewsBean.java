
import java.io.File;
import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

/**
 * Created by xiaomin on 2014/11/20.
 */
public class NewsBean {

    public ArrayList<NewsItem> getNews(String channel) throws Exception {

        DBConnect db=new DBConnect();
        String sql ="select * from channellist where channelname like\'%"+channel+"%\'";
        db.stmt=db.createStatement(sql);
        //获得频道的查询结果
        ResultSet rt=db.executeQuery();

        ArrayList<String> channels=new ArrayList<String>();

        while(rt.next()) {
            //获得频道的查询结果对应的文件路径
            channels.add(rt.getString(2));
        }

        //根据每个文件路径打开并读取Object存入数组中
        ArrayList<NewsItem> newsItems=new ArrayList<NewsItem>();
        for(int i=0;i<channels.size();i++)
        {
             String filepath=channels.get(i);

            FileInputStream in=new FileInputStream(filepath);

            ObjectInputStream objin=new ObjectInputStream(in);
            ArrayList<MyRSSItem> rssItems= (ArrayList<MyRSSItem>) objin.readObject();
             for(int j=0;j<rssItems.size();j++)
             {
                 MyRSSItem item=(MyRSSItem)rssItems.get(j);
                 String title=item.getTitle();
                 String description=item.getDescription();
                 String pubDate=item.getPubDate();
                 String link=item.getLink();
                 //把description里面的图片提取出来
                 int m=description.indexOf("<img");
                 if(m!=-1)
                 {
                     description= (String) description.subSequence(0,m);
                 }
                 NewsItem newsItem=new NewsItem();
                 newsItem.setTitle(title);
                 newsItem.setDescription(description);
                 newsItem.setPubDate(pubDate);
                 newsItem.setLink(link) ;
                 newsItems.add(newsItem);

             }
        }

        return newsItems;
    }
    public ArrayList<NewsItem> Search(String key) throws Exception {
        DBConnect db=new DBConnect();
        String sql="select * from channellist";
        db.stmt=db.createStatement(sql);
        ResultSet rt=db.executeQuery();
            ArrayList<String> channels=new ArrayList<String>();
        while(rt.next()) {
            //获得频道的查询结果对应的文件路径
            channels.add(rt.getString(2));
        }
        ArrayList<NewsItem> newsItems=new ArrayList<NewsItem>();
        for(int i=0;i<channels.size();i++)
        {
            String filepath=channels.get(i);
            FileInputStream in=new FileInputStream(filepath);
            ObjectInputStream objin=new ObjectInputStream(in);
            ArrayList<MyRSSItem> rssItems= (ArrayList<MyRSSItem>) objin.readObject();
            for(int j=0;j<rssItems.size();j++)
            {
                MyRSSItem item=(MyRSSItem)rssItems.get(j);
                String title=item.getTitle();
                String description=item.getDescription();

                int titleindex=title.indexOf(key);
                int dscbindex=description.indexOf(key);
                if(titleindex!=-1||dscbindex!=-1)
                {
                    String pubDate=item.getPubDate();
                    String link=item.getLink();
                    //把description里面的图片提取出来
                    int m=description.indexOf("<img");
                    if(m!=-1)
                    {
                        description= (String) description.subSequence(0,m);
                    }
                    NewsItem newsItem=new NewsItem();
                    newsItem.setTitle(title);
                    newsItem.setDescription(description);
                    newsItem.setPubDate(pubDate);
                    newsItem.setLink(link) ;
                    newsItems.add(newsItem);
                }
            }
        }

        return newsItems;

    }

}

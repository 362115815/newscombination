package bean;


import org.gnu.stealthp.rsslib.RSSException;
import org.gnu.stealthp.rsslib.RSSHandler;
import org.gnu.stealthp.rsslib.RSSItem;
import org.gnu.stealthp.rsslib.RSSParser;
import  java.util.List;
import java.net.MalformedURLException;
import java.net.URL;
/**
 * Created by xiaomin on 2014/10/27.
 */

//获取rss资源
public class RSSbean {

    public List Start(final String rssURL) throws RSSException {

        //解析本地rss
          RSSHandler localRSSHandler = new RSSHandler();
        RSSParser.parseXmlFile(rssURL, localRSSHandler, false);
       List channelItems=RSSInfoRetriever.getRSSInfo(localRSSHandler);
     /*   // 取得rss元素的信息并且打印在控制台上

        System.out.println("*************Charles博客的 rss信息如下****************");
        System.out.println(localRSSInfo);
        System.out.println("****************************************************");
         return localInfo;*/
/*
    // 取得远程的rss
        RSSHandler remoteRSSHandler = new RSSHandler();
        try {
            RSSParser.parseXmlFile(new URL(remoteRSS), remoteRSSHandler, false);
            // 取得rss元素的信息并且打印在控制台上
            String remoteRSSInfo=RSSInfoRetriever.getRSSInfo(remoteRSSHandler);
            System.out.println("****************人民网的 rss信息如下******************");
            System.out.println(remoteRSSInfo);
            System.out.println("****************************************************");
            return  remoteRSSInfo;
        }
      catch (MalformedURLException e)
      {

      }*/

     return channelItems;
    }

    public  static String getItemInfo(RSSItem item)
    {
        String itemInfo=new String();
        //摘要作者
        String itemAuthor=item.getAuthor();
        //摘要标题
        String itemTitle=item.getTitle();
        //摘要描述
        String itemDescription=item.getDescription();
        //摘要链接
        String itemLink=item.getLink();
        //摘要发布日期
        String itemPubDate=item.getPubDate();

        itemInfo+="作者:"+itemAuthor+"<br>";
        itemInfo+="标题:"+itemTitle+"<br>";
        itemInfo+="描述:"+itemDescription+"<br>";
        itemInfo+="链接:"+"<a href=\""+itemLink+"\">"+itemLink+"</a><br>";
        itemInfo+="发布日期:"+itemPubDate+"<br>";
        itemInfo+="<br>";
        return itemInfo;
    }

}

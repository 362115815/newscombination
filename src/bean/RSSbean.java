package bean;


import org.gnu.stealthp.rsslib.RSSException;
import org.gnu.stealthp.rsslib.RSSHandler;
import org.gnu.stealthp.rsslib.RSSParser;

import java.net.MalformedURLException;
import java.net.URL;
/**
 * Created by xiaomin on 2014/10/27.
 */

//获取rss资源
public class RSSbean {

    public String Start(final String rssURL) throws RSSException {


        //解析本地rss
        RSSHandler localRSSHandler = new RSSHandler();
        RSSParser.parseXmlFile(rssURL, localRSSHandler, false);
        String localInfo=RSSInfoRetriever.getRSSInfo(localRSSHandler);
     /*   // 取得rss元素的信息并且打印在控制台上

        System.out.println("*************Charles博客的 rss信息如下****************");
        System.out.println(localRSSInfo);
        System.out.println("****************************************************");*/
         return localInfo;
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

      }
     return "";*/
    }


}

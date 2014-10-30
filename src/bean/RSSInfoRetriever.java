package bean;

/**
 * Created by xiaomin on 2014/10/28.
 */
import org.gnu.stealthp.rsslib.RSSChannel;
import org.gnu.stealthp.rsslib.RSSHandler;
import org.gnu.stealthp.rsslib.RSSImage;
import org.gnu.stealthp.rsslib.RSSItem;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class RSSInfoRetriever {

    public static List getRSSInfo(RSSHandler handler)

    {
        StringBuffer rssInfo = new StringBuffer();
        //取得rss提要的频道信息(Channel)
        RSSChannel channel = handler.getRSSChannel();
        //Part1:分离出rss频道的元信息
        //(1)频道的标题
        String titleInfo = channel.getTitle();
        //(2)频道的链接信息
        String linkInfo = channel.getLink();
        //(3)频道的描述信息
        String descriptionInfo = channel.getDescription();
        //(4)频道使用的语言
        String languageInfo = channel.getLanguage();
        //(5)频道版权信息
        String copyrightInfo = channel.getCopyright();
        //(6)频道的generator的信息
        String generatorInfo = channel.getGenerator();
        //(7)频道的image信息
        RSSImage channelImage = channel.getRSSImage();
        String channelImageUrl = channelImage.getUrl();

        rssInfo.append("频道标题： " + titleInfo + "<br/>");
        rssInfo.append("频道相关Link信息： " + linkInfo + "<br/>");
        rssInfo.append("频道描述信息: " + descriptionInfo + "<br/>");
        rssInfo.append("频道使用的语言： " + languageInfo + "<br/>");
        rssInfo.append("频道版权信息： " + copyrightInfo + "<br/>");
        rssInfo.append("频道产生器信息： " + generatorInfo + "<br/>");
        rssInfo.append("频道图片URL: " + channelImageUrl + "<br/>");

        //Part2: 分离出rss频道的所有摘要(feed)，这里用item表示
        List channelItems = channel.getItems();


        int itemSize = channelItems.size();
        if (itemSize >= 1) {
            rssInfo.append("<br/>");
            rssInfo.append("一共有" + itemSize + "个摘要在这个频道中");
            rssInfo.append("<br/>");

            /*for(int i=0;i<itemSize;i++)
            {
                int itemNo=i+1;
                RSSItem item =(RSSItem) channelItems.get(i);

                rssInfo.append("<br/>");
                rssInfo.append("摘要"+itemNo+":");

                //(1)摘要的作者
                String itemAuthor=item.getAuthor();
                //(2)摘要的标题
                String itemTitle=item.getTitle();
                //(3)摘要的描述
                String itemDescription=item.getDescription();
                //(4)摘要的链接
                String itemLink=item.getLink();
                //(5)摘要的发布日期
                String itemPubDate=item.getPubDate();

                rssInfo.append("作者： "+itemAuthor+"<br>");
                rssInfo.append("标题： "+itemTitle+"<br>");
                rssInfo.append("描述： "+itemDescription+"<br>");
                rssInfo.append("链接： <a href="+itemLink+">"+itemLink+"</a><br>");
                rssInfo.append("发布日期: "+itemPubDate+"<br>");

                rssInfo.append("<br>");
            }
        }
        return rssInfo.toString();*/
            return channelItems;
        }
        return null;

    }
}


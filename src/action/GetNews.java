package action;

import bean.ContentCompare;
import bean.RSSInfoRetriever;
import bean.RSSbean;
import bean.Similarity;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import org.gnu.stealthp.rsslib.RSSException;
import org.gnu.stealthp.rsslib.RSSItem;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by xiaomin on 2014/10/27.
 */
public class GetNews extends ActionSupport{
    public String execute() throws RSSException {

      RSSbean rss=new RSSbean();
      /*  String remoteRSS="http://news.qq.com/newsgn/rss_newsgn.xml";//qq国内要闻
        String remoteRSS1="http://rss.sina.com.cn/news/china/focus15.xml";//新浪国内要闻；*/
        String remoteRSS="D://qq.xml";
        String remoteRSS1="D://sina.xml";
        List finalChannelItems=null;

        try {
            List channelItems1=rss.Start(remoteRSS);
            List channelItems2=rss.Start(remoteRSS1);
            finalChannelItems= ContentCompare.compare(channelItems1,channelItems2);
            StringBuffer itemsInfo=new StringBuffer();
            int itemNo=0;
            for(int i=0;i<finalChannelItems.size();i++)
            {

                RSSItem item=(RSSItem)finalChannelItems.get(i);
                itemNo=i+1;
               itemsInfo.append("摘要"+itemNo+":<br>");
                String itemTemp=new String();
                itemTemp=RSSbean.getItemInfo(item);
                itemsInfo.append(itemTemp);
            }
           ActionContext context=ActionContext.getContext();
            Map request=(Map)context.get("request");
            request.put("itemsInfo",itemsInfo);


        } catch (RSSException e) {
            e.printStackTrace();
        }

      /*  String s1="央视网消息(新闻联播)：本台消息：国务院副总理、中俄能源合作委员会中方主席张高丽29日应约同俄罗斯副总理、委员会俄方主席德沃尔科维奇通电话。张高丽说，李克强总理不久前成功访俄，和梅德韦杰夫总理共同举行中俄总理第十九次定期会晤，推动中俄全面战略协作伙伴关系继续向前发展。希望双方积极落实两国领导人就扩大能";

        String s2="新华网北京10月29日电 国务院副总理、中俄能源合作委员会中方主席张高丽29日应约同俄罗斯副总理、委员会俄方主席德沃尔科维奇通电话。张高丽说，李克强总理不久前成功访俄，和梅德韦杰夫总理共同举行中俄总理第十九次定期会晤，推动中俄全面战略协作伙伴关系继续向前发展。";
        double similarity=0;
        try {

                similarity = Similarity.getSimilarity(s1, s2);
            }
        catch (Exception e)
        {

        }*/



        return "success";
    }
}
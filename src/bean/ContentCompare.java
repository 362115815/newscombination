package bean;

/**
 * Created by xiaomin on 2014/10/29.
 */
import org.gnu.stealthp.rsslib.RSSItem;

import java.util.ArrayList;
import  java.util.List;
public class ContentCompare {
   public  static List compare(List channelItems1, List channelItems2)
    {
        ArrayList<RSSItem> result=new ArrayList<RSSItem>();
        int itemsSize1,itemsSize2;
        itemsSize1=channelItems1.size();
        itemsSize2=channelItems2.size();
        if(itemsSize1!=0&&itemsSize2!=0)
        {

            for(int i=0;i<itemsSize2;i++)
            {
                int flag=1;
                RSSItem item2=(RSSItem)channelItems2.get(i);
                String description2=item2.getDescription();
                for(int j=0;j<itemsSize1;j++)
                {
                    RSSItem item1=(RSSItem)channelItems1.get(j);
                    String description1=item1.getDescription();
                    try
                    {
                        double similarity=Similarity.getSimilarity(description1,description2);
                        if(similarity>0.5)
                        {
                            flag=0;
                            break;
                        }
                        else {

                            continue;
                        }
                    }
                catch (Exception e)
                {
                        System.out.println(e);
                }

                }
                if(flag==1)
                {
                    result.add(item2);
                }
            }
            for(int i=0;i<itemsSize1;i++)
            {
                RSSItem item=(RSSItem)channelItems1.get(i);
                result.add(item);
            }
        }
        return result;
    }
}

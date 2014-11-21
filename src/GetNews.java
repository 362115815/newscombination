import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Map;

/**
 * Created by xiaomin on 2014/11/20.
 */
public class GetNews extends ActionSupport{
    private  String channel;
    public  void setChannel(String channel) throws UnsupportedEncodingException {
        this.channel=java.net.URLDecoder.decode(channel,"utf-8");
    }
    public String getChannel()
    {
        return channel;
    }
    public  String execute() throws Exception {

        NewsBean newsBean=new NewsBean();

         ArrayList<NewsItem> newsItems= newsBean.getNews(channel);

        Map request=(Map) ActionContext.getContext().get("request");
        request.put("newsItems",newsItems);
        return "success";
    }
}

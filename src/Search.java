import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Map;

/**
 * Created by xiaomin on 2014/11/21.
 */
public class Search extends ActionSupport{
    private  String key;
    public void setKey(String key) throws UnsupportedEncodingException {
       String key1=new String(key.getBytes("ISO-8859-1"),"utf-8");
        this.key=key1;
    }
    public  String getKey()
    {
        return key;
    }

    public String execute() throws Exception {

        NewsBean newsBean=new NewsBean();
        ArrayList<NewsItem> newsItems= newsBean.Search(key);
        Map request=(Map) ActionContext.getContext().get("request");
        request.put("newsItems",newsItems);
        return "success";
    }
}

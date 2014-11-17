
import org.gnu.stealthp.rsslib.RSSChannel;
import org.gnu.stealthp.rsslib.RSSHandler;
import org.gnu.stealthp.rsslib.RSSItem;
import org.gnu.stealthp.rsslib.RSSParser;
import sun.swing.FilePane;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.Timer;

/**
 * Created by xiaomin on 2014/11/10.
 */
public class NewsUpdater {

    public  void update() throws Exception {
        String filepathQQ="./rssfile/";
        String filepathSina="./rssfile/";
        String filepathWangyi="./rssfile/";
        String siteQQ="qq";
        String siteSina="sina";
        String siteWangyi="wangyi";
        getNewfile(filepathQQ,siteQQ);
        getNewfile(filepathSina,siteSina);
        getNewfile(filepathWangyi,siteWangyi);

        //三个网站的xml都下载完后开始比较相同新闻，将相同的新闻放在一起；
        //获得channel名单
        //连接数据库
        DBConnect db=new DBConnect();
        //声明sql语句
        String sql="select * from channellist";
        ArrayList<String> channelList=new ArrayList<String>();
        ArrayList<String> channelpath=new ArrayList<String>();
        //创建sql语句
        try {
            db.stmt=db.createStatement(sql);

            ResultSet rt=db.executeQuery();

            while(rt.next())
            {
                String channelname=rt.getString(1);
                String path=rt.getString(2);
                channelList.add(channelname);
                channelpath.add(path);
            }


        }
        catch (Exception e) {
            System.out.println(e.toString());
        }


        if(channelList.size()!=0)
        {
            int count=0;
            for(int i=0;i<channelList.size();i++)
            {
                String channel=new String();
                channel =channelList.get(i);




                //从三个表中获取channel有关的所有频道和路径；
               ArrayList<String>qqchannel=new ArrayList<String>();

                String orichannel=channel;
                channel="%"+channel+"%";

                //构建sql语句
                String sql1="select * from qq where channel like \'"+channel+"\'";
                String sql2="select * from sina where channel like \'"+channel+"\'";
                String sql3="select * from wangyi where channel like \'"+channel+"\'";
               db.stmt=db.createStatement(sql1);
                ResultSet rtqq=db.executeQuery();
               db.stmt=db.createStatement(sql2);
                ResultSet rtsina=db.executeQuery();
                db.stmt=db.createStatement(sql3);
                ResultSet rtwangyi=db.executeQuery();


                ArrayList<String> filepath=new ArrayList<String>();

                //获取查询结果的filepath
                while(rtqq.next())
                {
                    String temp=rtqq.getString(2);
                    System.out.println(temp);
                    filepath.add(temp);
                }
                while(rtsina.next())
                {
                    String temp=rtsina.getString(2);
                    System.out.println(temp);
                    filepath.add(temp);
                }

                while(rtwangyi.next())
                {
                    String temp=rtwangyi.getString(2);
                    System.out.println(temp);
                    filepath.add(temp);
                }


                //如果结果为空则调到下一项
                if(filepath.size()==0)
                {
                    continue;
                }


                //将结果每个xml的item保存到数组itemList里面

               ArrayList<RSSItem> itemList=new ArrayList<RSSItem>();
                for(int j=0;j<filepath.size();j++)
                {
                    String path=filepath.get(j);
                       System.out.println(path);
                    //解析本地rss
                    RSSHandler localRSSHandler=new RSSHandler();
                    RSSParser.parseXmlFile(path,localRSSHandler,false);

                    //获得rss频道
                    RSSChannel channel1=localRSSHandler.getRSSChannel();
                    //获得rss里面的item
                    List items=channel1.getItems();
                    int itemsize=items.size();
                    for(int k=0;k<itemsize;k++)
                    {
                        RSSItem item=(RSSItem) items.get(k);
                        itemList.add(item);
                    }
                }

                //对每个item进行排序，相同的排在一起存入itemList1

                ArrayList<MyRSSItem> itemList1=new ArrayList<MyRSSItem>();

                int itemsize=itemList.size();
                while(itemsize!=0)
                {
                    int index=0;
                   RSSItem curitem=itemList.get(index);

                    index++;
                    String curDesb=curitem.getDescription();
                    if(curDesb==null || curDesb=="")
                    {
                        return;
                    }
                    else
                    {
                     //   System.out.println(curDesb);
                    }

                    MyRSSItem myRSSItem=new MyRSSItem();
                    myRSSItem.setAuthor(curitem.getAuthor());
                    myRSSItem.setDescription(curitem.getDescription());
                    myRSSItem.setLink(curitem.getLink());
                    myRSSItem.setPubDate(curitem.getPubDate());
                    myRSSItem.setTitle(curitem.getTitle());

                    itemList1.add(myRSSItem);

                    RSSItem tempitem=new RSSItem();
                    String tempDesb=new String();
                    double similarrity=0;
                    int tempsize=itemList.size();
                    while(index<tempsize)
                    {
                        tempitem=itemList.get(index);
                        tempDesb=tempitem.getDescription();
                        if(tempDesb==null || tempDesb=="")
                        {
                            return;
                        }
                        else
                        {
                           // System.out.println(tempDesb);
                        }
                        similarrity=0;
                        similarrity= Similarity.getSimilarity(curDesb,tempDesb);
                        if(similarrity>=0.5) //说明两个新闻相似性很高，放在一起
                        {

                            MyRSSItem myRSSItem1=new MyRSSItem();
                            myRSSItem1.setAuthor(tempitem.getAuthor());
                            myRSSItem1.setDescription(tempitem.getDescription());
                            myRSSItem1.setLink(tempitem.getLink());
                            myRSSItem1.setPubDate(tempitem.getPubDate());
                            myRSSItem1.setTitle(tempitem.getTitle());

                            itemList1.add(myRSSItem1);

                            itemList.remove(index--);
                        }
                        index++;
                        tempsize=itemList.size();
                    }

                   itemList.remove(0);
                   itemsize=itemList.size();

                }



             //把处理完的itemlist1存到文件中，再把文件路径存到数据库里

                //获得文件路径
                String  path=channelpath.get(i);
                FileOutputStream out=new FileOutputStream(path);
                 ObjectOutputStream objout=new ObjectOutputStream(out);
                objout.writeObject(itemList1);
                objout.flush();
                objout.close();

                FileInputStream in=new FileInputStream(path);
                ObjectInputStream objin=new ObjectInputStream(in);

               ArrayList<MyRSSItem>tempItems= (ArrayList<MyRSSItem>) objin.readObject();


            }

        }


    }
   public  void  getNewfile(String filepath,String site)
    {


        String rssListPath=filepath+site+".txt";//txt文件路径
        try {
            File path=new File(rssListPath);
            BufferedReader br=new BufferedReader(new InputStreamReader(new FileInputStream(path),"GBK"));
            Scanner in = new Scanner(br);
            List channelList = new ArrayList();


            //提取channel和下载链接
            while (in.hasNext()) {
                String str = in.nextLine();
                int index = str.indexOf(" ");
                String channelName = str.substring(0, index);
                String channelAddress = str.substring(index + 1, str.length());
                String[] arrs = {channelName, channelAddress};
                channelList.add(arrs);


        /*    //将网站的频道和xml文件路径插到数据库中
             //构建文件路径
                  //创建数据库连接
            DBConnect db=new DBConnect();

                String xmlFilePath=filepath+site+"/"+channelName+".xml";
                //创建sql语句
                String sql="insert into "+site+" values(\'"+channelName+"\',\'"+xmlFilePath+"\')";
                String sql1=new String(sql.getBytes(),"utf-8");
                db.stmt=db.createStatement(sql1);
                int i=db.executeUpdate();
                   db.close();*/
            }




            //下载每一个channel对应链接的xml文件
            for (int i = 0; i < channelList.size(); i++)
                {
                String[]arr=(String[])channelList.get(i);
                System.out.println("channel:"+arr[0]+"\naddress:"+arr[1]);
                try {
                    String filePath=filepath+site+"/";

                    this.FileDownload(filePath,arr[0],arr[1]);
                } catch (MalformedURLException e) {
                    e.printStackTrace();
                }

            }



        }
        catch (FileNotFoundException e)
        {
            System.out.println(e);
        }
        catch(UnsupportedEncodingException e)
        {
            System.out.println(e);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return;

    }

  public  void FileDownload(String filePath,String filename,String strURL) throws MalformedURLException {
        int bytesum=0;
        int byteread=0;
        URL url=new URL(strURL);
       try
       {
           URLConnection cont=url.openConnection();
           InputStream inStream=cont.getInputStream();
           FileOutputStream fout=new FileOutputStream(filePath+filename+".xml");
           byte[] buffer=new byte[1024];
           int length;
           while((byteread=inStream.read(buffer))!=-1)
           {
               bytesum+=byteread;
               System.out.println(bytesum);
               fout.write(buffer,0,byteread);
           }
           fout.close();


       } catch (IOException e) {
           e.printStackTrace();
       }



   }
    public static void main(String[] args) {

    /*  //构建channellist表
        try {
            File path = new File("./rssfile/channellist.txt");
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(path), "GBK"));
            Scanner in = new Scanner(br);
            //创建数据库连接
            DBConnect db = new DBConnect();

            //提取channel和下载链接
            while (in.hasNext()) {
                String str = in.nextLine();
                String str1="./rssfile/result/"+str;
                //创建sql语句
                String sql = "insert into " + "channellist" + " values(\'" + str + "\',\'"+str1+"\')";

                db.stmt = db.createStatement(sql);
                int i = db.executeUpdate();
            }
            db.close();


        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }*/

        Timer timer = new Timer();
        timer.schedule(new MyTimerTask(), 0, 600000);//设置自动更新
    }
    }

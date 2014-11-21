<%--
  Created by IntelliJ IDEA.
  User: xiaomin
  Date: 2014/11/20
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
  <head>
      <title>Welcome</title>

      <link rel="stylesheet" href="/css/body.css" />
      <script type="text/javascript">


          function getChannel(s)
          {
              var channel=s.getAttribute("channel");

              var channelSeperate=channel.split("_");
              var channelname="";
              for(var i=0;i<channelSeperate.length;i++)
              {
                  channelname+=channelSeperate[i];
                  if(i<channelSeperate.length-1)
                  {
                      channelname+=" > ";
                  }

              }

              document.getElementById("channelname").innerHTML=channelname;

              window.location.href="/getnews.action" +"?channel="+encodeURI(encodeURI(channel));


              //alert(channelname);
          }

      </script>
  </head>
  <body>
    <form action="/getnews.action">
        <input type="submit" value="submit" >
        </form>

    <s:property value="#request.channel"></s:property>
    <div>

    <header>
        <!--
            作者：362115815@qq.com
            时间：2014-11-18
            描述：这里添加新闻logo，还有登陆登出框，以及导航，搜索框
        -->

        <img  id="logoimage" src="/img/logo.png"/>

        <form id="denglu">
            <input id="signin" type="button" value="signin"/>
            <input id="login" type="button" value="login"/>
        </form>
        <form >
            <input id="search" type="text"/>
            <input id="submit" type="submit" value="search"/>
        </form>
        <div id="aaa">
            <nav class="multi_drop_menu">
                <ul>
                    <li>
                        <a href="#" channel="新闻" onclick="getChannel(this)">新闻</a>
                        <ul>
                            <li>
                                <a href="#" channel="新闻_国内" onclick="getChannel(this)">国内</a>
                            </li>

                            <li>
                                <a href="#"  channel="新闻_国际" onclick="getChannel(this)">国际</a>
                            </li>
                            <li>
                                <a href="#"channel="新闻_社会" onclick="getChannel(this)">社会</a>
                            </li>
                            <li>
                                <a href="#" channel="新闻_军事" onclick="getChannel(this)">军事</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="#" channel="娱乐" onclick="getChannel(this)">娱乐</a>
                        <ul>
                            <li>
                                <a href="#" channel="娱乐_头条" onclick="getChannel(this)">头条</a>
                            </li>
                            <li>
                                <a href="#"  channel="娱乐_电影" onclick="getChannel(this)">电影</a>
                            </li>
                            <li>
                                <a href="#"  channel="娱乐_音乐" onclick="getChannel(this)">音乐</a>
                            </li>
                            <li>
                                <a href="#"  channel="娱乐_电视" onclick="getChannel(this)">电视</a>
                            </li>
                            <li>
                                <a href="#"  channel="娱乐_明星" onclick="getChannel(this)">明星</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="#"  channel="科技" onclick="getChannel(this)">科技</a>
                        <ul>
                            <li>
                                <a href="#" channel="科技_互联网" onclick="getChannel(this)">互联网</a>
                            </li>
                            <li>
                                <a href="#" channel="科技_IT业界" onclick="getChannel(this)">IT业界</a>
                            </li>
                            <li>
                                <a href="#"  channel="科技_通信" onclick="getChannel(this)">通信</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="#" channel="财经" onclick="getChannel(this)">财经</a>
                        <ul>
                            <li>
                                <a href="#"  channel="财经_头条" onclick="getChannel(this)">头条</a>
                            </li>
                            <li>
                                <a href="#" channel="财经_要闻" onclick="getChannel(this)">要闻</a>
                            </li>
                            <li>
                                <a href="#" channel="财经_国内" onclick="getChannel(this)">国内</a>
                            </li>
                            <li>
                                <a href="#" channel="财经_国际" onclick="getChannel(this)">国际</a>
                            </li>
                            <li>
                                <a href="#" channel="财经_理财" onclick="getChannel(this)">理财</a>
                            </li>
                            <li>
                                <a href="#" channel="财经_金融" onclick="getChannel(this)">金融</a>
                            </li>
                            <li>
                                <a href="#" channel="财经_基金" onclick="getChannel(this)">基金</a>
                            </li>
                            <li>
                                <a href="#" channel="财经_期货" onclick="getChannel(this)">期货</a>
                            </li>
                            <li>
                                <a href="#" channel="财经_产业新闻" onclick="getChannel(this)">产业新闻</a>
                            </li>
                            <li>
                                <a href="#" channel="财经_财经评论" onclick="getChannel(this)">财经评论</a>
                            </li>
                            <li>
                                <a href="#" channel="财经_股票" onclick="getChannel(this)">股票</a>
                                <ul>
                                    <li>
                                        <a href="#" channel="财经_股票_美股" onclick="getChannel(this)">美股</a>
                                    </li>
                                    <li>
                                        <a href="#" channel="财经_股票_港股" onclick="getChannel(this)">港股</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" channel="体育" onclick="getChannel(this)">体育</a>
                        <ul>
                            <li>
                                <a href="#" channel="体育_篮球" onclick="getChannel(this)">篮球</a>
                                <ul>
                                    <li>
                                        <a href="#" channel="体育_篮球_NBA" onclick="getChannel(this)">NBA</a>
                                    </li>
                                    <li>
                                        <a href="#" channel="体育_篮球_CBA" onclick="getChannel(this)">CBA</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" channel="体育_足球" onclick="getChannel(this)">足球</a>
                                <ul>
                                    <li>
                                        <a href="#" channel="体育_足球_英超" onclick="getChannel(this)">英超</a>
                                    </li>
                                    <li>
                                        <a href="#" channel="体育_足球_意甲" onclick="getChannel(this)">意甲</a>
                                    </li>
                                    <li>
                                        <a href="#" channel="体育_足球_西甲" onclick="getChannel(this)">西甲</a>
                                    </li>
                                    <li>
                                        <a href="#" channel="体育_足球_中国足球" onclick="getChannel(this)">中国足球</a>
                                    </li>
                                    <li>
                                        <a href="#" channel="体育_足球_国际足球" onclick="getChannel(this)">国际足球</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" channel="体育_综合" onclick="getChannel(this)">综合</a>
                            </li>
                            <li>
                                <a href="#" channel="体育_赛车" onclick="getChannel(this)">赛车</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" channel="汽车" onclick="getChannel(this)">汽车</a>
                        <ul>
                            <li>
                                <a href="#" channel="汽车_头条" onclick="getChannel(this)">头条</a>
                            </li>
                            <li>
                                <a href="#" channel="汽车_要闻" onclick="getChannel(this)">要闻</a>
                            </li>
                            <li>
                                <a href="#" channel="汽车_导购" onclick="getChannel(this)">导购</a>
                            </li>
                            <li>
                                <a href="#" channel="汽车_试驾" onclick="getChannel(this)">试驾</a>
                            </li>
                            <li>
                                <a href="#" channel="汽车_行情" onclick="getChannel(this)">行情</a>
                            </li>
                            <li>
                                <a href="#" channel="汽车_改装" onclick="getChannel(this)">改装</a>
                            </li>
                            <li>
                                <a href="#" channel="汽车_新车上市" onclick="getChannel(this)">新车上市</a>
                            </li>
                            <li>
                                <a href="#" channel="汽车_用车修车" onclick="getChannel(this)">用车修车</a>
                            </li>
                            <li>
                                <a href="#" channel="汽车_汽车用品" onclick="getChannel(this)">汽车用品</a>
                            </li>
                        </ul>
                    </li>
                </ul>

            </nav>
        </div>

    </header>

    <section >
        <!--
            作者：362115815@qq.com
            时间：2014-11-18
            描述：这里添加新闻主题部分，article，aside
        -->
        <div id="channel" >
            <!--频道名称-->
            <div >

                <p id="channelname"></p>

            </div>
            <!--新闻内容-->
            <div>


            </div>
        </div>
    </section>
    <footer>
        <!--
            作者：362115815@qq.com
            时间：2014-11-18
            描述：这里还没想好加什么
        -->
    </footer>
    </div>
  </body>
</html>

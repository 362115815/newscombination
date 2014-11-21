<%--
  Created by IntelliJ IDEA.
  User: xiaomin
  Date: 2014/11/20
  Time: 23:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>

    <title>Welcome</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/body1.css" />
    <link href="css/styles.css" rel="stylesheet">
<%--    <link href="css/animation.css" rel="stylesheet">--%>

    <!-- 返回顶部调用 begin -->
    <link href="css/lrtk.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/js.js"></script>
    <!-- 返回顶部调用 end-->
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

           /* document.getElementById("channelname").innerHTML=channelname;*/

            window.location.href="/getnews.action" +"?channel="+encodeURI(encodeURI(channel));
        }

    </script>

</head>
<body>
<header>
    <nav id="nav" class="multi_drop_menu">
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
                    <li>
                        <a href="#" channel="财经_产业新闻" onclick="getChannel(this)">产业新闻</a>
                    </li>
                    <li>
                        <a href="#" channel="财经_财经评论" onclick="getChannel(this)">财经评论</a>
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
        <script src="js/silder.js"></script><!--获取当前页导航 高亮显示标题-->
    </nav>
</header>
<%--header end--%>

<div id="mainbody">
  <div class="info">
      <div class="info">
          <figure> <img src="images/art.jpg"  alt="Panama Hat">
              <figcaption><strong>渡人如渡己，渡已，亦是渡</strong> 当我们被误解时，会花很多时间去辩白。 但没有用，没人愿意听，大家习惯按自己的所闻、理解做出判别，每个人其实都很固执。与其努力且痛苦的试图扭转别人的评判，不如默默承受，给大家多一点时间和空间去了解。而我们省下辩解的功夫，去实现自身更久远的人生价值。其实，渡人如渡己，渡已，亦是渡人。</figcaption>
          </figure>
          <div class="card">
              <h1>我的名片</h1>
              <p>网名：MIDI</p>
              <p>职业：学生</p>
              <p>电话：18691941843</p>
              <p>Email：362115815@qq.com</p>
              <ul class="linkmore">
                  <li><a href="/" class="talk" title="给我留言"></a></li>
                  <li><a href="/" class="address" title="联系地址"></a></li>
                  <li><a href="/" class="email" title="给我写信"></a></li>
                  <li><a href="/" class="photos" title="生活照片"></a></li>
                  <li><a href="/" class="heart" title="关注我"></a></li>
              </ul>
          </div>
      </div>
      <%--info end--%>
      <div class="blank"></div>
      <div class="blogs">
          <ul class="bloglist">
              <s:iterator value="#request.newsItems" status="state">
              <li>
                  <div class="arrow_box">
                      <div class="ti"></div>
                      <!--三角形-->
                      <div class="ci"></div>
                      <!--圆形-->
                      <h2 class="title"><a href="<s:property value="link"></s:property>" target="_blank"><s:property value="title"></s:property> </a></h2>
                      <ul class="textinfo">
                        <%--  <a href="/"><img src="images/s1.jpg"></a>--%>
                          <p><s:property value="description"></s:property> </p>
                      </ul>
                      <ul class="details">
                          <li class="likes"><a href="#">10</a></li>
                          <li class="comments"><a href="#">34</a></li>
                          <li class="icon-time"><a href="#"><s:property value="pubDate"></s:property> </a></li>
                      </ul>
                  </div>

                  <!--arrow_box end-->
              </li>
              </s:iterator>
           </ul>


          <!--bloglist end-->
          <aside>
              <div class="search">
                  <form class="searchform" action="/search.action">
                      <input type="text" name="key" value="Search"  onfocus="this.value=''" onblur="this.value='Search'">
                  </form>
              </div>
              <div class="tuijian">
                  <h2>推荐新闻</h2>
                  <ol>
                      <li><span><strong>1</strong></span><a href="/">有一种思念，是淡淡的幸福,一个心情一行文字</a></li>
                      <li><span><strong>2</strong></span><a href="/">励志人生-要做一个潇洒的女人</a></li>
                      <li><span><strong>3</strong></span><a href="/">女孩都有浪漫的小情怀――浪漫的求婚词</a></li>
                      <li><span><strong>4</strong></span><a href="/">Green绿色小清新的夏天-个人博客模板</a></li>
                      <li><span><strong>5</strong></span><a href="/">女生清新个人博客网站模板</a></li>
                      <li><span><strong>6</strong></span><a href="/">Wedding-婚礼主题、情人节网站模板</a></li>
                      <li><span><strong>7</strong></span><a href="/">Column 三栏布局 个人网站模板</a></li>
                      <li><span><strong>8</strong></span><a href="/">时间煮雨-个人网站模板</a></li>
                      <li><span><strong>9</strong></span><a href="/">花气袭人是酒香―个人网站模板</a></li>
                  </ol>
              </div>
              <div class="toppic">
                  <h2>图文并茂</h2>
                  <ul>
                      <li><a href="/"><img src="images/k01.jpg">腐女不可怕，就怕腐女会画画！
                          <p>伤不起</p>
                      </a></li>
                      <li><a href="/"><img src="images/k02.jpg">问前任，你还爱我吗？无限戳中泪点~
                          <p>感兴趣</p>
                      </a></li>
                      <li><a href="/"><img src="images/k03.jpg">世上所谓幸福，就是一个笨蛋遇到一个傻瓜。
                          <p>喜欢</p>
                      </a></li>
                  </ul>
              </div>
              <div class="clicks">
                  <h2>热门点击</h2>
                  <ol>
                      <li><span><a href="/">慢生活</a></span><a href="/">有一种思念，是淡淡的幸福,一个心情一行文字</a></li>
                      <li><span><a href="/">爱情美文</a></span><a href="/">励志人生-要做一个潇洒的女人</a></li>
                      <li><span><a href="/">慢生活</a></span><a href="/">女孩都有浪漫的小情怀――浪漫的求婚词</a></li>
                      <li><span><a href="/">博客模板</a></span><a href="/">Green绿色小清新的夏天-个人博客模板</a></li>
                      <li><span><a href="/">女生个人博客</a></span><a href="/">女生清新个人博客网站模板</a></li>
                      <li><span><a href="/">Wedding</a></span><a href="/">Wedding-婚礼主题、情人节网站模板</a></li>
                      <li><span><a href="/">三栏布局</a></span><a href="/">Column 三栏布局 个人网站模板</a></li>
                      <li><span><a href="/">个人网站模板</a></span><a href="/">时间煮雨-个人网站模板</a></li>
                      <li><span><a href="/">古典风格</a></span><a href="/">花气袭人是酒香―个人网站模板</a></li>
                  </ol>
              </div>

              <div class="viny">
                  <dl>
                      <dt class="art"><img src="images/artwork.png" alt="专辑"></dt>
                      <dd class="icon-song"><span></span>南方姑娘</dd>
                      <dd class="icon-artist"><span></span>歌手：赵雷</dd>
                      <dd class="icon-album"><span></span>所属专辑：《赵小雷》</dd>
                      <dd class="icon-like"><span></span><a href="/">喜欢</a></dd>
                      <dd class="music">
                          <audio src="images/nf.mp3" controls></audio>
                      </dd>
                      <!--也可以添加loop属性 音频加载到末尾时，会重新播放-->
                  </dl>
              </div>
          </aside>
      </div>
      <!--blogs end-->
  </div>
    <!--mainbody end-->
    <footer>
        <div class="footer-mid">
            <div class="links">
                <h2>友情链接</h2>
                <ul>
                    <li><a href="/">杨青个人博客</a></li>
                    <li><a href="http://www.3dst.com">3DST技术服务中心</a></li>
                </ul>
            </div>
            <div class="visitors">
                <h2>最新评论</h2>
                <dl>
                    <dt><img src="images/s8.jpg">
                    <dt>
                    <dd>DanceSmile
                        <time>49分钟前</time>
                    </dd>
                    <dd>在 <a href="http://www.yangqq.com/jstt/bj/2013-07-28/530.html" class="title">如果要学习web前端开发，需要学习什么？ </a>中评论：</dd>
                    <dd>文章非常详细，我很喜欢.前端的工程师很少，我记得几年前yahoo花高薪招聘前端也招不到</dd>
                </dl>
                <dl>
                    <dt><img src="images/s7.jpg">
                    <dt>
                    <dd>yisa
                        <time>2小时前</time>
                    </dd>
                    <dd>在 <a href="http://www.yangqq.com/news/s/2013-07-31/533.html" class="title">芭蕾女孩的心事儿</a>中评论：</dd>
                    <dd>我手机里面也有这样一个号码存在</dd>
                </dl>
                <dl>
                    <dt><img src="images/s6.jpg">
                    <dt>
                    <dd>小林博客
                        <time>8月7日</time>
                    </dd>
                    <dd>在 <a href="http://www.yangqq.com/jstt/bj/2013-06-18/285.html" class="title">如果个人博客网站再没有价值，你还会坚持吗？ </a>中评论：</dd>
                    <dd>博客色彩丰富，很是好看</dd>
                </dl>
            </div>
            <section class="flickr">
                <h2>摄影作品</h2>
                <ul>
                    <li><a href="/"><img src="images/01.jpg"></a></li>
                    <li><a href="/"><img src="images/02.jpg"></a></li>
                    <li><a href="/"><img src="images/03.jpg"></a></li>
                    <li><a href="/"><img src="images/04.jpg"></a></li>
                    <li><a href="/"><img src="images/05.jpg"></a></li>
                    <li><a href="/"><img src="images/06.jpg"></a></li>
                    <li><a href="/"><img src="images/07.jpg"></a></li>
                    <li><a href="/"><img src="images/08.jpg"></a></li>
                    <li><a href="/"><img src="images/09.jpg"></a></li>
                </ul>
            </section>
        </div>
        <div class="footer-bottom">
            <p>Copyright 2014 Design by <a href="www.ixiaomin.cn">Xiaomin</a></p>
        </div>
    </footer>
  <%--  <!-- jQuery仿腾讯回顶部和建议 代码开始 -->
    <div id="tbox"> <a id="togbook" href="/e/tool/gbook/?bid=1"></a> <a id="gotop" href="javascript:void(0)"></a> </div>
    <!-- 代码结束 -->--%>
</div>

</body>
</html>

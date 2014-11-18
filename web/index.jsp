<%--
  Created by IntelliJ IDEA.
  User: xiaomin
  Date: 2014/11/18
  Time: 23:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome</title>
    <link rel="stylesheet" href="./css/body.css" />
</head>
<body>
<div>
<header>
    <!--
        作者：362115815@qq.com
        时间：2014-11-18
        描述：这里添加新闻logo，还有登陆登出框，以及导航，搜索框
    -->

    <img  id="logoimage" src="img/logo.png"/>

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
            <ul >
                <li>
                    <a href="#">新闻</a>
                    <ul>
                        <li>
                            <a href="#">国内</a>
                        </li>

                        <li>
                            <a href="#">国际</a>
                        </li>
                        <li>
                            <a href="#">社会</a>
                        </li>
                        <li>
                            <a href="#">军事</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#">娱乐</a>
                    <ul>
                        <li>
                            <a href="#">头条</a>
                        </li>
                        <li>
                            <a href="#">电影</a>
                        </li>
                        <li>
                            <a href="#">音乐</a>
                        </li>
                        <li>
                            <a href="#">电视</a>
                        </li>
                        <li>
                            <a href="#">明星</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#">科技</a>
                    <ul>
                        <li>
                            <a href="#">互联网</a>
                        </li>
                        <li>
                            <a href="#">IT业界</a>
                        </li>
                        <li>
                            <a href="#">通信</a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#">财经</a>
                    <ul>
                        <li>
                            <a href="#">头条</a>
                        </li>
                        <li>
                            <a href="#">要闻</a>
                        </li>
                        <li>
                            <a href="#">国内</a>
                        </li>
                        <li>
                            <a href="#">国际</a>
                        </li>
                        <li>
                            <a href="#">理财</a>
                        </li>
                        <li>
                            <a href="#">金融</a>
                        </li>
                        <li>
                            <a href="#">基金</a>
                        </li>
                        <li>
                            <a href="#">期货</a>
                        </li>
                        <li>
                            <a href="#">产业新闻</a>
                        </li>
                        <li>
                            <a href="#">财经评论</a>
                        </li>
                        <li>
                            <a href="#">股票</a>
                            <ul>
                                <li>
                                    <a href="#">美股</a>
                                </li>
                                <li>
                                    <a href="#">港股</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">体育</a>
                    <ul>
                        <li>
                            <a href="#">篮球</a>
                            <ul>
                                <li>
                                    <a href="#">NBA</a>
                                </li>
                                <li>
                                    <a href="#">CBA</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">足球</a>
                            <ul>
                                <li>
                                    <a href="#">英超</a>
                                </li>
                                <li>
                                    <a href="#">意甲</a>
                                </li>
                                <li>
                                    <a href="#">西甲</a>
                                </li>
                                <li>
                                    <a href="#">中国足球</a>
                                </li>
                                <li>
                                    <a href="#">国际足球</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">综合</a>
                        </li>
                        <li>
                            <a href="#">赛车</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">汽车</a>
                    <ul>
                        <li>
                            <a href="#">头条</a>
                        </li>
                        <li>
                            <a href="#">要闻</a>
                        </li>
                        <li>
                            <a href="#">导购</a>
                        </li>
                        <li>
                            <a href="#">试驾</a>
                        </li>
                        <li>
                            <a href="#">行情</a>
                        </li>
                        <li>
                            <a href="#">改装</a>
                        </li>
                        <li>
                            <a href="#">新车上市</a>
                        </li>
                        <li>
                            <a href="#">用车修车</a>
                        </li>
                        <li>
                            <a href="#">汽车用品</a>
                        </li>
                    </ul>
                </li>
            </ul>

        </nav>
    </div>

</header>
<section>
    <!--
        作者：362115815@qq.com
        时间：2014-11-18
        描述：这里添加新闻主题部分，article，aside
    -->


    <article>


    </article>

    <aside>


    </aside>
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

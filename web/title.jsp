<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
</head>

<body>
<center>
    <div class="channel">
        <div class="channelLogo clearfix">
            <span class="attlogo"><img width="170" height="24" alt="有态度的新闻门户" src="http://img3.cache.netease.com/cnews/temp/img/attlogo-news.png"></span>
            <div class="top_search">
                <form action="http://news.yodao.com/search" method="get" name="nisearch_top" id="formtop" target="_blank">
                    <input type="hidden" name="keyfrom" value="news.163">
                    <input type="hidden" name="suser" value="user163">
                    <input type="hidden" name="ue" value="gbk">
                    <div class="search-input-area">
                        <span class="hidden">搜索</span>
                        <input type="text" name="q" id="searchInput_top" onFocus="this.value=''" value="请输入关键词" class="textBox ">
                        <input type="submit"  name="Submit" value="搜索" tabindex="0" title="搜索" class="search-logo" id="sb_form_go">
                        <!--<span class="search-logo"></span>-->
                    </div>
                    <noscript>&lt;select name="site" class="left"&gt;
                        &lt;option value="网易" selected="selected"&gt;新闻&lt;/option&gt;
                        &lt;option value=""&gt;网页&lt;/option&gt;
                        &lt;/select&gt;</noscript>
                    <div class="left" id="divSelect">
                        <input type="hidden" name="site" value="网易" id="siteName">
                    </div>
                    <input type="hidden" name="in" id="in" value="page">
                </form>
            </div>
        </div>
        <div class="nav-channel clearfix" >
            <div class="nav">
                <div class="nav-blue">
                    <a class="first current" href="" target = "frame2">首页</a>
                    <a href="http://tag.163.com/#news?from=guide" target = "frame2">头条</a>
                    <a href="http://news.163.com/domestic/" target = "frame2">娱乐</a>
                    <a href="http://news.163.com/world/" target = "frame2">体育</a>
                    <a href="http://news.163.com/shehui/" target = "frame2">财经</a>
                    <a href="http://news.163.com/review/" target = "frame2">科技</a>
                    <a href="http://data.163.com/special/datablog/" target = "frame2">国际</a>
                    <a href="./action/rss" target = "frame2">国内</a>
                </div>
            </div>
        </div>
    </div>
</center>
</body>
</html>

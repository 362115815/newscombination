<%--
  Created by IntelliJ IDEA.
  User: xiaomin
  Date: 2014/11/20
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title></title>
</head>
<body>
rss
<s:iterator value="#request.newsItems" status="state">
    <p><a><s:property value="title"></s:property> </a></p>
    <p><a><s:property value="description"></s:property> </a></p>


</s:iterator>
<s:property value="#request.key"></s:property>

</body>
</html>

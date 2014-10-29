<%--
  Created by IntelliJ IDEA.
  User: xiaomin
  Date: 2014/10/27
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title></title>
    <script type="text/javascript">
        function QueryString() {
            var name, value, i;
            var str = location.search;
//alert(str);
            var num = str.indexOf("?")
            str = str.substr(num + 1);
            var arrtmp = str.split("&");
            for (i = 0; i < arrtmp.length; i++) {
                num = arrtmp[i].indexOf("=");
                if (num > 0) {
                    name = arrtmp[i].substring(0, num);
                    value = arrtmp[i].substr(num + 1);
                    this[name] = value;
                }
            }
        }
        function f()
        {

            var content=request.getAttribute("rssInfo");
            alert(content);
        }


    </script>
</head>
<body >
<div id="rsscontent">
<%=request.getAttribute("rssInfo")
%>
</div>
<div >
    <%=request.getAttribute("rssInfo1")%>
    </div>
<%--<s:property value="#request.rssInfo"></s:property>--%>
</body>
</html>

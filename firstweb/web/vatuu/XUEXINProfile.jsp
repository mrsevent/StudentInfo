<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = (String) session.getAttribute("id");
    if (id==null){
        response.sendRedirect("../login.jsp");
    }
%>
<html>
<head>
    <title>学信档案</title>
    <style>
        .but_1{
            height: 36px;
            width: 34px;
            background: url(../css/images/usersys/icon/lefticon.jpg);
            background-repeat: no-repeat;
            background-position:10px;
            cursor: pointer;
        }
        .but_2{
            height: 36px;
            width: 34px;
            background: url(../css/images/usersys/icon/righticon.jpg);
            background-repeat: no-repeat;
            background-position:13px;
            cursor: pointer;
        }
        .but_3{
            height: 38px;
            width: 34px;
            background: url(../css/images/usersys/icon/refresh.jpg);
            background-repeat: no-repeat;
            background-position: 5px;
            cursor: pointer;
        }
        .labelcol{
            width: 160px;
            height:100%;
            float: left;
            box-sizing: border-box;
            border-right: solid 1px #cccccc;
        }
        .winContent{
            margin-left: 160px;
        }
        .table_1 td{
            text-align: center;
            border: 1px solid #9f7e42;
        }
    </style>
</head>
<body style="background: #fafafa;">
<div>
    <div class="labelcol">
        <ul>
            <li><a href="StudentinfoAction.jsp">学籍信息</a></li>
            <li><a href="StudentinfoEdit.jsp">信息修改</a></li>
            <li class="active"><a href="https://my.chsi.com.cn/archive/index.jsp" target="_blank">学信档案</a></li>
        </ul>
    </div>
    <div class="winContent">
        <div>
            <button class="but_1" onclick="window.history.go(-1);"></button>
            <button class="but_2" onclick="window.history.go(1);"></button>
            <button class="but_3" onclick="window.location.reload();"></button>
        </div>
    </div>
</div>
</body>
</html>

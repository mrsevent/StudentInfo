<%--
  Created by IntelliJ IDEA.
  User: 94888
  Date: 2019/1/3
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <script type="text/javascript" src="js/http_code.jquery.com_jquery-2.0.0.js">

    </script>
    <script type="text/javascript">
        function checkform() {
            var id  = document.getElementById("id");
            var password  = document.getElementById("password");
            $("#remindid").html("");
            $("#remindpassword").html("");
            if (id.value == ""&&password.value == ""){
                $("#remindid").html("账号不能为空！");
                $("#remindpassword").html("密码不能为空！");
                return false;
            }
            if (id.value == ""){
                $("#remindid").html("账号不能为空！");
                return false;
            }else{
                $("#remindid").html("");
            }
            if (password.value == ""){
                $("#remindpassword").html("密码不能为空！");
                return false;
            }else{
                $("#remindpassword").html("");
            }
            return true;
        }
    </script>
</head>
<body>
<form action="register" method="post">
    账号：<input type="text" name="id" id="id"><span id="remindid"></span><br/>
    密码：<input type="password" name="password" id="password"><span id="remindpassword"></span><br/>
    性别：<input type="text" name="gender" id="gender"><span id="remindgender"></span><br/>
    电话：<input type="text" name="telephone" id="telephone"><span id="remindtelephone"></span><br/>
    <input type="submit" value="注册" onclick="return checkform();">
</form>
</body>
</html>

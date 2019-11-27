<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>在线教育平台 - 登录页面</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/vue.js"></script>

    <link rel="stylesheet" type="text/css" href="css/index.css"/>
    <script type="text/javascript" src="js/index.js"></script>

</head>
<body class="bg-primary">
<nav class="navbar navbar-default navbar-fixed-top"
     role="navigation">
    <div class="container-fluid">
        <div class="navbar-header  ">
            <p class="navbar-text">在线教育平台 - 登录页面</p>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li id="hoverLi1"><a href="register" target="_blank">|注册|</a></li>
        </ul>
    </div>
</nav>
<div class="panel panel-primary center-block">
    <div class="panel-heading">
        <h3 class="panel-title text-center">登录面板</h3>
    </div>
    <div class="panel-body">
        <form class="form-horizontal" role="form" action="login" method="post">
            <div class="form-group">
                <label for="userId" class="col-sm-2 col-md-2 control-label">账号</label>
                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control" value="1"
                           id="userId" name="userId" placeholder="请输入账号">
                </div>
            </div>

            <div class="form-group">
                <label for="userPass" class="col-sm-2 col-md-2 control-label">密码</label>
                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control" value="1"
                           id="userPass" name="userPass" placeholder="请输入密码">
                </div>
            </div>
            <div class="form-group">
                <label for="userType" class="col-sm-2 col-md-2 control-label">账号类型</label>
                <div class="col-sm-10 col-md-10">
                    <label class="radio-inline">
                        <input type="radio" name="userType" id="userType" value="teacher"checked >教师
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="userType" value="student" >学生
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="userType" value="admin" >管理员
                    </label>
                </div>
            </div>

            <div class="form-group">

                <button type="submit" class="btn btn-info btn-block">登录</button>
            </div>
        </form>
    </div>
    <div class="panel-footer" >
        <h4 class="text-center">${requestScope.loginMessage}</h4>
    </div>
</div>
</body>

</html>
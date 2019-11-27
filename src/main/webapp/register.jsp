<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>在线教育平台 - 注册页面</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/vue.js"></script>

    <link rel="stylesheet" type="text/css" href="css/register.css"/>

</head>
<body class="bg-primary">
<nav class="navbar navbar-default navbar-fixed-top"
     role="navigation">
    <div class="container-fluid">
        <div class="navbar-header  ">
            <p class="navbar-text">在线教育平台 - 注册页面</p>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li id="hoverLi1"><a href="/register" target="_blank">|注册|</a></li>
        </ul>
    </div>
</nav>
<div class="panel panel-primary center-block">
    <div class="panel-heading">
        <h3 class="panel-title text-center">注册面板</h3>
    </div>
    <div class="panel-body">
        <form class="form-horizontal" role="form" action="register" method="post">
            <div class="form-group">
                <label for="userId" class="col-sm-2 col-md-2 control-label">账号</label>
                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control"
                           id="userId" name="userId" placeholder="请输入账号">
                </div>
            </div>
            <div class="form-group">
                <label for="userName" class="col-sm-2 col-md-2 control-label">名字</label>
                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control"
                           id="userName" name="userName" placeholder="请输入名字">
                </div>
            </div>

            <div class="form-group">
                <label for="userPass" class="col-sm-2 col-md-2 control-label">密码</label>
                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control"
                           id="userPass" name="userPass" placeholder="请输入密码">
                </div>
            </div>
            <div class="form-group">
                <label for="userPass1" class="col-sm-2 col-md-2 control-label">重复密码</label>
                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control"
                           id="userPass1" name="userPass1" placeholder="请确认密码">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 col-md-2 control-label">账号类型</label>
                <div class="col-sm-10 col-md-10">
                    <label class="radio-inline">
                        <input type="radio" name="userType" value="teacher" >教师
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="userType" value="student">学生
                    </label>
                </div>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-success btn-block">注册账号</button>
                <h5 class="text-center">${requestScope.registerMessage}</h5>
            </div>
        </form>
    </div>
    <div class="panel-footer" >
        <h5 >注册说明1：表单不能有空值</h5>
        <h5 >注册说明2：账号、密码：字母开头，长度在6~16之间，只能包含字母、数字和下划线</h5>
        <h5 >注册说明3：不能注册已被拉如黑名单的账号</h5>
        <h5 >注册说明4：注册成功后，会直接登录系统</h5>
    </div>
</div>
</body>

</html>
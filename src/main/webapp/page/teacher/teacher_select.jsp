<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询结果</title>
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/vue.js"></script>
    <script type="text/javascript" src="js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="js/bootstrapValidator.js"></script>

    <link rel="stylesheet" type="text/css" href="css/teacher/teacher.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrapValidator.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrapValidator.css"/>
    <script type="text/javascript" src="js/teacher/teacher.js"></script>
</head>
<body class="bg-primary">
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#example-navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">在线教育平台-教师端页面</a>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="teacher?userId=<%=session.getAttribute("userId")%>">我的课程</a></li>
                <li><a href="teacher_info">我的信息</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li id="hoverLi1"><a href="./register">|注册|</a></li>
                <li id="hoverLi2"><a href="#">|退出|</a> </li>
                <li id="hoverLi3" class="ShowUserInfo"><a >|当前在线状态|</a></li>
            </ul>
        </div>
    </div>
</nav>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">课程列表</h3>
        </div>
        <div class="panel-body form-inline">
            <label>搜索名称关键字：<input type="text" class="form-control" placeholder="请输入要搜索的课程名称" id="course_name"></label>
            <button class="btn btn-primary" onclick="search()">搜索</button>
        </div>
    </div>

<div class="modal fade" id="updateCourse">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">修改课程</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <div class="modal-body">
                <form class="form-group form-inline" id="updateCourseFormSelect">
                    <div class="form-group">
                        <label class="form-inline hidden">
                            <input type="number" class="form-control" name="courseId" value="" id="updateId"/>
                        </label>
                    </div>
                    <div class="form-group">
                        <label class="form-inline">
                            课程名称：<input type="text" class="form-control "  name="courseName">
                        </label>
                    </div>
                    <div class="form-group">
                        <label class="form-inline">
                            章节数：<input type="number" class="form-control" min="1" id="updateChapterCount" name="chapterCount"/>
                        </label>
                    </div>
                    <div class="form-group">
                        <label class="form-inline">
                            所需积分：<input type="number" class="form-control" min="0"  name="courseCost"/>
                        </label>
                    </div>
                    <div class="form-group">
                        <label class="form-inline">
                            课程简介：<textarea class="form-control" rows="6" cols="56"  id="updateCourseInfo" name="courseInfo"></textarea>
                        </label>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <button type="submit" class="btn btn-primary btn-block" data-dismiss="modal" onclick="updateCourseSelect()">确认</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<c:forEach items="${courseList}" var="courseList">
    <div class="courseList">
        <div class="courseItem">
            <img src="https://img2.mukewang.com/szimg/5db7fa4f09a2b64312000676-360-202.png">
            <div class="info">
                <div class="top">
                    <span class="course_name">课程名称：${courseList.courseName}</span>
                    <span class="integral">所需积分：${courseList.courseCost}</span>
                </div>
                <div class="course_info">
                    <span>课程简介：${courseList.courseInfo}</span>
                </div>
                <div class="bottom">
                    <span>任课教师：${courseList.masterName}</span>
                    <span>上传时间：${courseList.courseDate}</span>
                        <%--                <span class="glyphicon glyphicon-user">参加人数：2005人</span>--%>
                    <span>参加人数：${courseList.coursePopularity}人</span>
                </div>
            </div>
        </div>
        <div class="operate">
            <a class="btn btn-warning" data-toggle="modal" data-target="#updateCourse" onclick="edit(${courseList.courseId},${courseList.chapterCount})">修改课程</a>
            <a class="btn btn-danger" onclick="delCourse(${courseList.courseId})">删除课程</a>
            <a class="btn btn-info" onclick="question(${courseList.courseId})">上传题库</a>
            <a class="btn btn-success" onclick="video(${courseList.courseId})">上传视频</a>
        </div>
    </div>
</c:forEach>
<ul class="pagination">
    <li><a href="${pageContext.request.contextPath}/teacher_select?courseName=<%=session.getAttribute("courseName")%>&page=1" aria-label="Previous">首页</a></li>
    <li><a href="${pageContext.request.contextPath}/teacher_select?courseName=<%=session.getAttribute("courseName")%>&page=${pageInfo.pageNum-1}">上一页</a></li>
    <c:forEach begin="1" end="${pageInfo.pages}" var="pageNumber">
        <li><a href="${pageContext.request.contextPath}/teacher_select?courseName=<%=session.getAttribute("courseName")%>&page=${pageNumber}">${pageNumber}</a></li>
    </c:forEach>

    <li><a href="${pageContext.request.contextPath}/teacher_select?courseName=<%=session.getAttribute("courseName")%>&page=${pageInfo.pageNum+1}">下一页</a></li>
    <li><a href="${pageContext.request.contextPath}/teacher_select?courseName=<%=session.getAttribute("courseName")%>&page=${pageInfo.pages}" aria-label="Next">尾页</a></li>
</ul>

<div id="UserInfo">
    <p>用户类型：<%=session.getAttribute("userType")%></p>
    <p>用户账号：<%=session.getAttribute("userId")%></p>
    <p>用户名：<%=session.getAttribute("userName")%></p>
</div>
</body>
</html>

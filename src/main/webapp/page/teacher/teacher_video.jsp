<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>教师页面</title>
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/vue.js"></script>

    <link rel="stylesheet" type="text/css" href="css/teacher/teacher.css"/>
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
<div id="app">
    <div class="nav_left">
        <ul class="nav flex-column">
            <li class="nav-item nav-link" v-for="item in chapters" :key="item.id">
                <a @click="jump(item.id)">第{{item.id}}章</a>
            </li>
        </ul>
    </div>

<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title"><%=session.getAttribute("courseName")%></h3>
    </div>
    <div class="panel-body form-inline">
        <table class="table table-bordered table-hover table-striped" id="videoTable">
            <thead>
            <tr>
                <th>小节</th>
                <th>文件名</th>
                <th>上传</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="item in list" :key="item.videoId">
                <td>第{{item.videoId}}节</td>
                <td @dblclick="show(item.url,item.courseId,item.chapterId)">
                    {{item.url}}
                </td>
                <td>
                    <form method="post" enctype="multipart/form-data" :id="item.videoId+1"><input type="file" @change="changeFile(item)" name="putVideo" multiple="multiple" :id="item.videoId" accept="video/*"/></form>
                </td>
                <td>
                    <a href="" @click.prevent="del(item.videoId)">删除</a>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td><form id="uploadForm" method="post" enctype="multipart/form-data"><input type="file" multiple="multiple" @change="put()" id="put" v-if="isShow" accept="video/*" name="putVideo"/></form></td>
                <td></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</div>
<%--<video autoplay="autoplay" loop="loop" muted="muted" id="video"></video>--%>
<div id="UserInfo">
    <p>用户类型：<%=session.getAttribute("userType")%></p>
    <p>用户账号：<%=session.getAttribute("userId")%></p>
    <p>用户名：<%=session.getAttribute("userName")%></p>
</div>
<script>
    var cid;
    new Vue({
        el:'#app',
        data:{
            isShow:true,
            videoId1:<%=session.getAttribute("videoId")%>,
            url:'',
            list:[
            ],
            chapters:[

            ]
        },
        created(){
            <c:forEach items="${videos}" var="videos">
            var videoList={};
            videoList.chapterId="${videos.chapterId}";
            videoList.videoId="${videos.videoId}"
            videoList.url="${videos.videoUrl}"
            videoList.courseId="${videos.courseId}"//js中可以使用此标签，将EL表达式中的值push到数组中
            this.list.push(videoList)
            </c:forEach>
            <c:forEach items="${chapters}" var="chapters">
            var chapterList={};
            chapterList.id="${chapters}"
            this.chapters.push(chapterList)
            </c:forEach>
        },
        methods:{
            jump(id){
                window.location.href="teacher_video?courseId="+this.list[0].courseId+"&chapterId="+id;
            },
            show(url,courseId,chapterId) {
                window.location.href="show_video?courseId="+courseId+"&chapterId="+chapterId+"&url="+url;
            },
            put(){
                var chapterId;
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i=0;i<vars.length;i++) {
                    var pair = vars[i].split("=");
                    if(pair[0] == "chapterId"){chapterId=pair[1];}   //解析当前页面的url，取url中的参数chapterId的值
                }
                this.videoId1++;
                this.list.push({
                    courseId:"${videos[0].courseId}",
                    chapterId:chapterId,
                    videoId:this.videoId1,
                    url:document.getElementById("put").files[0].name
                })
                $.ajax({
                    url:"addVideo",
                    type:"post",
                    data:{
                        courseId:"${videos[0].courseId}",
                        chapterId:chapterId,
                        videoId:this.videoId1,
                        videoUrl:document.getElementById("put").files[0].name,
                    }
                })
                var formData=new FormData($("#uploadForm")[0])
                formData.append("courseId","${videos[0].courseId}")
                formData.append("chapterId",chapterId)
                $.ajax({
                    url:"upload",
                    type: "post",
                    data:formData,
                    contentType:false,
                    processData: false,
                    success:function () {
                        location.reload()
                    }
                })
                // document.getElementById("put").outerHTML=document.getElementById("put").outerHTML;
                alert("上传成功！")
                this.videoId1++;
                this.chapterId=1;
                this.isShow=false;
                // location.reload()
            },
            changeFile(item){
                $.ajax({     //此ajax操作是先删除原来tomcat服务器中的视频文件
                    url:"uninstall?courseId="+item.courseId+"&chapterId="+item.chapterId+"&url="+item.url,
                    type:"delete"
                })

                for (var i = 0; i < this.list.length; i++) {
                    if (this.list[i].videoId == item.videoId) {
                        this.list.splice(i, 1, {
                            url: document.getElementById(item.videoId).files[0].name,
                            courseId: item.courseId,
                            videoId: item.videoId,
                            chapterId: item.chapterId
                        })
                    $.ajax({
                        url:"updateVideo",
                        type:"post",
                        data:{
                            courseId:"${videos[0].courseId}",
                            videoId:item.videoId,
                            chapterId:item.chapterId,
                            videoUrl:document.getElementById(item.videoId).files[0].name
                        }
                    })
                        var formData=new FormData($("#"+item.videoId+1)[0])
                        formData.append("courseId","${videos[0].courseId}")
                        formData.append("chapterId",item.chapterId)
                        $.ajax({
                            url:"upload",
                            type: "post",
                            data:formData,
                            contentType:false,
                            processData: false
                        })
                    }
                }
                //清空上一次文件选择按钮选择的文件路径
                // document.getElementById("'"+item.id+"'").outerHTML=document.getElementById("'"+item.id+"'").outerHTML
                alert("上传成功！")
                // location.reload()
            },
            del(id){
                var msg = "您真的确定要删除吗？";
                if (confirm(msg)==true) {
                    var index = this.list.findIndex(item => {
                        if (item.videoId == id) {
                            $.ajax({
                                url: "deleteOneVideo?courseId=" + item.courseId + "&videoId=" + id+"&chapterId="+item.chapterId,
                                type: "delete",
                            })
                            $.ajax({
                                url:"uninstall?courseId="+item.courseId+"&chapterId="+item.chapterId+"&url="+item.url,
                                type:"delete"
                            })
                            return true;
                        }
                    })
                    this.list.splice(index, 1)
                    alert("删除成功");
                    location.reload()
                }
                else{
                    alert("已经取消删除")
                }
            }
        }
    })
</script>
</body>
</html>

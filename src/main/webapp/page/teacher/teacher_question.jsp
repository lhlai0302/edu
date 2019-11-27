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

<div id="app">
    <div class="nav_left">
        <ul class="nav flex-column" v-for="item in chapters" :key="item.id">
            <li class="nav-item nav-link">
                <a @click="jump(item.id)">第{{item.id}}章</a>
            </li>
        </ul>
    </div>
    <!-- 模态框 -->
    <div class="modal fade" id="insertQuestion">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- 模态框头部 -->
                <div class="modal-header">
                    <h4 class="modal-title">添加题目</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- 模态框主体 -->
                <div class="modal-body">
                    <form class="form-group form-inline" id="tab1">
                        <div class="form-group">
                            <label class="form-inline">
                                题目：<input type="text" class="form-control" v-model="question" name="question">
                            </label>
                        </div><br>
                        <div class="form-group">
                            <label class="form-inline">
                                A.<input type="text" class="form-control" v-model="answerA" name="answerA">
                            </label>
                        </div><br>
                        <div class="form-group">
                            <label class="form-inline">
                                B.<input type="text" class="form-control" v-model="answerB" name="answerB">
                            </label>
                        </div><br>
                        <div class="form-group">
                            <label class="form-inline">
                                C.<input type="text" class="form-control" v-model="answerC" name="answerC">
                            </label>
                        </div><br>
                        <div class="form-group">
                            <label class="form-inline">
                                正确答案.<input type="text" class="form-control" v-model="trueAnswer" name="trueAnswer">
                            </label>
                        </div><br>
                        <div class="form-group">
                            <div class="input-group">
                                <button type="button" class="btn btn-primary btn-block" data-dismiss="modal" @click="add">确认</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<form class="panel panel-primary title">
    <div class="panel-heading">
<%--        <h3 class="panel-title">第一章</h3>--%>
            <a @click.prevent="del()">删除题目</a>
            <a data-toggle="modal" data-target="#insertQuestion">上传题库</a>
    </div>
    <div class="panel-body" v-for="item in list" :key="item.questionId">
    <li style="list-style: none">
        <input type="checkbox" name="check" :checked="checked">
        <input type="text" v-model="item.question" class="form-control" @keyup.enter="update(item.questionId)">
    </li>
                <ol type="A">
                    <li><input type="text" v-model="item.answerA" class="form-control"  @keyup.enter="update(item.questionId)"></li>
                    <li><input type="text" v-model="item.answerB" class="form-control" @keyup.enter="update(item.questionId)"></li>
                    <li><input type="text" v-model="item.answerC" class="form-control"  @keyup.enter="update(item.questionId)"></li>
                </ol>
        <li><input type="text" v-model="item.trueAnswer" class="form-control trueAnswer" @keyup.enter="update(item.questionId)"></li>
        <ul class="pagination">
            <li><a @click="index(item.courseId,item.chapterId)" aria-label="Previous">首页</a></li>
            <li><a @click="last(item.courseId,item.chapterId)">上一页</a></li>
            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNumber">
                <li><a @click="page(item.courseId,item.chapterId,${pageNumber})">${pageNumber}</a></li>
            </c:forEach>
            <li><a @click="next(item.courseId,item.chapterId)">下一页</a></li>
            <li><a @click="final(item.courseId,item.chapterId)" aria-label="Next">尾页</a></li>
        </ul>
    </div>
</form>
</div>
<div id="UserInfo">
    <p>用户类型：<%=session.getAttribute("userType")%></p>
    <p>用户账号：<%=session.getAttribute("userId")%></p>
    <p>用户名：<%=session.getAttribute("userName")%></p>
</div>
<script>
    new Vue({
        el:'#app',
        data:{
            checked:'',
            courseId:'',
            chapterId:'',
            questionId:'',
            question:'',
            answerA:'',
            answerB:'',
            answerC:'',
            trueAnswer:'',
            list:[
            ],
            chapters:[

            ]
        },
        created(){
            <c:forEach items="${questions}" var="questions">
            var questionList={};
            questionList.courseId="${questions.courseId}"
            questionList.chapterId="${questions.chapterId}"
            questionList.questionId="${questions.questionId}"
            questionList.question="${questions.question}"
            questionList.answerA="${questions.answerA}"
            questionList.answerB="${questions.answerB}"
            questionList.answerC="${questions.answerC}"
            questionList.trueAnswer="${questions.trueAnswer}"//js中可以使用此标签，将EL表达式中的值push到数组中
            questionList.checked=false
            this.list.push(questionList)
            </c:forEach>
            <c:forEach items="${chapters}" var="chapters">
            var chapterList={};
            chapterList.id="${chapters}"
            this.chapters.push(chapterList)
            </c:forEach>
        },
        methods: {
            index(id1,id2){
                window.location.href="teacher_question?page=1"+"&courseId="+id1+"&chapterId="+id2
            },
            last(id1,id2){
                window.location.href="teacher_question?page=${pageInfo.pageNum-1}"+"&courseId="+id1+"&chapterId="+id2
            },
            page(id1,id2,pageNum){
                window.location.href="teacher_question?page="+pageNum+"&courseId="+id1+"&chapterId="+id2
            },
            next(id1,id2){
                window.location.href="teacher_question?page=${pageInfo.pageNum+1}"+"&courseId="+id1+"&chapterId="+id2
            },
            final(id1,id2){
                window.location.href="teacher_question?page=${pageInfo.pages}"+"&courseId="+id1+"&chapterId="+id2
            },
            jump(id){
                window.location.href="teacher_question?courseId="+"${questions[0].courseId}"+"&chapterId="+id;
            },
            add() {
                $('#insertQuestion').bootstrapValidator('validate');
                if($('#insertQuestion').data("bootstrapValidator").isValid()) {
                this.list.push({
                    questionId: this.questionId++,
                    question:this.question,
                    answerA:this.answerA,
                    answerB:this.answerB,
                    answerC:this.answerC,
                    trueAnswer:this.trueAnswer
                });
                $.ajax({
                    url:"addQuestion",
                    type:"post",
                    data:{
                        courseId:"${questions[0].courseId}",
                        chapterId:"${questions[0].chapterId}",
                        questionId:<%=session.getAttribute("questionId")%>,
                        question:this.question,
                        answerA:this.answerA,
                        answerB:this.answerB,
                        answerC:this.answerC,
                        trueAnswer:this.trueAnswer
                    }
                })
                this.question=this.answerA=this.answerB=this.answerC=''
                alert("增加成功！")
                    $("#insertQuestion").modal('hide');
                location.reload();
                }else{
                    alert("提交失败！")
                }
            },
            del(){
                var msg = "您真的确定要删除吗？";
                if (confirm(msg)==true) {
                    var str = document.getElementsByName("check");
                    for (var i = 0; i < str.length; i++) {
                        if (str[i].checked == true) {
                            // this.list.splice(i,1)
                            this.list[i].checked = true;
                        }
                    }
                    for (var i = 0; i < this.list.length; i++) {
                        if (this.list[i].checked) {
                            $.ajax({
                                url: "deleteQuestion/" + this.list[i].courseId + "/" + this.list[i].chapterId + "/" + this.list[i].questionId,
                                type: "DELETE",
                            });
                        }
                    }
                    var str = document.getElementsByName("check");
                    for (var i = 0; i < str.length; i++) {
                        if (str[i].checked == true) {
                            this.list.splice(i, 1)
                            // this.list[i].checked=true;
                        }
                    }
                    //通过遍历list中的checked属性来判断questionId
                    alert("删除成功")
                    location.reload();
                }else{
                    alert("已经取消删除")
                }
            },
            update(id){
                for(var i=0;i<this.list.length;i++){
                    if(this.list[i].questionId==id){
                        $.ajax({
                            url:"updateQuestion",
                            type:"post",
                            data:{
                                courseId:"${questions[0].courseId}",
                                chapterId:"${questions[0].chapterId}",
                                questionId:id,
                                question:this.list[i].question,
                                answerA:this.list[i].answerA,
                                answerB:this.list[i].answerB,
                                answerC:this.list[i].answerC,
                                trueAnswer:this.list[i].trueAnswer
                            }
                        })
                        alert("修改成功！")
                        location.reload();
                    }
            }
    }
        }
    })
</script>
</body>
</html>

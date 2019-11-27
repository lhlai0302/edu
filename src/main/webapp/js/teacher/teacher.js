$(document).ready(function() {
    $(".ShowUserInfo").mouseover(function () {
        $("#UserInfo").css("display", "block");
    });
    $(".ShowUserInfo").mouseout(function () {
        $("#UserInfo").css("display", "none");
    });
    // $(".nav_left li").on("click",function(){
    //     var address =$(this).attr("data-src");
    //     $("iframe").attr("src",address);
    // });
    $(".nav_left li").click(function () {
        $(".nav_left li").removeClass("active");
        $(this).addClass("active")
    })

    var courseId=getQueryVariable("courseId")
    var chapterId=getQueryVariable("chapterId")
    var url=getQueryVariable("url")
    $("#video").attr("src","/edu_video/"+courseId+"/"+chapterId+"/"+url)

    $("#insertCourse").bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            courseName: {
                message: '课程名验证失败',
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    }
                }
            },
            chapterCount: {
                message: '章节数验证失败',
                validators: {
                    notEmpty: {
                        message: '章节数不能为空'
                    },
                    regexp: {
                        regexp: /^[1-9]\d*$/,
                        message: '章节数只能是正整数'
                    }
                }
            },
            courseCost: {
                message: '所需积分验证失败',
                validators: {
                    notEmpty: {
                        message: '所需积分不能为空'
                    },
                    regexp: {
                        regexp: /^[1-9]\d*|0$/,
                        message: '所需积分只能是整数'
                    }
                }
            }
        }
    })

    $("#insertQuestion").bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            question: {
                message: '问题验证失败',
                validators: {
                    notEmpty: {
                        message: '问题不能为空'
                    }
                }
            },
            answerA: {
                message: '答案A验证失败',
                validators: {
                    notEmpty: {
                        message: '答案A不能为空'
                    }
                }
            },
            answerB: {
                message: '答案B验证失败',
                validators: {
                    notEmpty: {
                        message: '答案B不能为空'
                    }
                }
            },
            answerC: {
                message: '答案C验证失败',
                validators: {
                    notEmpty: {
                        message: '答案C不能为空'
                    }
                }
            },
            trueAnswer: {
                message: '正确答案验证失败',
                validators: {
                    notEmpty: {
                        message: '正确答案不能为空'
                    }
                }
            }
            }
    })

    $("#updateCourse").bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            courseName: {
                message: '课程名验证失败',
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    }
                }
            },
            chapterCount: {
                message: '章节数验证失败',
                validators: {
                    notEmpty: {
                        message: '章节数不能为空'
                    },
                    regexp: {
                        regexp: /^[1-9]\d*$/,
                        message: '章节数只能是正整数'
                    }
                }
            },
            courseCost: {
                message: '所需积分验证失败',
                validators: {
                    notEmpty: {
                        message: '所需积分不能为空'
                    },
                    regexp: {
                        regexp: /^[1-9]\d*|0$/,
                        message: '所需积分只能是整数'
                    }
                }
            }
        }
    })
})

//课程管理部分
var chapterCount=0;
function search(){     //查询课程，从课程展示页面搜索 从课程查询结果页面搜索
    var course_name=$("#course_name").val()
    if($("#course_name").val()!=null){
        window.location.href="teacher_select?courseName="+course_name
    }
}
function delCourse(id){    //删除课程，从课程展示页面删除 从课程查询结果页面删除
    console.log(id)
    var msg = "您真的确定要删除吗？";
    if (confirm(msg)==true) {
        var courseId=id;
        $.ajax({
            url: "deleteCourse/"+courseId,
            type: "DELETE",
        });
        // var index=this.list.findIndex(item=>{
        //     if(item.id==id){
        //         return true;
        //     }
        // })
        // this.list.splice(index,1)
        alert("删除成功");
        location.reload();
    } else {
        alert("已经取消删除");
    }
}
function edit(courseId,chapters) {   //课程展示，课程查询页面都调用这个方法
    $("#updateId").val(courseId);
    chapterCount=chapters;
}
function updateCourseDis() {   //课程展示页面的修改方法
    $('#updateCourse').bootstrapValidator('validate');
    if($('#updateCourse').data("bootstrapValidator").isValid()) {
        $.ajax({
            url: "updateCourse?chapter=" +(chapterCount -$('#updateChapterCount').val()),
            type: "post",
            data: $("#updateCourseFormDis").serialize(),
        })
        alert("修改成功！")
        $("#updateCourse").modal('hide');
        $("#updateCourseFormDis").val("")
        location.reload()
    }else{
        alert("提交失败！")
    }
}
function updateCourseSelect() {    //课程查询页面的修改方法
    $('#updateCourse').bootstrapValidator('validate');
    if($('#updateCourse').data("bootstrapValidator").isValid()) {
        $.ajax({
            url: "updateCourse?chapter=" + (chapterCount -$('#updateChapterCount').val()),
            type: "post",
            data: $("#updateCourseFormSelect").serialize(),
        })
        alert("修改成功！")
        $("#updateCourse").modal('hide');
        $("#updateCourseFormSelect").val("")
        location.reload()
    }else{
        alert("提交失败！")
    }
}
function question(id){    //课程展示页面，课程查询结果页面的跳转题库页面方法
    window.location.href="teacher_question?courseId="+id+"&chapterId=1";
}
function video(id){      //课程展示页面，课程查询页面的跳转视频页面方法
    window.location.href="teacher_video?courseId="+id+"&chapterId=1";
}
function addCourse() {    //增加课程方法
    $('#insertCourse').bootstrapValidator('validate');
    $("#courseDate").val(new Date().getFullYear() + "-" + new Date().getMonth() + "-" + new Date().getDate())
    if($('#insertCourse').data("bootstrapValidator").isValid()) {
        $.ajax({
            url: "addCourse",
            type: "post",
            data: $("#insertCourseForm").serialize(),
        })
        alert("增加成功！")
        $("#insertCourse").modal('hide');
        $("#insertCourseForm").val("")
        location.reload();
    }else{
        alert("提交失败！")
    }
}

function getQueryVariable(variable)  //解析url参数
{
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i=0;i<vars.length;i++) {
        var pair = vars[i].split("=");
        if(pair[0] == variable){return pair[1];}
    }
    return(false);
}
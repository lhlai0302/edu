package teacher.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Encoder;
import teacher.model.Course;
import teacher.model.Question;
import teacher.model.Video;
import teacher.service.TeacherService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

@Controller
public class RequestMappingControllerTeacher {
    @Resource
    private TeacherService ts;

    @RequestMapping(value = "/teacher")    //根据教师id查询所有课程
    public String index_teacher1(Model model, @RequestParam(defaultValue = "1") int page, @RequestParam String userId) {
        PageHelper.startPage(page, 5);
        List<Course> courses = ts.selectCourse(userId);
        PageInfo pageInfo = new PageInfo(courses, 4);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("courses", courses);
        return "page/teacher/teacher_course";
    }//教师端页面-我的课程；

    @RequestMapping(value = "addCourse")//增加课程
    public String index_teacher_test1(Course course) {
        int rows = ts.addCourse(course);
        int courseId = ts.selectMaxCourseId();
        for (int i = 1; i <= course.getChapterCount(); i++) {
            int qrow = ts.addQuestionChapter(courseId, i);   //增加课程的同时在题库表和视频表增加记录
            int vrow = ts.addVideoChapter(courseId, i);
        }
        return "page/teacher/teacher_course";
    }//教师端页面-我的课程；

    @RequestMapping(value = "updateCourse")//修改课程
    public String index_teacher_test2(Course course, @RequestParam int chapter) {
        System.out.println(course.getCourseName());
        System.out.println(course.getCourseCost());
        System.out.println(course.getChapterCount());
        System.out.println(course.getCourseInfo());
        if (chapter < 0) {
            for (int i = (course.getChapterCount() + chapter + 1); i <= course.getChapterCount(); i++) {
                int row = ts.addQuestionChapter(course.getCourseId(), i);      //修改的章节数比原来多，题库和视频的章节id记录增加
                int row1 = ts.addVideoChapter(course.getCourseId(), i);
            }
            ;
        }
        if (chapter > 0) {
            for (int i = course.getChapterCount() + 1; i <= course.getChapterCount() + chapter; i++) {
                int row = ts.deleteQuestionByChapter(course.getCourseId(), i);       //修改的章节数比原来少，题库和视频多出来的记录删掉
                int row1 = ts.deleteVideo(course.getCourseId(), i);
            }
            ;
        }
        int rows = ts.updateCourse(course);
        return "page/teacher/teacher_course";
    }//教师端页面-我的课程；

    @RequestMapping(value = "deleteCourse/{courseId}", method = RequestMethod.DELETE)//删除课程
    public String index_teacher_test3(@PathVariable int courseId) {
        int rows = ts.deleteCourse(courseId);
//        int row=ts.deleteQuestionByCourse(courseId);  //同时删除题目
//        int r=ts.deleteVideoByCourse(courseId);   //同时删除视频      //建立外键后可级联删除
        return "page/teacher/teacher_course";
    }//教师端页面-我的课程；


    @RequestMapping(value = "/teacher_select")  //查询课程
    public String index_teacher13(Model model, @RequestParam String courseName, HttpSession session, @RequestParam(defaultValue = "1") int page) {
        session.setAttribute("courseName", courseName);
        PageHelper.startPage(page, 6);
        List<Course> courseList = ts.selectOneCourse(courseName);
        PageInfo pageInfo = new PageInfo(courseList, 4);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("courseList", courseList);
        return "page/teacher/teacher_select";
    }

    @RequestMapping(value = "addQuestion")//增加题库
    public String index_teacher8(Question question) {
        int rows = ts.addQuestion(question);
        return "page/teacher/teacher_question";
    }

    @RequestMapping(value = "updateQuestion")//修改题目
    public String index_teacher10(Question question) {
        int rows = ts.updateQuestion(question);
        return "page/teacher/teacher_question";
    }

    @RequestMapping(value = "deleteQuestion/{courseId}/{chapterId}/{questionId}", method = RequestMethod.DELETE)//删除题目
    public String index_teacher9(@PathVariable int courseId, @PathVariable int chapterId, @PathVariable int questionId) {
        int rows = ts.deleteQuestion(courseId, chapterId, questionId);
        return "page/teacher/teacher_question";
    }//教师端页面-我的课程；

    @RequestMapping("/teacher_question")     //查看某个课程某一章的题目
    public String index_teacher3(Model model, @RequestParam(defaultValue = "1") int page, @RequestParam int courseId, int chapterId, HttpSession session) {
        PageHelper.startPage(page, 1);
        List<Question> questions = ts.selectQuestionByChapterId(courseId, chapterId);
        PageInfo pageInfo = new PageInfo(questions);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("questions", questions);
        List<Integer> chapters = ts.selectQuestionChapter(courseId);
        model.addAttribute("chapters", chapters);
        int questionId = ts.selectMaxQuestionId(courseId, chapterId) + 1;
        session.setAttribute("questionId", questionId);
        return "page/teacher/teacher_question";
    }//教师端页面-题库信息；

    @RequestMapping("/teacher_video")           //查看某个课程的视频列表
    public String index_teacher4(Model model, @RequestParam int courseId, HttpSession session, int chapterId) {
        String courseName = ts.selectCourseNameByCourseId(courseId);
        List<Video> videos = ts.selectVideo(courseId, chapterId);
        List<Integer> chapters = ts.selectVideoChapter(courseId);   //查询某个课程的章节
        model.addAttribute("chapters", chapters);
        model.addAttribute("videos", videos);
        session.setAttribute("courseName", courseName);
        int videoId = ts.selectMaxVideoId(courseId, chapterId);
        session.setAttribute("videoId", videoId);
        return "page/teacher/teacher_video";
    }//教师端页面-视频信息；

    @RequestMapping("updateVideo")  //修改视频url
    public String index_teacher11(Video video) {
        int rows = ts.updateVideo(video);
        return "page/teacher/teacher_video";
    }

    @RequestMapping("addVideo")   //增加视频
    public String index_teacher12(Video video) {
        int rows = ts.addVideo(video);
        return "page/teacher/teacher_video";
    }

    @RequestMapping(value = "deleteVideo", method = RequestMethod.DELETE)      //删除视频
    public String index_teacher12(@RequestParam int courseId, @RequestParam int chapterId) {
        int rows = ts.deleteVideo(courseId, chapterId);
        return "page/teacher/teacher_video";
    }

    @RequestMapping(value = "deleteOneVideo", method = RequestMethod.DELETE)      //删除视频
    public String index_teacher14(@RequestParam int courseId, @RequestParam int chapterId, @RequestParam int videoId) {
        int rows = ts.deleteOneVideo(courseId, chapterId, videoId);
        return "page/teacher/teacher_video";
    }

    @RequestMapping(value = "upload",method = RequestMethod.POST)  //上传视频文件到tomcat服务器上
    //video是上传的视频文件  courseId,chapterId是作为存放视频的目录 即第一章第一节的视频文件路径为E:\edu_video\1\1\xx.mp4
    public String index_teacher15(@RequestParam("putVideo")MultipartFile video,int courseId,int chapterId){
        try {
            String filename =new String(video.getOriginalFilename().getBytes("ISO-8859-1"));
            String extensionName = filename.substring(filename.lastIndexOf(".")+1);
            if (!new File("E:\\edu_video"+"\\"+courseId+"\\"+chapterId+"\\").exists()) {//判断文件夹是否存在，不存在创建
                new File("E:\\edu_video"+"\\"+courseId+"\\"+chapterId+"\\").mkdir();
            }
            File file1 = new File("E:\\edu_video"+"\\"+courseId+"\\"+chapterId+"\\"+filename);
            video.transferTo(file1);//上传到服务器
        }catch (Exception e){
            e.printStackTrace();
        }
        return "page/teacher/teacher_video";
    }

    @RequestMapping(value = "uninstall",method = RequestMethod.DELETE)   //删除tomcat服务器中的视频
    //通过courseId,chapterId,url删除视频，即从视频的路径出发
    public String index_teacher_16(int courseId,int chapterId,String url){
        File file1 = new File("E:\\edu_video"+"\\"+courseId+"\\"+chapterId+"\\"+url);
        file1.delete();
        return "page/teacher/teacher_video";
    }

    @RequestMapping(value =  "show_video" )   //双击某个课程视频记录展示视频
    public String index_teacher16() {
        return "page/teacher/show_video";
    }

}

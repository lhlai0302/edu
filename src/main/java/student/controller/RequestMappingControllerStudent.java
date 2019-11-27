package student.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RequestMappingControllerStudent {
    @RequestMapping("/student")
    public String index_student1() {
        return "page/student/student_course";
    }//学生端页面-我的课程；
    @RequestMapping("/student_integral")
    public String index_student2() {
        return "page/student/student_integral";
    }//学生端页面-我的积分；

}

package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RequestMappingControllerAdmin {

    @RequestMapping(value = { "/index","/login" })
    public String index() {
        return "index";
    }//跳转至首页

    @RequestMapping("/register")
    public String register(){
        return "register";
    }

    @RequestMapping("/admin")
    public String index_admin1() {
        return "page/admin/admin_user";
    }//管理员页面-用户管理
    @RequestMapping("/admin_course")
    public String index_admin2() {
        return "page/admin/admin_course";
    }//管理员页面-课程管理
    @RequestMapping("/admin_log")
    public  String index_admin3(){
        return "page/admin/admin_log";
    }//管理员页面-日志浏览




}

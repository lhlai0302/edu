package admin.controller;

import admin.model.User;
import admin.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Resource
    private AdminService as;

    // 登录实现
    @PostMapping(value = "/login")
    @ModelAttribute
    public ModelAndView login(String userId, String userPass,
                              String userType, ModelAndView mv, HttpSession session) {

//        User user1 = as.loginBlack(userId);//是否在黑名单
        User user2 = as.loginPass(userId,userPass);//匹配账户密码
        User user3 = as.loginType(userId,userType);//匹配账户类型
        String userName=as.loginName(userId);

//        if(user1!=null){
//            mv.setViewName("index");
//            mv.addObject("loginMessage", "该账户已被拉入黑名单，请联系管理员");
//        }
        if (user2 == null) {
            mv.setViewName("index");
            mv.addObject("loginMessage", "账号不存在或密码错误，请重新输入");
        }
        else if (user3==null) {
            mv.setViewName("index");
            mv.addObject("loginMessage", "账号与账号类型不匹配，请重新确认输入");
        }
        else{
            if(user2.getUserType().equals("admin")){
                mv.setView(new RedirectView("/edu/admin"));
                session.setAttribute("userId",   user2.getUserId());
                session.setAttribute("userType", user2.getUserType());
            }
            else if(user2.getUserType().equals("teacher")){
                mv.setView(new RedirectView("/edu/teacher?userId="+user2.getUserId()));
                session.setAttribute("userId",   user2.getUserId());
                session.setAttribute("userType", user2.getUserType());
                session.setAttribute("userName",userName);
            }
            else{
                mv.setView(new RedirectView("/edu/student"));
                session.setAttribute("userId",   user2.getUserId());
                session.setAttribute("userType", user2.getUserType());
            }
        }
        return mv;
    }
}

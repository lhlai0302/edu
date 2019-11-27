package admin.controller;

import admin.model.User;
import admin.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class RegisterController {
    @Resource
    private AdminService as;

    @PostMapping(value = "/register")
    public ModelAndView register(String userId, String userPass,
                                 String userPass1,String userName,
                                 String userType,ModelAndView mv,
                                 HttpSession session) {
        User user1 = as.loginBlack(userId);//是否在黑名单
        User user2 = as.loginExist(userId);//是否已注册
        //正在表达式验证账号、密码：字母开头，长度在6~16之间，只能包含字母、数字和下划线
        boolean matcherPass = userPass.matches("^[a-zA-Z]\\w{5,15}$");
        boolean matcherId = userId.matches("^[a-zA-Z]\\w{5,15}$");

        if(userType==""||userId==""||userName==""||userPass==""||userPass1==""){
            mv.setViewName("register");
            mv.addObject("registerMessage", "注册失败：表单不允许有空值");
        }
        else if(!matcherId){
            mv.setViewName("register");
            mv.addObject("registerMessage", "注册失败：账号不合法");
        }
        else if(!matcherPass){
            mv.setViewName("register");
            mv.addObject("registerMessage", "注册失败：密码不合法");
        }
        else if(!userPass.equals(userPass1)){
            mv.setViewName("register");
            mv.addObject("registerMessage", "注册失败：密码不同");
        }
        else if(user1!=null){
            mv.setViewName("register");
            mv.addObject("registerMessage", "注册失败：该账号已被拉入黑名单");
        }
        else if(user2!=null){
            mv.setViewName("register");
            mv.addObject("registerMessage", "注册失败：该账号已被注册");
        }
        else{
            int userRegister = as.register(userId,userName,userPass,userType);
            if(userType=="teacher"){
                mv.setView(new RedirectView("/edu/teacher"));
                session.setAttribute("userId",   userId);
                session.setAttribute("userType", userType);
                session.setAttribute("userName", userName);
            }
            else{
                mv.setView(new RedirectView("/edu/student"));
                session.setAttribute("userId",   userId);
                session.setAttribute("userType", userType);
                session.setAttribute("userName", userName);
            }
        }
        return mv;
    }
}

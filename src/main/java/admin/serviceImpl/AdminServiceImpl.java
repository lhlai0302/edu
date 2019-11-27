package admin.serviceImpl;

import admin.mapper.AdminMapper;
import admin.model.User;
import admin.service.AdminService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("AdminService")
public class AdminServiceImpl  implements AdminService {
    @Resource
    private AdminMapper am;

    public User loginExist(String userId){
        return am.loginExist(userId);
    };
    public User loginBlack(String userId){
        return am.loginBlack(userId);
    }

    public User loginPass(String userId, String userPass) {
        return am.loginPass(userId,userPass);
    }
    public User loginType(String userId,String userType){
        return  am.loginType(userId,userType);
    }

    public int register (String userId ,String userName,
                  String userPass,String userType){
        return am.register(userId,userName,userPass,userType);
    }

    public String loginName(String userId){
        return am.loginName(userId);
    }
}

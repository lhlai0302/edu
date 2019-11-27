package admin.service;

import admin.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public interface AdminService {
    User loginExist(String userId);
    User loginBlack(String userId);
    User loginPass(String userId, String userPass);
    User loginType(String userId, String userType);
    int register (String userId ,String userName,String userPass,String userType);
    String loginName(String userId);
}

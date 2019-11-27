package admin.mapper;

import admin.model.User;
import org.apache.ibatis.annotations.Param;

public interface AdminMapper {

    User loginExist(@Param("userId")String userId);

    User loginBlack(@Param("userId")String userId);

    User loginPass(@Param("userId") String userId,
                   @Param("userPass") String userPass);

    User loginType(@Param("userId")String userId,
                   @Param("userType")String userType);

    int register (@Param("userId")String userId ,
                  @Param("userName")String userName,
                  @Param("userPass")String userPass,
                  @Param("userType")String userType);

    String loginName(@Param("userId")String userId);
}

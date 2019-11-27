package admin.model;

public class User {
    private String userId;
    private String userPass;
    private String userType;

    public User(String userId, String userPass) {
        this.userId = userId;
        this.userPass = userPass;
    }

    public User(String userId) {
        this.userId = userId;
    }

    public User(String userId, String userPass, String userType) {
        this.userId = userId;
        this.userPass = userPass;
        this.userType = userType;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }
}

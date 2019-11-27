package teacher.model;


import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.sql.Date;

public class Course {
    private int courseId;
    private int chapterCount;
    private String courseName;
    private String userId;
    private String masterName;
    private int courseCost;
    private int coursePopularity;
    private String courseInfo;
    private Date courseDate;

    public Course(int courseId, int chapterCount, String courseName, String userId, String masterName, int courseCost, int coursePopularity, String courseInfo, Date courseDate){
        this.courseId=courseId;
        this.chapterCount=chapterCount;
        this.courseName=courseName;
        this.userId=userId;
        this.masterName=masterName;
        this.courseCost=courseCost;
        this.coursePopularity=coursePopularity;
        this.courseInfo=courseInfo;
        this.courseDate=courseDate;
    }

    public Course(){

    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public int getChapterCount() {
        return chapterCount;
    }

    public void setChapterCount(int chapterCount) {
        this.chapterCount=chapterCount;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getMasterName() {
        return masterName;
    }

    public void setMasterName(String masterName) {
        this.masterName = masterName;
    }

    public int getCourseCost() {
        return courseCost;
    }

    public void setCourseCost(int courseCost) {
        this.courseCost = courseCost;
    }

    public int getCoursePopularity() {
        return coursePopularity;
    }

    public void setCoursePopularity(int coursePopularity) {
        this.coursePopularity = coursePopularity;
    }

    public String getCourseInfo() {
        return courseInfo;
    }

    public void setCourseInfo(String courseInfo) {
        this.courseInfo = courseInfo;
    }

    public Date getCourseDate() {
        return courseDate;
    }

    public void setCourseDate(Date courseDate) {
        this.courseDate = courseDate;
    }

//    public Timestamp getCourseDate() {
//        return courseDate;
//    }
//
//    public void setCourseDate(Timestamp courseDate) {
//        this.courseDate = courseDate;
//    }
}

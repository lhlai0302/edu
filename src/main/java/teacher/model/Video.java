package teacher.model;

public class Video {
    private int courseId;
    private int chapterId;
    private int videoId;
    private String videoUrl;

    public Video(int courseId,int chapterId,int videoId,String videoUrl){
        this.courseId=courseId;
        this.chapterId=chapterId;
        this.videoId=videoId;
        this.videoUrl=videoUrl;
    }

    public int getChapterId() {
        return chapterId;
    }

    public void setChapterId(int chapterId) {
        this.chapterId = chapterId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }
}

package teacher.serviceImpl;

import org.springframework.stereotype.Service;
import teacher.mapper.TeacherMapper;
import teacher.model.Course;
import teacher.model.Question;
import teacher.model.Video;
import teacher.service.TeacherService;

import javax.annotation.Resource;
import java.sql.Date;
import java.util.List;

@Service("TeacherService")
public class TeacherServiceImpl implements TeacherService {
    @Resource
    private TeacherMapper tm;

    public List<Course> selectCourse(String userId){
        return tm.selectCourse(userId);
    }

    public List<Question> selectQuestionByChapterId(int courseId,int chapterId){
        return tm.selectQuestionByChapterId(courseId,chapterId);
    }

    public List<Integer>selectQuestionChapter(int courseId){
        return tm.selectQuestionChapter(courseId);
    }

    public List<Integer>selectVideoChapter(int courseId){
        return tm.selectVideoChapter(courseId);
    }

    public List<Video> selectVideo(int courseId,int chapterId){
        return tm.selectVideo(courseId,chapterId);
    }

    public int addCourse(Course course){
        return tm.addCourse(course);
    }

    public int updateCourse(Course course){
        return tm.updateCourse(course);
    }

    public int deleteCourse(int courseId){
        return tm.deleteCourse(courseId);
    }

    public int deleteQuestion(int courseId,int chapterId,int questionId){
        return tm.deleteQuestion(courseId,chapterId,questionId);
    }

    public int deleteQuestionByCourse(int courseId){
        return tm.deleteQuestionByCourse(courseId);
    }

    public int deleteQuestionByChapter(int courseId,int chapterId){
        return tm.deleteQuestionByChapter(courseId,chapterId);
    }

    public int deleteOneVideo(int courseId,int chapterId,int videoId){
        return tm.deleteOneVideo(courseId,chapterId,videoId);
    }

    public int addQuestion(Question question){
        return tm.addQuestion(question);
    }

    public int updateQuestion(Question question){
        return tm.updateQuestion(question);
    }

    public int addQuestionChapter(int courseId ,int chapterId){
        return tm.addQuestionChapter(courseId,chapterId);
    }

    public int addVideoChapter(int courseId,int chapterId){
        return tm.addVideoChapter(courseId,chapterId);
    }

    public int updateVideo(Video video){
        return tm.updateVideo(video);
    }

    public int deleteVideo(int courseId,int chapterId){
        return tm.deleteVideo(courseId,chapterId);
    }

    public int deleteVideoByCourse(int courseId){
        return tm.deleteVideoByCourse(courseId);
    }

    public int selectMaxCourseId(){
        return tm.selectMaxCourseId();
    }

    public int selectMaxQuestionId(int courseId,int chapterId){
        return tm.selectMaxQuestionId(courseId,chapterId);
    }

    public int selectMaxVideoId(int courseId,int chapterId){
        return tm.selectMaxVideoId(courseId,chapterId);
    }

    public String selectCourseNameByCourseId(int courseId){
        return tm.selectCourseNameByCourseId(courseId);
    }

    public int addVideo(Video video){
        return tm.addVideo(video);
    }

    public List<Course> selectOneCourse(String courseName){
        return tm.selectOneCourse(courseName);
    }

}

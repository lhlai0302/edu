package teacher.service;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import teacher.model.Course;
import teacher.model.Question;
import teacher.model.Video;

import java.sql.Date;
import java.util.List;

@Service
public interface TeacherService {
    List<Course> selectCourse(String userId);
    List<Question> selectQuestionByChapterId(int courseId,int chapterId);
    List<Integer> selectQuestionChapter(int courseId);
    List<Integer> selectVideoChapter(int courseId);
    List<Video> selectVideo(int courseId,int chapterId);
    int addQuestion(Question question);
    int addCourse(Course course);
    int updateCourse(Course course);
    int deleteCourse(int courseId);
    int deleteQuestion(int courseId,int chapterId,int questionId);
    int deleteQuestionByCourse(int courseId);
    int deleteQuestionByChapter(int courseId,int chapterId);
    int updateQuestion(Question question);
    int addQuestionChapter(int courseId,int chapterId);
    int addVideoChapter(int courseId,int chapterId);
    int updateVideo(Video video);
    int deleteVideo(int courseId,int chapterId);
    int deleteOneVideo(int courseId,int chapterId,int videoId);
    int deleteVideoByCourse(int courseId);
    int selectMaxCourseId();
    int selectMaxQuestionId(int courseId,int chapterId);
    int selectMaxVideoId(int courseId,int chapterId);
    String selectCourseNameByCourseId(int courseId);
    int addVideo(Video video);
    List<Course>selectOneCourse(String courseName);
}

package teacher.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import teacher.model.Course;
import teacher.model.Question;
import teacher.model.Video;

import java.sql.Date;
import java.util.List;

public interface TeacherMapper {
    int addCourse(Course course);   //增加课程
    int updateCourse(Course course);   //修改课程
    int deleteCourse(@Param("courseId") int courseId);  //删除课程
    List<Course> selectCourse(@Param("userId")String userId);   //根据教师id查询课程
    List<Question> selectQuestionByChapterId(@Param("courseId")int courseId,@Param("chapterId")int chapterId);   //查询对应课程对应章节的题目
    List<Integer> selectQuestionChapter(@Param("courseId")int courseId);    //查询某课程的章节id展示在课程题库页面的左边导航中
    int addQuestion(Question question);    //增加题目
    int deleteQuestion(@Param("courseId") int courseId,@Param("chapterId") int chapterId,@Param("questionId") int questionId);  //删除题目
    int deleteQuestionByCourse(@Param("courseId")int courseId);  //删除课程的同时删除所有题目
    int deleteQuestionByChapter(@Param("courseId")int courseId,@Param("chapterId")int chapterId);   //课程原章节数大于修改后课程的章节数，删除多余的题目
    int updateQuestion(Question question);   //修改题目
    int addQuestionChapter(@Param("courseId") int courseId,@Param("chapterId") int chapterId);   //课程原章节数小于修改后的课程章节数，增加没有的题目记录
    int addVideoChapter(@Param("courseId")int courseId,@Param("chapterId")int chapterId);   //课程原章节数小于修改后的课程章节数，增加没有的视频记录
    List<Video> selectVideo(@Param("courseId")int courseId,@Param("chapterId")int chapterId);  //查询某课程的某一章节的所有视频
    List<Integer> selectVideoChapter(@Param("courseId")int courseId);    //查询某课程的章节id展示在课程视频页面的左边导航中
    int deleteVideoByCourse(@Param("courseId")int courseId);   //删除课程的同时删除视频记录
    int deleteVideo(@Param("courseId") int courseId,@Param("chapterId") int chapterId);   //课程原章节数大于修改后课程的章节数，删除多余的视频
    int deleteOneVideo(@Param("courseId")int courseId,@Param("chapterId")int chapterId,@Param("videoId")int videoId);  //删除某课程某章节的某个视频
    int updateVideo(Video video);  //重新上传视频
    int selectMaxCourseId();  //增加课程的时候给出对应的courseId
    int selectMaxQuestionId(@Param("courseId")int courseId,@Param("chapterId") int chapterId);  //增加题目的时候给出对应的questionId
    int selectMaxVideoId(@Param("courseId")int courseId,@Param("chapterId")int chapterId);   //增加视频的时候给出对应的videoId
    String selectCourseNameByCourseId(@Param("courseId") int courseId);   //在视频页面给出课程的名字
    int addVideo(Video video);   //增加视频
    List<Course>selectOneCourse(@Param("courseName")String courseName);  //通过课程名称查询课程记录
//    Course selectOneCourse(@Param("courseName")String courseName);
}

package teacher.model;

public class Question {
    private int courseId;
    private int chapterId;
    private int questionId;
    private String question;
    private String answerA;
    private String answerB;
    private String answerC;
    private String trueAnswer;

    public Question(int courseId,int chapterId,int questionId,String question,String answerA,String answerB,String answerC,String trueAnswer){
        this.courseId=courseId;
        this.chapterId=chapterId;
        this.questionId=questionId;
        this.question=question;
        this.answerA=answerA;
        this.answerB=answerB;
        this.answerC=answerC;
        this.trueAnswer=trueAnswer;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public int getChapterId() {
        return chapterId;
    }

    public void setChapterId(int chapterId) {
        this.chapterId = chapterId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswerA() {
        return answerA;
    }

    public void setAnswerA(String answerA) {
        this.answerA = answerA;
    }

    public String getAnswerB() {
        return answerB;
    }

    public void setAnswerB(String answerB) {
        this.answerB = answerB;
    }

    public String getAnswerC() {
        return answerC;
    }

    public void setAnswerC(String answerC) {
        this.answerC = answerC;
    }

    public String getTrueAnswer() {
        return trueAnswer;
    }

    public void setTrueAnswer(String trueAnswer) {
        this.trueAnswer = trueAnswer;
    }
}

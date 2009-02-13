package com.topcoder.common.web.data.admin;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;
import java.sql.Date;
import java.util.Calendar;

public final class Compilation implements Serializable, TagRenderer {

    private int roundId;
    private int problemId;
    private String className;
    private String methodName;
    private String difficultyDesc;
    private int coderId;
    private String handle;
    private String compilationText;
    private String status;
    private long openTime;
    private long submitTime;
    private float points;
    private float submissionPoints;
    private String submissionText;
    private String languageName;
    private float pointValue;

    public Compilation() {
        roundId = 0;
        problemId = 0;
        className = "";
        methodName = "";
        difficultyDesc = "";
        coderId = 0;
        handle = "";
        compilationText = "";
        status = "";
        openTime = 0;
        submitTime = 0;
        points = 0;
        submissionPoints = 0;
        submissionText = "";
        languageName = "";
        pointValue = 0;

    }

// set
    public void setRoundId(int roundId) {
        this.roundId = roundId;
    }

    public void setProblemId(int problemId) {
        this.problemId = problemId;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public void setDifficultyDesc(String difficultyDesc) {
        this.difficultyDesc = difficultyDesc;
    }

    public void setCoderId(int coderId) {
        this.coderId = coderId;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public void setCompilationText(String compilationText) {
        this.compilationText = compilationText;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setOpenTime(long openTime) {
        this.openTime = openTime;
    }

    public void setSubmitTime(long submitTime) {
        this.submitTime = submitTime;
    }

    public void setPoints(float points) {
        this.points = points;
    }

    public void setSubmissionPoints(float submissionPoints) {
        this.submissionPoints = submissionPoints;
    }

    public void setSubmissionText(String submissionText) {
        this.submissionText = submissionText;
    }

    public void setLanguageName(String languageName) {
        this.languageName = languageName;
    }

    public void setPointValue(float pointValue) {
        this.pointValue = pointValue;
    }


// get
    public int getRoundId() {
        return roundId;
    }

    public int getProblemId() {
        return problemId;
    }

    public String getClassName() {
        return className;
    }

    public String getMethodName() {
        return methodName;
    }

    public String getDifficultyDesc() {
        return difficultyDesc;
    }

    public int getCoderId() {
        return coderId;
    }

    public String getHandle() {
        return handle;
    }

    public String getCompilationText() {
        return compilationText;
    }

    public String getStatus() {
        return status;
    }

    public long getOpenTime() {
        return openTime;
    }

    public long getSubmitTime() {
        return submitTime;
    }

    public float getPoints() {
        return points;
    }

    public float getSubmissionPoints() {
        return submissionPoints;
    }

    public String getSubmissionText() {
        return submissionText;
    }

    public String getLangaugeName() {
        return languageName;
    }

    public float getPointValue() {
        return pointValue;
    }

    public String getTimeString(long time) {
        Calendar c = null;
        StringBuffer ret = null;
        if (time <= 0)
            ret = new StringBuffer();
        else {
            c = Calendar.getInstance();
            c.setTime(new Date(time));
            ret = new StringBuffer();
            if (c.get(Calendar.HOUR_OF_DAY) < 10) ret.append("0");
            ret.append(c.get(Calendar.HOUR_OF_DAY));
            ret.append(':');
            if (c.get(Calendar.MINUTE) < 10) ret.append("0");
            ret.append(c.get(Calendar.MINUTE));
            ret.append(':');
            if (c.get(Calendar.SECOND) < 10) ret.append("0");
            ret.append(c.get(Calendar.SECOND));
        }
        return ret.toString();
    }

    public String getCodingTime() {
        StringBuffer ret = new StringBuffer();
        if ((submitTime - openTime) > 0) {
            long minutes = (submitTime - openTime) / (60 * 1000);
            long seconds = ((submitTime - openTime) - (minutes * (60 * 1000))) / 1000;
            long millis = (submitTime - openTime) % 1000;
            if (minutes < 10) ret.append(0);
            ret.append(minutes);
            ret.append(':');
            if (seconds < 10) ret.append(0);
            ret.append(seconds);
            ret.append(".");
            ret.append(millis);
        }
        return ret.toString();
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Compilation");
            result.addTag(new ValueTag("RoundId", roundId));
            result.addTag(new ValueTag("ProblemId", problemId));
            result.addTag(new ValueTag("ClassName", className));
            result.addTag(new ValueTag("MethodName", methodName));
            result.addTag(new ValueTag("DifficultyDesc", difficultyDesc));
            result.addTag(new ValueTag("CoderId", coderId));
            result.addTag(new ValueTag("Handle", handle));
            result.addTag(new ValueTag("CompilationText", compilationText));
            result.addTag(new ValueTag("Status", status));
            result.addTag(new ValueTag("OpenTime", getTimeString(openTime)));
            result.addTag(new ValueTag("SubmitTime", getTimeString(submitTime)));
            result.addTag(new ValueTag("Points", points));
            result.addTag(new ValueTag("SubmissionPoints", submissionPoints));
            result.addTag(new ValueTag("SubmissionText", submissionText));
            result.addTag(new ValueTag("LanguageName", languageName));
            result.addTag(new ValueTag("CodingTime", getCodingTime()));
            result.addTag(new ValueTag("PointValue", getPointValue()));
        } catch (Exception e) {
            throw e;
        }
        return result;
    }
}



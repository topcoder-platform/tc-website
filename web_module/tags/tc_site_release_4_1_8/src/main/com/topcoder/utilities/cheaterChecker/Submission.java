package com.topcoder.utilities.cheaterChecker;

public class Submission {
    private String handle;
    private long coderId;
    private byte[] classFile;
    private String source;
    private int languageId;
    private long openTime;
    private long submitTime;
    private float points;
    private long problemId;
    private long componentId;
    private String className;
    private String methodName;
    private boolean included;

    public Submission() {
        setHandle(null);
        setCoderId(0);
        setClassFile(null);
        setSource(null);
        setLanguageId(0);
        setOpenTime(0);
        setSubmitTime(0);
        setPoints(0.0f);
        setProblemId(0);
        setComponentId(0);
        setClassName(null);
        setMethodName(null);
        setIncluded(false);
    }

    public String getHandle() {
        return handle;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public long getCoderId() {
        return coderId;
    }

    public void setCoderId(long coderId) {
        this.coderId = coderId;
    }

    public byte[] getClassFile() {
        return classFile;
    }

    public void setClassFile(byte[] classFile) {
        this.classFile = classFile;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public int getLanguageId() {
        return languageId;
    }

    public void setLanguageId(int languageId) {
        this.languageId = languageId;
    }

    public long getOpenTime() {
        return openTime;
    }

    public void setOpenTime(long openTime) {
        this.openTime = openTime;
    }

    public long getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(long submitTime) {
        this.submitTime = submitTime;
    }

    public float getPoints() {
        return points;
    }

    public void setPoints(float points) {
        this.points = points;
    }

    public long getProblemId() {
        return problemId;
    }

    public void setProblemId(long problemId) {
        this.problemId = problemId;
    }

    public long getComponentId() {
        return componentId;
    }

    public void setComponentId(long componentId) {
        this.componentId = componentId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public boolean isIncluded() {
        return included;
    }

    public void setIncluded(boolean included) {
        this.included = included;
    }

}

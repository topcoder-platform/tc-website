package com.topcoder.web.codinginterface.techassess.model;

import com.topcoder.shared.problem.Problem;
import com.topcoder.shared.language.Language;
import com.topcoder.shared.language.BaseLanguage;

import java.io.Serializable;

/**
 * User: dok
 * Date: Dec 23, 2004
 * Time: 2:32:42 PM
 */
public class ProblemInfo implements Serializable {

    private String code = null;
    private long componentId = 0;
    private Language language = null;
    private Problem problem = null;
    private int problemTypeId = 0;
    private long startTime = 0;
    private String statusDesc = null;
    private String className = null;
    private long time = 0;

    public ProblemInfo() {

    }

    public ProblemInfo(String code, long componentId, int languageId, Problem problem, int problemType) {
        this.code = code;
        this.componentId = componentId;
        this.language = BaseLanguage.getLanguage(languageId);
        this.problem = problem;
        this.problemTypeId = problemType;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public long getComponentId() {
        return componentId;
    }

    public void setComponentId(long componentId) {
        this.componentId = componentId;
    }

    public Language getLanguage() {
        return language;
    }

    public void setLanguage(Language language) {
        this.language = language;
    }

    public Problem getProblem() {
        return problem;
    }

    public void setProblem(Problem problem) {
        this.problem = problem;
    }

    public int getProblemTypeId() {
        return problemTypeId;
    }

    public void setProblemTypeId(int problemTypeId) {
        this.problemTypeId = problemTypeId;
    }

    public long getStartTime() {
        return startTime;
    }

    public void setStartTime(long startTime) {
        this.startTime = startTime;
    }

    public String getStatusDesc() {
        return statusDesc;
    }

    public void setStatusDesc(String statusDesc) {
        this.statusDesc = statusDesc;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public long getTime() {
        return time;
    }

    public void setTime(long time) {
        this.time = time;
    }

    public long getTimeRemaining() {
        long ret = 0;
        if (startTime>0) {
            ret = System.currentTimeMillis()+time-startTime;
        } else {
            ret = time;
        }
        return ret;
    }

}

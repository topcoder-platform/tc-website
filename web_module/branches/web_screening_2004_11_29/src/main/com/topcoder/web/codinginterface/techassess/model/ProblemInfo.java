package com.topcoder.web.codinginterface.techassess.model;

import com.topcoder.shared.problem.Problem;
import com.topcoder.shared.language.Language;
import com.topcoder.shared.language.BaseLanguage;

/**
 * User: dok
 * Date: Dec 23, 2004
 * Time: 2:32:42 PM
 */
public class ProblemInfo {

    private String code = null;
    private long componentId = 0;
    private boolean editable = false;
    private Language language = null;
    private Problem problem = null;
    private int problemType = 0;

    public ProblemInfo() {

    }

    public ProblemInfo(String code, long componentId, boolean editable, int languageId, Problem problem, int problemType) {
        this.code = code;
        this.componentId = componentId;
        this.editable = editable;
        this.language = BaseLanguage.getLanguage(languageId);
        this.problem = problem;
        this.problemType = problemType;
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

    public boolean isEditable() {
        return editable;
    }

    public void setEditable(boolean editable) {
        this.editable = editable;
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

    public int getProblemType() {
        return problemType;
    }

    public void setProblemType(int problemType) {
        this.problemType = problemType;
    }


}

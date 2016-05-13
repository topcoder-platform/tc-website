package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;
import java.util.ArrayList;

public class Problem implements Serializable {

    private int problemId;
    private int roundId;
    private String className;
    private String newClassName;
    private String methodName;
    private String resultType;
    private int resultTypeId;
    private String difficulty;
    private String divisionDesc;
    private int difficultyId;
    private int divisionId;
    private int pointVal;
    private ArrayList paramTypes;
    private String defaultSolution;
    private String problemText;
    private int submitOrder;
//  private int language;
    private ArrayList testCases; // ArrayList of TestCase
    private boolean modified;
    private String activeInd;

    public Problem() {
        this.problemId = -1;
        this.roundId = -1;
        this.className = "";
        this.newClassName = "";
        this.methodName = "";
        this.resultType = "";
        this.resultTypeId = 0;
        this.pointVal = 0;
        this.paramTypes = new ArrayList();
        this.defaultSolution = "";
        this.problemText = "";
        this.submitOrder = 0;
        this.divisionId = 0;
        this.testCases = new ArrayList();
        this.modified = false;
        this.activeInd = "";
        this.divisionDesc = "";
    }

    public Problem(int problemId, String className, String methodName, String resultType,
                   int pointVal, String defaultSolution, String problemText, int diffLevel, int submitOrder) {
        this.problemId = problemId;
        this.roundId = -1;
        this.className = className;
        this.methodName = methodName;
        this.resultType = resultType;
        this.pointVal = pointVal;
        this.paramTypes = new ArrayList();
        this.defaultSolution = defaultSolution;
        this.problemText = problemText;
        this.difficultyId = diffLevel;
        this.difficulty = "";
        this.submitOrder = submitOrder;
        this.testCases = new ArrayList();
        this.modified = false;
        this.activeInd = "";
    }

    public Problem(int problemId, String className, String methodName, String resultType,
                   int resultTypeId, int pointVal, String defaultSolution, String problemText,
                   int diffLevel, int submitOrder) {
        this.problemId = problemId;
        this.roundId = -1;
        this.className = className;
        this.methodName = methodName;
        this.resultType = resultType;
        this.resultTypeId = resultTypeId;
        this.pointVal = pointVal;
        this.paramTypes = new ArrayList();
        this.defaultSolution = defaultSolution;
        this.problemText = problemText;
        this.difficultyId = diffLevel;
        this.difficulty = "";
        this.submitOrder = submitOrder;
        this.testCases = new ArrayList();
        this.modified = false;
        this.activeInd = "";
    }

    public final void setDivisionId(int divisionId) {
        this.divisionId = divisionId;
    }

    public final void setRoundId(int roundId) {
        this.roundId = roundId;
    }

    public final void setProblemId(int problemId) {
        this.problemId = problemId;
    }

    public final void setDivisionDesc(String in) {
        this.divisionDesc = in;
    }

    public final void setClassName(String in) {
        this.className = in;
    }

    public final void setNewClassName(String in) {
        this.newClassName = in;
    }

    public final void setMethodName(String in) {
        this.methodName = in;
    }

    public final void setResultType(String in) {
        this.resultType = in;
    }

    public final void setResultTypeId(int in) {
        this.resultTypeId = in;
    }

    public final void setDifficulty(String in) {
        this.difficulty = in;
    }

    public void setDifficultyId(int difficultyId) {
        this.difficultyId = difficultyId;
    }

    public final void setPointVal(int in) {
        this.pointVal = in;
    }

    public final void setParamTypes(ArrayList in) {
        this.paramTypes = in;
    }

    public final void setDefaultSolution(String in) {
        this.defaultSolution = in;
    }

    public final void setProblemText(String in) {
        this.problemText = in;
    }
/*
  public final void setLanguage(int in) {
    this.language = in;
  }
*/
    public final void setTestCases(ArrayList in) {
        this.testCases = in;
    }

    public final void setActiveInd(String activeInd) {
        this.activeInd = activeInd;
    }

    public final void setModified(boolean modified) {
        this.modified = modified;
    }

    public final int getDivisionId() {
        return this.divisionId;
    }

    public final int getProblemId() {
        return this.problemId;
    }

    public final String getClassName() {
        return this.className;
    }

    public final String getDivisionDesc() {
        return this.divisionDesc;
    }

    public final String getNewClassName() {
        return this.newClassName;
    }

    public final String getMethodName() {
        return this.methodName;
    }

    public final String getResultType() {
        return this.resultType;
    }

    public final int getResultTypeId() {
        return this.resultTypeId;
    }

    public final String getDifficulty() {
        return this.difficulty;
    }

    public int getDifficultyId() {
        return difficultyId;
    }

    public final int getPointVal() {
        return this.pointVal;
    }

    public final ArrayList getParamTypes() {
        return this.paramTypes;
    }

    public final String getDefaultSolution() {
        return this.defaultSolution;
    }

    public final String getProblemText() {
        return this.problemText;
    }

    public final int getSubmitOrder() {
        return this.submitOrder;
    }

    public final ArrayList getTestCases() {
        return this.testCases;
    }

    public final String getActiveInd() {
        return activeInd;
    }

    public final int getRoundId() {
        return this.roundId;
    }

    public final boolean getModified() {
        return modified;
    }

    public String toString() {
        StringBuffer str = new StringBuffer(500);
        str.append((new Integer(problemId)).toString());
        str.append(", ");
        str.append((new Integer(roundId)).toString());
        str.append(", ");
        str.append(className);
        str.append(",");
        str.append(methodName);
        str.append(", ");
        str.append(resultType);
        str.append(", ");
        str.append((new Integer(pointVal)).toString());
        str.append(", ");
        str.append(paramTypes.toString());
        str.append(", ");
        str.append(defaultSolution);
        str.append(", ");
        str.append(problemText);
//    str.append(", ");
//    str.append(language);
        str.append(", ");
        str.append(testCases);
        return str.toString();
    }

    public boolean equals(Problem problem) {
        return this.problemId == problem.getProblemId();
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        String paramType = "";
        TestCase TestCase = null;
        try {
            int sumRound = 0;
            result = new RecordTag("Problem");
            result.addTag(new ValueTag("ProblemId", problemId));
            result.addTag(new ValueTag("RoundId", roundId));
            result.addTag(new ValueTag("ProblemText", problemText));
            result.addTag(new ValueTag("MethodName", methodName));
            result.addTag(new ValueTag("ClassName", className));
            result.addTag(new ValueTag("ResultType", resultType));
            result.addTag(new ValueTag("ResultTypeId", resultTypeId));
            result.addTag(new ValueTag("Difficulty", difficulty));
            result.addTag(new ValueTag("DifficultyID", difficultyId));
            result.addTag(new ValueTag("DivisionId", divisionId));
            result.addTag(new ValueTag("DivisionDesc", divisionDesc));
            result.addTag(new ValueTag("Modified", modified));

            RecordTag paramTag = new RecordTag("PARAMTYPES");

            for (int i = 0; i < this.paramTypes.size(); i++) {
                paramType = (String) this.paramTypes.get(i);
                paramTag.addTag(new ValueTag("ParamType", paramType));
            }
            result.addTag(paramTag);

            for (int i = 0; i < this.testCases.size(); i++) {
                TestCase = (TestCase) this.testCases.get(i);
                result.addTag(TestCase.getXML());
            }
        } catch (Exception e) {
            throw new Exception("common. Problem getXML ERROR: " + e);
        }
        return result;
    }
}

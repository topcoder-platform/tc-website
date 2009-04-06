package com.topcoder.common.web.data.stat.problem;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;
import java.util.ArrayList;


public final class Problem implements Serializable, TagRenderer {

    private int ProblemId;
    private String MethodName;
    private String ClassName;
    private int DifficultyId;
    private String DifficultyDesc;
    private String Status;
    private float Points;
    private String ProblemText;
    private String ProgramText;
    private String CodingTime;
    private ArrayList problemChallenges;
    private ArrayList problemTests;

    public Problem() {

        this.ProblemId = 0;
        this.MethodName = "";
        this.ClassName = "";
        this.DifficultyId = 0;
        this.DifficultyDesc = "";
        this.Status = "";
        this.Points = 0;
        this.ProblemText = "";
        this.ProgramText = "";
        this.CodingTime = "";
        this.problemChallenges = new ArrayList();
        this.problemTests = new ArrayList();
    }

// set
    public void setProblemId(int ProblemId) {
        this.ProblemId = ProblemId;
    }

    public void setMethodName(String MethodName) {
        this.MethodName = MethodName;
    }

    public void setClassName(String ClassName) {
        this.ClassName = ClassName;
    }

    public void setDifficultyId(int DifficultyId) {
        this.DifficultyId = DifficultyId;
    }

    public void setDifficultyDesc(String DifficultyDesc) {
        this.DifficultyDesc = DifficultyDesc;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public void setPoints(float Points) {
        this.Points = Points;
    }

    public void setProblemText(String ProblemText) {
        this.ProblemText = ProblemText;
    }

    public void setProgramText(String ProgramText) {
        this.ProgramText = ProgramText;
    }

    public void setCodingTime(String CodingTime) {
        this.CodingTime = CodingTime;
    }

    public void setProblemChallenges(ArrayList problemChallenges) {
        this.problemChallenges = problemChallenges;
    }

    public void setProblemTests(ArrayList problemTests) {
        this.problemTests = problemTests;
    }

// get
    public int getProblemId() {
        return this.ProblemId;
    }

    public String getMethodName() {
        return this.MethodName;
    }

    public String getClassName() {
        return this.ClassName;
    }

    public int getDifficultyId() {
        return this.DifficultyId;
    }

    public String getDifficultyDesc() {
        return this.DifficultyDesc;
    }

    public String getStatus() {
        return this.Status;
    }

    public float getPoints() {
        return this.Points;
    }

    public String getProblemText() {
        return this.ProblemText;
    }

    public String getProgramText() {
        return this.ProgramText;
    }

    public String getCodingTime() {
        return this.CodingTime;
    }

    public ArrayList getProblemChallenges() {
        return this.problemChallenges;
    }

    public ArrayList getProblemTests() {
        return this.problemTests;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Problem");
            result.addTag(new ValueTag("ProblemId", ProblemId));
            result.addTag(new ValueTag("MethodName", MethodName));
            result.addTag(new ValueTag("ClassName", ClassName));
            result.addTag(new ValueTag("DifficultyId", DifficultyId));
            result.addTag(new ValueTag("DifficultyDesc", DifficultyDesc));
            result.addTag(new ValueTag("Status", Status));
            result.addTag(new ValueTag("Points", Points));
            result.addTag(new ValueTag("ProblemText", ProblemText));
            result.addTag(new ValueTag("ProgramText", ProgramText));
            result.addTag(new ValueTag("CodingTime", CodingTime));
            for (int i = 0; i < this.problemChallenges.size(); i++) {
                Challenge challenge = (Challenge) this.problemChallenges.get(i);
                result.addTag(challenge.getXML());
            }
            for (int i = 0; i < this.problemTests.size(); i++) {
                Test test = (Test) this.problemTests.get(i);
                result.addTag(test.getXML());
            }
        } catch (Exception e) {
            throw new Exception("common.web.data.stat.problem.Problem getXML ERROR: " + e);
        }
        return result;
    }
}


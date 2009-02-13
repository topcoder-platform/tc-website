package com.topcoder.common.web.data.stat.problem;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;

public final class Test implements Serializable, TagRenderer {

    private int TestId;
    private String TestArgs;
    private String ActualResult;
    private String ExpectedResult;

    public Test() {

        this.TestId = 0;
        this.TestArgs = "";
        this.ActualResult = "";
        this.ExpectedResult = "";
    }

// set

    public void setTestId(int TestId) {
        this.TestId = TestId;
    }

    public void setTestArgs(String TestArgs) {
        this.TestArgs = TestArgs;
    }

    public void setActualResult(String ActualResult) {
        this.ActualResult = ActualResult;
    }

    public void setExpectedResult(String ExpectedResult) {
        this.ExpectedResult = ExpectedResult;
    }

// get

    public int getTestId() {
        return this.TestId;
    }

    public String getTestArgs() {
        return this.TestArgs;
    }

    public String getActualResult() {
        return this.ActualResult;
    }

    public String getExpectedResult() {
        return this.ExpectedResult;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Test");
            result.addTag(new ValueTag("TestId", TestId));
            result.addTag(new ValueTag("TestArgs", TestArgs));
            result.addTag(new ValueTag("ActualResult", ActualResult));
            result.addTag(new ValueTag("ExpectedResult", ExpectedResult));
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("common.web.data.stat.problem.Test getXML ERROR: " + e);
        }
        return result;
    }
}


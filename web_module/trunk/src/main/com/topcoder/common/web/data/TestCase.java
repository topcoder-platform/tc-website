package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;
import java.util.ArrayList;

public final class TestCase implements Serializable, TagRenderer {

    private int problemId;
    private int testCaseId;
    private ExpectedResult expectedResultAttr;
    private int testOrder;
    private boolean modified;
    private ArrayList testCaseArgs;

    public TestCase() {
        problemId = 0;
        testCaseId = 0;
        expectedResultAttr = new ExpectedResult();
        testOrder = 0;
        modified = false;
        testCaseArgs = new ArrayList();
    }

    // set
    public void setProblemId(int problemId) {
        this.problemId = problemId;
    }

    public void setTestCaseId(int testCaseId) {
        this.testCaseId = testCaseId;
    }

    public void setExpectedResult(ExpectedResult expectedResultAttr) {
        this.expectedResultAttr = expectedResultAttr;
    }

    public void setTestOrder(int testOrder) {
        this.testOrder = testOrder;
    }

    public void setModified(boolean modified) {
        this.modified = modified;
    }

    public void setTestCaseArgs(ArrayList testCaseArgs) {
        this.testCaseArgs = testCaseArgs;
    }

    // get
    public int getProblemId() {
        return problemId;
    }

    public int getTestCaseId() {
        return testCaseId;
    }

    public ExpectedResult getExpectedResult() {
        return expectedResultAttr;
    }

    public int getTestOrder() {
        return testOrder;
    }

    public boolean getModified() {
        return modified;
    }

    public ArrayList getTestCaseArgs() {
        return testCaseArgs;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        TestCaseArg TestCaseArg = null;
        try {
            int sumRound = 0;
            result = new RecordTag("TestCase");
            result.addTag(new ValueTag("ProblemId", problemId));
            result.addTag(new ValueTag("TestCaseId", testCaseId));
            result.addTag(new ValueTag("TestOrder", testOrder));
            result.addTag(new ValueTag("Modified", modified));
            result.addTag(expectedResultAttr.getXML());
            for (int i = 0; i < this.testCaseArgs.size(); i++) {
                TestCaseArg = (TestCaseArg) this.testCaseArgs.get(i);
                result.addTag(TestCaseArg.getXML());
            }
        } catch (Exception e) {
            throw new Exception("common.web.data.TestCase getXML ERROR: " + e);
        }
        return result;
    }
}


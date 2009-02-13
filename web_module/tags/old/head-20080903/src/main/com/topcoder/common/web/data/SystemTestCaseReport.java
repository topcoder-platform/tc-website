package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;

public final class SystemTestCaseReport implements Serializable, TagRenderer {

    private Problem problem;
    private java.sql.Timestamp processingTime;
    private java.sql.Timestamp timestamp;
    private int coderId;
    private int numIterations;
    private int testCaseId;
    private int roundId;
    private int roomId;
    private float deductionAmount;
    private String viewable;
    private String roundName;
    private String roomName;
    private String handle;
    private Object args;
    private Object expected;
    private Object received;


    public SystemTestCaseReport() {
        problem = new Problem();
        processingTime = new java.sql.Timestamp(System.currentTimeMillis());
        timestamp = new java.sql.Timestamp(System.currentTimeMillis());
        coderId = 0;
        numIterations = 0;
        testCaseId = 0;
        roundId = 0;
        roomId = 0;
        deductionAmount = 0F;
        viewable = "";
        handle = "";
        roomName = "";
        roundName = "";
        args = new Object();
        expected = new Object();
        received = new Object();
    }

    // set
    public void setTimestamp(java.sql.Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public void setProcessingTime(long processingTime) {
        this.processingTime = new java.sql.Timestamp(processingTime);
    }

    public void setProblem(Problem problem) {
        this.problem = problem;
    }

    public void setExpected(Object expected) {
        this.expected = expected;
    }

    public void setReceived(Object received) {
        this.received = received;
    }

    public void setArgs(Object args) {
        this.args = args;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public void setRoundName(String roundName) {
        this.roundName = roundName;
    }

    public void setViewable(String viewable) {
        this.viewable = viewable;
    }

    public void setDeductionAmount(float deductionAmount) {
        this.deductionAmount = deductionAmount;
    }

    public void setNumIterations(int numIterations) {
        this.numIterations = numIterations;
    }

    public void setRoundId(int roundId) {
        this.roundId = roundId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public void setCoderId(int coderId) {
        this.coderId = coderId;
    }

    public void setTestCaseId(int testCaseId) {
        this.testCaseId = testCaseId;
    }


    // get
    public Problem getProblem() {
        return problem;
    }

    public String getRoomName() {
        return roomName;
    }

    public String getRoundName() {
        return roundName;
    }

    public String getHandle() {
        return handle;
    }

    public java.sql.Timestamp getTimestamp() {
        return timestamp;
    }

    public java.sql.Timestamp getProcessingTime() {
        return processingTime;
    }

    public String getViewable() {
        return viewable;
    }

    public float getDeducationAmount() {
        return deductionAmount;
    }

    public int getRoundId() {
        return roundId;
    }

    public int getRoomId() {
        return roomId;
    }

    public int getNumIterations() {
        return numIterations;
    }

    public int getCoderId() {
        return coderId;
    }

    public int getTestCaseId() {
        return testCaseId;
    }

    public Object getExpected() {
        return expected;
    }

    public Object getReceived() {
        return received;
    }

    public Object getArgs() {
        return args;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("SystemTestCaseReport");
            result.addTag(problem.getXML());
            result.addTag(new ValueTag("RoundId", roundId));
            result.addTag(new ValueTag("RoundName", roundName));
            result.addTag(new ValueTag("RoomId", roomId));
            result.addTag(new ValueTag("RoomName", roomName));
            result.addTag(new ValueTag("TestCaseId", testCaseId));
            result.addTag(new ValueTag("CoderId", coderId));
            result.addTag(new ValueTag("Handle", handle));
            result.addTag(new ValueTag("DeductionAmount", deductionAmount));
            result.addTag(new ValueTag("ProcessingTime", processingTime.toString()));
            result.addTag(new ValueTag("Timestamp", timestamp.toString()));
            result.addTag(new ValueTag("NumIterations", numIterations));
            result.addTag(new ValueTag("Args", args.toString()));
            result.addTag(new ValueTag("Expected", expected.toString()));
            result.addTag(new ValueTag("Received", received.toString()));
            result.addTag(new ValueTag("Viewable", viewable));
        } catch (Exception e) {
            throw new Exception("common.web.data.SytemTestCaseReport getXML ERROR: " + e);
        }
        return result;
    }
}

package com.topcoder.common.web.data;

import com.topcoder.common.web.util.Conversion;
import com.topcoder.shared.dataAccess.StringUtilities;
import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.util.ArrayList;

public final class Challenge
        implements Serializable, TagRenderer {

    private static final int JAVA = 1;
    private static final int UNSUCCESSFUL_CHALLENGE = -50;
    private static final int EASY_CHALLENGE = 1;


    private int contestId;
    private int roundId;
    private Room room;
    private int challengeId;
    private int challengerId;
    private String chalHandle;
    private int statusId;
    private String statusDesc;
    private int defendantId;
    private String defHandle;
    private Location location;
    private Problem problem;
    private ArrayList args; // ArrayList of ChallengeArg
    private Object resultValue;
    private Object expectedResult;
    private String resultValueType;
    private String expectedResultType;
    private int succeeded = 0;
    private long submitTime;
    private double challengerPoints;
    private double defendantPoints;
    private double pointValue;
    private double penaltyValue;
    private double chalValue;
    private String msg;
    private int language;

    public Challenge() {
        this.contestId = 0;
        this.roundId = 0;
        this.room = new Room();
        this.challengeId = 0;
        this.challengerId = 0;
        this.defendantId = 0;
        this.problem = new Problem();
        this.resultValue = new Object();
        this.expectedResult = new Object();
        this.resultValueType = "";
        this.expectedResultType = "";
        this.succeeded = -1;
        this.chalHandle = "";
        this.defHandle = "";
        this.submitTime = 0L;
        this.pointValue = 0D;
        this.penaltyValue = 0D;
        this.chalValue = 0D;
        this.challengerPoints = 0D;
        this.defendantPoints = 0D;
        this.args = new ArrayList();
        this.msg = "";
        this.statusDesc = "";
        this.statusId = 0;
        this.language = -1;
    }


    public Challenge(Problem problem, int language) {
        this.language = JAVA;
        this.problem = problem;
        this.chalHandle = "";
        this.defHandle = "";
        this.args = new ArrayList();
        this.resultValue = "";
        this.msg = "";
        this.chalValue = EASY_CHALLENGE;
        this.language = language;
        this.resultValue = null;
        this.expectedResult = null;
        this.resultValueType = null;
        this.expectedResultType = null;
        this.succeeded = 0;
    }

    // This constructor is only for contstucting an errant attributes object
    public Challenge(String errorMessage) {
        this.succeeded = 0;
        this.resultValue = errorMessage;
        this.chalValue = EASY_CHALLENGE;
    }

// set
    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public void setStatusDesc(String statusDesc) {
        this.statusDesc = statusDesc;
    }

    public void setChallengerId(int challengerId) {
        this.challengerId = challengerId;
    }

    public void setChalHandle(String in) {
        this.chalHandle = in;
    }

    public void setDefendantId(int defendantId) {
        this.defendantId = defendantId;
    }

    public void setDefHandle(String in) {
        this.defHandle = in;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public void setProblem(Problem problem) {
        this.problem = problem;
    }

    public void setArgs(ArrayList args) {
        this.args = args;
    }

    public void setResultValue(Object resultValue) {
        this.resultValue = resultValue;
    }

    public void setExpectedResult(Object expectedResult) {
        this.expectedResult = expectedResult;
    }

    public void setResultValueType(String resultValueType) {
        this.resultValueType = resultValueType;
    }

    public void setExpectedResultType(String expectedResultType) {
        this.expectedResultType = expectedResultType;
    }

    public void setSucceeded(int succeeded) {
        this.succeeded = succeeded;
    }

    public void setSubmitTime(long submitTime) {
        this.submitTime = submitTime;
    }

    public void setPointValue(double value) {
        DecimalFormat twoDigits = new DecimalFormat("0.00");
        this.pointValue = value;
        this.penaltyValue = UNSUCCESSFUL_CHALLENGE;
    }

    public void setChallengerPoints(double challengerPoints) {
        this.challengerPoints = challengerPoints;
    }

    public void setDefendantPoints(double defendantPoints) {
        this.defendantPoints = defendantPoints;
    }

    public void setChalValue(double value) {
        this.chalValue = value;
    }

    public void setMessage(String msg) {
        this.msg = msg;
    }

    public void setContestId(int contestId) {
        this.contestId = contestId;
    }

    public void setRoundId(int roundId) {
        this.roundId = roundId;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public void setLanguage(int language) {
        this.language = language;
    }

    public void setChallengeId(int challengeId) {
        this.challengeId = challengeId;
    }

// get
    public String getStatusDesc() {
        return statusDesc;
    }

    public int getStatusId() {
        return statusId;
    }

    public int getContestId() {
        return contestId;
    }

    public int getRoundId() {
        return roundId;
    }

    public Room getRoom() {
        return room;
    }

    public int getChallengeId() {
        return challengeId;
    }

    public int getChallengerId() {
        return challengerId;
    }

    public String getChalHandle() {
        return chalHandle;
    }

    public int getDefendantId() {
        return defendantId;
    }

    public String getDefHandle() {
        return defHandle;
    }

    public Location getLocation() {
        return location;
    }

    public Problem getProblem() {
        return problem;
    }

    public ArrayList getArgs() {
        return args;
    }

    public Object getResultValue() {
        return resultValue;
    }

    public Object getExpectedResult() {
        return expectedResult;
    }

    public String getResultValueType() {
        return resultValueType;
    }

    public String getExpectedResultType() {
        return expectedResultType;
    }

    public int getSucceeded() {
        return succeeded;
    }

    public long getSubmitTime() {
        return submitTime;
    }

    public double getPointValue() {
        return pointValue;
    }

    public double getDefendantPoints() {
        return this.defendantPoints;
    }

    public double getChallengerPoints() {
        return this.challengerPoints;
    }

    public double getChalValue() {
        return this.chalValue;
    }

    public double getPenaltyValue() {
        return this.penaltyValue;
    }

    public String getMessage() {
        return msg;
    }

    public int getLanguage() {
        return language;
    }

    public String getChalText() {
        String retVal = "CHAL INFO - CHLNGR: " + challengerId +
                " DFNDNT: " + defendantId +
                " PROB: " + problem +
                " SUCC: " + succeeded;
        return retVal;
    }

    public String toString() {
        StringBuffer str = new StringBuffer(500);
        str.append("CHALLENGE ATTRIBUTES OBJECT:");
        str.append("\nchallenger: " + chalHandle);
        str.append("\ndefendant: " + defHandle);
        str.append("\nproblem: " + problem.getProblemId());
        str.append("\nargs: " + args);
        str.append("\nresultValue: " + resultValue);
        str.append("\nexpectedResult: " + expectedResult);
        str.append("\nchallengerPoints: " + challengerPoints);
        str.append("\ndefendantPoints: " + defendantPoints);
        str.append("\nsucceeded: " + succeeded);
        str.append("\nmsg: " + msg + "\n");
        return str.toString();
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Challenge");
            result.addTag(new ValueTag("ChallengeId", challengeId));
            result.addTag(new ValueTag("ContestId", contestId));
            result.addTag(new ValueTag("RoundId", roundId));
            result.addTag(room.getXML());
            result.addTag(new ValueTag("ChallengerId", challengerId));
            result.addTag(new ValueTag("ChallengerName", chalHandle));
            result.addTag(new ValueTag("DefendantId", defendantId));
            result.addTag(new ValueTag("DefendantName", defHandle));
            result.addTag(problem.getXML());
            result.addTag(new ValueTag("Language", language));
            result.addTag(new ValueTag("ExpectedResult", Conversion.checkNull(StringUtilities.makePretty(expectedResult))));
            result.addTag(new ValueTag("ExpectedResultType", expectedResultType));
            result.addTag(new ValueTag("ResultValue", Conversion.checkNull(StringUtilities.makePretty(resultValue))));
            result.addTag(new ValueTag("ResultValueType", resultValueType));
            result.addTag(new ValueTag("PointValue", pointValue));
            result.addTag(new ValueTag("PenaltyValue", penaltyValue));
            result.addTag(new ValueTag("ChallengeValue", chalValue));
            result.addTag(new ValueTag("ChallengerPoints", challengerPoints));
            result.addTag(new ValueTag("DefendantPoints", defendantPoints));
            result.addTag(new ValueTag("Succeeded", succeeded));
            result.addTag(new ValueTag("StatusId", statusId));
            result.addTag(new ValueTag("StatusDesc", statusDesc));
            result.addTag(new ValueTag("Message", msg));
            result.addTag(new ValueTag("Args", Conversion.checkNull(StringUtilities.makePretty(args))));
            result.addTag(new ValueTag("SubmitTime", new java.sql.Timestamp(submitTime).toString()));
        } catch (Exception e) {
            throw new Exception("common.web.data.Challenge getXML ERROR: " + e);
        }
        return result;
    }


}


package com.topcoder.web.codinginterface.longcontest.model;

public class LongContestModel {
	
	private String contestName;
	private long contestID;
	private String roundName;
	private long roundID;
	private String startTime;
	private String endTime;
	private String problemName;
	private long componentID;
	private boolean passed;
	private boolean coderRegistered;
	private long problemID;
	private boolean started;
	
	public boolean isCoderRegistered() {
		return coderRegistered;
	}
	public void setCoderRegistered(boolean coderRegistered) {
		this.coderRegistered = coderRegistered;
	}
	public long getComponentID() {
		return componentID;
	}
	public void setComponentID(long componentID) {
		this.componentID = componentID;
	}
	public long getContestID() {
		return contestID;
	}
	public void setContestID(long contestID) {
		this.contestID = contestID;
	}
	public String getContestName() {
		return contestName;
	}
	public void setContestName(String contestName) {
		this.contestName = contestName;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public boolean isPassed() {
		return passed;
	}
	public void setPassed(boolean passed) {
		this.passed = passed;
	}
	public String getProblemName() {
		return problemName;
	}
	public void setProblemName(String problemName) {
		this.problemName = problemName;
	}
	public long getRoundID() {
		return roundID;
	}
	public void setRoundID(long roundID) {
		this.roundID = roundID;
	}
	public String getRoundName() {
		return roundName;
	}
	public void setRoundName(String roundName) {
		this.roundName = roundName;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public long getProblemID() {
		return problemID;
	}
	public void setProblemID(long problemID) {
		this.problemID = problemID;
	}
	public boolean isStarted() {
		return started;
	}
	public void setStarted(boolean started) {
		this.started = started;
	}	
	
}

package com.topcoder.web.codinginterface.longcontest.model;

public class StandingModel {
	
	private String handle;
	private long roundID;
	private long coderID;
	private long componentStateID;
	private long componentID;
	private double points;
	private int submissionNumber;
	private int rank;
	
	public long getCoderID() {
		return coderID;
	}
	public void setCoderID(long coderID) {
		this.coderID = coderID;
	}
	public long getComponentID() {
		return componentID;
	}
	public void setComponentID(long componentID) {
		this.componentID = componentID;
	}
	public long getComponentStateID() {
		return componentStateID;
	}
	public void setComponentStateID(long componentStateID) {
		this.componentStateID = componentStateID;
	}
	public String getHandle() {
		return handle;
	}
	public void setHandle(String handle) {
		this.handle = handle;
	}
	public double getPoints() {
		return points;
	}
	public void setPoints(double points) {
		this.points = points;
	}
	public long getRoundID() {
		return roundID;
	}
	public void setRoundID(long roundID) {
		this.roundID = roundID;
	}
	public int getSubmissionNumber() {
		return submissionNumber;
	}
	public void setSubmissionNumber(int submissionNumber) {
		this.submissionNumber = submissionNumber;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
}

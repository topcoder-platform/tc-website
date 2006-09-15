package com.topcoder.web.ejb.pacts;

import java.util.Date;

/**
 * Represents basic payment information.
 * 
 * @author cucu
 *
 */
public class BasePayment {
	private long id;
	private long coderId;
	private double grossAmount;
	private double netAmount;
	private Date dueDate;
	private int statusId;
	private String description;
	
	
	protected BasePayment(long id, long coderId) {
		super();
		this.id = id;
		this.coderId = coderId;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
	public double getGrossAmount() {
		return grossAmount;
	}
	public void setGrossAmount(double grossAmount) {
		this.grossAmount = grossAmount;
	}
	public double getNetAmount() {
		return netAmount;
	}
	public void setNetAmount(double netAmount) {
		this.netAmount = netAmount;
	}
	public int getStatusId() {
		return statusId;
	}
	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}
	public long getCoderId() {
		return coderId;
	}
	public long getId() {
		return id;
	}

}

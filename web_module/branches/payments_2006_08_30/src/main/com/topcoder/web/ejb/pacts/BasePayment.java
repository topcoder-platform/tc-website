package com.topcoder.web.ejb.pacts;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.topcoder.web.ejb.pacts.ComponentTournamentBonusPayment.Processor;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 * Represents basic payment information.
 *
 * @author cucu
 *
 */
public abstract class BasePayment {
	private long id;
	private long coderId;
	private double grossAmount;
	private double netAmount;
	private Date dueDate;
	private int statusId;
	private String description;

	// Date when the event happened.  It is not stored in the database, but needed to know if referrals must be paid.
	private Date eventDate;
	
	// Whether complete data is filled or not.
	private boolean dataFilled;

	protected BasePayment(long coderId, double grossAmount) {
		super();
		this.coderId = coderId;
		this.grossAmount = grossAmount;
		dataFilled = false;
	}

	void setId(long id) {
		this.id = id;
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
	public abstract int getPaymentType();

	public boolean isDataFilled() {
		return dataFilled;
	}

	public void setDataFilled(boolean dataFilled) {
		this.dataFilled = dataFilled;
	}

	protected abstract void fillPaymentReference(Payment p);

	protected Payment createPayment() {
		SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");

        Payment p = new Payment();
        p.setGrossAmount(getGrossAmount());
        p.setStatusId(getStatusId());
        p.getHeader().setDescription(getDescription());
        p.getHeader().setTypeId(getPaymentType());
        p.setEventDate(getEventDate());
        p.setDueDate(format.format(getDueDate()));
        p.getHeader().getUser().setId(getCoderId());

        fillPaymentReference(p);

        return p;

	}
	// TODO make it abstract!
	protected PaymentProcessor getProcessor() {
		return null;
	}	


	public Date getEventDate() {
		return eventDate;
	}

	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}
}

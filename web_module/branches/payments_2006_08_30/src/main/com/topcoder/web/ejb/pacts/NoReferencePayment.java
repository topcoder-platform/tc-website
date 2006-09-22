package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 * Payment that doesn't have any reference to another table.
 * 
 * @author cucu
 *
 */
public class NoReferencePayment extends BasePayment {
	private final int paymentType;
	
	public NoReferencePayment(int paymentType, long coderId, double grossAmount, String description) {
		this(paymentType, coderId, grossAmount, description, new Date());
		
		if (getReferenceTypeId() != NO_REFERENCE) {
			throw new IllegalArgumentException("Can't create a NoReferencePayment for type " + paymentType);
		}
	}
	
	public NoReferencePayment(int paymentType, long coderId, double grossAmount, String description, Date eventDate) {
		super(coderId, grossAmount);
		setDescription(description);
		setEventDate(eventDate);
		this.paymentType = paymentType;	
	}

	public int getPaymentType() {
		return paymentType;
	}

	protected BasePayment.Processor getProcessor() {
		return new Processor();		
	}
	
	protected void fillPaymentReference(Payment p) {
		// nothing to do here since there is no reference		
	}

	protected static class Processor extends BasePayment.Processor {

		public String lookupDescription(BasePayment payment) throws SQLException {
			return payment.getDescription();
		}

		public Date lookupEventDate(BasePayment payment) throws SQLException {
			return payment.getEventDate();
		}
	}



}

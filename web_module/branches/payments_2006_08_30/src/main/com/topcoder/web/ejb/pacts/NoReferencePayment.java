package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;


/**
 * Payment that doesn't have any reference to another table.
 *
 * @author cucu
 *
 */
public class NoReferencePayment extends BasePayment {

	public NoReferencePayment(int paymentTypeId, long coderId, double grossAmount, String description) {
		this(paymentTypeId, coderId, grossAmount, description, new Date());

		if (getReferenceTypeId() != NO_REFERENCE) {
			throw new IllegalArgumentException("Can't create a NoReferencePayment for type " + paymentTypeId);
		}
	}

	public NoReferencePayment(int paymentTypeId, long coderId, double grossAmount, String description, Date eventDate) {
		super(paymentTypeId, coderId, grossAmount);
		setDescription(description);
		setEventDate(eventDate);
	}

	protected BasePayment.Processor getProcessor() {
		return new Processor();
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

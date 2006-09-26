package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for charity.
 *
 * @author cucu
 *
 */
public class CharityPayment extends ParentReferencePayment {

	public CharityPayment(BasePayment parent) {
		super(CHARITY_PAYMENT, parent.getCoderId(), 0.0, parent.getId());

		if (parent.getId() <= 0) {
			throw new IllegalArgumentException("Parent payment was not saved to DB (payment_id missing)");
		}
	}

	public CharityPayment(long coderId, long parentId) {
		super(CHARITY_PAYMENT, coderId, 0.0, parentId);
	}


	protected BasePayment.Processor getProcessor() {
		return new Processor();
	}

	protected static class Processor extends ParentReferencePayment.Processor {

		public String lookupDescription(BasePayment payment) throws SQLException {
			ParentReferencePayment p = (ParentReferencePayment) payment;

        	return "Paid to Charity: " + getPaymentDesc(p);
		}
	}


}

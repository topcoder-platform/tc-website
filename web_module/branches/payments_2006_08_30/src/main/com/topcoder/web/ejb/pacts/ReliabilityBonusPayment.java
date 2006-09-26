package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for reliability bonus.
 *
 * @author cucu
 *
 */
public class ReliabilityBonusPayment extends ParentReferencePayment {

	public ReliabilityBonusPayment(BasePayment parent, double grossAmount) {
		super(RELIABILITY_BONUS_PAYMENT, parent.getCoderId(), grossAmount, parent.getId());

		if (parent.getId() <= 0) {
			throw new IllegalArgumentException("Parent payment was not saved to DB (payment_id missing)");
		}
	}

	public ReliabilityBonusPayment(long coderId, double grossAmount, long parentId) {
		super(RELIABILITY_BONUS_PAYMENT, coderId, grossAmount, parentId);
	}

	protected BasePayment.Processor getProcessor() {
		return new Processor();
	}

	protected static class Processor extends ParentReferencePayment.Processor {

		public String lookupDescription(BasePayment payment) throws SQLException {
			ParentReferencePayment p = (ParentReferencePayment) payment;

        	return "Reliability bonus for " + getPaymentDesc(p);
		}
	}


}

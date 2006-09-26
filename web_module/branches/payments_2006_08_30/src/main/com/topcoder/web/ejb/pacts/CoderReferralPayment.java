package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for coder referral.
 *
 * @author cucu
 *
 */
public class CoderReferralPayment extends ParentReferencePayment {

	public CoderReferralPayment(BasePayment parent, long coderId, double grossAmount) {
		super(CODER_REFERRAL_PAYMENT, coderId, grossAmount, parent.getId());

		if (parent.getId() <= 0) {
			throw new IllegalArgumentException("Parent payment was not saved to DB (payment_id missing)");
		}
	}

	public CoderReferralPayment(long coderId, double grossAmount, long parentId) {
		super(CODER_REFERRAL_PAYMENT, coderId, grossAmount, parentId);
	}

	protected BasePayment.Processor getProcessor() {
		return new Processor();
	}

	protected static class Processor extends ParentReferencePayment.Processor {

		public String lookupDescription(BasePayment payment) throws SQLException {
			ParentReferencePayment p = (ParentReferencePayment) payment;

        	return "Referral bonus for " + getReferredCoder(p) + " " + getPaymentDesc(p);
		}
	}


}

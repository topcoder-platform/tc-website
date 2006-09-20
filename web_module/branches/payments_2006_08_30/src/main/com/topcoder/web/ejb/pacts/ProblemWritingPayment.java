package com.topcoder.web.ejb.pacts;

import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * Payment for a problem writing.
 * 
 * @author cucu
 *
 */
public class ProblemWritingPayment extends ProblemPayment {

	public ProblemWritingPayment(long coderId, double grossAmount, long problemId) {
		super(coderId, grossAmount, problemId);
	}

	public int getPaymentType() {
		return PactsConstants.PROBLEM_WRITING_PAYMENT;
	}

}

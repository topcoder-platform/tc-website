package com.topcoder.web.ejb.pacts;

import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 * Payment for an algorithm contest (e.g. SRM)
 * 
 * @author cucu
 *
 */
public class AlgorithmContestPayment extends AlgorithmPayment {
	public AlgorithmContestPayment(long coderId, double grossAmount, long roundId) {
		super(coderId, grossAmount, roundId);
	}


	public int getPaymentType() {
		return PactsConstants.ALGORITHM_CONTEST_PAYMENT;
	}

	public boolean payReferral() {
		return true;
	}
}

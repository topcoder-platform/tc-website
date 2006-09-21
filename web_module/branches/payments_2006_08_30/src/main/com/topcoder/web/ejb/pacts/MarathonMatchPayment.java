package com.topcoder.web.ejb.pacts;

import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * Payment for a prize in a Marathon Match.
 * 
 * @author cucu
 *
 */
public class MarathonMatchPayment extends AlgorithmPayment {
	
	public MarathonMatchPayment(long coderId, double grossAmount, long roundId) {
		super(coderId, grossAmount, roundId);
	}

	public MarathonMatchPayment(long coderId, double grossAmount, long roundId, int placed) {
		super(coderId, grossAmount, roundId, placed);
	}

	public int getPaymentType() {
		return PactsConstants.MARATHON_MATCH_PAYMENT;
	}
}

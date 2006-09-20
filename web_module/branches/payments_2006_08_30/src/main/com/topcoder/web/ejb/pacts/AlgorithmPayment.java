package com.topcoder.web.ejb.pacts;

import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 * Payment for an algorithm competition (SRM, contest prize, marathon matches).
 *  It includes a reference to a round.
 * 
 * @author cucu
 *
 */
public abstract class AlgorithmPayment extends BasePayment {
	private long roundId;

	public AlgorithmPayment(long coderId, double grossAmount, long roundId) {
		super(coderId, grossAmount);
		this.roundId = roundId;
	}

	public long getRoundId() {
		return roundId;
	}

	protected void fillPaymentReference(Payment p) {
		p.getHeader().setAlgorithmRoundId(getRoundId());
	}

}

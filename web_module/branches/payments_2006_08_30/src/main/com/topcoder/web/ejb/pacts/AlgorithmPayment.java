package com.topcoder.web.ejb.pacts;

import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 * Payment for an algorithm competition (SRM, contest prize, marathon matches).
 * It includes a reference to a round, as well as the round name, that is actually
 * the contest name + the round name.
 * Also there is an optional field, placed, that will be used in the description
 * on the payment if its positive.
 * 
 * @author cucu
 *
 */
public abstract class AlgorithmPayment extends BasePayment {
	private long roundId;
	private String roundName;
	private int placed;
	
	public String getRoundName() {
		return roundName;
	}

	public int getPlaced() {
		return placed;
	}

	public void setRoundName(String roundName) {
		this.roundName = roundName;
	}

	public AlgorithmPayment(long coderId, double grossAmount, long roundId, int placed) {
		super(coderId, grossAmount);
		this.roundId = roundId;
		this.placed = placed;
	}
	
	public AlgorithmPayment(long coderId, double grossAmount, long roundId) {
		this(coderId, grossAmount, roundId, 0);
	}

	public long getRoundId() {
		return roundId;
	}

	protected void fillPaymentReference(Payment p) {
		p.getHeader().setAlgorithmRoundId(getRoundId());
	}

}

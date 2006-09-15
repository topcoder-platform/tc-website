package com.topcoder.web.ejb.pacts;

/**
 * Payment for an algorithm contest.  It includes a reference to a round.
 * 
 * @author cucu
 *
 */
public class AlgorithmContestPayment extends BasePayment {
	private long roundId;

	public AlgorithmContestPayment(long id, long coderId, long roundId) {
		super(id, coderId);
		this.roundId = roundId;
	}

	public long getRoundId() {
		return roundId;
	}
}

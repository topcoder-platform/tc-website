package com.topcoder.web.ejb.pacts;


/**
 * Payment for a prize in a Marathon Match.
 * 
 * @author cucu
 *
 */
public class MarathonMatchPayment extends AlgorithmRoundReferencePayment {
	
	public MarathonMatchPayment(long coderId, double grossAmount, long roundId) {
		super(coderId, grossAmount, roundId);
	}

	public MarathonMatchPayment(long coderId, double grossAmount, long roundId, int placed) {
		super(coderId, grossAmount, roundId, placed);
	}

	public int getPaymentType() {
		return PaymentTypes.MARATHON_MATCH_PAYMENT;
	}
}

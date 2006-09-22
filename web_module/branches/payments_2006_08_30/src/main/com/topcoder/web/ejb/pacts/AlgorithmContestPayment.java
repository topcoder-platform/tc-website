package com.topcoder.web.ejb.pacts;


/**
 * Payment for an algorithm contest (e.g. SRM)
 * 
 * @author cucu
 *
 */
public class AlgorithmContestPayment extends AlgorithmRoundReferencePayment {
	public AlgorithmContestPayment(long coderId, double grossAmount, long roundId) {
		super(coderId, grossAmount, roundId);
	}

	public AlgorithmContestPayment(long coderId, double grossAmount, long roundId, int placed) {
		super(coderId, grossAmount, roundId, placed);
	}

	public int getPaymentType() {
		return PaymentTypes.ALGORITHM_CONTEST_PAYMENT;
	}
}

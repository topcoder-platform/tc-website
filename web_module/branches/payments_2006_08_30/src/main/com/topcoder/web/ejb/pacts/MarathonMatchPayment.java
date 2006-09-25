package com.topcoder.web.ejb.pacts;


/**
 * Payment for a prize in a Marathon Match.
 * 
 * @author cucu
 *
 */
public class MarathonMatchPayment extends AlgorithmRoundReferencePayment {
	
	/**
	 * Create a payment for a Marathon Match.
	 *  
	 * @param coderId id of the coder being paid
	 * @param grossAmount amount paid
	 * @param roundId the round for which the coder is being paid.
	 */
	public MarathonMatchPayment(long coderId, double grossAmount, long roundId) {
		super(coderId, grossAmount, roundId);
	}

	/**
	 * Create a payment for a Marathon Match.
	 *  
	 * @param coderId id of the coder being paid
	 * @param grossAmount amount paid
	 * @param roundId the round for which the coder is being paid.
	 * @param placed the place that the coder had in the contest, used for creating the description.
	 */
	public MarathonMatchPayment(long coderId, double grossAmount, long roundId, int placed) {
		super(coderId, grossAmount, roundId, placed);
	}

	/**
	 * Get the type of this payment.
	 * 
	 * @return the type of this payment.
	 */	
	public int getPaymentType() {
		return PaymentTypes.MARATHON_MATCH_PAYMENT;
	}
}

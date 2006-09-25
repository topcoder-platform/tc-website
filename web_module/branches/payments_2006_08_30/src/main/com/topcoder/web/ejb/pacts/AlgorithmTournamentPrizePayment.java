package com.topcoder.web.ejb.pacts;


/**
 * Payment for a prize in algorithm contest (e.g. TCO finals)
 * 
 * @author cucu
 *
 */
public class AlgorithmTournamentPrizePayment extends AlgorithmRoundReferencePayment {
	
	/**
	 * Create a payment for an algorithm tournament prize, for example winning a TCO.
	 *  
	 * @param coderId id of the coder being paid
	 * @param grossAmount amount paid
	 * @param roundId the round for which the coder is being paid.
	 */
	public AlgorithmTournamentPrizePayment(long coderId, double grossAmount, long roundId) {
		super(coderId, grossAmount, roundId);
	}

	/**
	 * Create a payment for an algorithm tournament prize, for example winning a TCO.
	 *  
	 * @param coderId id of the coder being paid
	 * @param grossAmount amount paid
	 * @param roundId the round for which the coder is being paid.
	 * @param placed the place that the coder had in the contest, used for creating the description.
	 */
	public AlgorithmTournamentPrizePayment(long coderId, double grossAmount, long roundId, int placed) {
		super(coderId, grossAmount, roundId, placed);
	}

	/**
	 * Get the type of this payment.
	 * 
	 * @return the type of this payment.
	 */	
	public int getPaymentType() {
		return PaymentTypes.ALGORITHM_TOURNAMENT_PRIZE_PAYMENT;
	}
}

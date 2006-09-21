package com.topcoder.web.ejb.pacts;

import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * Payment for a prize in algorithm contest (e.g. TCO finals)
 * 
 * @author cucu
 *
 */
public class AlgorithmTournamentPrizePayment extends AlgorithmPayment {
	
	public AlgorithmTournamentPrizePayment(long coderId, double grossAmount, long roundId) {
		super(coderId, grossAmount, roundId);
	}

	public AlgorithmTournamentPrizePayment(long coderId, double grossAmount, long roundId, int placed) {
		super(coderId, grossAmount, roundId, placed);
	}

	public int getPaymentType() {
		return PactsConstants.ALGORITHM_TOURNAMENT_PRIZE_PAYMENT;
	}
}

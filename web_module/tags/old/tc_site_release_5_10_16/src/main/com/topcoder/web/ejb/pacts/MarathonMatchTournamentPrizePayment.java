package com.topcoder.web.ejb.pacts;


/**
 * Payment for a prize in a Marathon Matc tournamenth.
 *
 * @author cucu
 *
 */
public class MarathonMatchTournamentPrizePayment extends AlgorithmRoundReferencePayment {

    /**
     * Create a payment for a Marathon Match Tournament.
     *
     * @param coderId id of the coder being paid
     * @param grossAmount amount paid
     * @param roundId the round for which the coder is being paid.
     */
    public MarathonMatchTournamentPrizePayment(long coderId, double grossAmount, long roundId) {
        this(coderId, grossAmount, roundId, 0);
    }

    /**
     * Create a payment for a Marathon Match Tournament.
     *
     * @param coderId id of the coder being paid
     * @param grossAmount amount paid
     * @param roundId the round for which the coder is being paid.
     * @param placed the place that the coder had in the tournament, used for creating the description.
     */
    public MarathonMatchTournamentPrizePayment(long coderId, double grossAmount, long roundId, int placed) {
        super(MARATHON_MATCH_TOURNAMENT_PRIZE_PAYMENT, coderId, grossAmount, roundId, placed);
    }

}

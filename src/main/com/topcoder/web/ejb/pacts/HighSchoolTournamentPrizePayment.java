package com.topcoder.web.ejb.pacts;


/**
 * Payment for a prize in a high school tournament.
 *
 * @author cucu
 *
 */
public class HighSchoolTournamentPrizePayment extends AlgorithmRoundReferencePayment {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 2L;

    /**
     * Create a payment for a high school tournament prize.
     *
     * @param coderId id of the coder being paid
     * @param grossAmount amount paid
     * @param roundId the round for which the coder is being paid.
     */
    public HighSchoolTournamentPrizePayment(long coderId, double grossAmount, long roundId) {
        this(coderId, grossAmount, roundId, 0);
    }

    /**
    /**
     *
     * @param coderId id of the coder being paid
     * @param grossAmount amount paid
     * @param roundId the round for which the coder is being paid.
     * @param placed the place that the coder had in the contest, used for creating the description.
     */
    public HighSchoolTournamentPrizePayment(long coderId, double grossAmount, long roundId, int placed) {
        super(HIGH_SCHOOL_TOURNAMENT_PRIZE_PAYMENT, coderId, grossAmount, roundId, placed);
    }
}

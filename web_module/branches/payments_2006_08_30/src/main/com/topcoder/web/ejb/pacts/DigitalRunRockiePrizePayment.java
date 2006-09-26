package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for a Digital Run prize.
 *
 * @author cucu
 *
 */
public class DigitalRunRockiePrizePayment extends DigitalRunSeasonReferencePayment {

	public DigitalRunRockiePrizePayment(long coderId, double grossAmount, long seasonId) {
		super(DIGITAL_RUN_ROCKIE_PRIZE_PAYMENT, coderId, grossAmount, seasonId);
	}

	public DigitalRunRockiePrizePayment(long coderId, double grossAmount, long seasonId, int placed) {
		super(DIGITAL_RUN_ROCKIE_PRIZE_PAYMENT, coderId, grossAmount, seasonId, placed);
	}

	protected BasePayment.Processor getProcessor() {
		return new Processor();
	}


	protected static class Processor extends DigitalRunSeasonReferencePayment.Processor {

		public String lookupDescription(BasePayment payment) throws SQLException {
			DigitalRunSeasonReferencePayment p = (DigitalRunSeasonReferencePayment) payment;

			return getSeasonName(p) + ", " + getOrdinal(p.getPlaced());
		}
	}

}

package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for a Digital Run prize.
 *
 * @author cucu
 *
 */
public class DigitalRunPrizePayment extends DigitalRunStageReferencePayment {

	public DigitalRunPrizePayment(long coderId, double grossAmount, long stageId) {
		super(DIGITAL_RUN_PRIZE_PAYMENT, coderId, grossAmount, stageId);
	}

	public DigitalRunPrizePayment(long coderId, double grossAmount, long stageId, int placed) {
		super(DIGITAL_RUN_PRIZE_PAYMENT, coderId, grossAmount, stageId, placed);
	}


	protected BasePayment.Processor getProcessor() {
		return new Processor();
	}

	protected static class Processor extends DigitalRunStageReferencePayment.Processor {

		public String lookupDescription(BasePayment payment) throws SQLException {
			DigitalRunStageReferencePayment p = (DigitalRunStageReferencePayment) payment;

			return getStageName(p) + ", " + getOrdinal(p.getPlaced());
		}

	}
}

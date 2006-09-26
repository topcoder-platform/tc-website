package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for a Digital Run Top Third bonus.
 *
 * @author cucu
 *
 */
public class DigitalRunTopThirdPayment extends DigitalRunStageReferencePayment {

	public DigitalRunTopThirdPayment(long coderId, double grossAmount, long stageId) {
		super(DIGITAL_RUN_TOP_THIRD_PAYMENT, coderId, grossAmount, stageId);
	}

	public DigitalRunTopThirdPayment(long coderId, double grossAmount, long stageId, int placed) {
		super(DIGITAL_RUN_TOP_THIRD_PAYMENT, coderId, grossAmount, stageId, placed);
	}

	protected BasePayment.Processor getProcessor() {
		return new Processor();
	}

	protected static class Processor extends DigitalRunStageReferencePayment.Processor {

		public String lookupDescription(BasePayment payment) throws SQLException {
			DigitalRunStageReferencePayment p = (DigitalRunStageReferencePayment) payment;

			return getStageName(p) + " Top Third, " + getOrdinal(p.getPlaced());
		}

	}



}

package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.ejb.pacts.DigitalRunTopThirdPayment.Processor;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 * Payment for a Digital Run prize.
 * 
 * @author cucu
 *
 */
public class DigitalRunPrizePayment extends DigitalRunStageReferencePayment {

	public DigitalRunPrizePayment(long coderId, double grossAmount, long stageId) {
		super(coderId, grossAmount, stageId);
	}

	public DigitalRunPrizePayment(long coderId, double grossAmount, long stageId, int placed) {
		super(coderId, grossAmount, stageId, placed);
	}
	
	public int getPaymentType() {
		return PaymentTypes.DIGITAL_RUN_PRIZE_PAYMENT;
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

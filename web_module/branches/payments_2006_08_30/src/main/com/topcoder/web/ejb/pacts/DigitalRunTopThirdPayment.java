package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 * Payment for a Digital Run Top Third bonus.
 * 
 * @author cucu
 *
 */
public class DigitalRunTopThirdPayment extends DigitalRunStageReferencePayment {

	public DigitalRunTopThirdPayment(long coderId, double grossAmount, long stageId) {
		super(coderId, grossAmount, stageId);
	}

	public DigitalRunTopThirdPayment(long coderId, double grossAmount, long stageId, int placed) {
		super(coderId, grossAmount, stageId, placed);
	}
	
	public int getPaymentType() {
		return PaymentTypes.DIGITAL_RUN_TOP_THIRD_PAYMENT;
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

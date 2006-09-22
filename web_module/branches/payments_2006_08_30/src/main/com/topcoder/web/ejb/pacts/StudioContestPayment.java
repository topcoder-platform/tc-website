package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

/**
 * Payment for a Studio Contest.
 * 
 * @author cucu
 *
 */
public class StudioContestPayment extends StudioContestReferencePayment {
	public StudioContestPayment(long coderId, double grossAmount, long contestId, int placed) {
		super(coderId, grossAmount, contestId, placed);
	}

	public StudioContestPayment(long coderId, double grossAmount, long contestId) {
		this(coderId, grossAmount, contestId, 0);
	}
	
	protected BasePayment.Processor getProcessor() {
		return new Processor();
	}	

	public int getPaymentType() {
		return PaymentTypes.TC_STUDIO_PAYMENT;
	}

	protected static class Processor extends StudioContestReferencePayment.Processor {
		
		public String lookupDescription(BasePayment payment) throws SQLException {
			StudioContestReferencePayment p = (StudioContestReferencePayment) payment;
			
			return getContestName(p) + " contest " + getOrdinal(p.getPlaced());
		}

		public Date lookupEventDate(BasePayment payment) throws SQLException {
			StudioContestReferencePayment p = (StudioContestReferencePayment) payment;
			
			return getEndDate(p);
		}
		
	}

}

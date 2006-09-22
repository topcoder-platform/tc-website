package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for the review board of a component.
 * 
 * @author cucu
 *
 */
public class ReviewBoardPayment extends ComponentProjectReferencePayment {
	public ReviewBoardPayment(long coderId, double grossAmount, long projectId) {
		super(coderId, grossAmount, projectId);
	}

	public int getPaymentType() {
		return PaymentTypes.REVIEW_BOARD_PAYMENT;
	}

	protected BasePayment.Processor getProcessor() {
		return new Processor();		
	}
	
	protected class Processor extends ComponentProjectReferencePayment.Processor {

		public String lookupDescription(BasePayment payment) throws SQLException {
			ComponentProjectReferencePayment p = (ComponentProjectReferencePayment) payment;
			
        	return getComponentName(p) + " - " + getProjectType(p) + " review board";
		}
	}

}

package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for a component winning.
 * 
 * @author cucu
 *
 */
public class ComponentWinningPayment extends ComponentProjectReferencePayment {

	public ComponentWinningPayment(long coderId, double grossAmount, long projectId, int placed) {
		super(coderId, grossAmount, projectId, placed);
	}
	
	public ComponentWinningPayment(long coderId, double grossAmount, long projectId) {
		this(coderId, grossAmount, projectId, 0);
	}


	public int getPaymentType() {
		return PaymentTypes.COMPONENT_PAYMENT;
	}

	protected BasePayment.Processor getProcessor() {
		return new Processor();		
	}
	
	protected static class Processor extends ComponentProjectReferencePayment.Processor {

		public String lookupDescription(BasePayment payment) throws SQLException {
			ComponentProjectReferencePayment p = (ComponentProjectReferencePayment) payment;
			
        	return getComponentName(p) + " - " + getProjectType(p) + ", " + getOrdinal(p.getPlaced());

		}
	}


}

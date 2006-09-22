package com.topcoder.web.ejb.pacts;

import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * Payment for a component winning.
 * 
 * @author cucu
 *
 */
public class ComponentWinningPayment extends ComponentPayment {
	private int placed;

	public ComponentWinningPayment(long coderId, double grossAmount, long projectId, int placed) {
		super(coderId, grossAmount, projectId);
		this.placed = placed;
	}

	public int getPlaced() {
		return placed;
	}


	public int getPaymentType() {
		return PactsConstants.COMPONENT_PAYMENT;
	}

}

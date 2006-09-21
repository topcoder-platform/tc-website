package com.topcoder.web.ejb.pacts;

import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * Payment for the review board of a component.
 * 
 * @author cucu
 *
 */
public class ReviewBoardPayment extends ComponentPayment {
	public ReviewBoardPayment(long coderId, double grossAmount, long projectId) {
		super(coderId, grossAmount, projectId);
	}

	public int getPaymentType() {
		return PactsConstants.REVIEW_BOARD_PAYMENT;
	}

}

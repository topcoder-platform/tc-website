package com.topcoder.web.ejb.pacts;

import java.sql.Connection;
import java.sql.SQLException;

import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * Payment for a problem testing.
 * 
 * @author cucu
 *
 */
public class ProblemTestingPayment extends ProblemPayment {

	public ProblemTestingPayment(long coderId, double grossAmount, long problemId) {
		super(coderId, grossAmount, problemId);
	}


	public int getPaymentType() {
		return PactsConstants.PROBLEM_TESTING_PAYMENT;
	}

}

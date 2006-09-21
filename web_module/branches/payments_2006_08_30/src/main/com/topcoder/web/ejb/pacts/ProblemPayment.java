package com.topcoder.web.ejb.pacts;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 * Payment for a problem writing or testing.  It includes a reference to a problem.
 * 
 * @author cucu
 *
 */
public abstract class ProblemPayment extends BasePayment {
	private long problemId;

	public ProblemPayment(long coderId, double grossAmount, long problemId) {
		super(coderId, grossAmount);
		this.problemId = problemId;
	}

	public long getProblemId() {
		return problemId;
	}
	
	protected void fillPaymentReference(Payment p) {
		p.getHeader().setAlgorithmProblemId(getProblemId());
	}
	
}

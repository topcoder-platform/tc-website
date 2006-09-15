package com.topcoder.web.ejb.pacts;

/**
 * Payment for a problem writing or testing.  It includes a reference to a problem.
 * 
 * @author cucu
 *
 */
public class ProblemPayment extends BasePayment {
	private long problemId;

	public ProblemPayment(long id, long coderId, long problemId) {
		super(id, coderId);
		this.problemId = problemId;
	}

	public long getProblemId() {
		return problemId;
	}
}

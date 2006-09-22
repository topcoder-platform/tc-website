package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for a problem testing.
 * 
 * @author cucu
 *
 */
public class ProblemTestingPayment extends AlgorithmProblemReferencePayment {

	public ProblemTestingPayment(long coderId, double grossAmount, long problemId) {
		super(coderId, grossAmount, problemId);
	}


	public int getPaymentType() {
		return PaymentTypes.PROBLEM_TESTING_PAYMENT;
	}


	protected BasePayment.Processor getProcessor() {
		return new Processor();
	}

	protected static class Processor extends AlgorithmProblemReferencePayment.Processor {

		public String lookupDescription(BasePayment payment) throws SQLException {
			AlgorithmProblemReferencePayment p = (AlgorithmProblemReferencePayment) payment;
			
			return "Problem " + getProblemName(p) + " testing";
		}	
	}
}

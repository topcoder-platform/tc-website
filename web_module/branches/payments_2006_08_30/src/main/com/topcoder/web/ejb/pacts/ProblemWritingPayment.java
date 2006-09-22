package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;

/**
 * Payment for a problem writing.
 * 
 * @author cucu
 *
 */
public class ProblemWritingPayment extends AlgorithmProblemReferencePayment {

	public ProblemWritingPayment(long coderId, double grossAmount, long problemId) {
		super(coderId, grossAmount, problemId);
	}

	public int getPaymentType() {
		return PaymentTypes.PROBLEM_WRITING_PAYMENT;
	}
		
	protected BasePayment.Processor getProcessor() {
		return new Processor();
	}

	protected class Processor extends AlgorithmProblemReferencePayment.Processor {
		
		public String lookupDescription(BasePayment payment) throws SQLException {
			AlgorithmProblemReferencePayment p = (AlgorithmProblemReferencePayment) payment;
			
			return "Problem " + getProblemName(p) + " writing";
		}	
	}
}

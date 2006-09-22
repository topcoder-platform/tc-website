package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 * Payment that references a problem.
 * 
 * @author cucu
 *
 */
public abstract class AlgorithmProblemReferencePayment extends BasePayment {
	private long problemId;

	public AlgorithmProblemReferencePayment(long coderId, double grossAmount, long problemId) {
		super(coderId, grossAmount);
		this.problemId = problemId;
	}

	public long getProblemId() {
		return problemId;
	}
	
	protected void fillPaymentReference(Payment p) {
		p.getHeader().setAlgorithmProblemId(getProblemId());
	}
	
	protected static abstract class Processor extends BasePayment.Processor {
		private String problemName = null;

		public Date lookupEventDate(BasePayment payment) throws SQLException {
			return new Date();
		}
		
		protected String getProblemName(AlgorithmProblemReferencePayment payment) throws SQLException {
			if (problemName == null) {
				lookupData(payment);
			}
			return problemName;
		}


		private void lookupData(AlgorithmProblemReferencePayment payment) throws SQLException {
	        StringBuffer query = new StringBuffer(100);
	        query.append(" SELECT name ");
	        query.append(" FROM problem ");
	        query.append(" WHERE problem_id = " + payment.getProblemId());

	        ResultSetContainer rsc = runSelectQuery(query.toString());

	        if (rsc.getRowCount() != 1) {
	        	throw new IllegalArgumentException("Not exactly 1 problem found with id " + payment.getProblemId());
	        }
	        
	        problemName = rsc.getStringItem(0, 0);
		}
		
	}

}

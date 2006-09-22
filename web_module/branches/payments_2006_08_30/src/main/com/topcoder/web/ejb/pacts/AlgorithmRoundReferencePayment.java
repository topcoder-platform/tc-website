package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 * Payment for an algorithm that takes a refence to a round.
 * 
 * @author cucu
 *
 */
public abstract class AlgorithmRoundReferencePayment extends BasePayment {
	private long roundId;
	

	public AlgorithmRoundReferencePayment(long coderId, double grossAmount, long roundId, int placed) {
		super(coderId, grossAmount, placed);
		this.roundId = roundId;
	}
	
	public AlgorithmRoundReferencePayment(long coderId, double grossAmount, long roundId) {
		this(coderId, grossAmount, roundId, 0);
	}

	public long getRoundId() {
		return roundId;
	}

	protected void fillPaymentReference(Payment p) {
		p.getHeader().setAlgorithmRoundId(getRoundId());
	}
	
	protected BasePayment.Processor getProcessor() {
		return new Processor();
	}	


	protected static class Processor extends BasePayment.Processor {
		private String roundName = null;
		private Date endDate = null;

		public String lookupDescription(BasePayment payment) throws SQLException {
			return getRoundName((AlgorithmRoundReferencePayment) payment) + " " + getOrdinal(payment.getPlaced());
		}

		public Date lookupEventDate(BasePayment payment) throws SQLException {
			return getEndDate((AlgorithmRoundReferencePayment) payment);
		}
		
		protected String getRoundName(AlgorithmRoundReferencePayment payment) throws SQLException {
			if (roundName == null) {
				lookupData(payment);
			}
			return roundName;
		}


		protected Date getEndDate(AlgorithmRoundReferencePayment payment) throws SQLException {
			if (endDate == null) {
				lookupData(payment);
			}
			return endDate;
		}

		private void lookupData(AlgorithmRoundReferencePayment payment) throws SQLException {
	        StringBuffer query = new StringBuffer(100);
	        query.append(" select c.name || ' ' || r.name as round_name,  c.end_date");
	        query.append(" from round r, ");
	        query.append(" contest c ");
	        query.append(" where r.contest_id = c.contest_id ");
	        query.append(" and r.round_id = " + payment.getRoundId());

	        ResultSetContainer rsc = runSelectQuery(query.toString());

	        if (rsc.getRowCount() != 1) {
	        	throw new IllegalArgumentException("Not exactly 1 round found with id " + payment.getRoundId());
	        }

	        roundName = rsc.getStringItem(0, "round_name");
	        endDate = rsc.getTimestampItem(0, "end_date");
		}
		
	}


}

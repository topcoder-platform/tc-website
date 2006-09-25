package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 * Payment that references a studio component contest.
 * 
 * @author cucu
 *
 */
public abstract class StudioContestReferencePayment extends BasePayment {
	private long contestId;

	/**
	 * Create a new payment referencing a TC Studio Contest.
	 * 
	 * @param coderId coder to be paid.
	 * @param grossAmount amount to be paid.
	 * @param contestId referenced studio contest.
	 */
	public StudioContestReferencePayment(long coderId, double grossAmount, long contestId) {
		super(coderId, grossAmount);
		this.contestId = contestId;
	}

	/**
	 * Create a new payment referencing a TC Studio Contest.
	 * 
	 * @param coderId coder to be paid.
	 * @param grossAmount amount to be paid.
	 * @param contestId referenced studio contest.
	 * @param placed the place that the coder had in the contest, used for creating the description.
	 */
	public StudioContestReferencePayment(long coderId, double grossAmount, long contestId, int placed) {
		super(coderId, grossAmount, placed);
		this.contestId = contestId;
	}

	/**
	 * Get the id of the referenced studio contest.
	 * 
	 * @return the id of the referenced studio contest.
	 */
	public long getContestId() {
		return contestId;
	}

	/**
	 * Set the id of the referenced studio contest.
	 * 
	 * @return the id of the referenced studio contest.
	 */
	public void setContestId(long contestId) {
		this.contestId = contestId;
	}

	/**
	 * Fill the studio contest id field in the payment
	 */
	protected void fillPaymentReference(Payment p) {
		p.getHeader().setStudioContestId(getContestId());
	}
	


	/**
	 * Processor for payments that have a reference to studio contests.
	 * It provides methods for getting the name and the date of the contest.
	 *  
	 * @author Cucu
	 */	
	protected static abstract class Processor extends BasePayment.Processor {
		private String contestName = null;
		private Date endDate = null;

		/**
		 * Get the name of the contest.
		 * 
		 * @param contestId id of the contest to retrieve its name.
		 * @return the name of the contest.
		 * @throws SQLException
		 */
		protected String getContestName(long contestId) throws SQLException {
			if (contestName == null) {
				lookupData(contestId);
			}
			return contestName;
		}


		/**
		 * Get the end date of the contest.
		 * 
		 * @param contestId id of the contest to retrieve its end date.
		 * @return the end date of the contest.
		 * @throws SQLException
		 */
		protected Date getEndDate(long contestId) throws SQLException {
			if (endDate == null) {
				lookupData(contestId);
			}
			return endDate;
		}

		/**
		 * Do the actual lookup of contest name and date.
		 * 
		 * @param contestId id of the contest to retrieve data. 
		 * @throws SQLException
		 */
		private void lookupData(long contestId) throws SQLException {
			String query = "SELECT name, end_time FROM contest WHERE contest_id =" + contestId;
			ResultSetContainer rsc = runSelectQuery(DBMS.STUDIO_DATASOURCE_NAME, query);
			
			if (rsc.getRowCount() != 1) {
				throw new IllegalArgumentException("Not exactly 1 row retrieved for studio contest " + contestId);
			}
			
			contestName = rsc.getStringItem(0, "name");
			endDate = rsc.getTimestampItem(0, "end_time");
		}
		
	}
}

package com.topcoder.web.ejb.pacts;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 * Payment that references a contest component.
 * 
 * @author cucu
 *
 */
public abstract class ComponentContestReferencePayment extends BasePayment {
	private long contestId;

	public ComponentContestReferencePayment(long coderId, double grossAmount, long contestId) {
		super(coderId, grossAmount);
		this.contestId = contestId;
	}

	public long getContestId() {
		return contestId;
	}
	
	protected void fillPaymentReference(Payment p) {
		p.getHeader().setComponentContestId(getContestId());
	}
	
	
	protected abstract class Processor extends BasePayment.Processor {
		private String contestName = null;
		private Date endDate = null;

		public Processor(Connection con) {
			super(con);
		}

		protected String getContestName() throws SQLException {
			if (contestName == null) {
				lookupData();
			}
			return contestName;
		}


		protected Date getEndDate() throws SQLException {
			if (endDate == null) {
				lookupData();
			}
			return endDate;
		}

		private void lookupData() throws SQLException {
			String query = "SELECT contest_name, end_date FROM tcs_catalog:contest WHERE contest_id =" + getContestId();
			ResultSetContainer rsc = runSelectQuery(query);
			contestName = rsc.getStringItem(0, "contest_name");
			endDate = rsc.getTimestampItem(0, "end_date");			
		}
		
	}
}

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

	public StudioContestReferencePayment(long coderId, double grossAmount, long contestId) {
		super(coderId, grossAmount);
		this.contestId = contestId;
	}

	public StudioContestReferencePayment(long coderId, double grossAmount, long contestId, int placed) {
		super(coderId, grossAmount, placed);
		this.contestId = contestId;
	}

	public long getContestId() {
		return contestId;
	}
	
	protected void fillPaymentReference(Payment p) {
		p.getHeader().setStudioContestId(getContestId());
	}
	
	
	protected static abstract class Processor extends BasePayment.Processor {
		private String contestName = null;
		private Date endDate = null;

		protected String getContestName(StudioContestReferencePayment payment) throws SQLException {
			if (contestName == null) {
				lookupData(payment);
			}
			return contestName;
		}


		protected Date getEndDate(StudioContestReferencePayment payment) throws SQLException {
			if (endDate == null) {
				lookupData(payment);
			}
			return endDate;
		}

		private void lookupData(StudioContestReferencePayment payment) throws SQLException {
			String query = "SELECT name, end_time FROM contest WHERE contest_id =" + payment.getContestId();
			ResultSetContainer rsc = runSelectQuery(DBMS.STUDIO_DATASOURCE_NAME, query);
			contestName = rsc.getStringItem(0, "name");
			endDate = rsc.getTimestampItem(0, "end_time");
		}
		
	}
}

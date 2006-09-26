package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

/**
 * Payment that references a component contest.
 *
 * @author cucu
 *
 */
public abstract class ComponentContestReferencePayment extends BasePayment {
	private long contestId;

	public ComponentContestReferencePayment(int paymentTypeId, long coderId, double grossAmount, long contestId) {
		super(paymentTypeId, coderId, grossAmount);
		this.contestId = contestId;
	}

	public ComponentContestReferencePayment(int paymentTypeId, long coderId, double grossAmount, long contestId, int placed) {
		super(paymentTypeId, coderId, grossAmount, placed);
		this.contestId = contestId;
	}

	public long getContestId() {
		return contestId;
	}

	public void setContestId(long contestId) {
		fieldChanged(MODIFICATION_REFERENCE, contestId != this.contestId);
		this.contestId = contestId;
	}


	protected static abstract class Processor extends BasePayment.Processor {
		private String contestName = null;
		private Date endDate = null;

		protected String getContestName(ComponentContestReferencePayment payment) throws SQLException {
			if (contestName == null) {
				lookupData(payment);
			}
			return contestName;
		}


		protected Date getEndDate(ComponentContestReferencePayment payment) throws SQLException {
			if (endDate == null) {
				lookupData(payment);
			}
			return endDate;
		}

		private void lookupData(ComponentContestReferencePayment payment) throws SQLException {
			String query = "SELECT contest_name, end_date FROM contest WHERE contest_id =" + payment.getContestId();
			ResultSetContainer rsc = runSelectQuery(DBMS.TCS_OLTP_DATASOURCE_NAME, query);
			contestName = rsc.getStringItem(0, "contest_name");
			endDate = rsc.getTimestampItem(0, "end_date");
		}

	}
}

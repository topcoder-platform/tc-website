package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

/**
 * Payment that references a digital run season.
 *
 * @author cucu
 *
 */
public abstract class DigitalRunSeasonReferencePayment extends BasePayment {
	private long seasonId;

	public DigitalRunSeasonReferencePayment(int paymentTypeId, long coderId, double grossAmount, long seasonId) {
		super(paymentTypeId, coderId, grossAmount);
		this.seasonId = seasonId;
	}

	public DigitalRunSeasonReferencePayment(int paymentTypeId, long coderId, double grossAmount, long seasonId, int placed) {
		super(paymentTypeId, coderId, grossAmount, placed);
		this.seasonId = seasonId;
	}

	public long getSeasonId() {
		return seasonId;
	}


	protected static abstract class Processor extends BasePayment.Processor {
		private String seasonName = null;
		private Date endDate = null;

		public Date lookupEventDate(BasePayment payment) throws SQLException {
			return getEndDate((DigitalRunSeasonReferencePayment) payment);
		}

		protected String getSeasonName(DigitalRunSeasonReferencePayment payment) throws SQLException {
			if (seasonName == null) {
				lookupData(payment);
			}
			return seasonName;
		}


		protected Date getEndDate(DigitalRunSeasonReferencePayment payment) throws SQLException {
			if (endDate == null) {
				lookupData(payment);
			}
			return endDate;
		}

		private void lookupData(DigitalRunSeasonReferencePayment payment) throws SQLException {
			StringBuffer query = new StringBuffer(300);

			query.append(" SELECT s.name, c.date ");
			query.append(" FROM season s, calendar c  ");
			query.append(" WHERE c.calendar_id = s.end_calendar_id ");
			query.append(" AND s.season_id = " + payment.getSeasonId());

			ResultSetContainer rsc = runSelectQuery(DBMS.TCS_DW_DATASOURCE_NAME, query.toString());

			if (rsc.getRowCount() != 1) {
				throw new IllegalArgumentException("Not exactly 1 row returned for season_id=" + payment.getSeasonId());
			}

			seasonName = rsc.getStringItem(0, "name");
			endDate = rsc.getTimestampItem(0, "date");
		}

	}
}

package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

/**
 * Payment that references a digital run stage.
 *
 * @author cucu
 *
 */
public abstract class DigitalRunStageReferencePayment extends BasePayment {
	private long stageId;

	public DigitalRunStageReferencePayment(int paymentTypeId, long coderId, double grossAmount, long stageId) {
		super(paymentTypeId, coderId, grossAmount);
		this.stageId = stageId;
	}

	public DigitalRunStageReferencePayment(int paymentTypeId, long coderId, double grossAmount, long stageId, int placed) {
		super(paymentTypeId, coderId, grossAmount, placed);
		this.stageId = stageId;
	}

	public long getStageId() {
		return stageId;
	}



	protected static abstract class Processor extends BasePayment.Processor {
		private String stageName = null;
		private Date endDate = null;

		public Date lookupEventDate(BasePayment payment) throws SQLException {
			return getEndDate((DigitalRunStageReferencePayment) payment);
		}

		protected String getStageName(DigitalRunStageReferencePayment payment) throws SQLException {
			if (stageName == null) {
				lookupData(payment);
			}
			return stageName;
		}


		protected Date getEndDate(DigitalRunStageReferencePayment payment) throws SQLException {
			if (endDate == null) {
				lookupData(payment);
			}
			return endDate;
		}

		private void lookupData(DigitalRunStageReferencePayment payment) throws SQLException {
			StringBuffer query = new StringBuffer(300);

			query.append(" SELECT s.name || ' ' || st.name as stage_name, c.date ");
			query.append(" FROM stage st, season s, calendar c  ");
			query.append(" WHERE s.season_id = st.season_id ");
			query.append(" AND c.calendar_id = st.end_calendar_id ");
			query.append(" AND st.stage_id = " + payment.getStageId());

			ResultSetContainer rsc = runSelectQuery(DBMS.TCS_DW_DATASOURCE_NAME, query.toString());

			if (rsc.getRowCount() != 1) {
				throw new IllegalArgumentException("Not exactly 1 row returned for stage_id=" + payment.getStageId());
			}

			stageName = rsc.getStringItem(0, "stage_name");
			endDate = rsc.getTimestampItem(0, "date");
		}

	}
}

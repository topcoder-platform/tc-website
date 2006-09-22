package com.topcoder.web.ejb.pacts;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	
	
	protected abstract class Processor extends PaymentProcessor {
		private String contestName;
		private Date endDate;
		
		protected String getContestName() {
			return contestName;
		}

		protected Date getEndDate() {
			return endDate;
		}

		protected void lookupData(Connection c) throws SQLException {
			// just testing!!
			try { 
				PreparedStatement ps = c.prepareStatement("select contest_name, end_date from tcs_catalog:contest where contest_id =" + getContestId());
				ResultSet rs = ps.executeQuery();
				ResultSetContainer rsc = new ResultSetContainer(rs, false);
				contestName = rsc.getStringItem(0,0);
				endDate = rsc.getTimestampItem(0, 1);
			} catch (Exception e) {
				throw new SQLException(e.getMessage());
			}
			
		}
		
	}
}

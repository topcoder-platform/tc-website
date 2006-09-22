package com.topcoder.web.ejb.pacts;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 * Payment for a Component Tournament Bonus (e.g. winning TCO 06 Design contest)
 * TODO: placed 
 * @author cucu
 *
 */
public class ComponentTournamentBonusPayment extends ComponentContestReferencePayment {

	public ComponentTournamentBonusPayment(long coderId, double grossAmount, long contestId) {
		super(coderId, grossAmount, contestId);
	}

	
	protected void fillPaymentReference(Payment p) {
		p.getHeader().setComponentContestId(getContestId());
	}
	
	protected BasePayment.Processor getProcessor(Connection c) {
		return new Processor(c);
	}	

	public int getPaymentType() {
		return PactsConstants.COMPONENT_TOURNAMENT_BONUS_PAYMENT;
	}

	protected class Processor extends ComponentContestReferencePayment.Processor {
/*
		protected void fillData(Connection c) throws SQLException {
			lookupData(c);
			
			setDescription();
			setEventDate(getEndDate());

			// Calculate the due date as the event date + an interval depending on the type
	        Calendar dueDate = Calendar.getInstance();
	        dueDate.setTime(getEndDate());
	        dueDate.add(Calendar.DAY_OF_YEAR, getDueDateInterval(c, getPaymentType()));

			setDueDate(dueDate.getTime());
		}
		*/

		
		public Processor(Connection con) {
			super(con);
		}

		public String lookupDescription() throws SQLException {
			return getContestName() + " contest winning";
		}

		public Date lookupEventDate() throws SQLException {
			return getEndDate();
		}
		
	}

}

package com.topcoder.web.ejb.pacts;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	
	protected PaymentProcessor getProcessor() {
		return new Processor();
	}	

	public int getPaymentType() {
		return PactsConstants.COMPONENT_TOURNAMENT_BONUS_PAYMENT;
	}

	protected class Processor extends ComponentContestReferencePayment.Processor {

		protected void fillData(Connection c) throws SQLException {
			lookupData(c);
			
			setDescription(getContestName() + " contest winning");
			setEventDate(getEndDate());			
		}
		
	}

}

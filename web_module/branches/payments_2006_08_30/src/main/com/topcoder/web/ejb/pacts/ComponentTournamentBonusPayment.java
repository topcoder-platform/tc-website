package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.util.Date;

/**
 * Payment for a Component Tournament Bonus (e.g. winning TCO 06 Design contest)
 *
 * @author cucu
 *
 */
public class ComponentTournamentBonusPayment extends ComponentContestReferencePayment {
	public ComponentTournamentBonusPayment(long coderId, double grossAmount, long contestId, int placed) {
		super(COMPONENT_TOURNAMENT_BONUS_PAYMENT, coderId, grossAmount, contestId, placed);
	}

	public ComponentTournamentBonusPayment(long coderId, double grossAmount, long contestId) {
		super(COMPONENT_TOURNAMENT_BONUS_PAYMENT, coderId, grossAmount, contestId);
	}

	protected BasePayment.Processor getProcessor() {
		return new Processor();
	}

	protected static class Processor extends ComponentContestReferencePayment.Processor {


		public String lookupDescription(BasePayment payment) throws SQLException {
			ComponentContestReferencePayment p = (ComponentContestReferencePayment) payment;

			return getContestName(p) + " contest " + getOrdinal(p.getPlaced());
		}

		public Date lookupEventDate(BasePayment payment) throws SQLException {
			ComponentContestReferencePayment p = (ComponentContestReferencePayment) payment;

			return getEndDate(p);
		}

	}

}

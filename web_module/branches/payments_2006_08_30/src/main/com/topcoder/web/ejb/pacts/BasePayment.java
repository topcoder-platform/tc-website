package com.topcoder.web.ejb.pacts;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.jboss.util.NullArgumentException;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 * Represents basic payment information, without reference information. 
 * This class partially overlaps with Payment class.  However, this class is intendeed
 * to be uses with PactsClientServices, and tries to be more friendly.  
 * 
 * Payment is still used for internal processing, but maybe we can think in the future
 * to do just one class.  
 *
 * @author cucu
 *
 */
public abstract class BasePayment implements PaymentTypes {
	private static Logger log = Logger.getLogger(BasePayment.class);

	// payment Id
	private long id = 0;
	private long coderId;
	private double grossAmount;
	private double netAmount = 0;
	private Date dueDate = null;
	private int statusId = 0;
	private String description = null;

	
	// Date when the event happened.  It is not stored in the database, but needed to know if referrals must be paid.
	private Date eventDate;

	// Description of the status, looked up in db
	private String statusDesc = null;
	
	// Some payments include a placement to use in the description.
	private int placed = 0;
	
	/**
	 * Create a base payment.
	 * 
	 * @param coderId coder that receives the payment.
	 * @param grossAmount gross amount of the payment.
	 */
	protected BasePayment(long coderId, double grossAmount) {
		this(coderId, grossAmount, 0);
	}

	/**
	 * Create a base payment including the placement position in a contest.
	 * The placement is just for creating the description of the payment.
	 * 
	 * @param coderId coder that receives the payment.
	 * @param grossAmount gross amount of the payment.
	 * @param placed the position that the coder had in the contest.
	 */
	protected BasePayment(long coderId, double grossAmount, int placed) {
		this.coderId = coderId;
		this.grossAmount = grossAmount;
		this.placed = placed;
	}

	/**
	 * Get the type of reference that this payment uses.
	 * It will return the value of one of the constants: NO_REFERENCE or REFERENCE_*
	 * 
	 * @return the type of reference that this payment uses.
	 */
	public int getReferenceTypeId() {
		return getReferenceTypeId(getPaymentType());
	}
	
	/**
	 * Get the type of reference for the specified type of payment.
	 * It will return the value of one of the constants: NO_REFERENCE or REFERENCE_*
	 * 
	 * @param paymenteType type of payment
	 * @return the type of reference for the specified type of payment.
	 */
	public static int getReferenceTypeId(int paymentType) {
		switch(paymentType) {
        case ALGORITHM_CONTEST_PAYMENT:
        case MARATHON_MATCH_PAYMENT:
        case ALGORITHM_TOURNAMENT_PRIZE_PAYMENT: 
        	return REFERENCE_ALGORITHM_ROUND_ID; 
        
        case COMPONENT_PAYMENT:
        case REVIEW_BOARD_PAYMENT: 
        	return REFERENCE_COMPONENT_PROJECT_ID;
        	
        case PROBLEM_TESTING_PAYMENT:
        case PROBLEM_WRITING_PAYMENT: 
        	return REFERENCE_ALGORITHM_PROBLEM_ID;
        	
        case TC_STUDIO_PAYMENT: 
        	return REFERENCE_STUDIO_CONTEST_ID;
        	
        case COMPONENT_TOURNAMENT_BONUS_PAYMENT:
        	return REFERENCE_COMPONENT_CONTEST_ID;
        	
        case DIGITAL_RUN_PRIZE_PAYMENT:
        case DIGITAL_RUN_TOP_THIRD_PAYMENT:
        	return REFERENCE_DIGITAL_RUN_STAGE_ID;

        case DIGITAL_RUN_ROCKIE_PRIZE_PAYMENT:
        	return REFERENCE_DIGITAL_RUN_SEASON_ID;

        case CODER_REFERRAL_PAYMENT:
        case CHARITY_PAYMENT:
        case RELIABILITY_BONUS_PAYMENT:
        	return REFERENCE_PARENT_PAYMENT_ID;
        	
        default: 
        	return NO_REFERENCE;
		}
	}

	
	/**
	 * Create a payment using the specified information.
	 * An instance of an extending class of BasePayment will be returned, depending on the type of payment.
	 * 
	 * @param paymentTypeId type of payment
	 * @param coderId id of the coder
	 * @param grossAmount gross amount paid
	 * @param referenceId the reference to another table PK for this payment.
	 * @return an instance of an extending class of BasePayment , depending on the type of payment.
	 */
	public static BasePayment createPayment(int paymentTypeId, long coderId, double grossAmount, long referenceId) {
		switch(paymentTypeId) {
        case ALGORITHM_CONTEST_PAYMENT: return new AlgorithmContestPayment(coderId, grossAmount, referenceId);
        case MARATHON_MATCH_PAYMENT: return new MarathonMatchPayment(coderId, grossAmount, referenceId);
        case ALGORITHM_TOURNAMENT_PRIZE_PAYMENT: return new AlgorithmTournamentPrizePayment(coderId, grossAmount, referenceId);
        case COMPONENT_PAYMENT: return new ComponentWinningPayment(coderId, grossAmount, referenceId);
        case REVIEW_BOARD_PAYMENT: return new ReviewBoardPayment(coderId, grossAmount, referenceId);
        case PROBLEM_TESTING_PAYMENT: return new ProblemTestingPayment(coderId, grossAmount, referenceId);
        case PROBLEM_WRITING_PAYMENT: return new ProblemWritingPayment(coderId, grossAmount, referenceId);
        case TC_STUDIO_PAYMENT: return new StudioContestPayment(coderId, grossAmount, referenceId); 
        case COMPONENT_TOURNAMENT_BONUS_PAYMENT: return new ComponentTournamentBonusPayment(coderId, grossAmount, referenceId);
        case DIGITAL_RUN_PRIZE_PAYMENT: return new DigitalRunPrizePayment(coderId, grossAmount, referenceId);
        case DIGITAL_RUN_TOP_THIRD_PAYMENT: return new DigitalRunTopThirdPayment(coderId, grossAmount, referenceId);
        case DIGITAL_RUN_ROCKIE_PRIZE_PAYMENT: return new DigitalRunRockiePrizePayment(coderId, grossAmount, referenceId);
        case CODER_REFERRAL_PAYMENT: return new CoderReferralPayment(coderId, grossAmount, referenceId);
        case CHARITY_PAYMENT: return new CharityPayment(coderId, referenceId);
        case RELIABILITY_BONUS_PAYMENT: return new ReliabilityBonusPayment(coderId, grossAmount, referenceId);
        default: return new NoReferencePayment(paymentTypeId, coderId, grossAmount, "");		
        }
	}



	/**
	 * Create a Payment object from this object.
	 * 
	 * @return a Payment object based on this object.
	 */
	protected Payment createPayment() {
		SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");

        Payment p = new Payment();
        p.setGrossAmount(getGrossAmount());
        p.setStatusId(getStatusId());
        p.getHeader().setDescription(getDescription());
        p.getHeader().setTypeId(getPaymentType());
        p.setEventDate(getEventDate());
        p.setDueDate(format.format(getDueDate()));
        p.getHeader().getUser().setId(getCoderId());
        p.setId(getId());
        p.getHeader().setId(getId());
        
        fillPaymentReference(p);

        return p;

	}
	
	/**
	 * Get the type for this payment.
	 * 
	 * @return the type for this payment.
	 */
	public abstract int getPaymentType();

	/**
	 * Fill the corresponding field in the Payment object for the payment reference.
	 *  
	 * @param p the payment to fill.
	 */
	protected abstract void fillPaymentReference(Payment p);

	/**
	 * Get a processor for filling necessary information in the payment.
	 * 
	 * @return a processor for filling necessary information in the payment.
	 */
	protected abstract BasePayment.Processor getProcessor();


	
	protected void setId(long id) {
		this.id = id;
	}

	protected int getPlaced() {
		return placed;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
	public double getGrossAmount() {
		return grossAmount;
	}
	public void setGrossAmount(double grossAmount) {
		this.grossAmount = grossAmount;
	}
	public double getNetAmount() {
		return netAmount;
	}
	public void setNetAmount(double netAmount) {
		this.netAmount = netAmount;
	}
	public int getStatusId() {
		return statusId;
	}
		
	public long getCoderId() {
		return coderId;
	}
	public long getId() {
		return id;
	}

	public String getStatusDesc() {
		return statusDesc;
	}
	public Date getEventDate() {
		return eventDate;
	}

	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}
	
	protected void setStatusDesc(String statusDesc) {
		this.statusDesc = statusDesc;
	}
	
	/**
	 * Set the status id.
	 * If the value changes, statusDesc is set to null, because that value must be looked up from DB.
	 * 
	 * @param statusId the new status id.
	 */
	public void setStatusId(int statusId) {
		if (statusId != this.statusId) {
			this.statusDesc = null;			
		}

		this.statusId = statusId;
	}

	

	/**
	 * Base class for procesing payments, i.e. completing some information that must be looked
	 * up in other tables.
	 * 
	 * @author Cucu
	 */
	protected static abstract class Processor {
		/**
		 * Implementing classes must return the description of the payment.
		 * 
		 * @return the description of the payment.
		 * @throws SQLException if an error occurred trying to access db.
		 */
		public abstract String lookupDescription(BasePayment payment) throws SQLException;
		
		/**
		 * Implementing classes must return the date that the event being paid took place.
		 * 
		 * @return the description the date that the event being paid took place.
		 * @throws SQLException if an error occurred trying to access db.
		 */
		public abstract Date lookupEventDate(BasePayment payment) throws SQLException;
		
		/**
		 * Get the due date of the payment.
		 * It is calculated as the day the event being paid took place plus
		 * an interval of days that is looked up from the database  
		 * 
		 * @return the due date of the payment.
		 * @throws SQLException if an error occurred trying to access db.
		 */
		public Date lookupDueDate(BasePayment payment) throws SQLException {
			
			if (payment.getEventDate() == null) {
				throw new NullArgumentException("eventDate can't be null");
			}
			
			// Calculate the due date as the event date + an interval depending on the type
	        Calendar dueDate = Calendar.getInstance();
	        dueDate.setTime(payment.getEventDate());
	        dueDate.add(Calendar.DAY_OF_YEAR, getDueDateInterval(payment.getPaymentType()));
	        return dueDate.getTime();
		}
		
		/**
		 * Get the status of the payment.
		 * If the user has completed tax forms, it returns PAYMENT_PENDING_STATUS, otherwise PAYMENT_ON_HOLD_STATUS.
		 * 
		 * Inheriting classes can override this method to use other status. 
		 * 
		 * @return the status of the payment.
		 * @throws SQLException
		 */
		public int lookupStatus(BasePayment payment) throws SQLException {
			return hasTaxForm(payment.getCoderId()) ? 
					PactsConstants.PAYMENT_PENDING_STATUS : PactsConstants.PAYMENT_ON_HOLD_STATUS;
		}

		/**
		 * Fill eventDate, dueDate, statusId and description for the payment.
		 *  
		 * @param payment payment to fill
		 * @throws SQLException
		 */
		protected void fillData(BasePayment payment) throws SQLException {
	    	if (payment.getEventDate() == null) {
	    		payment.setEventDate(lookupEventDate(payment));
	    	}
	    	
	    	if (payment.getDueDate() == null) {
	    		payment.setDueDate(lookupDueDate(payment));
	    	}
	    	
	    	if (payment.getStatusId() == 0) {
	    		payment.setStatusId(lookupStatus(payment));
	    		
	    		if (payment.getStatusDesc() == null) {
	    			payment.setStatusDesc(lookupStatusDesc(payment.getStatusId()));
	    		}
	    	}
	    	
	    	if (payment.getDescription() == null) {
	    		payment.setDescription(lookupDescription(payment));
	    	}	
		}
		
		
		/**
		 * Checks whether the payment is already in the DB.
		 * The default behaviour is to return always false.
		 * 
		 * @param payment the payment to check for duplicates.
		 * @return false
		 * @throws SQLException
		 */
		public boolean isDuplicated(BasePayment payment) throws SQLException {
			return false;
		}
		
		/**
		 * Find the description of the specified status.
		 * 
		 * @param statusId the status id to find.
		 * @return the description for the status.
		 * @throws SQLException
		 */
		protected String lookupStatusDesc(int statusId) throws SQLException {
	        String query = "SELECT status_desc FROM status_lu WHERE status_id = " + statusId;
	        
	        ResultSetContainer statusName = runSelectQuery(query);
	
	        if (statusName.getRowCount() == 0) {
	            throw new SQLException("Status code " + statusId + " not found in database");
	        }
	
	        return statusName.getItem(0, 0).toString();
		}
        
        
		/**
		 * Close a PreparedStatement.
		 *  
		 * @param ps the PreparedStatement to close.
		 */
	    protected void close(PreparedStatement ps) {
	        if (ps != null) {
	            try {
	                ps.close();
	            } catch (Exception ignore) {
	            	log.error("FAILED to close PreparedStatement.");
	                ignore.printStackTrace();
	            }
	        }
	    }
	    
		/**
		 * Close a ResultSet.
		 *  
		 * @param ps the ResultSet to close.
		 */
	    protected void close(ResultSet rs) {
	        if (rs != null) {
	            try {
	                rs.close();
	            } catch (Exception ignore) {
	                log.error("FAILED to close ResultSet.");
	                ignore.printStackTrace();
	            }
	        }
	    }

		/**
		 * Close a Connection.
		 *  
		 * @param ps the Connection to close.
		 */
	    protected void close(Connection conn) {
	        if (conn != null) {
	            try {
	                conn.close();
	            } catch (Exception ignore) {
	                log.error("FAILED to close Connection.");
	                ignore.printStackTrace();
	            }
	        }

	    }


	    /**
	     * Run a query in the specified database.
	     * 
	     * @param dbName the name of the database to run the query.
	     * @param query query to run. 
	     * @return the ResultSetContainer for executing the query.
	     * @throws SQLException
	     */
		protected ResultSetContainer runSelectQuery(String dbName, String query) throws SQLException {
	    	Connection c = null;
	    	try {
	    		c = DBMS.getConnection(dbName);
	    		
	    		return runSelectQuery(c, query);
	    	} finally {
	    		close(c);
	    	}
		}
		
	    /**
	     * Run a query in OLTP.
	     * 
	     * @param query query to run. 
	     * @return the ResultSetContainer for executing the query.
	     * @throws SQLException
	     */
		protected ResultSetContainer runSelectQuery(String query) throws SQLException {
			return runSelectQuery(DBMS.OLTP_DATASOURCE_NAME, query);
		}

		/**
		 * Run a query in the specified conneciton.
		 * 
		 * @param c connection where the query will run.
	     * @param query query to run. 
	     * @return the ResultSetContainer for executing the query.
		 * @throws SQLException
		 */
		protected ResultSetContainer runSelectQuery(Connection c, String query) throws SQLException {
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        try {
	            ps = c.prepareStatement(query);
	            rs = ps.executeQuery();
	            return new ResultSetContainer(rs, false);

	        } catch (SQLException e) {
	        	log.error("SQLException running query: " + query);
	        	log.error(e.getMessage());
	        	throw e;
	        	
	        } catch (Exception e) {
	        	log.error("Exception running query: " + query);
	        	log.error(e.getMessage());
	        	throw new SQLException(e.getMessage());
	        } finally {
	        	close(rs);
	        	close(ps);
	        }
		}
		
	    /**
	     * Get the interval in days from an event (srm, contest finalization...) to the payment.
	     *
	     * @param paymentTypeId type id of the payment
	     * @return the interval in days from an event (srm, contest finalization...) to the payment.
	     */
	    protected int getDueDateInterval(int paymentTypeId) throws SQLException {
	        StringBuffer query = new StringBuffer(100);
	        query.append(" SELECT due_date_interval ");
	        query.append(" FROM payment_type_lu ");
	        query.append(" WHERE payment_type_id = " + paymentTypeId);

	        ResultSetContainer rsc = runSelectQuery(query.toString());

	        if (rsc.getRowCount() != 1) {
	        	throw new IllegalArgumentException("Payment type not found: " + paymentTypeId);
	        }
	        return rsc.getIntItem(0, 0);
	    }
	    
	    /**
	     * Returns whether the user has already sent a Tax form.
	     *
	     * @param coderId coder to check for tax form
	     * @return whether the user has already sent a Tax form.
	     * @throws SQLException if a problem occurs accesing DB
	     */
	    protected boolean hasTaxForm(long coderId) throws SQLException {
	        StringBuffer query = new StringBuffer(1000);
	        query.append(" SELECT 1 ");
	        query.append(" FROM user_tax_form_xref ");
	        query.append(" WHERE user_id = " + coderId);

	        ResultSetContainer rsc = runSelectQuery(query.toString());

	        return rsc.getRowCount() > 0;
	    }

	    /**
	     * Get an ordinal string for a placement.
	     * If it's 0, "winnings" is returned, if not, "1st place", "2nd place", "3rd place" and so on.
	     * 
	     * @param placed the placement.
	     * @return an ordinal string for a placement.
	     */
	    protected String getOrdinal(int placed) {
	        switch (placed) {
	        case 0: return "winnings";
	        case 1: return "1st place";
	        case 2: return "2nd place"; 
	        case 3: return  "3rd place";
	        }
	        return placed + "th place"; 
		}

	    
	}



}

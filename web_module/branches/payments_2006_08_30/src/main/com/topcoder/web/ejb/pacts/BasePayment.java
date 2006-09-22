package com.topcoder.web.ejb.pacts;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;

/**
 * Represents basic payment information.
 *
 * @author cucu
 *
 */
public abstract class BasePayment {
	private static Logger log = Logger.getLogger(BasePayment.class);

	private long id;
	private long coderId;
	private double grossAmount;
	private double netAmount;
	private Date dueDate;
	private int statusId;
	private String description;

	// Date when the event happened.  It is not stored in the database, but needed to know if referrals must be paid.
	private Date eventDate;
	
	// Whether complete data is filled or not.
	private boolean dataFilled;

	protected BasePayment(long coderId, double grossAmount) {
		super();
		this.coderId = coderId;
		this.grossAmount = grossAmount;
		dataFilled = false;
	}

	void setId(long id) {
		this.id = id;
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
	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}
	public long getCoderId() {
		return coderId;
	}
	public long getId() {
		return id;
	}
	public abstract int getPaymentType();

	public boolean isDataFilled() {
		return dataFilled;
	}

	public void setDataFilled(boolean dataFilled) {
		this.dataFilled = dataFilled;
	}

	protected abstract void fillPaymentReference(Payment p);

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

        fillPaymentReference(p);

        return p;

	}
	// TODO make it abstract!
	protected BasePayment.Processor getProcessor(Connection c) {
		return null;
	}	


	public Date getEventDate() {
		return eventDate;
	}

	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}
	
	
	protected abstract class Processor {
		protected Connection c;
		
		public Processor(Connection con) {
			this.c = con;
		}
		
		protected void fillData() throws SQLException {
	    	setEventDate(this.lookupEventDate());
	    	setDueDate(this.lookupDueDate());
	    	setStatusId(this.lookupStatus());
	    	setDescription(this.lookupDescription());			
		}
		
		public abstract String lookupDescription() throws SQLException;
		
		public abstract Date lookupEventDate() throws SQLException;
		
		public Date lookupDueDate() throws SQLException {
			// Calculate the due date as the event date + an interval depending on the type
	        Calendar dueDate = Calendar.getInstance();
	        dueDate.setTime(lookupEventDate());
	        dueDate.add(Calendar.DAY_OF_YEAR, getDueDateInterval(getPaymentType()));
	        return dueDate.getTime();
		}
		
		public int lookupStatus() throws SQLException {
			return hasTaxForm(getCoderId()) ? PactsConstants.PAYMENT_PENDING_STATUS : PactsConstants.PAYMENT_ON_HOLD_STATUS;
		}
		
		// Helper Methods!!
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


		protected ResultSetContainer runSelectQuery(String query) throws SQLException {
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
	     * @param c connection tu use for db access
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
	     * @param c connection to use for db access
	     * @param coderId coder to check for tax form
	     * @return whether the user has already sent a Tax form.
	     * @throws SQLException if a problem occurs accesing DB
	     */
	    private boolean hasTaxForm(long coderId) throws SQLException {
	        StringBuffer query = new StringBuffer(1000);
	        query.append(" SELECT 1 ");
	        query.append(" FROM user_tax_form_xref ");
	        query.append(" WHERE user_id = " + coderId);

	        ResultSetContainer rsc = runSelectQuery(query.toString());

	        return rsc.getRowCount() > 0;
	    }

	    
	}

}

package com.topcoder.utilities.pacts;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.sql.DBUtility;
import com.topcoder.web.ejb.pacts.ComponentWinningPayment;
import com.topcoder.web.ejb.pacts.PactsClientServices;
import com.topcoder.web.ejb.pacts.PactsClientServicesHome;
import com.topcoder.web.ejb.pacts.ReliabilityBonusPayment;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * Checks the component payments that don't have reliability bonus payment and create their payments.
 * 
 * 
 * @author Cucu
 * @version 1.0
 */
public class PayReliabilityBonus extends DBUtility {

	private static final int PAY_RELIABILITY_BONUS_LOG_ID = 999; // FIX!
    protected Timestamp fLastLogTime = null;

	@Override
	protected void runUtility() throws Exception {
		PactsClientServices  ejb = (PactsClientServices) createEJB();
		getLastUpdateTime();
        
		StringBuffer query = new StringBuffer(200);
        query.append("SELECT pr.user_id, pr.project_id, pr.old_reliability, pd.gross_amount ");
        query.append("FROM tcs_catalog:project_result pr, ");
        query.append("payment p, ");
        query.append("payment_detail pd ");
        query.append("WHERE p.user_id = pr.user_id ");
        query.append("AND component_project_id = pr.project_id ");
        query.append("AND p.most_recent_detail_id = pd.payment_detail_id ");
        query.append("AND not old_reliability is null ");
        query.append("AND pd.status_id != " + PactsConstants.PAYMENT_DELETED_STATUS);
        query.append("AND (pr.modify_date >= ? OR "); 
        query.append("pd.date_modified >= ? OR ");
        query.append("pd.create_date >= ? ) ");
        
        PreparedStatement psSelProjects = prepareStatement("informixoltp", query.toString());
        psSelProjects.setTimestamp(1, fLastLogTime);
        psSelProjects.setTimestamp(2, fLastLogTime);
        psSelProjects.setTimestamp(3, fLastLogTime);
        
        ResultSet rs = psSelProjects.executeQuery();
        while (rs.next()) {
        	long userId = rs.getLong("user_id");
        	long projectId = rs.getLong("project_id");
        	double reliability = rs.getDouble("old_reliability");
        	
        	List l = ejb.findCoderPayments(userId, PactsConstants.COMPONENT_PAYMENT, projectId);
        	for (Iterator it = l.iterator(); it.hasNext(); ) {
        		ComponentWinningPayment payment = (ComponentWinningPayment) it.next();
        		       		
        		List bonusPayments = ejb.findCoderPayments(userId, PactsConstants.RELIABILITY_BONUS_PAYMENT, payment.getId());
        		if (bonusPayments.size() > 1) {
        			log.error("Payment " + payment.getId() + " has more than 1 reliability bonus payment, please have a look at it!");
        			continue;
        		}
        		
        		double bonusAmount = getReliabilityPercent(reliability) * payment.getGrossAmount();
        		
        		if (bonusAmount > 0) {
	        		if (bonusPayments.size() == 1) {
	        			ReliabilityBonusPayment bp = (ReliabilityBonusPayment) bonusPayments.get(0);
	        			if (bp.getGrossAmount() != bonusAmount) {
	        				log.warn("Changing amount for bonus payment for project=" + projectId + ", user=" + userId +
	        						" from " + bp.getGrossAmount() + " to " + bonusAmount);
	        				bp.setGrossAmount(bonusAmount);
	        				//ejb.updatePayment(bp);
	        			} 
	        		} else {
	        			// no bonus payment found, create it
	        			log.info("Creating bonus payment for project=" + projectId + ", user=" + userId + " for $ " + bonusAmount);
	        			ReliabilityBonusPayment bp = new ReliabilityBonusPayment(userId, bonusAmount, payment.getId());
	        			//ejb.addPayment(bp);
	        		}
        		} else {
        			// No bonus amount should be payed
            		if (bonusPayments.size() > 0) {
            			log.warn("Payment " + payment.getId() + " had reliability bonus but its reliability is " + reliability + 
            						", so the bonus will be erased");
            			//ejb.deletePayment(bp);
            		}
        		}
        		
        		
        	}
        }
	}

    private double getReliabilityPercent(double reliability) {
        double bonus = 0;
        if (reliability >= .95) {
            bonus = .2;
        } else if (reliability >= .9) {
            bonus = .15;
        } else if (reliability >= .8) {
            bonus = .1;
        }
        return bonus;
    }
    
	private void payReliabilityBonus(ComponentWinningPayment payment) {
		
	}
	
	
	@Override
	protected void setUsageError(String msg) {
		// TODO Auto-generated method stub
		
	}
    public static Object createEJB() throws NamingException, Exception {
        Context initial = new InitialContext();
        Object objref = initial.lookup(PactsClientServicesHome.class.getName());
        PactsClientServicesHome home = (PactsClientServicesHome) 
            PortableRemoteObject.narrow(objref, PactsClientServicesHome.class);

        return(home.create());
    }
    
    private void getLastUpdateTime() throws Exception {
/*        PreparedStatement stmt = null;
        ResultSet rs = null;
        StringBuffer query = null;

        query = new StringBuffer(100);
        query.append("select timestamp from update_log where log_id = ");
        query.append("(select max(log_id) from update_log where log_type_id = " + PAY_RELIABILITY_BONUS_LOG_ID + ")");

        try {
            stmt = prepareStatement("informix", query.toString());
            rs = stmt.executeQuery(query.toString());
            if (rs.next()) {
                fLastLogTime = rs.getTimestamp(1);
                log.info("Date is " + fLastLogTime.toString());
            } else {
                fLastLogTime = new Timestamp(new GregorianCalendar(1980,1,1).getTimeInMillis());
                log.info("No row found in update_log, starting from the beggining.");
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Failed to retrieve last log time.\n" +
                    sqle.getMessage());
        } finally {
            DBMS.close(rs);
            DBMS.close(stmt);
        }
        */
    	fLastLogTime = new Timestamp(new GregorianCalendar(1980,1,1).getTimeInMillis()); 
    }


}

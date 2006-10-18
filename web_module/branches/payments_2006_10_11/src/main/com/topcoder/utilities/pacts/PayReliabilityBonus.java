package com.topcoder.utilities.pacts;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

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

	protected void runUtility() throws Exception {
		PactsClientServices  ejb = (PactsClientServices) createEJB();
        
		StringBuffer query = new StringBuffer(200);

		// Find all the project result that have a payment but not a reliability bonus payment
		// If a reliability bonus is deleted (status 69) it will be found anyways, so that if 
		// someone deletes a reliability bonus, it is not created again.
		query.append("SELECT pr.user_id, pr.project_id, pr.old_reliability, pd.gross_amount, p.payment_id ");
        query.append("FROM tcs_catalog:project_result pr, ");
        query.append("payment p, ");
        query.append("payment_detail pd ");
        query.append("WHERE p.user_id = pr.user_id ");
        query.append("AND component_project_id = pr.project_id ");
        query.append("AND p.most_recent_detail_id = pd.payment_detail_id ");        
        query.append("AND old_reliability >= 0.8 ");
        query.append("AND not exists ");
        query.append("   (SELECT 1 FROM payment_detail pd2 ");
        query.append("     WHERE pd2.parent_payment_id=p.payment_id ");
        query.append("     AND pd2.payment_type_id=" + PactsConstants.RELIABILITY_BONUS_PAYMENT);
        
        PreparedStatement psSelProjects = prepareStatement("informixoltp", query.toString());
        
        ResultSet rs = psSelProjects.executeQuery();
        while (rs.next()) {
        	long userId = rs.getLong("user_id");
        	long projectId = rs.getLong("project_id");
        	double reliability = rs.getDouble("old_reliability");
        	double amount = rs.getDouble("gross_amount");
        	long paymentId = rs.getLong("payment_id");
        	
    		double bonusAmount = getReliabilityPercent(reliability) * amount;

    		log.info("Adding a bonus payment for user " + userId + " project " + projectId + " for $ " + bonusAmount);
        	ReliabilityBonusPayment bp = new ReliabilityBonusPayment(userId, amount, paymentId);
			ejb.addPayment(bp);
/*
        	List l = ejb.findCoderPayments(userId, PactsConstants.COMPONENT_PAYMENT, projectId);
        	for (Iterator it = l.iterator(); it.hasNext(); ) {
        		ComponentWinningPayment payment = (ComponentWinningPayment) it.next();
        		       		
        		List bonusPayments = ejb.findCoderPayments(userId, PactsConstants.RELIABILITY_BONUS_PAYMENT, payment.getId());
        		if (bonusPayments.size() > 1) {
        			log.error("Payment " + payment.getId() + " has more than 1 reliability bonus payment, please have a look at it!");
        			continue;
        		}
        		
        		
        		if (bonusAmount > 0) {
	        		if (bonusPayments.size() == 1) {
	        			ReliabilityBonusPayment bp = (ReliabilityBonusPayment) bonusPayments.get(0);
	        			if (bp.getGrossAmount() != bonusAmount) {
	        				log.warn("Changing amount for bonus payment for project=" + projectId + ", user=" + userId +
	        						" from " + bp.getGrossAmount() + " to " + bonusAmount);
	        				bp.setGrossAmount(bonusAmount);
	        				//ejb.updatePayment(bp);
	        			} else {
	        				log.info("Already have bonus payment for project=" + projectId + ", user=" + userId +
	        						 " of $ " + bonusAmount);
	        			}
	        		} else {
	        			// no bonus payment found, create it
//	        			log.info("Creating bonus payment for project=" + projectId + ", user=" + userId + " for $ " + bonusAmount);
        				log.info(projectId + ", " + userId + ", " + bonusAmount + ", " + getReliabilityPercent(reliability)+ ";");

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
        		
        		
        	} */
			
			
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
    
	

	protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg + "\n");
        sErrorMsg.append("PayReliabilityBonus:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line");
        sErrorMsg.append("   -sourcedb URL : URL of source database.\n");
        fatal_error();
	}
	
    public static Object createEJB() throws NamingException, Exception {
        Context initial = new InitialContext();
        Object objref = initial.lookup(PactsClientServicesHome.class.getName());
        PactsClientServicesHome home = (PactsClientServicesHome) 
            PortableRemoteObject.narrow(objref, PactsClientServicesHome.class);

        return(home.create());
    }
    

}

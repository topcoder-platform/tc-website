package com.topcoder.utilities.pacts;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.topcoder.shared.util.sql.DBUtility;
import com.topcoder.web.ejb.pacts.BasePayment;
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

    /**
     * This variable tells if only an analysis is wanted.
     */
    private String onlyAnalyze = null;


	protected void runUtility() throws Exception {
		PactsClientServices  ejb = (PactsClientServices) createEJB();
        
		StringBuffer query = new StringBuffer(200);

		// Find all the project result that have a payment but not a reliability bonus payment
		// If a reliability bonus is deleted (status 69) it will be found anyways, so that if 
		// someone deletes a reliability bonus, it is not created again.
		query.append("SELECT pr.user_id, pr.project_id, pr.old_reliability, pd.gross_amount, p.payment_id ");
        query.append("FROM tcs_catalog:project pro, tcs_catalog:project_result pr, ");
        query.append("payment p, ");
        query.append("payment_detail pd ");
        query.append("WHERE p.user_id = pr.user_id ");
        query.append("AND component_project_id = pr.project_id ");
        query.append("AND p.most_recent_detail_id = pd.payment_detail_id ");      
        query.append("AND pr.reliability_ind = 1 ");
        query.append("AND pr.project_id = pro.project_id ");
        query.append("AND pro.project_status_id = 7 ");
        query.append("AND old_reliability >= 0.8 ");
        query.append("AND not exists ");
        query.append("   (SELECT 1 FROM payment_detail pd2 ");
        query.append("     WHERE pd2.parent_payment_id=p.payment_id ");
        query.append("     AND pd2.payment_type_id=" + PactsConstants.RELIABILITY_BONUS_PAYMENT + ")");
        
        PreparedStatement psSelProjects = prepareStatement("informixoltp", query.toString());
        
		log.info("user_id;project_id;reliability_percent;bonus_amount;old_reliability;gross_amount");

        int count = 0;
        ResultSet rs = psSelProjects.executeQuery();
        while (rs.next()) {
        	long userId = rs.getLong("user_id");
        	long projectId = rs.getLong("project_id");
        	double reliability = rs.getDouble("old_reliability");
        	double amount = rs.getDouble("gross_amount");
        	long paymentId = rs.getLong("payment_id");
        	
    		double bonusAmount = getReliabilityPercent(reliability) * amount;

            if (onlyAnalyze.equalsIgnoreCase("false")) {
            	ReliabilityBonusPayment bp = new ReliabilityBonusPayment(userId, bonusAmount, paymentId);
            	bp.setNetAmount(bonusAmount);

            	BasePayment p = ejb.addPayment(bp);
            }

    		log.info("" + userId + ";" + projectId + ";" + getReliabilityPercent(reliability) + ";" + bonusAmount + ";" + reliability + ";" + amount);
//    		log.info("Adding a bonus payment for user " + userId + " project " + projectId + " for $ " + bonusAmount + "(payment_id = " + p.getId() + ")");
			count++;			
        }
        log.info("Done. Bonus rows inserted: " + count);
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
    
	

    public static Object createEJB() throws NamingException, Exception {
        Context initial = new InitialContext();
        Object objref = initial.lookup(PactsClientServicesHome.class.getName());
        PactsClientServicesHome home = (PactsClientServicesHome) 
            PortableRemoteObject.narrow(objref, PactsClientServicesHome.class);

        return(home.create());
    }
    
    /**
     * Process and validates the parameters.
     */
    protected void processParams() {
        super.processParams();

        onlyAnalyze = (String) params.get("onlyAnalyze");
        if (onlyAnalyze == null) {
        	onlyAnalyze = "false";
        }
        params.remove("onlyAnalyze");

        log.debug("onlyAnalyze : " + onlyAnalyze);
    }

    /**
     * Show usage of the PayReliabilityBonus.
     *
     * @param msg The error message.
     */
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg + "\n");
        sErrorMsg.append("PayReliabilityBonus:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line");
        sErrorMsg.append("   -onlyAnalyze : whether to just analyze without updates.\n");
        fatal_error();
    }



}

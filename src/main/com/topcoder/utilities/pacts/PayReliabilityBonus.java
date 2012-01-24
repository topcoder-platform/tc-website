package com.topcoder.utilities.pacts;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.sql.DBUtility;
import com.topcoder.web.ejb.pacts.PactsClientServices;
import com.topcoder.web.ejb.pacts.PactsClientServicesHome;
import com.topcoder.web.ejb.pacts.ReliabilityBonusPayment;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.request.util.ReliabilityBonusCalculator;

/**
 * Checks the component payments that don't have reliability bonus payment and create their payments.
 * 
 * 
 * @author cucu, DixonD
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
        query.append("SELECT pr.user_id, pr.project_id, pr.reliability_on_registration, pd.total_amount, pd.client, p.payment_id,  pro.project_category_id , ");
        query.append("       (select NVL(ppd.actual_start_time, psd.actual_start_time)   ");
        query.append("          from tcs_catalog:project proj  ");
        query.append("               , OUTER tcs_catalog:project_phase psd  ");
        query.append("               , OUTER tcs_catalog:project_phase ppd  ");
        query.append("          where  psd.project_id = proj.project_id   ");
        query.append("          and psd.phase_type_id = 2   ");
        query.append("          and ppd.project_id = proj.project_id   ");
        query.append("          and proj.project_id = pr.project_id   ");
        query.append("          and ppd.phase_type_id = 1) as posting_date ");
        query.append("FROM tcs_catalog:project pro, tcs_catalog:project_reliability pr, ");
        query.append("payment p, ");
        query.append("payment_detail pd ");
        query.append("WHERE p.user_id = pr.user_id ");
        query.append("AND component_project_id = pr.project_id ");
        query.append("AND p.most_recent_detail_id = pd.payment_detail_id ");
        query.append("AND pd.payment_status_id != 69 ");
        query.append("AND pr.reliable_ind = 1 ");
        query.append("AND pd.installment_number = 1 ");
        query.append("AND pr.project_id = pro.project_id ");
        query.append("AND reliability_on_registration >= 0.8 ");
        query.append("AND pd.payment_type_id = " + PactsConstants.CONTEST_PAYMENT + " ");
        query.append("AND pro.project_category_id in (1, 2, 6, 7, 13, 14, 19, 23, 24, 26, 35, 36) ");
        query.append("AND pro.project_id not in (select project_id from tcs_catalog:project_info where project_info_type_id=45 and (value='false' or value='False')) ");

        // The following line is not to pay the old projects posted before we did the change to the reliability calculation logic on Dec 2010
        query.append("AND p.create_date >= to_date('12/01/2010', '%m/%d/%Y') ");
        query.append("AND not exists ");
        query.append("   (SELECT 1 FROM payment_detail pd2 ");
        query.append("     WHERE pd2.parent_payment_id=p.payment_id ");
        query.append("     AND pd2.payment_type_id=" + PactsConstants.RELIABILITY_BONUS_PAYMENT + ")");
        
        PreparedStatement psSelProjects = prepareStatement("informixoltp", query.toString());

        log.info("user_id, project_id, posting date, bonus amount, reliability, total amount, parent payment id");
        
        ReliabilityBonusCalculator reliabilityBonus = ReliabilityBonusCalculator.getInstance();
        
        int count = 0;
        ResultSet rs = psSelProjects.executeQuery();
        while (rs.next()) {
            long userId = rs.getLong("user_id");
            long projectId = rs.getLong("project_id");
            double reliability = rs.getDouble("reliability_on_registration");
            double amount = rs.getDouble("total_amount");
            long paymentId = rs.getLong("payment_id");
            Date postingDate = rs.getDate("posting_Date");
            long projectTypeId = rs.getLong("project_category_id");

            // use parent's client for the reliability payment
            String client = rs.getString("client");

            double bonusAmount = reliabilityBonus.getReliabilityPercent(reliability, postingDate, projectTypeId) * amount;

            if (onlyAnalyze.equalsIgnoreCase("false")) {
                ReliabilityBonusPayment bp = new ReliabilityBonusPayment(userId, bonusAmount, paymentId);
                bp.setClient(client);
                bp.setNetAmount(bonusAmount);
    
                ejb.addPayment(bp);
            }
    
            log.info("" + userId + ", " + projectId + ", " + postingDate + ", " + bonusAmount + ", " + reliability + ", "
                    + amount + ",  " + paymentId+" , "+projectTypeId);
                
            count++;                        
        }
            
        log.info("Done. Bonus rows inserted: " + count);
    }

    public static Object createEJB() throws Exception {
        InitialContext initial = TCContext.getInitial();

        Object objref = initial.lookup(PactsClientServicesHome.class.getName());
        PactsClientServicesHome home = (PactsClientServicesHome) 
            PortableRemoteObject.narrow(objref, PactsClientServicesHome.class);

        return (home.create());
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

        // "reliabilityFilename" is more useful than "CONF_FILENAME"
        String reliabilityFilename = (String) params.get("reliabilityFilename");
        try {
            if (reliabilityFilename == null || reliabilityFilename.trim().length() == 0) {
                throw new Exception("Invalid or non-existent parameter [reliabilityFilename].");
            }
            // TODO: use reliabilityFilename
        } catch (Exception ex) {
            ex.printStackTrace();
            sErrorMsg.setLength(0);
            sErrorMsg.append("Load of reliability XML file failed:\n");
            sErrorMsg.append(ex.getMessage());
            fatal_error(ex);
        }
        params.remove("reliabilityFilename");

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

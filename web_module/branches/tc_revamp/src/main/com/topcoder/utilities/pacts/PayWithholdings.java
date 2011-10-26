/*
 * Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.pacts;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.sql.DBUtility;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.PactsClientServices;
import com.topcoder.web.ejb.pacts.PactsClientServicesHome;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * Utility class for paying withheld payments.
 *
 * This class will check for pending withholdings that should be released and will generate the payments accordingly.
 *
 * @author pulky
 * @version 1.0 (PACTS Release Assembly 1.1.1)
 */
public class PayWithholdings extends DBUtility {

	/**
	 * A hard cutoff date for the start of the payments, to filter out old project data.
	 */
	private static final String START_DATE = "MDY(03, 01, 2009)";
	
    /**
     * This variable tells if only an analysis is wanted.
     */
    private String onlyAnalyze = null;

    /**
     * This variable tells how many days after first installment payment the withholding should be released.
     */
    private int releasePeriodDays;

    /**
     * This method will be executed after connections are created.
     *
     * It will search for payments that have withholding for <code>releasePeriodDays</code> days and release
     * the corresponding difference.
     *
     * @throws Exception if any error occurs.
     */
    protected void runUtility() throws Exception {
        PactsClientServices  ejb = (PactsClientServices) createEJB();

        StringBuffer query = new StringBuffer(200);

        // Get partial payments to release withholdings.
        // If releasePeriodDays were reached since project completion, make the payment.
        query.append("SELECT user_id, client, pd.payment_type_id, pd.payment_method_id ");
        query.append(" , pd.component_project_id ");
        query.append(" , (select max(pp.actual_end_time) from tcs_catalog:project_phase pp "); 
        query.append("         where pp.project_id = pd.component_project_id ");
        query.append("         and pp.phase_status_id = 3) as project_completion_date "); 
        query.append(" , sum(gross_amount) as amount_paid ");
        query.append(" , sum(case when installment_number = 1 then total_amount else 0.0 end) as total_amount ");
        query.append(" , max(installment_number) as installment_number ");
        query.append(" FROM payment p, payment_detail pd ");
        query.append(" WHERE p.most_recent_detail_id = pd.payment_detail_id ");
        query.append(" AND gross_amount < total_amount ");
        query.append(" AND pd.payment_type_id in (");
        query.append(PactsConstants.CONTEST_PAYMENT).append(", ");
        query.append(PactsConstants.ARCHITECTURE_PAYMENT).append(", ");
        query.append(PactsConstants.ASSEMBLY_PAYMENT).append(", ");
        query.append(PactsConstants.REVIEW_BOARD_PAYMENT).append(", ");
        query.append(PactsConstants.TEST_SUITES_PAYMENT).append(", ");
        query.append(PactsConstants.TEST_SCENARIOS_PAYMENT).append(", ");
        query.append(PactsConstants.UI_PROTOTYPE_COMPETITION_PAYMENT).append(", ");
        query.append(PactsConstants.RIA_BUILD_COMPETITION_PAYMENT).append(", ");
        query.append(PactsConstants.COMPONENT_PAYMENT).append(") ");
        query.append(" AND (select max(pp.actual_end_time) from tcs_catalog:project_phase pp "); 
        query.append("         where pp.project_id = pd.component_project_id ");
        query.append("         and pp.phase_status_id = 3) + ").append(releasePeriodDays); 
        query.append(" UNITS DAY < current ");
        query.append(" AND (select max(pp.actual_end_time) from tcs_catalog:project_phase pp "); 
        query.append("         where pp.project_id = pd.component_project_id ");
        query.append("         and pp.phase_status_id = 3) >= " + START_DATE);
        query.append(" GROUP BY 1, 2, 3, 4, 5, 6 ");
        query.append(" HAVING sum(gross_amount) < sum(case when installment_number = 1 then total_amount else 0.0 end) ");

        PreparedStatement psSelProjects = prepareStatement("informixoltp", query.toString());

        log.info("User id, Reference id, Completion date, Total amount, Release amount, First installment payment id");
        log.info("==================================================================================================");

        int count = 0;
        ResultSet rs = psSelProjects.executeQuery();
        while (rs.next()) {
            long userId = rs.getLong("user_id");
            long referenceId = rs.getLong("component_project_id");
            double totalAmount = rs.getDouble("total_amount");
            double amountPaid = rs.getDouble("amount_paid");
            Date projectCompletionDate = rs.getDate("project_completion_date");
            String client = rs.getString("client");
            int paymentTypeId = rs.getInt("payment_type_id");
            int installment = rs.getInt("installment_number") + 1;
            int methodId = rs.getInt("payment_method_id");
            double releaseAmount = totalAmount - amountPaid;

            if (onlyAnalyze.equalsIgnoreCase("false")) {
                BasePayment bp = BasePayment.createPayment(paymentTypeId, userId, releaseAmount, referenceId, 1);

                bp.setClient(client);
                bp.setInstallmentNumber(installment);
                bp.setMethodId(methodId);
                bp.setTotalAmount(totalAmount);

                ejb.addPayment(bp);
            }

            log.info("" + userId + ", " + referenceId + ", " + projectCompletionDate + ", " + totalAmount + ", "
                    + releaseAmount);

            count++;
        }
        if (onlyAnalyze.equalsIgnoreCase("false")) {
            log.info("Done. Payments released: " + count);
        } else {
            log.info("Done. Payments that will be released: " + count);
        }
    }

    /**
     * Private helper method to retrieve PACTS EJB.
     *
     * @return a <code>PactsClientServices</code> with PACTS EJB.
     * @throws Exception if any error occurs
     */
    private static PactsClientServices createEJB() throws Exception {
        InitialContext initial = TCContext.getInitial();

        Object objref = initial.lookup(PactsClientServicesHome.class.getName());
        PactsClientServicesHome home = (PactsClientServicesHome)
            PortableRemoteObject.narrow(objref, PactsClientServicesHome.class);

        return ((PactsClientServices) home.create());
    }

    /**
     * This method processes and validates the parameters.
     */
    protected void processParams() {
        super.processParams();

        // let set this to true by default to avoid running this by mistake
        onlyAnalyze = (String) params.get("onlyAnalyze");
        if (onlyAnalyze == null) {
            onlyAnalyze = "false";
        }
        params.remove("onlyAnalyze");

        // get release_period_days parameter
        try {
            releasePeriodDays = Integer.parseInt((String) params.get("release_period_days"));
        } catch (NumberFormatException nfe) {
            sErrorMsg.append("Invalid release_period_days specified.\n");
            fatal_error(nfe);
        }

        log.debug("onlyAnalyze : " + onlyAnalyze);
        log.debug("releasePeriodDays : " + releasePeriodDays);
    }

    /**
     * This method shows usage of the PayWithholdings utility.
     *
     * @param msg The error message.
     */
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg + "\n");
        sErrorMsg.append("PayWithholdings:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line");
        sErrorMsg.append("   -onlyAnalyze : whether to just analyze without updates.\n");
        sErrorMsg.append("   -releasePeriodDays : how many days after first installment \n");
        sErrorMsg.append("                        payment the withholding should be released.\n");
        fatal_error();
    }
}

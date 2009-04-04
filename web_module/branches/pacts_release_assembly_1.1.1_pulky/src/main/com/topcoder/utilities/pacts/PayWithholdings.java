/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.utilities.pacts;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;

import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.PactsClientServices;
import com.topcoder.web.ejb.pacts.PactsClientServicesHome;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.sql.DBUtility;

/**
 * Payment class for Copilot projects.
 * 
 * This class will check for pending withholdings that should be released and generates the payments accordingly. 
 *
 * @author TCSDEVELOPER
 * @version 1.0 (PACTS Release Assembly 1.1.1)
 */
public class PayWithholdings extends DBUtility {

    /**
     * This variable tells if only an analysis is wanted.
     */
    private String onlyAnalyze = null;
    
    /**
     * This variable tells how many days after first installment payment the withholding should be released. 
     */
    private String releasePeriodDays = null;

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

        query.append("SELECT user_id, client, pd.payment_type_id, pd.payment_method_id, p.payment_id ");
        query.append("     , pd.component_project_id ");
        query.append("     , sum(gross_amount) as amount_paid ");
        query.append("     , max(total_amount) as total_amount ");
        query.append("     , max(installment_number) as installment_number ");
        query.append("     , min(pd.create_date) as first_payment_date ");
        query.append(" FROM payment p, payment_detail pd ");
        query.append(" WHERE p.most_recent_detail_id = pd.payment_detail_id ");
        query.append(" AND gross_amount <> total_amount "); 
        query.append(" AND pd.payment_type_id in ("); 
        query.append(PactsConstants.ARCHITECTURE_PAYMENT).append(", ");
        query.append(PactsConstants.ASSEMBLY_PAYMENT).append(", ");
        query.append(PactsConstants.COMPONENT_PAYMENT).append(") ");
        query.append(" GROUP BY user_id, client, pd.payment_type_id, pd.payment_method_id, p.payment_id");
        query.append(" , pd.component_project_id");
        query.append(" HAVING sum(gross_amount) < max(total_amount) ");
        query.append(" AND min(pd.create_date) + " + releasePeriodDays + " UNITS DAY < TODAY ");

        PreparedStatement psSelProjects = prepareStatement("informixoltp", query.toString());
        
        log.info("User id, Reference id, First payment date, Total amount, Release amount, First installment payment id");


        int count = 0;
        ResultSet rs = psSelProjects.executeQuery();
        while (rs.next()) {
            long userId = rs.getLong("user_id");
            long referenceId = rs.getLong("component_project_id");
            double totalAmount = rs.getDouble("total_amount");
            double amountPaid = rs.getDouble("amount_paid");
            long paymentId = rs.getLong("payment_id");
            Date firstPaymentDate= rs.getDate("first_payment_date");
            String client = rs.getString("client");
            int paymentTypeId = rs.getInt("payment_type_id");
            int installment = rs.getInt("installment_number") + 1;
            int methodId = rs.getInt("payment_method_id");
            double releaseAmount = totalAmount - amountPaid;
                
            if (onlyAnalyze.equalsIgnoreCase("false")) {
                
                BasePayment bp = BasePayment.createPayment(paymentTypeId, userId, releaseAmount, 
                        referenceId, 1);  

                bp.setClient(client);
                bp.setInstallmentNumber(installment);
                bp.setMethodId(methodId);
                
                ejb.addPayment(bp);
            }

            log.info("" + userId + ", " + referenceId + ", " + firstPaymentDate + ", " + totalAmount + ", " 
                    + releaseAmount + ", " + paymentId);

            count++;            
        }
        log.info("Done. Payments released: " + count);
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

        onlyAnalyze = (String) params.get("onlyAnalyze");
        if (onlyAnalyze == null) {
            onlyAnalyze = "false";
        }
        params.remove("onlyAnalyze");

        // "reliabilityFilename" is more useful than "CONF_FILENAME"
        releasePeriodDays = Integer.parseInt((String) params.get("release_period_days"));

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

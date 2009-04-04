/*
 * Copyright (c) 2001-2009 TopCoder Inc.  All Rights Reserved.
 */
package com.topcoder.utilities.pacts;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.sql.DBUtility;

import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.PactsClientServices;
import com.topcoder.web.ejb.pacts.PactsClientServicesHome;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;

import javax.rmi.PortableRemoteObject;


/**
 * <p>
 * This script can be run to detect and release any such withholding that has not been released in a certain period of
 * time. Period 30 days is set by default.
 * </p>
 *
 * @author TCSASSEMBLY
 * @version 1.0
 */
public class ReleaseWithholdingPayment extends DBUtility {
    /** The default value for the period days. */
    private static final int DEFAULT_PERIOD = 30;

    /** This variable tells if only an analysis is wanted. */
    private String onlyAnalyze = null;

    /** The period days after which the withholding payments will be released. */
    private int period;

    /**
     * <p>
     * The main entry of this script, detect and release any such withholding that has not been released in a certain
     * period of time.
     * </p>
     *
     * @throws Exception any unexpected error.
     */
    protected void runUtility() throws Exception {
        PactsClientServices ejb = (PactsClientServices) createEJB();

        String query = "SELECT sum(gross_amount) as amount_paid " +
        "     , max(total_amount) as total_amount " +
        "     , max(installment_number) as installment_number " +
        "       , max(client) as client " +
        "       , user_id " +
        "       , pd.payment_type_id " +
        "       , pd.component_project_id " +
        "       , max(payment_method_id) as payment_method_id " +
        " FROM payment p, payment_detail pd, tcs_catalog:project proj, tcs_catalog:project_info pi_complete " +
        " WHERE p.most_recent_detail_id = pd.payment_detail_id " +
        " AND pd.component_project_id = proj.project_id " +
        " AND proj.project_id = pi_complete.project_id " +
        " AND pi_complete.project_info_type_id = 21 " +
        " AND to_date(pi_complete.value, \"%m.%d.%Y %H:%M %p\") < (current - " + period + " units day)" +
        " group by user_id, pd.payment_type_id, pd.component_project_id ";

        PreparedStatement psSelProjects = null;
        ResultSet rs = null;

        try {
            int count = 0;
            psSelProjects = prepareStatement("informixoltp", query);
            rs = psSelProjects.executeQuery();

            while (rs.next()) {
                int installment = rs.getInt("installment_number") + 1;
                double totalAmount = rs.getDouble("total_amount");
                double paid = rs.getDouble("amount_paid");
                String client = rs.getString("client");
                int paymentTypeId = rs.getInt("payment_type_id");
                long componentProjectId = rs.getLong("component_project_id");
                long coderId = rs.getLong("user_id");
                int methodId = rs.getInt("payment_method_id");

                if (totalAmount > paid) {
                    if (onlyAnalyze.equalsIgnoreCase("false")) {
                        BasePayment payment = BasePayment.createPayment(paymentTypeId, coderId, totalAmount,
                                componentProjectId);
                        payment.setClient(client);
                        payment.setGrossAmount(totalAmount - paid);
                        payment.setInstallmentNumber(installment);
                        payment.setMethodId(methodId);

                        ejb.addPayment(payment);
                    }

                    log.info("Pay to: " + coderId + " $ " + (totalAmount - paid) + " for project " +
                        componentProjectId);

                    count++;
                }
            }

            log.info("Done. Withholding Payment rows inserted: " + count);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    // ignore
                }
            }

            if (psSelProjects != null) {
                try {
                    psSelProjects.close();
                } catch (SQLException e) {
                    // ignore
                }
            }
        }
    }

    /**
     * <p>
     * Creates the PactsClientServices EJB.
     * </p>
     *
     * @return the created EJB.
     *
     * @throws Exception any unexpected error.
     */
    public static Object createEJB() throws Exception {
        InitialContext initial = TCContext.getInitial();

        Object objref = initial.lookup(PactsClientServicesHome.class.getName());
        PactsClientServicesHome home = (PactsClientServicesHome) PortableRemoteObject.narrow(objref,
                PactsClientServicesHome.class);

        return (home.create());
    }

    /**
     * Process and validates the parameters.
     */
    protected void processParams() {
        super.processParams();

        // onlyAnalyze
        onlyAnalyze = (String) params.get("onlyAnalyze");

        if (onlyAnalyze == null) {
            onlyAnalyze = "false";
        }

        params.remove("onlyAnalyze");

        // period
        String period = (String) params.get("period");
        this.period = DEFAULT_PERIOD;

        try {
            if ((period != null) && (period.trim().length() != 0)) {
                this.period = Integer.parseInt(period);
            }
        } catch (Exception ex) {
            // ignore the error and use the default value
        }

        params.remove("period");

        log.debug("onlyAnalyze : " + onlyAnalyze);
    }

    /**
     * Show usage of the ReleaseWithholdingPayment.
     *
     * @param msg The error message.
     */
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg + "\n");
        sErrorMsg.append("ReleaseWithholdingPayment:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line");
        sErrorMsg.append("   -onlyAnalyze : whether to just analyze without updates.\n");
        sErrorMsg.append("   -period : the period days after which the withholding payments will be released.\n");
        fatal_error();
    }
}

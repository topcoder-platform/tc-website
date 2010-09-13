/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.utilities.tcs;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.sql.DBUtility;
import com.topcoder.web.common.model.DefaultPriceComponent;

/**
 * <strong>Purpose</strong>:
 * Utility to fix payment columns.
 *
 * This utility analyzes and fixes the payments in both OR and PACTS due to a misscalculation.
 *
 * @author pulky
 * @version 1.0.0
 */
public class PaymentFixUtility extends DBUtility{
    /**
     * This variable holds the start date to analyze.
     */
    private String startDate = null;

    /**
     * This variable holds the end date to analyze.
     */
    private String endDate = null;

    /**
     * This variable tells if only an analysis is wanted.
     */
    private String onlyAnalyze = null;

    /**
     * Runs the PaymentFixUtility.
     *
     * First of all it will search for those projects that has advanced to review participants
     * who got less than 75 in screening, and will check for those project payment in both OR
     * and PACTS tables. If there are inconsistencies, they will be corrected.
     *
     */
    public void runUtility() throws Exception {
        PreparedStatement psSelPossibleConflicts = null;
        PreparedStatement psSelRolesAndPayments = null;
        PreparedStatement psSelPACTS = null;
        PreparedStatement psUpdOR = null;
        PreparedStatement psUpdPACTS = null;
        ResultSet rs = null;
        ResultSet rs2 = null;
        ResultSet rs3 = null;
        StringBuffer query = null;
        DefaultPriceComponent defaultPriceComponent = null;

        try {
            query = new StringBuffer(200);
            query.append("select ");
            query.append("distinct p.project_type_id, c.component_name, s.project_id, pi.end_date, ");
            query.append("(select count(*) from submission s2  ");
            query.append("where s2.advanced_to_review = 1 ");
            query.append("and s2.submission_type_id = 1 ");
            query.append("and s2.project_id = s.project_id ");
            query.append("and s2.cur_version = 1) as advanced, ");
            query.append("(select count(*) from scorecard sc2  ");
            query.append("where sc2.score >= 75 and sc2.cur_version = 1 and sc2.scorecard_type = 1 ");
            query.append("and sc2.project_id = s.project_id) as passed ");
            query.append("from submission s, project p, comp_versions cv, comp_catalog c, scorecard sc, phase_instance pi ");
            query.append("where c.component_id = cv.component_id and cv.comp_vers_id = p.comp_vers_id ");
            query.append("and s.submission_type_id = 1 ");
            query.append("and s.project_id = p.project_id and s.advanced_to_review = 1 ");
            query.append("and s.submission_id = sc.submission_id and sc.score > 0 and sc.score < 75 ");
            query.append("and sc.cur_version = 1 and sc.scorecard_type = 1 ");
            query.append("and sc.project_id = s.project_id and s.cur_version = 1 ");
            query.append("and s.project_id = pi.project_id and pi.phase_id = 2 and pi.end_date > ? ");
            query.append("and pi.end_date < ? and pi.cur_version = 1 ");

            int count = 0;
            for (Enumeration e = params.keys() ; e.hasMoreElements() ; count++) {
                if (count == 0) {
                    query.append("and p.project_id in (");
                } else {
                    query.append(", ");
                }
                String key = (String) e.nextElement();
                query.append(params.get(key));
                log.debug("Column: " + key + ", value: " + params.get(key));
            }
            if (count > 0) {
                query.append(") ");
            }

            query.append("order by pi.end_date asc");

            psSelPossibleConflicts = prepareStatement("tcs_catalog", query.toString());
            psSelPossibleConflicts.setString(1, startDate);
            psSelPossibleConflicts.setString(2, endDate);

            query = new StringBuffer(200);
            query.append("select rur.r_role_id, rur.login_id, pi.payment, pi.payment_info_v_id ");
            query.append("from r_user_role rur, payment_info pi  ");
            query.append("where rur.project_id = ?  ");
            query.append("and rur.r_role_id in (2,3) and rur.cur_version = 1 ");
            query.append("and rur.payment_info_id = pi.payment_info_id ");
            query.append("and pi.cur_version = 1 ");
            query.append("order by rur.r_role_id asc ");
            psSelRolesAndPayments = prepareStatement("tcs_catalog", query.toString());

            query = new StringBuffer(200);
            query.append("select pd.payment_detail_id, pd.gross_amount from payment p, payment_detail pd  ");
            query.append("where ");
            query.append("pd.payment_detail_id = p.most_recent_detail_id ");
            query.append("and p.user_id = ? ");
            query.append("and pd.project_id = ?  ");
            query.append("and pd.payment_type_id = 7");
            psSelPACTS = prepareStatement("informixoltp", query.toString());

            query = new StringBuffer(200);
            query.append("update payment_info set payment = ? ");
            query.append("where payment_info_v_id = ?");
            psUpdOR = prepareStatement("tcs_catalog", query.toString());

            query = new StringBuffer(200);
            query.append("update payment_detail set net_amount = ?, gross_amount = ? ");
            query.append("where payment_detail_id = ?");
            psUpdPACTS = prepareStatement("informixoltp", query.toString());

            rs = psSelPossibleConflicts.executeQuery();
            for (int i = 1; rs.next(); i++ ) {
                log.debug("");
                log.debug("-----------------------------------------------");
                log.debug("Possible conflict found: (" + i + ")");
                log.debug("[" + ((rs.getInt(1) == 1) ? "Design] " : "Development] ") +
                        rs.getString(2) + " (" + rs.getString(3) + ") on " + rs.getString(4));
                log.debug("Passed Review: " + rs.getInt(6) + ", Advanced to review:" + rs.getInt(5));
                log.debug("Analyzing...");

                defaultPriceComponent = new DefaultPriceComponent(
                        DefaultPriceComponent.LEVEL1, 0, rs.getInt(5),
                        ((rs.getInt(1) == 1) ? 112 : 113));

                psSelRolesAndPayments.clearParameters();
                psSelRolesAndPayments.setString(1, rs.getString(3));  // project_id

                String primaryReviewer = null;
                rs2 = psSelRolesAndPayments.executeQuery();
                for (int j = 1; rs2.next(); j++ ) {
                    if (j == 1) {
                        if (rs2.getInt(1) == 2) {
                            primaryReviewer = rs2.getString(2);
                        } else {
                            throw new Exception("Can't find primary reviewer");
                        }
                    } else {
                        if (rs2.getInt(1) == 3) {
                            float amountToPay = 0;
                            String message;
                            if (rs2.getString(2).equals(primaryReviewer)) {
                                message = "Primary " + rs2.getString(2) + " got $" + rs2.getFloat(3);
                                amountToPay = defaultPriceComponent.getCoreReviewCost();
                            } else {
                                message = "Reviewer " + rs2.getString(2) + " got $" + rs2.getFloat(3);
                                amountToPay = defaultPriceComponent.getReviewCost();
                            }
                            if (amountToPay == rs2.getFloat(3)) {
                                message += "...... Ok.";
                                log.debug(message);
                            } else {

                                // update OR
                                psUpdOR.clearParameters();
                                psUpdOR.setFloat(1, amountToPay);
                                psUpdOR.setLong(2, rs2.getLong(4));
                                if (!onlyAnalyze.equalsIgnoreCase("true")) {
                                    psUpdOR.executeUpdate();
                                }

                                psSelPACTS.setString(1, rs2.getString(2));  // user_id
                                psSelPACTS.setString(2, rs.getString(3));  // project_id
                                rs3 = psSelPACTS.executeQuery();
                                if (rs3.next()) {
                                    message += " PACTS: (id: " + rs3.getLong(1) + ", $" + rs3.getFloat(2) + ")";
                                    psUpdPACTS.clearParameters();
                                    if (rs2.getString(2).equals(primaryReviewer)) {
                                        message += "...... But should've got: $" + amountToPay + ", PACTS: $" + (rs3.getFloat(2) + (amountToPay - rs2.getFloat(3)));
                                        psUpdPACTS.setFloat(1, (rs3.getFloat(2) + (amountToPay - rs2.getFloat(3))));
                                        psUpdPACTS.setFloat(2, (rs3.getFloat(2) + (amountToPay - rs2.getFloat(3))));
                                    } else {
                                        message += "...... But should've got: $" + amountToPay;
                                        psUpdPACTS.setFloat(1, amountToPay);
                                        psUpdPACTS.setFloat(2, amountToPay);
                                    }
                                    // update PACTS
                                    psUpdPACTS.setLong(3, rs3.getLong(1));
                                    if (!onlyAnalyze.equalsIgnoreCase("true")) {
                                        psUpdPACTS.executeUpdate();
                                    }
                                } else {
                                    message += " NO PACTS ";
                                    message += "...... But should've got: $" + amountToPay;
                                }

                                DBMS.close(rs3);

                                log.debug(message);
                                if (!onlyAnalyze.equalsIgnoreCase("true")) {
                                    log.debug("Fixed...");
                                }
                            }
                        } else {
                            throw new Exception("duplicate primary");
                        }
                    }
                }
                DBMS.close(rs2);
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("PaymentFixUtility failed.\n" + sqle.getMessage());
        } finally {
            DBMS.close(psSelPossibleConflicts);
            DBMS.close(psSelPACTS);
            DBMS.close(rs);
            DBMS.close(psSelRolesAndPayments);
            DBMS.close(psUpdOR);
            DBMS.close(psUpdPACTS);
        }
    }

    /**
     * Process and validates the parameters.
     */
    protected void processParams() {
        super.processParams();

        startDate = (String) params.get("startDate");
        if (startDate == null)
            setUsageError("Please specify a startDate.\n");

        params.remove("startDate");

        endDate = (String) params.get("endDate");
        if (endDate == null)
            setUsageError("Please specify a endDate.\n");

        params.remove("endDate");

        onlyAnalyze = (String) params.get("onlyAnalyze");
        if (onlyAnalyze == null)
            setUsageError("Please specify a onlyAnalyze.\n");

        params.remove("onlyAnalyze");

        log.debug("startDate : " + startDate);
        log.debug("endDate : " + endDate);
        log.debug("onlyAnalyze : " + onlyAnalyze);
    }

    /**
     * Show usage of the PaymentFixUtility.
     *
     * @param msg The error message.
     */
    protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg + "\n");
        sErrorMsg.append("PaymentFixUtility:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line");
        sErrorMsg.append("   -sourcedb URL : URL of source database.\n");
        sErrorMsg.append("   -startDate : the start date to analyze..\n");
        sErrorMsg.append("   -endDate : the end date to analyze..\n");
        sErrorMsg.append("   -onlyAnalyze : wheter to just analyze without updates.\n");
        fatal_error();
    }
}

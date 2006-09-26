package com.topcoder.utilities.pacts;

/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

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
public class NewSchemaFixUtility extends DBUtility {
    /**
     * This variable tells if only an analysis is wanted.
     */
    private String onlyAnalyze = null;

    PreparedStatement psUpd = null;

    PreparedStatement psSelPaymentDetails = null;

    PreparedStatement psSelRoyalties = null;

    /**
     * Runs the PaymentFixUtility.
     *
     * First of all it will search for those projects that has advanced to review participants
     * who got less than 75 in screening, and will check for those project payment in both OR
     * and PACTS tables. If there are inconsistencies, they will be corrected.
     *
     */
    public void runUtility() throws Exception {
        ResultSet rs = null;

        try {            
            StringBuffer query = null;
            query = new StringBuffer(200);
            query.append("select * from user_contest_prize");
            PreparedStatement psSelRoomResult = prepareStatement("tcs_dw", query.toString());

            query = new StringBuffer(200);
            query.append("insert into user_contest_prize_dw values (?, ?, ?, ?, ?, ?, ?) ");
            PreparedStatement psInsRoomResult = prepareStatement("informixoltp", query.toString());

            log.debug("Copying table...");
            rs = psSelRoomResult.executeQuery();
            for (int i = 1; rs.next(); i++ ) {
                psInsRoomResult.clearParameters();
                for (int j = 1; j <= 7; j++) {
                    psInsRoomResult.setObject(j, rs.getObject(j));
                }
                psInsRoomResult.executeUpdate();

                if (i % 10 == 0) {
                    log.debug(i + "...");
                }
            }
            
/*            buildPreparedStatements();
            
            processRoyalties();
            
            rs = psSelPaymentDetails.executeQuery();
            for (int i = 1; rs.next(); i++ ) {
                switch (rs.getInt("payment_type_id")) {
                    case 1:
                        processContestPayment(rs.getLong("payment_detail_id"), rs.getString("payment_desc"));
                        break;
                    default:
                        throw new Exception("Unknown payment type");
                }
            }*/
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("PaymentFixUtility failed.\n" + sqle.getMessage());
        } finally {
            DBMS.close(psSelPaymentDetails);
            DBMS.close(rs);
            DBMS.close(psUpd);
        }
    }

    /**
     * @throws SQLException
     */
    private void buildPreparedStatements() throws SQLException {
        StringBuffer query = null;
        query = new StringBuffer(200);
        query.append("select ");
        query.append("user_id, amount, description, royalty_date ");
        query.append("from royalty ");

        psSelRoyalties = prepareStatement("tcs_dw", query.toString());

        query = new StringBuffer(200);
        query.append("select ");
        query.append("payment_detail_id, payment_type_id, payment_desc ");
        query.append("from payment_detail ");

        psSelPaymentDetails = prepareStatement("informixoltp", query.toString());
        
        query = new StringBuffer(200);
        query.append("update payment_detail set ? = ? ");
        query.append("where payment_detail_id = ?");
        psUpd = prepareStatement("informixoltp", query.toString());
    }

    private void processRoyalties() throws Exception {
        ResultSet rs = null; 
        log.debug("Processing royalties:");
        try {
            rs = psSelRoyalties.executeQuery();
            for (int i = 1; rs.next(); i++) {
                // call payment EJB to generate the royalty payment.
                
                if (i % 100 == 0) {
                    log.debug(i + "...");
                }
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("Generating royalties failed.\n" + sqle.getMessage());
        } finally {
            DBMS.close(rs);
        }    
    }

    private void processContestPayment(long paymentDetailId, String paymentDesc) {
        // parse paymentDesc to get algorithm_round_id and algorithm_problem_id
        long srmId = Long.parseLong(
            paymentDesc.substring(
            paymentDesc.indexOf("Single Round Match ") + "Single Round Match ".length(),
            paymentDesc.lastIndexOf("Round ")));

        long roundId = Long.parseLong(
                paymentDesc.substring(
                paymentDesc.indexOf("Round ") + "Round ".length(),
                paymentDesc.lastIndexOf("winnings")));
    }

    /**
     * Process and validates the parameters.
     */
    protected void processParams() {
        super.processParams();

        onlyAnalyze = (String) params.get("onlyAnalyze");
        if (onlyAnalyze == null)
            setUsageError("Please specify a onlyAnalyze.\n");

        params.remove("onlyAnalyze");

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
        sErrorMsg.append("   -onlyAnalyze : wheter to just analyze without updates.\n");
        fatal_error();
    }
}

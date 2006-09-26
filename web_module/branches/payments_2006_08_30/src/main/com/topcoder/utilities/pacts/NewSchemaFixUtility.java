package com.topcoder.utilities.pacts;

/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

import java.lang.reflect.Method;
import java.rmi.RemoteException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.sql.DBUtility;
import com.topcoder.web.common.model.DefaultPriceComponent;
import com.topcoder.web.ejb.pacts.AlgorithmContestPayment;
import com.topcoder.web.ejb.pacts.CharityPayment;
import com.topcoder.web.ejb.pacts.PactsClientServices;
import com.topcoder.web.ejb.pacts.PactsClientServicesHome;

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

    PactsClientServices pcs = null;
    
    //PreparedStatement psSelRoyalties = null;

    /**
     * Runs the PaymentFixUtility.
     *
     * First of all it will search for those projects that has advanced to review participants
     * who got less than 75 in screening, and will check for those project payment in both OR
     * and PACTS tables. If there are inconsistencies, they will be corrected.
     *
     */
    public void runUtility() throws Exception {
        try {            
/*            StringBuffer query = null;
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
            }*/
            
            pcs = (PactsClientServices) createEJB();

            
//            buildPreparedStatements();
            
            //processRoomResultAdditions();
            //processRoomResultConflicts();
            processRoomResultCharities();
            
/*            processRoyalties();
            
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
//            DBMS.close(psSelPaymentDetails);
            //DBMS.close(rs);
            DBMS.close(psUpd);
        }
    }

    private void processRoomResultConflicts() throws SQLException, RemoteException {
        StringBuffer query = new StringBuffer(200);
        query.append("select coder_id, paid, round_id, room_placed ");
        query.append("from room_result_dw where room_result_dw.paid > 0  ");
        query.append("and room_result_dw.payment_type_id = 1 ");
        query.append("and not exists ( ");
        query.append("select pd.payment_detail_id from payment_detail pd, payment_detail_xref pdx, payment p ");
        query.append("where pd.payment_detail_id = pdx.payment_detail_id and ");
        query.append("p.payment_id = pdx.payment_id and pd.algorithm_round_id = room_result_dw.round_id ");
        query.append("and p.user_id = room_result_dw.coder_id and ");
        query.append("pd.gross_amount = room_result_dw.paid ");
        query.append(") and exists ( ");
        query.append("select pd.payment_detail_id from payment_detail pd ");
        query.append("where pd.algorithm_round_id = room_result_dw.round_id) ");

        PreparedStatement psSelRoomResultsConflicts = prepareStatement("informixoltp", query.toString());
        log.debug("Processing room_result conflicts:");

        ResultSet rs = null;
        try {            
            rs = psSelRoomResultsConflicts.executeQuery();
            int i = 1;
            for (; rs.next(); i++ ) {
                pcs.addPayment(new AlgorithmContestPayment(
                        rs.getLong("coder_id"),
                        rs.getDouble("paid"),
                        rs.getLong("round_id"),
                        rs.getInt("room_placed")));
                if (i % 10 == 0) {
                    log.debug(i + "...");
                }
            }
            log.debug(i + "rows were processed...");
        } finally {
          DBMS.close(rs);
        }
    }

    private void processRoomResultCharities() throws SQLException, RemoteException {
        StringBuffer query = new StringBuffer(200);
        query.append("select coder_id, paid, round_id, room_placed ");
        query.append("from room_result_dw ");
        query.append("where room_result_dw.paid > 0 and room_result_dw.payment_type_id = 5 ");
        query.append("and not exists ( ");
        query.append("select pd.payment_detail_id from payment_detail pd, payment_detail_xref pdx, payment p ");
        query.append("where pd.payment_detail_id = pdx.payment_detail_id and ");
        query.append("p.payment_id = pdx.payment_id and pd.algorithm_round_id = room_result_dw.round_id ");
        query.append("and p.user_id = room_result_dw.coder_id and ");
        query.append("pd.gross_amount = room_result_dw.paid) ");

        PreparedStatement psSelRoomResultsCharities=  prepareStatement("informixoltp", query.toString());

        log.debug("Processing room_result charities:");

        ResultSet rs = null;
        try {            
            rs = psSelRoomResultsCharities.executeQuery();
            int i = 1;
            for (; rs.next(); i++ ) {
                log.debug("Creating an AlgorithmContestPayment(" + 
                        rs.getLong("coder_id") + "," +
                        rs.getDouble("paid") + "," +
                        rs.getLong("round_id") + "," +
                        rs.getInt("room_placed") + ")");
                        
                AlgorithmContestPayment algorithmContestPayment = new AlgorithmContestPayment(
                        rs.getLong("coder_id"),
                        rs.getDouble("paid"),
                        rs.getLong("round_id"),
                        rs.getInt("room_placed"));
        
                pcs.addPayment(algorithmContestPayment);

                log.debug("Added: " + algorithmContestPayment.getId());
                
/*                pcs.addPayment(new CharityPayment(algorithmContestPayment));

                log.debug("Added Charity payment");*/

                if (i % 10 == 0) {
                    log.debug(i + "...");
                }
            }
            log.debug(i + "rows were processed...");
        } finally {
          DBMS.close(rs);
        }
    }

    private void processRoomResultAdditions() throws SQLException, RemoteException {
        StringBuffer query  = new StringBuffer(200);
        query.append("select coder_id, paid, round_id, room_placed ");
        query.append("from room_result_dw ");
        query.append("where room_result_dw.paid > 0 and room_result_dw.payment_type_id = 1 ");
        query.append("and not exists ( ");
        query.append("select pd.payment_detail_id from payment_detail pd ");
        query.append("where pd.algorithm_round_id = room_result_dw.round_id) ");

        PreparedStatement psSelRoomResultsAddittions =  prepareStatement("informixoltp", query.toString());

        log.debug("Processing room_result additions:");

        ResultSet rs = null;
        try {            
            rs = psSelRoomResultsAddittions.executeQuery();
            int i = 1;
            for (; rs.next(); i++ ) {
                pcs.addPayment(new AlgorithmContestPayment(
                    rs.getLong("coder_id"),
                    rs.getDouble("paid"),
                    rs.getLong("round_id"),
                    rs.getInt("room_placed")));
                if (i % 100 == 0) {
                    log.debug(i + "...");
                }
            }
            log.debug(i + "rows were processed...");
        } finally {
          DBMS.close(rs);
        }
    }

    public static Object createEJB() throws NamingException, Exception {
        /*Object remotehome = ctx.lookup(remoteclass.getName() + "Home");
        Method createmethod = PortableRemoteObject.narrow(remotehome,
                remotehome.getClass()).getClass().getMethod("create", null);
        return createmethod.invoke(remotehome, null);*/
        
        Context initial = new InitialContext();
        Object objref = initial.lookup(PactsClientServicesHome.class.getName());
        PactsClientServicesHome home = (PactsClientServicesHome) 
            PortableRemoteObject.narrow(objref, PactsClientServicesHome.class);

        return(home.create());
    }

/*    private void buildPreparedStatements() throws SQLException {
        StringBuffer query = null;

        query = new StringBuffer(200);
        query.append("select ");
        query.append("user_id, amount, description, royalty_date ");
        query.append("from royalty ");

        psSelRoyalties = prepareStatement("tcs_dw", query.toString());


    }/*

/*    private void processRoyalties() throws Exception {
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
    }*/

    /*private void processContestPayment(long paymentDetailId, String paymentDesc) {
        // parse paymentDesc to get algorithm_round_id and algorithm_problem_id
        long srmId = Long.parseLong(
            paymentDesc.substring(
            paymentDesc.indexOf("Single Round Match ") + "Single Round Match ".length(),
            paymentDesc.lastIndexOf("Round ")));

        long roundId = Long.parseLong(
                paymentDesc.substring(
                paymentDesc.indexOf("Round ") + "Round ".length(),
                paymentDesc.lastIndexOf("winnings")));
    }*/

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

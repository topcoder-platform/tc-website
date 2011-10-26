package com.topcoder.utilities.pacts;

/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

import java.rmi.RemoteException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.sql.DBUtility;
import com.topcoder.web.ejb.pacts.PactsClientServices;
import com.topcoder.web.ejb.pacts.PactsClientServicesHome;
import com.topcoder.web.ejb.pacts.ProblemWritingPayment;;
/*import com.topcoder.web.ejb.pacts.ProblemTestingPayment;
import com.topcoder.web.ejb.pacts.ReviewBoardPayment;
import com.topcoder.web.ejb.pacts.AlgorithmContestPayment;
import com.topcoder.web.ejb.pacts.CharityPayment;
import com.topcoder.web.ejb.pacts.ComponentWinningPayment;
import com.topcoder.web.ejb.pacts.ComponentTournamentBonusPayment;
import com.topcoder.web.ejb.pacts.NoReferencePayment;
import com.topcoder.web.ejb.pacts.BasePayment;*/


/**
 * <strong>Purpose</strong>:
 * Utility for the new payments schema.
 *
 * This utility adjusts old payments to the new payments schema
 *
 * @author pulky
 * @version 1.0.1
 */
public class NewSchemaFixUtility extends DBUtility {
    /**
     * The PACTS ejb.
     */
    PactsClientServices pcs = null;
    
    /**
     * Runs the NewSchemaFixUtility.
     *
     */
    public void runUtility() throws Exception {
        try {            
            /*StringBuffer query = null;
            query = new StringBuffer(200);
            query.append("select * from royalty");
            PreparedStatement psSelRoomResult = prepareStatement("tcs_dw", query.toString());

            query = new StringBuffer(200);
            query.append("insert into royalty_dw values (?, ?, ?, ?)");
            PreparedStatement psInsRoomResult = prepareStatement("informixoltp", query.toString());

            log.debug("Copying table...");
            ResultSet rs = psSelRoomResult.executeQuery();
            for (int i = 1; rs.next(); i++ ) {
                psInsRoomResult.clearParameters();
                for (int j = 1; j <= 4; j++) {
                    psInsRoomResult.setObject(j, rs.getObject(j));
                }
                psInsRoomResult.executeUpdate();

                if (i % 100 == 0) {
                    log.debug(i + "...");
                }
            }*/
            
            pcs = (PactsClientServices) createEJB();


            processProblemWritersPayments();
            processProblemWritersPaymentsNullReference();

            //processProblemTestersPaymentsWithRounds();
            //processProblemTestersPaymentsNullRounds();

            /*processReviewersPaymentMDBStatusNullProjId(4);
            processReviewersPaymentMDBStatusNullProjId(5);
            processReviewersPaymentMDBStatusNullProjId(6);
            processReviewersPaymentMDBStatusNullProjId(7);
            processReviewersPaymentMDB();
            processReviewersPaymentInfo();
            processRoomResultAdditions();
            processRoomResultConflicts();
            processRoomResultCharities();
            processCompCompetitions();
            processCompContests();
            processRoyalties();*/
            
            log.debug("Load process done.");

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new Exception("PaymentFixUtility failed.\n" + sqle.getMessage());
        } finally {
        }
    }

    private void processProblemWritersPayments() throws SQLException, RemoteException {
        StringBuffer query = new StringBuffer(200);
        query.append("select user_id, problem_id, sum(money) as payment ");
        query.append("from problem_writing_migration ");
        query.append("where processed_ind = 0 ");
        query.append("and not exists ( ");
        query.append("select 'exist' from payment p, payment_detail pd ");
        query.append("where p.most_recent_detail_id = pd.payment_detail_id ");
        query.append("and pd.status_id <> 69 ");
        query.append("and p.user_id = problem_writing_migration.user_id ");
        query.append("and pd.algorithm_problem_id = problem_writing_migration.problem_id ");
        query.append("and pd.payment_type_id = 15) ");
        query.append("group by user_id, problem_id ");


        PreparedStatement psSelCompCompetitions = prepareStatement("informixoltp", query.toString());
        log.debug("Processing problem writers payments:");

        ResultSet rs = null;
        try {            
            rs = psSelCompCompetitions.executeQuery();
            int i = 1;
            for (; rs.next(); i++ ) {
                pcs.addPayment(new ProblemWritingPayment(
                        rs.getLong("user_id"),
                        rs.getDouble("payment"),
                        rs.getLong("problem_id")));
                if (i % 10 == 0) {
                    log.debug(i + "...");
                }
            }
            log.debug(i + " rows were processed...");
        } finally {
            DBMS.close(rs);
            DBMS.close(psSelCompCompetitions);
        }
    }
    
    
    private void processProblemWritersPaymentsNullReference() throws SQLException, RemoteException {
        StringBuffer query = new StringBuffer(200);
        query.append("select user_id, class, money as payment, payment_date ");
        query.append("from problem_writing_migration ");
        query.append("where processed_ind = -3 ");

        PreparedStatement psSelCompCompetitions = prepareStatement("informixoltp", query.toString());
        log.debug("Processing problem writing payments: (null reference)");
      
        ResultSet rs = null;
        try {            
            rs = psSelCompCompetitions.executeQuery();
            int i = 1;
            for (; rs.next(); i++ ) {
                ProblemWritingPayment ptm = new ProblemWritingPayment(
                        rs.getLong("user_id"),
                        rs.getDouble("payment"),
                        i*-1);
                
                ptm.setDueDate(rs.getDate("payment_date"));
                ptm.setDescription("Problem " + rs.getString("class") + " writing");
                
                pcs.addPayment(ptm);
                if (i % 10 == 0) {
                    log.debug(i + "...");
                }
            }
            log.debug(i + " rows were processed...");
        } finally {
            DBMS.close(rs);
            DBMS.close(psSelCompCompetitions);
        }
    }


/*
    private void processProblemTestersPaymentsNullRounds() throws SQLException, RemoteException {
        StringBuffer query = new StringBuffer(200);
        query.append("select user_id, contest, money as payment, payment_date ");
        query.append("from problem_testing_migration ");
        query.append("where processed_ind in (-2, -3) ");

        PreparedStatement psSelCompCompetitions = prepareStatement("informixoltp", query.toString());
        log.debug("Processing problem testers payments:");

        
        
        
        ResultSet rs = null;
        try {            
            rs = psSelCompCompetitions.executeQuery();
            int i = 1;
            for (; rs.next(); i++ ) {
                ProblemTestingPayment ptm = new ProblemTestingPayment(
                        rs.getLong("user_id"),
                        rs.getDouble("payment"),
                        rs.getString("contest"));
                
                ptm.setDueDate(rs.getDate("payment_date"));
                
                pcs.addPayment(ptm);
                if (i % 10 == 0) {
                    log.debug(i + "...");
                }
            }
            log.debug(i + " rows were processed...");
        } finally {
            DBMS.close(rs);
            DBMS.close(psSelCompCompetitions);
        }
    }

 private void processProblemTestersPaymentsWithRounds() throws SQLException, RemoteException {
        StringBuffer query = new StringBuffer(200);
        query.append("select user_id, round_id, sum(money) as payment ");
        query.append("from problem_testing_migration ");
        query.append("where processed_ind = 0 ");
        query.append("and not exists ( ");
        query.append("select 'exist' from payment p, payment_detail pd ");
        query.append("where p.most_recent_detail_id = pd.payment_detail_id ");
        query.append("and pd.status_id <> 69 ");
        query.append("and p.user_id = problem_testing_migration.user_id ");
        query.append("and pd.algorithm_round_id = problem_testing_migration.round_id ");
        query.append("and pd.payment_type_id = 14) ");
        query.append("group by user_id, round_id ");

        PreparedStatement psSelCompCompetitions = prepareStatement("informixoltp", query.toString());
        log.debug("Processing problem testers payments:");

        ResultSet rs = null;
        try {            
            rs = psSelCompCompetitions.executeQuery();
            int i = 1;
            for (; rs.next(); i++ ) {
                pcs.addPayment(new ProblemTestingPayment(
                        rs.getLong("user_id"),
                        rs.getDouble("payment"),
                        rs.getLong("round_id")));
                if (i % 10 == 0) {
                    log.debug(i + "...");
                }
            }
            log.debug(i + " rows were processed...");
        } finally {
            DBMS.close(rs);
            DBMS.close(psSelCompCompetitions);
        }
    }
    
    
    private void processReviewersPaymentMDBStatusNullProjId(int status) throws SQLException, RemoteException {
        StringBuffer query = new StringBuffer(200);
        query.append("select rpm.coder_id, rpm.project_id, sum(rpm.total_amount) as payment ");
        query.append("from rboard_payment_migration rpm ");
        query.append("where processed_ind = " + status + " ");
        query.append("and not exists ( ");
        query.append("select * from payment p, payment_detail pd ");
        query.append("where p.most_recent_detail_id = pd.payment_detail_id ");
        query.append("and pd.status_id <> 69 ");
        query.append("and p.user_id = rpm.coder_id ");
        query.append("and pd.component_project_id = rpm.project_id ");
        query.append("and pd.payment_type_id = 7) ");
        query.append("group by rpm.coder_id, rpm.project_id ");


        PreparedStatement psSelRevPayments = prepareStatement("informixoltp", query.toString());
        log.debug("Processing reviewers payments (MDB - Status " + (status * -1 + 2) + "):");

        ResultSet rs = null;
        try {            
            rs = psSelRevPayments.executeQuery();
            int i = 1;
            for (; rs.next(); i++ ) {
                pcs.addPayment(new ReviewBoardPayment(
                        rs.getLong("coder_id"),
                        rs.getDouble("payment"),
                        rs.getObject("project_id") == null ? 10001001 : rs.getLong("project_id")));
                if (i % 10 == 0) {
                    log.debug(i + "...");
                }
            }
            log.debug(i + " rows were processed...");
            
            PreparedStatement psUpdNullProjects = prepareStatement("informixoltp", 
                "update payment_detail set component_project_id = null where payment_type_id = 7 and component_project_id = 10001001");
            i = psUpdNullProjects.executeUpdate();
            log.debug(i + " null projects updated...");
        } finally {
            DBMS.close(rs);
            DBMS.close(psSelRevPayments);
        }
    }


    private void processReviewersPaymentMDB() throws SQLException, RemoteException {
        StringBuffer query = new StringBuffer(200);
        query.append("select rpm.coder_id, rpm.project_id, sum(rpm.total_amount) as payment ");
        query.append("from rboard_payment_migration rpm ");
        query.append("where processed_ind = 0 ");
        query.append("and not exists ( ");
        query.append("select * from payment p, payment_detail pd ");
        query.append("where p.most_recent_detail_id = pd.payment_detail_id ");
        query.append("and pd.status_id <> 69 ");
        query.append("and p.user_id = rpm.coder_id ");
        query.append("and pd.component_project_id = rpm.project_id ");
        query.append("and pd.payment_type_id = 7) ");
        query.append("group by rpm.coder_id, rpm.project_id ");


        PreparedStatement psSelCompCompetitions = prepareStatement("informixoltp", query.toString());
        log.debug("Processing reviewers payments (MDB):");

        ResultSet rs = null;
        try {            
            rs = psSelCompCompetitions.executeQuery();
            int i = 1;
            for (; rs.next(); i++ ) {
                pcs.addPayment(new ReviewBoardPayment(
                        rs.getLong("coder_id"),
                        rs.getDouble("payment"),
                        rs.getLong("project_id")));
                if (i % 100 == 0) {
                    log.debug(i + "...");
                }
            }
            log.debug(i + " rows were processed...");
        } finally {
            DBMS.close(rs);
            DBMS.close(psSelCompCompetitions);
        }
    }
     
    
    private void processReviewersPaymentInfo() throws SQLException, RemoteException {
        StringBuffer query = new StringBuffer(200);
        query.append("select rur.login_id, rur.project_id, sum(pi.payment) as payment ");
        query.append("from tcs_catalog:r_user_role rur, tcs_catalog:payment_info pi, tcs_catalog:project p ");
        query.append("where pi.cur_version = 1 ");
        query.append("and pi.payment > 0 ");
        query.append("and rur.cur_version = 1 ");
        query.append("and rur.r_role_id in (2,3,4,5) ");
        query.append("and rur.payment_info_id = pi.payment_info_id ");
        query.append("and rur.project_id = p.project_id ");
        query.append("and p.cur_version = 1 ");
        query.append("and p.project_stat_id in (4,5,6,7) "); // correct status
        query.append("and nvl(p.complete_date, p.rating_date) >= '2004-10-22 10:29:15.000' "); // this is when the status started being updated 
        query.append("and pi.payment_stat_id = 2 "); // only paid 
        query.append("and not exists ( ");
        query.append("select * from payment p, payment_detail pd ");
        query.append("where p.most_recent_detail_id = pd.payment_detail_id ");
        query.append("and pd.status_id <> 69 ");
        query.append("and p.user_id = rur.login_id ");
        query.append("and pd.component_project_id = rur.project_id ");
        query.append("and pd.payment_type_id = 7) ");
        query.append("group by rur.login_id, rur.project_id ");

        PreparedStatement psSelCompCompetitions = prepareStatement("informixoltp", query.toString());
        log.debug("Processing reviewers payments (PaymentInfo):");

        ResultSet rs = null;
        try {            
            rs = psSelCompCompetitions.executeQuery();
            int i = 1;
            for (; rs.next(); i++ ) {
                pcs.addPayment(new ReviewBoardPayment(
                        rs.getLong("login_id"),
                        rs.getDouble("payment"),
                        rs.getLong("project_id")));
                if (i % 100 == 0) {
                    log.debug(i + "...");
                }
            }
            log.debug(i + " rows were processed...");
        } finally {
            DBMS.close(rs);
            DBMS.close(psSelCompCompetitions);
        }
    }
    
    
    private void processCompCompetitions() throws SQLException, RemoteException {
        StringBuffer query = new StringBuffer(200);
        query.append("select project_result_dw.user_id, project_result_dw.payment, "); 
        query.append("p.project_id, project_result_dw.placed from project_result_dw, project_dw p ");
        query.append("where p.project_id = project_result_dw.project_id and payment > 0 ");
        query.append("and p.status_id not in (1, 3) ");
        query.append("and p.project_id not in ");
        query.append("(select component_project_id from payment_detail ");
        query.append("where payment_type_id = 6 and status_id <> 69 and component_project_id is not null) ");

        PreparedStatement psSelCompCompetitions = prepareStatement("informixoltp", query.toString());
        log.debug("Processing component competitions:");

        ResultSet rs = null;
        try {            
            rs = psSelCompCompetitions.executeQuery();
            int i = 1;
            for (; rs.next(); i++ ) {
                pcs.addPayment(new ComponentWinningPayment(
                        rs.getLong("user_id"),
                        rs.getDouble("payment"),
                        rs.getLong("project_id"),
                        rs.getInt("placed")));
                if (i % 100 == 0) {
                    log.debug(i + "...");
                }
            }
            log.debug(i + " rows were processed...");
        } finally {
            DBMS.close(rs);
            DBMS.close(psSelCompCompetitions);
        }
    }


    private void processCompContests() throws SQLException, RemoteException {
        StringBuffer query = new StringBuffer(200);
        query.append("select user_id, prize_payment, contest_id, place from user_contest_prize_dw ");
        query.append("where prize_type_id not in (9, 10) and not exists ( ");
        query.append("select pd.payment_detail_id from payment_detail pd, payment_detail_xref pdx, payment p ");
        query.append("where pd.payment_detail_id = pdx.payment_detail_id and ");
        query.append("p.payment_id = pdx.payment_id and  p.most_recent_detail_id = pd.payment_detail_id ");
        query.append("and p.user_id = user_contest_prize_dw.user_id and pd.component_contest_id = user_contest_prize_dw.contest_id ");
        query.append("and pd.gross_amount = user_contest_prize_dw.prize_payment and ");
        query.append("pd.payment_type_id = 19 and pd.status_id <> 69) ");
        
        PreparedStatement psSelCompContests = prepareStatement("informixoltp", query.toString());
        log.debug("Processing component contests:");

        ResultSet rs = null;
        try {            
            rs = psSelCompContests.executeQuery();
            int i = 1;
            for (; rs.next(); i++ ) {
                
                pcs.addPayment(new ComponentTournamentBonusPayment(
                        rs.getLong("user_id"),
                        rs.getDouble("prize_payment"),
                        rs.getLong("contest_id"),
                        rs.getInt("place")));
                if (i % 10 == 0) {
                    log.debug(i + "...");
                }
            }
            log.debug(i + " rows were processed...");
        } finally {
          DBMS.close(rs);
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
        query.append("pd.gross_amount = room_result_dw.paid and ");
        query.append("pd.payment_type_id = 1 and pd.status_id <> 69) and exists ( ");
        query.append("select pd.payment_detail_id from payment_detail pd ");
        query.append("where pd.algorithm_round_id = room_result_dw.round_id and ");
        query.append("pd.payment_type_id = 1 and pd.status_id <> 69) ");

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
            log.debug(i + " rows were processed...");
        } finally {
          DBMS.close(rs);
          DBMS.close(psSelRoomResultsConflicts);
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
        query.append("pd.gross_amount = room_result_dw.paid and ");
        query.append("pd.payment_type_id = 5 and pd.status_id <> 69) ");

        PreparedStatement psSelRoomResultsCharities=  prepareStatement("informixoltp", query.toString());

        log.debug("Processing room_result charities:");

        ResultSet rs = null;
        try {            
            rs = psSelRoomResultsCharities.executeQuery();
            int i = 1;
            for (; rs.next(); i++ ) {
                        
                AlgorithmContestPayment algorithmContestPayment = new AlgorithmContestPayment(
                        rs.getLong("coder_id"),
                        rs.getDouble("paid"),
                        rs.getLong("round_id"),
                        rs.getInt("room_placed"));
        
                algorithmContestPayment = (AlgorithmContestPayment) pcs.addPayment(algorithmContestPayment);

                //log.debug("Added: " + algorithmContestPayment.getId());
                
                pcs.addPayment(new CharityPayment(algorithmContestPayment));

                //log.debug("Added Charity payment");

                if (i % 10 == 0) {
                    log.debug(i + "...");
                }
            }
            log.debug(i + " rows were processed...");
        } finally {
          DBMS.close(rs);
          DBMS.close(psSelRoomResultsCharities);
        }
    }

    private void processRoomResultAdditions() throws SQLException, RemoteException {
        StringBuffer query  = new StringBuffer(200);
        query.append("select coder_id, paid, round_id, room_placed ");
        query.append("from room_result_dw ");
        query.append("where room_result_dw.paid > 0 and room_result_dw.payment_type_id = 1 ");
        query.append("and not exists ( ");
        query.append("select pd.payment_detail_id from payment_detail pd ");
        query.append("where pd.algorithm_round_id = room_result_dw.round_id and ");
        query.append("pd.payment_type_id = 1 and pd.status_id <> 69) ");

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
            log.debug(i + " rows were processed...");
        } finally {
          DBMS.close(rs);
          DBMS.close(psSelRoomResultsAddittions);
        }
    }

    private void processRoyalties() throws SQLException, RemoteException {
        StringBuffer query  = new StringBuffer(200);
        query = new StringBuffer(200);
        query.append("select ");
        query.append("user_id, amount, description, royalty_date ");
        query.append("from royalty_dw ");
        query.append("where not exists ( ");
        query.append("select pd.payment_detail_id from payment_detail pd, payment_detail_xref pdx, payment p ");
        query.append("where pd.payment_detail_id = pdx.payment_detail_id and ");
        query.append("p.payment_id = pdx.payment_id ");
        query.append("and p.user_id = royalty_dw.user_id and ");
        query.append("pd.gross_amount = royalty_dw.amount and "); 
        query.append("pd.payment_type_id = 20 and pd.status_id <> 69) ");
        
        PreparedStatement psSelRoyalties =  prepareStatement("informixoltp", query.toString());

        log.debug("Processing royalties:");

        ResultSet rs = null;
        try {            
            rs = psSelRoyalties.executeQuery();
            int i = 1;
            for (; rs.next(); i++ ) {
                pcs.addPayment(new NoReferencePayment(
                    BasePayment.ROYALTY_PAYMENT,
                    rs.getLong("user_id"),
                    rs.getDouble("amount"),
                    rs.getString("description"),
                    rs.getDate("royalty_date")));
                if (i % 100 == 0) {
                    log.debug(i + "...");
                }
            }
            log.debug(i + " rows were processed...");
        } finally {
          DBMS.close(rs);
          DBMS.close(psSelRoyalties);
        }
    }
*/

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

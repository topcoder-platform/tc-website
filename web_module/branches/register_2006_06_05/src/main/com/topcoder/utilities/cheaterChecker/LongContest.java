package com.topcoder.utilities.cheaterChecker;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.utilities.CommentStripper;

import java.util.*;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 15, 2006
 */
public class LongContest {
    private static Logger log = Logger.getLogger(Contest.class);

    public static void main(String[] args) {
        String dataSourceName;
        long roundId;
        long componentId;
        if (args.length != 3) {
            System.out.println("SYNTAX: java " + Contest.class.getName() + "<datasource> <round id> <problem id>");
            return;
        }
        dataSourceName = args[0];
        roundId = Long.parseLong(args[1]);
        componentId = Long.parseLong(args[2]);

        try {
            Fraud fraud;
            List submissions = getSubmissions(dataSourceName, roundId, componentId);
            ArrayList allPotentialViolators = new ArrayList();
            log.debug("got submissions");
            if (submissions != null && submissions.size() > 0) {
                Submission temp = (Submission) submissions.get(0);
                log.info("running contest fraud detect for round: " + roundId + " component: " +
                        temp.getClassName() + "(" + componentId + ") for " + submissions.size() + " submissions");

                List normalizedSource = new ArrayList(submissions.size());
                for (int i = 0; i < submissions.size(); i++) {
                    normalizedSource.add(new NormalizedJavaSource(((Submission) submissions.get(i)).getSource()));
                }

                List nonNormalizedSource = new ArrayList(submissions.size());
                for (int i = 0; i < submissions.size(); i++) {
                    nonNormalizedSource.add(new JavaSource(((Submission) submissions.get(i)).getSource()));
                }

                fraud = new SimilarHistogram(nonNormalizedSource, submissions, Fraud.MAX_REPORT);
                fraud.setReportSize(200);
                log.info("****************** SIMILAR HISTOGRAM **************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");
                allPotentialViolators.addAll(fraud.getPotentialViolators());

                fraud = new Similar(nonNormalizedSource, submissions, Fraud.MAX_REPORT);
                fraud.setReportSize(200);
                log.info("****************** SIMILAR SOURCE **************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");
                allPotentialViolators.addAll(fraud.getPotentialViolators());

                fraud = new Same(normalizedSource, submissions, Fraud.MAX_REPORT);
                fraud.setReportSize(200);
                log.info("****************** SAME NORMALIZED SOURCE**************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");
                allPotentialViolators.addAll(fraud.getPotentialViolators());

/*                fraud = new SimilarSourceSubsequences(normalizedSource, submissions, Fraud.MAX_REPORT);
                log.info("****************** SIMILAR SUBSEQUENCES **************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");
                allPotentialViolators.addAll(fraud.getPotentialViolators());

                fraud = new EditDistance(normalizedSource, submissions, Fraud.MAX_REPORT);
                log.info("****************** EDIT DISTANCE **************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");
                allPotentialViolators.addAll(fraud.getPotentialViolators());*/

                //log.debug(allPotentialViolators);
                Histogram h = new Histogram(allPotentialViolators);
                Set worst = h.getSortedSet();
                log.debug("worst " + worst);
                StringBuffer worstBuf = new StringBuffer(1000);
                int i = 0;
                Map.Entry me;
                worstBuf.append("\n");
                for (Iterator it = worst.iterator(); it.hasNext() && i < Fraud.MAX_REPORT; i++) {
                    me = (Map.Entry) it.next();
                    worstBuf.append(((User) me.getKey()).getHandle());
                    worstBuf.append("(");
                    worstBuf.append(((User) me.getKey()).getUserId());
                    worstBuf.append(")");
                    worstBuf.append(" showed up ").append(me.getValue()).append(" times");
                    worstBuf.append("\n");
                }
                log.info("****************** Aggregate **************************");
                log.info(worstBuf);
                log.info("**********************************************************");


            }

        } catch (Exception e) {
            if (!(e instanceof SQLException))
                e.printStackTrace();
        }

    }

    private static List getSubmissions(String dataSourceName, long roundId, long componentId) throws Exception {
        ResultSet rs = null;
        PreparedStatement ps = null;
        PreparedStatement ps1 = null;
        ResultSet rs1 = null;
        Connection conn = null;
        Submission s;
        List ret = null;

        try {
            //TODO: This should take in the connection name, but it works for now
            conn = DBMS.getDirectConnection();
            StringBuffer query = new StringBuffer(500);

            query.append(" SELECT cc.coder_id");
            query.append(" , u.handle ");
            query.append(" , s.submission_text");
            query.append(" , s.language_id ");
            query.append(" , co.open_time ");
            query.append(" , s.submit_time");
            query.append(" , s.submission_points");
            query.append(" , c.component_id");
            query.append(" , c.problem_id");
            query.append(" , c.class_name");
            query.append(" , c.method_name");
            query.append(" , s.submission_number");
            query.append(" , s.example");
            query.append("  FROM long_component_state cc");
            query.append(" , long_submission s ");
            query.append(" , long_comp_result rr ");
            query.append(" , user u ");
            query.append(" , component c");
            query.append(" , long_compilation co");
            query.append(" WHERE cc.round_id = ?");
            query.append(" AND rr.round_id = ?");
            query.append(" AND s.long_component_state_id = cc.long_component_state_id");
            query.append(" AND rr.coder_id = cc.coder_id ");
            query.append(" AND rr.round_id = cc.round_id ");
            query.append(" AND u.user_id = cc.coder_id ");
            query.append(" AND u.user_id = rr.coder_id ");
            query.append(" AND cc.component_id = c.component_id");
            query.append(" AND co.long_component_state_id = s.long_component_state_id");
            query.append(" AND s.example = 0");
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, roundId);
            ps.setLong(2, roundId);
            //ps.setLong(3, componentId);
/*
            ps.setLong(4, roundId);
            ps.setLong(5, componentId);
*/

            CommentStripper cs = new CommentStripper();
            ret = new ArrayList();
            for (rs = ps.executeQuery(); rs.next(); ret.add(s)) {
                if (rs.getInt("example")==1) {
                    s = new ExampleSubmission();
                } else {
                    s = new Submission();
                }
                s.setHandle(rs.getString("handle"));
                s.setCoderId(rs.getInt("coder_id"));
                //s.setClassFile(rs.getBytes("class_file"));
                s.setSource(cs.stripComments(DBMS.getTextString(rs, 3)));
                s.setLanguageId(rs.getInt("language_id"));
                s.setOpenTime(rs.getLong("open_time"));
                s.setSubmitTime(rs.getLong("submit_time"));
                s.setPoints(rs.getFloat("submission_points"));
                s.setProblemId(rs.getLong("problem_id"));
                s.setComponentId(rs.getLong("component_id"));
                s.setClassName(rs.getString("class_name"));
                s.setMethodName(rs.getString("method_name"));
                s.setSubmissionNumber(rs.getInt("submission_number"));
                s.setIncluded(true);
            }

/*
            StringBuffer solQuery = new StringBuffer(1000);
            solQuery.append(" select s.coder_id ");
            solQuery.append(" , u.handle ");
            solQuery.append(" , s.solution_text ");
            solQuery.append(" , s.language_id ");
            solQuery.append(" , rc.component_id ");
            solQuery.append(" , c.problem_id ");
            solQuery.append(" , c.class_name ");
            solQuery.append(" , c.method_name ");
            solQuery.append(" from solution s ");
            solQuery.append(" , solution_class_file scf ");
            solQuery.append(" , component_solution_xref csx ");
            solQuery.append(" , round_component rc ");
            solQuery.append(" , user u ");
            solQuery.append(" , component c ");
            solQuery.append(" where s.solution_id = scf.solution_id ");
            solQuery.append(" and scf.sort_order = 1 ");
            solQuery.append(" and rc.component_id = c.component_id ");
            solQuery.append(" and s.coder_id = u.user_id ");
            solQuery.append(" and csx.solution_id = s.solution_id ");
            solQuery.append(" and rc.round_id = ? ");
            solQuery.append(" and rc.component_id = ? ");
            solQuery.append(" and rc.component_id = csx.component_id ");

            ps = conn.prepareStatement(solQuery.toString());
            ps.setLong(1, roundId);
            ps.setLong(2, componentId);

            for (rs1 = ps.executeQuery(); rs1.next(); ret.add(s)) {
                s = new Submission();
                s.setHandle(rs.getString("handle"));
                s.setCoderId(rs.getInt("coder_id"));
                //s.setClassFile(rs.getBytes("class_file"));
                s.setSource(cs.stripComments(DBMS.getTextString(rs, 3)));
                s.setLanguageId(rs.getInt("language_id"));
                s.setOpenTime(0);
                s.setSubmitTime(1000 * 60 * 60 * 6);  //6 hours.  that should keep them out of the running
                s.setPoints(rs.getFloat("submission_points"));
                s.setProblemId(rs.getLong("problem_id"));
                s.setComponentId(rs.getLong("component_id"));
                s.setClassName(rs.getString("class_name"));
                s.setMethodName(rs.getString("method_name"));
                s.setIncluded(true);
            }
*/

        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw e;
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement");
                }
            }
            if (rs1 != null) {
                try {
                    rs1.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet");
                }
            }

            if (ps1 != null) {
                try {
                    ps1.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection");
                }
            }

        }

        return ret;
    }

}



package com.topcoder.utilities.cheaterChecker;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.utilities.CommentStripper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class Contest {
    private static Logger log = Logger.getLogger(Contest.class);

    public static void main(String[] args) {
        String dataSourceName = null;
        long roundId = 0;
        long componentId = 0;
        if (args.length != 3) {
            System.out.println("SYNTAX: java " + Contest.class.getName() + "<datasource> <round id> <problem id>");
            return;
        }
        dataSourceName = args[0];
        roundId = Long.parseLong(args[1]);
        componentId = Long.parseLong(args[2]);

        try {
            Fraud fraud = null;
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

/* haven't come up with a use for this yet...

                List classSource = new ArrayList(submissions.size());
                for (int i = 0; i < submissions.size(); i++) {
                    classSource.add(new ClassSource(((Submission) submissions.get(i)).getClassFile()));
                }
*/
/* subsequences should be a superset, so we'll just do that one...at least for now
                fraud = new SimilarSourceSubstrings(normalizedSource, submissions);
                log.info("****************** SIMILAR SUBSTRINGS **************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");
                allPotentialViolators.addAll(fraud.getPotentialViolators());
*/
                fraud = new SimilarSourceSubsequences(normalizedSource, submissions, Fraud.MAX_REPORT);
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
                allPotentialViolators.addAll(fraud.getPotentialViolators());

                fraud = new SimilarHistogram(nonNormalizedSource, submissions, Fraud.MAX_REPORT);
                log.info("****************** SIMILAR HISTOGRAM **************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");
                allPotentialViolators.addAll(fraud.getPotentialViolators());

                fraud = new Similar(nonNormalizedSource, submissions, Fraud.MAX_REPORT);
                log.info("****************** SIMILAR SOURCE **************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");
                allPotentialViolators.addAll(fraud.getPotentialViolators());

                fraud = new Same(normalizedSource, submissions, Fraud.MAX_REPORT);
                log.info("****************** SAME NORMALIZED SOURCE**************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");
                allPotentialViolators.addAll(fraud.getPotentialViolators());

                fraud = new CPS(submissions, Fraud.MAX_REPORT);
                log.info("****************** CPS **************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");
                allPotentialViolators.addAll(fraud.getPotentialViolators());

                //log.debug(allPotentialViolators);
                Histogram h = new Histogram(allPotentialViolators);
                Set worst = h.getSortedSet();
                log.debug("worst " + worst);
                StringBuffer worstBuf = new StringBuffer(1000);
                int i = 0;
                Map.Entry me = null;
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
            return;
        }

    }

    private static List getSubmissions(String dataSourceName, long roundId, long componentId) throws Exception {
        ResultSet rs = null;
        PreparedStatement ps = null;
        PreparedStatement ps1 = null;
        ResultSet rs1 = null;
        Connection conn = null;
        Submission s = null;
        List ret = null;

        try {
            //TODO: This should take in the connection name, but it works for now
            conn = DBMS.getDirectConnection();
            StringBuffer query = new StringBuffer(500);

            query.append(" SELECT cc.coder_id ");
            query.append(" , scf.class_file ");
            query.append(" , u.handle ");
            query.append(" , co.compilation_text");
            query.append(" , s.submission_text");
            query.append(" , s.language_id as submit_language");
            query.append(" , co.language_id as compile_language");
            query.append(" , co.open_time ");
            query.append(" , s.submit_time ");
            query.append(" , s.submission_points ");
            query.append(" , c.component_id");
            query.append(" , c.problem_id");
            query.append(" , c.class_name");
            query.append(" , c.method_name");
            query.append(" , s.submission_number");
            query.append(" FROM component_state cc ");
            query.append(" , outer (submission s, submission_class_file scf)  ");
            query.append(" , room r ");
            query.append(" , room_result rr ");
            query.append(" , user u ");
            query.append(" , component c");
            query.append(" , compilation co");
            query.append(" WHERE cc.round_id = ? ");
            query.append(" AND r.round_id = ? ");
            query.append(" AND cc.round_id = r.round_id ");
            query.append(" AND r.room_type_id = 2 ");
            query.append(" and cc.status_id > 120 ");
            query.append(" AND cc.component_id = ? ");
            query.append(" AND s.submission_points >= 0 ");//
            query.append(" AND s.component_state_id = cc.component_state_id ");
            query.append(" AND rr.round_id = r.round_id ");
            query.append(" AND rr.room_id = r.room_id ");
            query.append(" AND rr.coder_id = cc.coder_id ");
            query.append(" AND rr.round_id = cc.round_id ");
            query.append(" AND u.user_id = cc.coder_id ");
            query.append(" AND u.user_id = rr.coder_id ");
            query.append(" AND scf.submission_number = s.submission_number ");
            query.append(" AND scf.component_state_id = s.component_state_id ");
            query.append(" AND scf.component_state_id = cc.component_state_id ");
            query.append(" AND scf.sort_order = 1");    //hoke it to be the first if there are multiple classes
            query.append(" AND cc.component_id = c.component_id");
            query.append(" AND co.component_state_id = cc.component_state_id");
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, roundId);
            ps.setLong(2, roundId);
            ps.setLong(3, componentId);

            CommentStripper cs = new CommentStripper();
            ret = new ArrayList();
            for (rs = ps.executeQuery(); rs.next(); ret.add(s)) {
                s = new Submission();
                s.setHandle(rs.getString("handle"));
                s.setCoderId(rs.getInt("coder_id"));
                //s.setClassFile(rs.getBytes("class_file"));
                if (rs.getString("submission_number") == null) {
                    s.setSource(cs.stripComments(DBMS.getTextString(rs, 4)));
                    s.setLanguageId(rs.getInt("compile_language"));
                } else {
                    s.setSource(cs.stripComments(DBMS.getTextString(rs, 5)));
                    s.setLanguageId(rs.getInt("submit_language"));
                }
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

            StringBuffer solQuery = new StringBuffer(1000);
            //include our writer/tester solutions.  to make this better, it should strip out checkData
            solQuery.append(" select s.coder_id ");
            solQuery.append(" , scf.class_file ");
            solQuery.append(" , u.handle ");
            solQuery.append(" , s.solution_text ");
            solQuery.append(" , s.language_id ");
/*
            solQuery.append(" , 0 ");
            solQuery.append(" , 0 ");
            solQuery.append(" , 0 ");
*/
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
                s.setHandle(rs1.getString("handle"));
                s.setCoderId(rs1.getInt("coder_id"));
                //s.setClassFile(rs.getBytes("class_file"));
                s.setSource(cs.stripComments(DBMS.getTextString(rs1, 4)));
                s.setLanguageId(rs1.getInt("language_id"));
                s.setOpenTime(0);
                s.setSubmitTime(1000 * 60 * 60 * 6);  //6 hours.  that should keep them out of the running
                s.setPoints(rs1.getFloat("submission_points"));
                s.setProblemId(rs1.getLong("problem_id"));
                s.setComponentId(rs1.getLong("component_id"));
                s.setClassName(rs1.getString("class_name"));
                s.setMethodName(rs1.getString("method_name"));
                s.setIncluded(true);
            }

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


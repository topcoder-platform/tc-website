package com.topcoder.utilities.cheaterChecker;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.utilities.CommentStripper;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Google {
    private static Logger log = Logger.getLogger(Contest.class);

    public static void main(String[] args) {
        String dataSourceName = null;
        long[] rounds = new long[args.length - 2];
        long componentId = 0;
        if (args.length < 3) {
            System.out.println("SYNTAX: java " + Contest.class.getName() + "<datasource> <component id> <round id> <round id> ");
            return;
        }
        dataSourceName = args[0];
        componentId = Long.parseLong(args[1]);
        for (int i = 2; i < args.length; i++) {
            rounds[i - 2] = Long.parseLong(args[i]);
        }

        try {
            Fraud fraud = null;
            List submissions = getSubmissions(dataSourceName, rounds[0], componentId);
            for (int i = 1; i < rounds.length; i++) {
                submissions.addAll(getSubmissions(dataSourceName, rounds[i], componentId));
            }
            log.debug("got submissions");
            if (submissions != null && submissions.size() > 0) {
                Submission temp = (Submission) submissions.get(0);
                StringBuffer buf = new StringBuffer();
                buf.append("running contest fraud detect for round: ");
                for (int i = 0; i < rounds.length; i++) {
                    buf.append(rounds[i]).append(",");
                }
                buf.append(" component: ");
                buf.append(temp.getClassName()).append("(").append(componentId).append(") for ");
                buf.append(submissions.size()).append(" submissions");
                log.info(buf.toString());

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
*/
                fraud = new SimilarSourceSubsequences(normalizedSource, submissions, 1000);
                log.info("****************** SIMILAR SUBSEQUENCES **************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");

                fraud = new EditDistance(normalizedSource, submissions, 1000);
                log.info("****************** EDIT DISTANCE **************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");

                fraud = new SimilarHistogram(nonNormalizedSource, submissions, 100);
                log.info("****************** SIMILAR HISTOGRAM **************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");

                fraud = new Similar(nonNormalizedSource, submissions, 1000);
                log.info("****************** SIMILAR SOURCE **************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");

                fraud = new Same(normalizedSource, submissions, 100000);
                log.info("****************** SAME NORMALIZED SOURCE**************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");

                fraud = new CPS(submissions, 1000);
                log.info("****************** CPS **************************");
                fraud.execute();
                log.info(fraud.getReport());
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
        Connection conn = null;
        Submission s = null;
        List ret = null;
        DataSource ds = null;

        try {
            conn = DBMS.getConnection(dataSourceName);
            StringBuffer query = new StringBuffer(500);

            query.append(" SELECT cc.coder_id ");
            query.append(" , scf.class_file ");
            query.append(" , u.handle ");
            query.append(" , s.submission_text ");
            query.append(" , s.language_id ");
            query.append(" , co.open_time ");
            query.append(" , s.submit_time ");
            query.append(" , s.submission_points ");
            query.append(" , c.component_id");
            query.append(" , c.problem_id");
            query.append(" , c.class_name");
            query.append(" , c.method_name");
            query.append(" FROM component_state cc ");
            query.append(" , submission s ");
            query.append(" , room r ");
            query.append(" , room_result rr ");
            query.append(" , user u ");
            query.append(" , submission_class_file scf ");
            query.append(" , component c");
            query.append(" , compilation co");
            query.append(" WHERE cc.round_id = ? ");
            query.append(" AND r.round_id = ? ");
            query.append(" AND cc.round_id = r.round_id ");
            query.append(" AND r.room_type_id = 2 ");
            query.append(" AND cc.component_id = ? ");
            query.append(" AND s.submission_points >= 0 ");//
            query.append(" AND s.component_state_id = cc.component_state_id ");
            query.append(" AND rr.round_id = r.round_id ");
            query.append(" AND rr.room_id = r.room_id ");
            query.append(" AND rr.coder_id = cc.coder_id ");
            query.append(" AND rr.round_id = cc.round_id ");
            query.append(" AND u.user_id = cc.coder_id ");
            query.append(" AND u.user_id = rr.coder_id ");
//            query.append(" AND cc.submission_number = s.submission_number ");
            query.append(" AND scf.submission_number = s.submission_number ");
            query.append(" AND scf.component_state_id = s.component_state_id ");
//            query.append(" AND scf.submission_number = cc.submission_number ");
            query.append(" AND scf.component_state_id = cc.component_state_id ");
            query.append(" AND scf.sort_order = 1");    //hoke it to be the first if there are multiple classes
            query.append(" AND cc.component_id = c.component_id");
            query.append(" AND co.component_state_id = s.component_state_id");

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
                s.setClassFile(rs.getBytes("class_file"));
                s.setSource(cs.stripComments(DBMS.getTextString(rs, 4)));
                s.setLanguageId(rs.getInt("language_id"));
                s.setOpenTime(rs.getLong("open_time"));
                s.setSubmitTime(rs.getLong("submit_time"));
                s.setPoints(rs.getFloat("submission_points"));
                s.setProblemId(rs.getLong("problem_id"));
                s.setComponentId(rs.getLong("component_id"));
                s.setClassName(rs.getString("class_name"));
                s.setMethodName(rs.getString("method_name"));
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
                    log.error("FAILED to close ResultSet in getAddress2");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                            "getAddress2");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getAddress2");
                }
            }

        }

        return ret;
    }

}



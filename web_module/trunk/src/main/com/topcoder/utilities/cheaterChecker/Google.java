package com.topcoder.utilities.cheaterChecker;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.sql.InformixSimpleDataSource;
import com.topcoder.utilities.CommentStripper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class Google {
    private static Logger log = Logger.getLogger(Contest.class);

    private static final String PROD_GOOGLE_CHINA = "jdbc:informix-sqli://192.168.14.51:2020/gcj_china_05_oltp:INFORMIXSERVER=informixoltp_tcp;user=coder;password=bre3burn";
    private static final String PROD_GOOGLE_INDIA = "jdbc:informix-sqli://192.168.14.51:2020/gcji06_oltp:INFORMIXSERVER=informixoltp_tcp;user=coder;password=bre3burn";

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
            ArrayList allPotentialViolators = new ArrayList();
            Fraud fraud = null;


            List submissions = getSubmissions(dataSourceName, rounds[0], componentId);
            for (int i = 1; i < rounds.length; i++) {
                submissions.addAll(getSubmissions(dataSourceName, rounds[i], componentId));
            }
            log.info("got " + submissions.size() + "  submissions");
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
                allPotentialViolators.addAll(fraud.getPotentialViolators());

                fraud = new EditDistance(normalizedSource, submissions, 1000);
                log.info("****************** EDIT DISTANCE **************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");
                allPotentialViolators.addAll(fraud.getPotentialViolators());

                fraud = new SimilarHistogram(nonNormalizedSource, submissions, 100);
                log.info("****************** SIMILAR HISTOGRAM **************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");
                allPotentialViolators.addAll(fraud.getPotentialViolators());

                fraud = new Similar(nonNormalizedSource, submissions, 1000);
                log.info("****************** SIMILAR SOURCE **************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");
                allPotentialViolators.addAll(fraud.getPotentialViolators());

                fraud = new Same(normalizedSource, submissions, 100000);
                log.info("****************** SAME NORMALIZED SOURCE**************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");
                allPotentialViolators.addAll(fraud.getPotentialViolators());

                fraud = new CPS(submissions, 1000);
                log.info("****************** CPS **************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");
                allPotentialViolators.addAll(fraud.getPotentialViolators());

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
        Connection conn = null;
        Submission s = null;
        List ret = null;

        try {
            conn = new InformixSimpleDataSource(new TCResourceBundle("DBMS").getProperty(dataSourceName)).getConnection();
            StringBuffer query = new StringBuffer(500);

            query.append(" SELECT cc.coder_id ");
            query.append(" , scf.class_file ");
            query.append(" , u.handle ");
            query.append(" , case s.component_state_id is null then c.compilation_text else s.submission_text end");
            query.append(" , s.language_id ");
            query.append(" , co.open_time ");
            query.append(" , s.submit_time ");
            query.append(" , s.submission_points ");
            query.append(" , c.component_id");
            query.append(" , c.problem_id");
            query.append(" , c.class_name");
            query.append(" , c.method_name");
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
                //s.setClassFile(rs.getBytes("class_file"));
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



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

/**
 * User: dok
 * Date: Aug 5, 2004
 * Time: 2:44:05 PM
 */
public class Brooks {
    private static Logger log = Logger.getLogger(Brooks.class);

    public static void main(String[] args) {
        String dataSourceName = null;
        long companyId = 0;
        if (args.length != 2) {
            System.out.println("SYNTAX: java " + Brooks.class.getName() + "<datasource> <company id>");
            return;
        }
        dataSourceName = args[0];
        companyId = Long.parseLong(args[1]);

        try {
            Fraud fraud = null;
            List submissions = getSubmissions(dataSourceName, companyId);
            log.debug("got submissions");
            if (submissions != null && submissions.size() > 0) {
                Submission temp = (Submission) submissions.get(0);
                StringBuffer buf = new StringBuffer();
                buf.append("running contest fraud detect for company: ");
                buf.append(companyId);
                buf.append(" component: ");
                buf.append(temp.getClassName()).append("(").append(companyId).append(") for ");
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
                fraud = new SimilarSourceSubsequences(normalizedSource, submissions);
                log.info("****************** SIMILAR SUBSEQUENCES **************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");

                fraud = new EditDistance(normalizedSource, submissions);
                log.info("****************** EDIT DISTANCE **************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");

                fraud = new SimilarHistogram(nonNormalizedSource, submissions);
                log.info("****************** SIMILAR HISTOGRAM **************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");

                fraud = new Similar(nonNormalizedSource, submissions);
                log.info("****************** SIMILAR SOURCE **************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");

                fraud = new Same(normalizedSource, submissions);
                log.info("****************** SAME NORMALIZED SOURCE**************************");
                fraud.execute();
                log.info(fraud.getReport());
                log.info("**********************************************************");

                fraud = new CPS(submissions);
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

    private static List getSubmissions(String dataSourceName, long companyId) throws Exception {
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        Submission s = null;
        List ret = null;
        DataSource ds = null;

        try {
            conn = DBMS.getConnection(dataSourceName);
            StringBuffer query = new StringBuffer(500);

            query.append("  SELECT cc.coder_id ");
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
            query.append(" , user u ");
            query.append(" , submission_class_file scf ");
            query.append(" , component c");
            query.append(" , compilation co");
            query.append(" , session_profile sp");
            query.append(" , session_profile_problem_xref spp");
            query.append(" , session sess");
            query.append(" WHERE sp.session_profile_id = spp.session_profile_id");
            query.append(" and spp.problem_type_id = 4");
            query.append(" and sp.session_profile_id = sess.session_profile_id");
            query.append(" and sess.user_id = u.user_id");
            query.append(" and sp.company_id = ?");
            query.append(" and spp.problem_id = c.problem_id");
            query.append(" AND s.component_state_id = cc.component_state_id ");
            query.append(" AND u.user_id = cc.coder_id ");
            query.append(" AND cc.submission_number = s.submission_number ");
            query.append(" AND scf.submission_number = s.submission_number ");
            query.append(" AND scf.component_state_id = s.component_state_id ");
            query.append(" AND scf.submission_number = cc.submission_number ");
            query.append(" AND scf.component_state_id = cc.component_state_id ");
            query.append(" AND scf.sort_order = 1");
            query.append(" AND cc.component_id = c.component_id");
            query.append(" AND co.component_state_id = s.component_state_id");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, companyId);

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


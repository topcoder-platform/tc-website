package com.topcoder.web.oracle;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.sql.InformixSimpleDataSource;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.oracle.dao.CandidateDAO;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.*;
import com.topcoder.web.oracle.roomassignment.CandidateRoomAssigner;
import com.topcoder.web.oracle.roomassignment.RandomAssigner;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 30, 2007
 */
public class CreateRoundFromStudioContest {


    public static void main(String[] args) {
        if (args.length == 0 || args[0] == null) {
            System.out.println("Need to provide a studio contest id");
            System.exit(1);
        }
        Long studioId = null;
        try {
            studioId = new Long(args[0]);
        } catch (NumberFormatException e) {
            System.out.println("Need to provide a valid studio contest id not this " + studioId + " crap");
            System.exit(1);
        }
        Integer oracleId = null;
        try {
            oracleId = new Integer(args[1]);
        } catch (NumberFormatException e) {
            System.out.println("Need to provide a valid oracle contest id not this " + oracleId + " crap");
            System.exit(1);
        }

        final String query =
                "  select p.path \n" +
                        ", s.original_file_name" +
                        ", s.system_file_name " +
                        " , s.submission_id" +
                        "          from submission s" +
                        "             , submission_review sr " +
                        "             , path p" +
                        "         where sr.submission_id = s.submission_id " +
                        "and s.path_id = p.path_id" +
                        "           and sr.review_status_id = 1" +
                        "           and s.rank <= (case when (select count(*) from contest_config where contest_id = s.contest_id and property_id = 8 and property_value is not null) > 0 then (select property_value from contest_config where contest_id = s.contest_id and property_id = 8)::decimal else 1000 end)" +
                        "           and s.contest_id = ? ";


        File destDir = new File("." + System.getProperty("file.separator") +
                "submissions_" + studioId);
        if (!destDir.exists()) {
            destDir.mkdirs();
        }

        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = new InformixSimpleDataSource(new TCResourceBundle("DBMS").getProperty("STUDIO_CONNECT_STRING")).getConnection();
            ps = conn.prepareStatement(query);
            ps.setLong(1, studioId);
            rs = ps.executeQuery();
            String ext;


            HibernateUtils.begin();
            CandidateDAO cDAO = OracleDAOUtil.getFactory().getCandidateDAO();
            CandidateInfo imageSrc;
            CandidateInfo dlURL;
            CandidateProperty srcProp = OracleDAOUtil.getFactory().getCandidatePropertyDAO().find(CandidateProperty.IMAGE_SOURCE);
            CandidateProperty dlProp = OracleDAOUtil.getFactory().getCandidatePropertyDAO().find(CandidateProperty.DOWNLOAD_URL);
            Contest contest = OracleDAOUtil.getFactory().getContestDAO().find(oracleId);

            List<Candidate> cans = new ArrayList<Candidate>();
            Round r = new Round();
            r.setName("Round " + System.currentTimeMillis());
            r.setStatus(OracleDAOUtil.getFactory().getRoundStatusDAO().find(RoundStatus.ACTIVE));
            //r.
            contest.addRound(r);
            while (rs.next()) {
                ext = rs.getString("original_file_name").substring(rs.getString("original_file_name").lastIndexOf('.'));


                Candidate c = new Candidate();
                c.setName(rs.getString("submission_id"));

                imageSrc = new CandidateInfo();
                imageSrc.setValue("/i/oracle/candidates/tcdotcom/" + rs.getInt("submission_id") + ext);
                imageSrc.setProperty(srcProp);
                c.addInfo(imageSrc);

                dlURL = new CandidateInfo();
                dlURL.setValue("http://"+ApplicationServer.STUDIO_SERVER_NAME + "/?module=DownloadSubmission&sbmid=" + rs.getInt("submission_id"));
                dlURL.setProperty(dlProp);
                c.addInfo(dlURL);


                cans.add(c);


            }


            CandidateRoomAssigner ra = new RandomAssigner();
            List<Room> l = ra.createAssignments(cans, r, 50);
            for (Room myRoom : l) {
                r.addRoom(myRoom);
                for (CandidateRoomResult crr : myRoom.getCandidateResults()) {
                    cDAO.saveOrUpdate(crr.getCandidate());
                }
            }
            OracleDAOUtil.getFactory().getContestDAO().saveOrUpdate(contest);

            HibernateUtils.getSession().flush();
            HibernateUtils.commit();
            HibernateUtils.close();

        } catch (Throwable e) {
            try {
                if (HibernateUtils.getSession().getTransaction().isActive()) {
                    HibernateUtils.rollback();
                }
            } catch (Exception e1) {
                e1.printStackTrace();
                System.exit(1);
            } finally {
                HibernateUtils.closeSession(); // Unbind is automatic here
            }

            e.printStackTrace();
            System.exit(1);
        } finally {
            DBMS.close(rs);
            DBMS.close(ps);
            DBMS.close(conn);

        }

    }


}

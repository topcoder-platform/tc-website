package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.CandidateDAO;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.*;
import com.topcoder.web.oracle.roomassignment.CandidateRoomAssigner;
import com.topcoder.web.oracle.roomassignment.RandomAssigner;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 30, 2007
 */
public class CreateRoundFromStudio extends Base {


    protected void dbProcessing() throws Exception {

        //todo assign round phase, assign round config items


        Long studioId = null;
        try {
            studioId = new Long(getRequest().getParameter(Constants.STUDIO_CONTEST_ID));
        } catch (NumberFormatException e) {
            addError(Constants.STUDIO_CONTEST_ID, "Please select a valid contest.");
        }
        Integer oracleId = null;
        try {
            oracleId = new Integer(getRequest().getParameter(Constants.CONTEST_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid contest specified");
        }

        Request dr = new Request();
        dr.setContentHandle("oracle_admin_submission_list");
        dr.setProperty(Constants.CONTEST_ID, studioId.toString());
        ResultSetContainer rsc = new DataAccess(DBMS.STUDIO_DATASOURCE_NAME).getData(dr).get("oracle_admin_submission_list");

        if (rsc.isEmpty()) {
            throw new NavigationException("No submissions to make a round from.");
        } else {
            File destDir = new File("." + System.getProperty("file.separator") +
                    "submissions_" + studioId);
            if (!destDir.exists()) {
                destDir.mkdirs();
            }

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
            contest.addRound(r);
            for (ResultSetContainer.ResultSetRow row : rsc) {
                Candidate c = new Candidate();
                c.setName(row.getStringItem("submission_id"));

                imageSrc = new CandidateInfo();
                imageSrc.setValue("http://" + ApplicationServer.STUDIO_SERVER_NAME + "/?module=DownloadSubmission&sbmid=" + row.getIntItem("submission_id"));
                imageSrc.setProperty(srcProp);
                c.addInfo(imageSrc);

                dlURL = new CandidateInfo();
                dlURL.setValue("http://" + ApplicationServer.STUDIO_SERVER_NAME + "/?module=DownloadSubmission&sbmid=" + row.getIntItem("submission_id"));
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

            closeConversation();
            beginCommunication();
            StringBuffer buf = new StringBuffer(50);
            buf.append(getSessionInfo().getServletPath());
            buf.append("?" + Constants.MODULE_KEY + "=AdminViewRound&");
            buf.append(Constants.ROUND_ID).append("=").append(r.getId());
            setNextPage(buf.toString());
            setIsNextPageInContext(false);


        }





    }


}

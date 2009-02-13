package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.CandidateDAO;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.*;
import com.topcoder.web.oracle.roomassignment.CandidateRoomAssigner;
import com.topcoder.web.oracle.roomassignment.RandomAssigner;
import com.topcoder.web.oracle.validation.StudioContestValidator;

import java.util.ArrayList;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 4, 2007
 */
public class AddCandidatesFromStudio extends Base {


    protected void dbProcessing() throws Exception {

        //todo take which class to use for assignment from user
        inputValidation();

        if (!hasErrors()) {
            Round r = OracleDAOUtil.getFactory().getRoundDAO().find(new Integer(getRequest().getParameter(Constants.ROUND_ID)));
            Request dr = new Request();
            dr.setContentHandle("oracle_admin_submission_list");
            dr.setProperty(Constants.CONTEST_ID, getRequest().getParameter(Constants.STUDIO_CONTEST_ID));
            ResultSetContainer rsc = new DataAccess(DBMS.STUDIO_DATASOURCE_NAME).getData(dr).get("oracle_admin_submission_list");

            CandidateDAO cDAO = OracleDAOUtil.getFactory().getCandidateDAO();
            CandidateInfo imageSrc;
            CandidateInfo dlURL;
            CandidateProperty srcProp = OracleDAOUtil.getFactory().getCandidatePropertyDAO().find(CandidateProperty.IMAGE_SOURCE);
            CandidateProperty dlProp = OracleDAOUtil.getFactory().getCandidatePropertyDAO().find(CandidateProperty.DOWNLOAD_URL);

            List<Candidate> cans = new ArrayList<Candidate>();
            Candidate c;
            for (ResultSetContainer.ResultSetRow row : rsc) {
                c = new Candidate();
                c.setName(row.getStringItem("submission_id"));

                imageSrc = new CandidateInfo();
                imageSrc.setValue("http://" + ApplicationServer.STUDIO_SERVER_NAME +
                        "/?module=DownloadSubmission&sbmid=" + row.getIntItem("submission_id"));
                imageSrc.setProperty(srcProp);
                c.addInfo(imageSrc);

                dlURL = new CandidateInfo();
                dlURL.setValue("http://" + ApplicationServer.STUDIO_SERVER_NAME +
                        "/?module=DownloadSubmission&sbmid=" + row.getIntItem("submission_id"));
                dlURL.setProperty(dlProp);
                c.addInfo(dlURL);

                cans.add(c);
            }


            CandidateRoomAssigner ra = new RandomAssigner();
            List<Room> l = ra.createAssignments(cans, r, new Integer(r.getConfigMap().get(RoundProperty.MAX_ROOM_SIZE)));
            for (Room myRoom : l) {
                r.addRoom(myRoom);
                for (CandidateRoomResult crr : myRoom.getCandidateResults()) {
                    cDAO.saveOrUpdate(crr.getCandidate());
                }
            }

            StringBuffer buf = new StringBuffer(50);
            buf.append(getSessionInfo().getServletPath());
            buf.append("?" + Constants.MODULE_KEY + "=AdminViewRound&");
            buf.append(Constants.ROUND_ID).append("=").append(r.getId());
            setNextPage(buf.toString());
            setIsNextPageInContext(false);

        } else {
            Round r = OracleDAOUtil.getFactory().getRoundDAO().find(new Integer(getRequest().getParameter(Constants.ROUND_ID)));

            loadEditRoundData(r);

            setNextPage("/admin/editRound.jsp");
            setIsNextPageInContext(true);
        }
    }

    private void inputValidation() throws NavigationException {
        String studioContestId = getRequest().getParameter(Constants.STUDIO_CONTEST_ID);

        ValidationResult studioResult = new StudioContestValidator().validate(new StringInput(studioContestId));

        if (!studioResult.isValid()) {
            addError(Constants.STUDIO_CONTEST_ID, studioResult.getMessage());
        }


        Integer roundId;
        try {
            roundId = new Integer(getRequest().getParameter(Constants.ROUND_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid round specified");
        }
        Round r = OracleDAOUtil.getFactory().getRoundDAO().find(roundId);
        if (r == null) {
            throw new NavigationException("Invalid round specified");
        } else {
            if (!r.getConfigMap().containsKey(RoundProperty.MAX_ROOM_SIZE)) {
                addError(Constants.STUDIO_CONTEST_ID, "Round must have max room size set to add candidates.");
            }
        }


    }


}

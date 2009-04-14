package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOFactory;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.Candidate;
import com.topcoder.web.oracle.model.CandidateInfo;
import com.topcoder.web.oracle.model.CandidateProperty;
import com.topcoder.web.oracle.model.CandidateRoomResult;
import com.topcoder.web.oracle.model.Room;
import com.topcoder.web.oracle.validation.CandidateNameValidator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 4, 2007
 */
public class EditCandidate extends Base {

    protected void dbProcessing() throws Exception {

        String roomId = getRequest().getParameter(Constants.ROOM_ID);
        String candidateId = getRequest().getParameter(Constants.CANDIDATE_ID);
        String name = getRequest().getParameter(Constants.CANDIDATE_NAME);

        inputValidation();

        OracleDAOFactory f = OracleDAOUtil.getFactory();

        Candidate candidate = null;
        Room room = f.getRoomDAO().find(new Integer(roomId));
        if (room == null) {
            throw new NavigationException("Invalid room specified.");
        }

        if (!"".equals(StringUtils.checkNull(candidateId))) {
            candidate = f.getCandidateDAO().find(new Integer(candidateId));
            if (candidate == null) {
                throw new NavigationException("Invalid candidate specified.");
            }
        }

        if (hasErrors()) {
            loadGeneralEditCandidateData();

            for (CandidateProperty p : f.getCandidatePropertyDAO().getProperties()) {
                setDefault(Constants.CANDIDATE_PROPERTY + p.getId(),
                        getRequest().getParameter(Constants.CANDIDATE_PROPERTY + p.getId()));
            }
            if (candidate != null) {
                getRequest().setAttribute("candidate", candidate);
            }
            setDefault(Constants.ROOM_ID, room.getId());
            setDefault(Constants.CANDIDATE_ID, candidateId);
            setDefault(Constants.CANDIDATE_NAME, name);
            getRequest().setAttribute("room", room);

            setNextPage("/admin/editCandidate.jsp");
            setIsNextPageInContext(true);
        } else {
            if (candidate == null) {
                log.debug("new candidate");
                candidate = new Candidate();
                CandidateRoomResult crr = new CandidateRoomResult();
                crr.setCandidate(candidate);
                room.addCandidateResult(crr);
            }
            candidate.setName(name);


            CandidateInfo currInfo;
            for (CandidateProperty curr : f.getCandidatePropertyDAO().getProperties()) {
                if (candidate.isNew() || !candidate.getInfoMap().containsKey(curr.getId())) {
                    currInfo = new CandidateInfo();
                    currInfo.setProperty(curr);
                    candidate.addInfo(currInfo);
                } else {
                    currInfo = candidate.getInfo(curr.getId());
                }
                String val = getRequest().getParameter(Constants.CANDIDATE_PROPERTY + curr.getId());
                currInfo.setValue(StringUtils.checkNull(val).trim().length() == 0 ? null : val.trim());
            }

            OracleDAOUtil.getFactory().getRoomDAO().saveOrUpdate(room);

            setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                    "=AdminViewCandidate&" + Constants.CANDIDATE_ID + "=" + candidate.getId() + "&" +
                    Constants.ROOM_ID + "=" + room.getId());
            setIsNextPageInContext(false);
        }

    }


    private void inputValidation() throws Exception {
        String name = getRequest().getParameter(Constants.CANDIDATE_NAME);

        //validate
        ValidationResult nameResult = new CandidateNameValidator().validate(new StringInput(name));

        if (!nameResult.isValid()) {
            addError(Constants.CANDIDATE_NAME, nameResult.getMessage());
        }
    }
}

package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.Transaction;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.ejb.note.Note;
import com.topcoder.web.ejb.note.NoteHome;
import com.topcoder.web.ejb.user.UserNote;
import com.topcoder.web.ejb.user.UserNoteHome;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.PermissionDeniedException;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.model.CandidateInfo;
import com.topcoder.web.common.*;
import com.topcoder.common.web.error.NavigationException;

import javax.naming.InitialContext;
import javax.transaction.UserTransaction;
import java.util.Map;

/**
 * Processing for NoteCreate page.
 * @author Porgery
 */
public class NoteCreate extends BaseProcessor {

    /** Implements the processing step.
     * @throws com.topcoder.web.common.TCWebException
     */
    protected void businessProcessing() throws TCWebException {
        if (getAuthentication().getUser().isAnonymous()) {
            throw new PermissionException(getAuthentication().getUser(), new ClassResource(this.getClass()));
        }

        String candId = getRequest().getParameter(Constants.CANDIDATE_ID);

        if (candId == null || candId.equals("")) {
            throw new NavigationException("Missing required parameter", getRequest().getQueryString());
        }
        try {

            DataAccessInt dAccess = Util.getDataAccess();

            Request dr = new Request();
            dr.setContentHandle("candidateInfo");
            dr.setProperty("uid", String.valueOf(getAuthentication().getUser().getId()));
            dr.setProperty("cid", candId);
            Map map = dAccess.getData(dr);
            if (map == null) {
                throw new Exception("No data obtained!");
            }

            CandidateInfo cinfo = new CandidateInfo();
            ResultSetContainer result =
                    (ResultSetContainer) map.get("candidateInfo");
            if (result.getRowCount() == 0) {
                throw new PermissionDeniedException(getAuthentication().getUser(),
                        "User not authorized to view information about candidate: " + String.valueOf(candId));
            }

            cinfo.setUserId(Long.valueOf(candId));
            cinfo.setUserName(result.getRow(0).getItem("email").toString());
            getRequest().setAttribute("candidateInfo", cinfo);

            String noteText = getRequest().getParameter(Constants.NOTE_TEXT);

            if (noteText == null || noteText.trim().equals("")) {
                String firstVisit = getRequest().getParameter(Constants.FIRST_ATTEMPT);
                if (firstVisit != null && firstVisit.equals("false")) {
                    getRequest().setAttribute(Constants.MESSAGE_PARAMETER,
                            "Please enter the text of the note.");
                }
                setNextPage(Constants.NOTE_CREATE_PAGE);
                setIsNextPageInContext(true);
                return;
            }

            UserTransaction ut = Transaction.get(getInitialContext());
            ut.begin();

            try {
                NoteHome nHome = (NoteHome) getInitialContext().lookup(NoteHome.class.getName());
                Note note = nHome.create();

                long noteId = note.createNote(noteText, getAuthentication().getUser().getId(), 1);

                UserNoteHome uHome = (UserNoteHome) getInitialContext().lookup(UserNoteHome.class.getName());
                UserNote unote = uHome.create();

                unote.createUserNote(Long.parseLong(candId), noteId, DBMS.SCREENING_JTS_OLTP_DATASOURCE_NAME);
            } catch (Exception e) {
                ut.rollback();
                throw e;
            }
            ut.commit();
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        setNextPage(((SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).getServletPath() + '?' +
                Constants.MODULE_KEY + '=' + "PopulateCandidate" + '&' +
                Constants.CANDIDATE_ID + '=' + candId);
        setIsNextPageInContext(false);
    }

}

package com.topcoder.web.tc.controller.request.report;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.common.*;
import com.topcoder.web.ejb.note.Note;
import com.topcoder.web.ejb.user.UserNote;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

import javax.transaction.Status;
import javax.transaction.TransactionManager;

/**
 * User: dok
 * Date: Nov 18, 2004
 * Time: 8:31:46 AM
 */
public class UpdateNote extends Base {

    protected void businessProcessing() throws TCWebException {
        String userId = getRequest().getParameter(Constants.USER_ID);

        if (!((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin())
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        if (StringUtils.checkNull(userId).equals("")) {
            throw new NavigationException("Request missing user id");
        }

        String nId = getRequest().getParameter(Constants.NOTE_ID);
        String noteText = getRequest().getParameter(Constants.NOTE_TEXT);

        try {

            Note note = (Note) createEJB(getInitialContext(), Note.class);
            UserNote userNote = (UserNote) createEJB(getInitialContext(), UserNote.class);
            TransactionManager tm = (TransactionManager)getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);

            if (StringUtils.checkNull(nId).equals("")) {
                try {
                    tm.begin();

                    long noteId = note.createNote(noteText, getUser().getId(), Constants.INTERNAL_NOTE_TYPE_ID,
                            DBMS.JTS_OLTP_DATASOURCE_NAME, DBMS.OLTP_DATASOURCE_NAME);
                    userNote.createUserNote(Long.parseLong(userId), noteId, DBMS.JTS_OLTP_DATASOURCE_NAME);

                    tm.commit();
                } catch (Exception e) {
                    try {
                        if (tm!= null && tm.getStatus() == Status.STATUS_ACTIVE) {
                            tm.rollback();
                        }
                    } catch (Exception te) {
                        throw new TCWebException(e);
                    }
                    throw new TCWebException(e);
                }


            } else {
                if (StringUtils.checkNull(noteText).equals("")) {
                    try {
                        tm.begin();
                        long noteId = Long.parseLong(nId);
                        note.removeNote(noteId, DBMS.JTS_OLTP_DATASOURCE_NAME);
                        userNote.removeUserNote(Long.parseLong(userId), noteId, DBMS.JTS_OLTP_DATASOURCE_NAME);
                        tm.commit();
                    } catch (Exception e) {
                        try {
                            if (tm != null && tm.getStatus() == Status.STATUS_ACTIVE) {
                                tm.rollback();
                            }
                        } catch (Exception te) {
                            throw new TCWebException(e);
                        }
                        throw new TCWebException(e);
                    }
                } else {
                    note.setText(Long.parseLong(nId), noteText, DBMS.OLTP_DATASOURCE_NAME);
                }

            }

            SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);

            setNextPage(info.getServletPath() + "?" + Constants.MODULE_KEY + "=ViewNotes&" + Constants.USER_ID + "=" + userId);
            setIsNextPageInContext(false);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


}

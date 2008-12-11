package com.topcoder.web.openaim.controller.request;

import com.topcoder.security.TCPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.openaim.Constants;
import com.topcoder.web.openaim.dao.OpenAIMDAOUtil;
import com.topcoder.web.openaim.model.Contest;
import com.topcoder.web.openaim.model.ContestStatus;
import com.topcoder.web.openaim.model.Document;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.util.Date;
import java.util.Iterator;
import java.util.Set;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public class DownloadDocument extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
        Long documentId;

        if (!userLoggedIn()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        try {
            documentId = new Long(getRequest().getParameter(Constants.DOCUMENT_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Document Specified");
        }

        Document d = OpenAIMDAOUtil.getFactory().getDocumentDAO().find(documentId);
        // don't check permissions for admins
        if (!isAdmin()) {

            // check if the user is registered for any contest that uses this documentation, or any of those contests is over.
            User u = DAOUtil.getFactory().getUserDAO().find(getUser().getId());

            Set contests = d.getContests();
            boolean isRegistered = false;

            for (Iterator it = contests.iterator(); it.hasNext() && !isRegistered;) {
                Contest c = (Contest) it.next();

                if ((ContestStatus.ACTIVE.equals(c.getStatus().getId()) && OpenAIMDAOUtil.getFactory().getContestRegistrationDAO().find(c, u) != null)
                        || new Date().after(c.getEndTime())) {
                    isRegistered = true;
                }
            }

            if (!isRegistered) {
                throw new NavigationException("User needs to be registered to the project in order to download documents.");
            }
        }

        //stream it out via the response
        getResponse().addHeader("content-disposition", "inline; filename=\"" + d.getOriginalFileName() + "\"");
        getResponse().setContentType(d.getMimeType().getDescription());

        ServletOutputStream sos = getResponse().getOutputStream();

        FileInputStream fis = new FileInputStream(d.getPath().getPath() + d.getSystemFileName());

        int b;
        int size = 0;
        while ((b = fis.read()) >= 0) {
            sos.write(b);
            size++;
        }
        getResponse().addHeader("Content-Length", String.valueOf(size));
        getResponse().setStatus(HttpServletResponse.SC_OK);
        getResponse().flushBuffer();

    }

    private boolean isAdmin() throws Exception {
        TCSubject subject = SecurityHelper.getUserSubject(getUser().getId());
        boolean found = false;
        for (Iterator it = subject.getPrincipals().iterator(); it.hasNext() && !found;) {
            found = ((TCPrincipal) it.next()).getId() == Constants.CONTEST_ADMIN_ROLE_ID;
        }
        return found;
    }
}

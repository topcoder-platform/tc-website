package com.topcoder.web.csf.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.csf.Constants;
import com.topcoder.web.csf.dao.CSFDAOUtil;
import com.topcoder.web.csf.model.Contest;
import com.topcoder.web.csf.model.ContestStatus;
import com.topcoder.web.csf.model.Document;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.util.Date;
import java.util.Iterator;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public class DownloadDocument extends Base {

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

        Document d = CSFDAOUtil.getFactory().getDocumentDAO().find(documentId);

        // don't check permissions for admins
        if (!isAdmin()) {

            // check if the user is registered for any contest that uses this documentation, or any of those contests is over.
            User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

            Set contests = d.getContests();
            boolean isRegistered = false;

            for (Iterator it = contests.iterator(); it.hasNext() && !isRegistered;) {
                Contest c = (Contest) it.next();

                if ((ContestStatus.ACTIVE.equals(c.getStatus().getId()) && CSFDAOUtil.getFactory().getContestRegistrationDAO().find(c, u) != null)
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
        while ((b = fis.read()) >= 0) {
            sos.write(b);
        }
        getResponse().setStatus(HttpServletResponse.SC_OK);
        getResponse().flushBuffer();

    }

}

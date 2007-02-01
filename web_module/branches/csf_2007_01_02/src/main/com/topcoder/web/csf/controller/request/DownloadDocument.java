package com.topcoder.web.csf.controller.request;

import java.io.FileInputStream;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.csf.Constants;
import com.topcoder.web.csf.dao.CSFDAOUtil;
import com.topcoder.web.csf.model.Contest;
import com.topcoder.web.csf.model.Document;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
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

        Document d = CSFDAOUtil.getFactory().getDocumentDAO().find(documentId);

        // check if the user is registered for any contest that uses this documentation
        User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

        Set contests = d.getContests();
        boolean isRegistered = false;
        
        for (Iterator it = contests.iterator(); it.hasNext() && !isRegistered ; ) {
            Contest c = (Contest) it.next();
            
            if (CSFDAOUtil.getFactory().getContestRegistrationDAO().find(c, u) != null) {
                isRegistered = true;
            }
        }

        //stream it out via the response
        getResponse().addHeader("content-disposition", "inline; filename=" + d.getOriginalFileName());
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

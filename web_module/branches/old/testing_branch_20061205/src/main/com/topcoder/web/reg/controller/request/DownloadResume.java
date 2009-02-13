package com.topcoder.web.reg.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Coder;
import com.topcoder.web.common.model.Resume;
import com.topcoder.web.common.model.User;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 22, 2006
 */
public class DownloadResume extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
            Coder c = u.getCoder();
            if (c == null) {
                throw new NavigationException("Sorry, your account does not include a resume.");
            } else {
                Set resumes = c.getResumes();
                if (resumes.isEmpty()) {
                    throw new NavigationException("Sorry, no resume found.");
                } else {
                    //we'll just return whatever we get.  the application rules do not allow
                    //for more than one resume per coder, but the schema allows for more
                    Resume r = (Resume) resumes.iterator().next();

                    getResponse().addHeader("content-disposition", "inline; filename=" + r.getFileName());
                    getResponse().setContentType(r.getFileType().getMimeType());
                    ServletOutputStream sos = getResponse().getOutputStream();
                    sos.write(r.getFile());
                    getResponse().setStatus(HttpServletResponse.SC_OK);
                    getResponse().flushBuffer();
                }
            }
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }
}

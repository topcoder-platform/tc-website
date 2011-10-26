package com.topcoder.web.winformula.controller.request;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.security.TCPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.dao.WinformulaDAOFactory;
import com.topcoder.web.winformula.dao.WinformulaDAOUtil;
import com.topcoder.web.winformula.model.Contest;

/**
 * @author dok
 * @version $Revision: 72012 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class DownloadFile extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            Long contestId;
            try {
                contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid Contest Specified");
            }
            String fileName = getRequest().getParameter(Constants.FILENAME);
            
            if (fileName == null || fileName.trim().length() == 0 || fileName.contains("\\") || fileName.contains("/")) {
                throw new NavigationException("Invalid Request");
            }

            fileName = fileName.trim();
            
            if (!isAdmin()) {
                WinformulaDAOFactory cFactory = WinformulaDAOUtil.getFactory();
                DAOFactory factory = DAOUtil.getFactory();
    
                Contest c = cFactory.getContestDAO().find(contestId);
                User u = factory.getUserDAO().find(new Long(getUser().getId()));
    
                log.debug("Coder type: " + u.getCoder().getCoderType().getDescription());
                
                if (cFactory.getContestRegistrationDAO().find(c, u) == null) {
                    throw new NavigationException("You must be registered in order to download the requested file");
                }
            }
            streamFile(Constants.FILES_FOLDER, fileName);
            //setNextPage(Constants.FILES_FOLDER+fileName);
            //setIsNextPageInContext(true);
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

    }
    
    private boolean isAdmin() throws Exception {
        TCSubject subject = SecurityHelper.getUserSubject(getUser().getId());
        boolean found = false;
        for (Iterator it = subject.getPrincipals().iterator(); it.hasNext() && !found;) {
            found = ((TCPrincipal) it.next()).getId() == Constants.CONTEST_ADMIN_ROLE_ID;
        }
        return found;
    }
    
    private void streamFile(String path, String fileName) throws IOException, NavigationException {
        //stream it out via the response
        getResponse().addHeader("content-disposition", "inline; filename=\"" + fileName + "\"");
        getResponse().setContentType("application/zip");
    
        ServletOutputStream sos = getResponse().getOutputStream();
    
        File file = new File(path, fileName);
        if (!file.exists() || !file.isFile()) {
            throw new NavigationException("Invalid file requested");
        }
                
        
        FileInputStream fis = new FileInputStream(file);
        getResponse().setContentLength((int) file.length());
        try {
            byte[] buffer = new byte[8000];
            int size = 0;
            int fullSize = 0;
            getResponse().setStatus(HttpServletResponse.SC_OK);
            while ((size = fis.read(buffer)) >= 0) {
                sos.write(buffer, 0, size);
                fullSize += size;
                sos.flush();
            }
            getResponse().flushBuffer();
        } finally {
            fis.close();
        }
    }
}

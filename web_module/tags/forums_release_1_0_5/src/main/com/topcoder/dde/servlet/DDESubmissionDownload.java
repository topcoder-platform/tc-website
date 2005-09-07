package com.topcoder.dde.servlet;

import com.topcoder.dde.catalog.ComponentVersionInfo;
import com.topcoder.dde.submission.*;
import com.topcoder.security.TCSubject;

import javax.ejb.CreateException;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.rmi.RemoteException;
import java.sql.SQLException;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: May 12, 2003
 * Time: 10:38:23 PM
 * To change this template use Options | File Templates.
 */
public class DDESubmissionDownload extends DBDownloadServlet {

    protected boolean isAuthorized(HttpServletRequest request) {
        Object o = request.getSession().getAttribute("AdminTCSubject");
        return (o != null && o instanceof TCSubject);
    }

    protected InputStream getDownloadFile(HttpServletRequest request) {

        long submission_id;
        try {
            submission_id = Long.parseLong(request.getParameter("submission_id"));
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        try {
            return new ByteArrayInputStream(Utility.getSubmissions().getSubmission(submission_id).getSubmission());
        } catch (RemoteException e) {
            e.printStackTrace();
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } catch (SubmissionDoesNotExistException e) {
            e.printStackTrace();
            return null;
        } catch (NamingException e) {
            e.printStackTrace();
            return null;
        } catch (CreateException e) {
            e.printStackTrace();
            return null;
        }
    }

    protected String getFileName(HttpServletRequest request) {

        long submission_id;
        try {
            submission_id = Long.parseLong(request.getParameter("submission_id"));
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        try {
            Submission s = Utility.getSubmissions().getSubmission(submission_id);
            Submitter sub = Utility.getSubmitters().getSubmitter(s.getSubmitterId());
            String phase = ComponentVersionInfo.getPhaseName(sub.getPhaseId());
            return "Submitter" + s.getSubmitterId() + "_" + request.getParameter("Project").replace(' ', '_') + "_" + request.getParameter("ver") + "_" + phase + "_submission.jar";
        } catch (RemoteException e) {
            e.printStackTrace();
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } catch (SubmissionDoesNotExistException e) {
            e.printStackTrace();
            return null;
        } catch (NamingException e) {
            e.printStackTrace();
            return null;
        } catch (CreateException e) {
            e.printStackTrace();
            return null;
        } catch (SubmitterDoesNotExistException e) {
            e.printStackTrace();
            return null;
        }
    }
}
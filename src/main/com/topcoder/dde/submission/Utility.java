package com.topcoder.dde.submission;

import com.topcoder.dde.user.User;
import com.topcoder.servlet.request.FileUpload;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.util.idgenerator.bean.IdGenException;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import java.io.IOException;
import java.io.InputStream;
import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 */
public class Utility {

    private static Context getContext() throws NamingException {
        return new InitialContext();
    }

    public static Submissions getSubmissions() throws NamingException, RemoteException, CreateException {
        return ((SubmissionsHome) PortableRemoteObject.narrow(getContext().lookup("SubmissionsEJB"), SubmissionsHome.class)).create();
    }

    public static Submitters getSubmitters() throws NamingException, RemoteException, CreateException {
        return ((SubmittersHome) PortableRemoteObject.narrow(getContext().lookup("SubmittersEJB"), SubmittersHome.class)).create();
    }

    public static Submission[] getSubmissions(long comp_ver_id) throws RemoteException, NamingException, CreateException, SQLException {
        Submissions s = getSubmissions();
        ArrayList list = new ArrayList();
        List submitters = getSubmitters().getSubmitters(new Submitter(-1, -1, comp_ver_id, -1));
        for (int i = 0; i < submitters.size(); i++) {
            Submission subList[] = s.getSubmissions(((Submitter) submitters.get(i)).getSubmitterId());
            for (int j = 0; j < subList.length; j++) {
                list.add(subList[j]);
            }
        }
        return (Submission[]) list.toArray(new Submission[0]);
    }

    public static boolean submit(FileUpload fileUpload, User user, long comp_version_id, long phase_id, String comment) throws SubmitterDoesNotExistException, IOException, NamingException, CreateException, SQLException, IdGenException {

        Iterator it = fileUpload.getAllUploadedFiles();
        boolean rv = false;
        while (it.hasNext()) {
            InputStream is = ((UploadedFile) it.next()).getInputStream();
            if (is.available() <= 0)
                continue;
            else
                rv = true;
            getSubmissions().submit(getSubmitters().getSubmitterId(user.getId(),
                    comp_version_id, phase_id, true), is, comment);
        }
        return rv;
    }

    public static String stripHTML(String text) {

        for (int i = 0; i >= 0;) {
            i = text.indexOf("&");
            if (i >= 0) {
                text = text.substring(0, i) + "&amp" + text.substring(i + 1);
                i++;
            }
        }
        for (int i = 0; i >= 0;) {
            i = text.indexOf("<");
            if (i >= 0) {
                text = text.substring(0, i) + "&lt" + text.substring(i + 1);
                i++;
            }
        }
        for (int i = 0; i >= 0;) {
            i = text.indexOf(">");
            if (i >= 0) {
                text = text.substring(0, i) + "&gt" + text.substring(i + 1);
                i++;
            }
        }
        for (int i = 0; i >= 0;) {
            i = text.indexOf("\"");
            if (i >= 0) {
                text = text.substring(0, i) + "&quot" + text.substring(i + 1);
                i++;
            }
        }
        return text;
    }
}
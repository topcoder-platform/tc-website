/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.dde.request;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import javax.ejb.CreateException;
import javax.naming.NamingException;

import com.topcoder.apps.screening.ConfigHelper;
import com.topcoder.apps.screening.EJBHelper;
import com.topcoder.apps.review.persistence.Common;
import com.topcoder.apps.screening.PermissionHelper;
import com.topcoder.apps.screening.ProjectType;
import com.topcoder.apps.screening.ScreeningJob;
import com.topcoder.apps.screening.SpecificationScreeningRequest;
import com.topcoder.apps.screening.application.AppSpecification;
import com.topcoder.apps.screening.application.ApplicationSpecification;
import com.topcoder.dde.util.Constants;
import com.topcoder.servlet.request.FileDoesNotExistException;
import com.topcoder.servlet.request.PersistenceException;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.util.format.FormatMethodFactory;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.BaseProcessor;

/**
 * <strong>Purpose</strong>:
 * A processor to process the application specification file upload.
 *
 * @author pulky
 * @version 1.0.0
 */
public class UploadApplicationSpecificationTask extends BaseProcessor {

    /**
     * The buffer size for file copy.
     */
    public static final int BUFSIZE = 16384;

    /**
     * Process the dr upload application specification request.
     * Validates user to be an admin or have special specification submit permission, copies
     * the file and places the screening request.
     *
     * @throws TCWebException when errors occur.
     */
    protected void businessProcessing() throws TCWebException {
        try {
            if (getUser().isAnonymous()) {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            } else {
                if (!PermissionHelper.isAdmin(getUser())
                        && !PermissionHelper.hasSpecificationSubmitPermission(getUser())) {
                    throw new NavigationException("You are not authorized to view this page");
                }

                // process the uploaded file.
                String submissionPath = processUploadedFile();
                processApplicationSpecification(submissionPath);

                setNextPage("/applications/upload_results.jsp");
                setIsNextPageInContext(true);
            }
        } catch (TCWebException tcwe) {
            throw tcwe;
        } catch (Exception e) {
            throw new TCWebException("Internal error. Please inform TC.", e);
        }
    }

    /**
     * Process the uploaded file.
     *
     * Copies the file to a local folder.
     *
     * @return the file's path prefix.
     *
     * @throws TCWebException when errors occur.
     */
    private String processUploadedFile() throws TCWebException {
        MultipartRequest req = (MultipartRequest) getRequest();
        UploadedFile file = req.getUploadedFile("file1");

        String pathPrefix = "";
        try {
            pathPrefix = ConfigHelper.getSubmissionPathPrefix();
        } catch (Exception e){
            throw new TCWebException("Internal error. Please inform TC.", e);
        }

        if (file != null && file.getContentType() != null) {
            String destFilename = "";

            InputStream is = null;
            try {
                is = file.getInputStream();

                destFilename = "Application_" + getUser().getId() + "_" +
                    FormatMethodFactory.getDefaultDateFormatMethod("yyyy-MM-dd-HH-mm-ss-SSS").format(new Date()) + ".jar";

                copy(is, pathPrefix + destFilename);
            } catch (IOException ioe) {
                throw new TCWebException("Couldn't read uploaded file.", ioe);
            } catch (PersistenceException pe) {
                throw new TCWebException("Persistence exception.", pe);
            } catch (FileDoesNotExistException fe) {
                throw new TCWebException("File does not exist.", fe);
            } finally {
                try {
                    is.close();
                } catch (Exception e) {
                }
            }

            return pathPrefix + destFilename;
        } else {
            throw new NavigationException("Empty file uploaded");
        }
    }

    /**
     * Process the Application specification upload
     *
     * @param specificationPath the uploaded file's local path.
     *
     * @throws TCWebException when errors occur.
     */
    private void processApplicationSpecification(String specificationPath) throws TCWebException {
        ApplicationSpecification applicationSpecification = null;
        Connection conn = null;
        try {
            conn = Common.getDataSource().getConnection();
            AppSpecification appSpecification = EJBHelper.getAppSpecification();

            String remoteFileName = ((MultipartRequest) getRequest()).getUploadedFile("file1").getRemoteFileName();

            // saves the new specification to DB.
            applicationSpecification = new ApplicationSpecification(
                    -1, getUser().getId(), ApplicationSpecification.APPLICATION_SPECIFICATION,
                    false, 0, (new File(specificationPath)).toURL(), remoteFileName, null);
            appSpecification.insertSpecification(conn, applicationSpecification);

            // places a screening request so the specification will be screened asynchronously.
            SpecificationScreeningRequest specificationScreeningRequest =
                new SpecificationScreeningRequest(
                -1, getUser().getId(),
                applicationSpecification.getSpecificationId(),
                specificationPath,
                ProjectType.APPLICATION);
            ScreeningJob.placeRequest(specificationScreeningRequest, conn);
        } catch (NamingException ne) {
            throw new TCWebException("Internal error. Please inform TC.", ne);
        } catch (RemoteException re) {
            throw new TCWebException("Internal error. Please inform TC.", re);
        } catch (CreateException ce) {
            throw new TCWebException("Internal error. Please inform TC.", ce);
        } catch (SQLException sqle) {
            throw new TCWebException("Could not create the specification screening request.", sqle);
        } catch (MalformedURLException murle) {
            throw new TCWebException("Could not create the remote file.", murle);
        } catch (PersistenceException pe) {
            throw new TCWebException("Persistence exception.", pe);
        } catch (FileDoesNotExistException fe) {
            throw new TCWebException("File does not exist.", fe);
        } finally {
            Common.close(conn);
        }

        getRequest().setAttribute(Constants.SPECIFICATION_KEY, String.valueOf(applicationSpecification.getSpecificationId()));
    }

    /**
     * Utility method to copy a file under a new name.
     *
     * @param source the source inputstream
     * @param destname the destination filename
     *
     * @throws IOException if an I/O error occurs
     */
    private static void copy(InputStream source, String destname) throws IOException {
        File dest = new File(destname);

        FileOutputStream fos = new FileOutputStream(dest);
        byte[] buf = new byte[BUFSIZE];
        int read = 0;
        while ((read = source.read(buf)) != -1) {
            fos.write(buf, 0, read);
        }
        fos.close();
    }
}

/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.security.TCPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.FileTypeCatalogDAO;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.comp.Document;
import com.topcoder.web.common.model.comp.FileType;
import com.topcoder.web.common.model.comp.MimeType;
import com.topcoder.web.common.model.comp.Project;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.util.Util;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * <p>A controller to be used for handling the requests for downloading the documents for <code>Studio</code> contests
 * hosted by <code>tcs_catalog</code> database.</p>
 *
 * <p>
 * Version 1.1 (Re-platforming Studio Release 4 Assembly 1.0) Change notes:
 *   <ol>
 *     <li>The mime types are read from <code>mime_type_lu</code> database table.</li>
 *   </ol>
 * </p>
 *  
 * @author isv, pvmagacho
 * @version 1.1
 */
public class DownloadCatalogDocument extends ShortHibernateProcessor {

    /**
     * <p>Constructs new <code>DownloadCatalogDocument</code> instance. This implementation does nothing.</p>
     */
    public DownloadCatalogDocument() {
    }

    /**
     * <p>Implements the logic for retrieving the desired document and outputting it's content to client.</p>
     * 
     * @throws Exception if an unexpected error occurs.
     */
    @Override
    protected void dbProcessing() throws Exception {
        Long documentId;
        Long contestId;

        if (!userLoggedIn()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        try {
            documentId = new Long(getRequest().getParameter(Constants.DOCUMENT_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Document Specified");
        }
        
        try {
            contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Contest Specified");
        }

        DAOFactory factory = DAOUtil.getFactory();
        Project project = factory.getProjectDAO().find(contestId.intValue());
        if (project == null) {
            throw new NavigationException("The specified project doesn't exist");
        }
        
        Document d = null;
        Set<Document> documents = project.getDocuments();
        for (Document document : documents) {
            if (document.getId().equals(documentId)) {
                d = document;
                break;
            }
        }
        if (d == null) {
            throw new NavigationException("The specified document doesn't exist");
        }

        // don't check permissions for admins
        if (!isAdmin()) {
            // check if the user is registered for any contest that uses this documentation, or any of those contests is over.
            User u = DAOUtil.getFactory().getUserDAO().find(getUser().getId());
            boolean isRegistered = false;
            boolean hasPermission = false;
            if ((Project.STATUS_ACTIVE.equals(project.getStatusId()) 
                 && RegistrationHelper.getSubmitterResource(project, u.getId()) != null) 
                || new Date().after(project.getEndTime())) {
                isRegistered = true;
            } else if (Util.hasCockpitPermissions(getUser().getId(), project.getId())) {
                hasPermission = true;
                log.debug("allow download, they have cockpit permissions");
            }

            if (!isRegistered && !hasPermission) {
                    throw new NavigationException("User needs to be registered or has permission to the project in " +
                                                  "order to download documents.");
            }
        }

        //stream it out via the response
        getResponse().addHeader("content-disposition", "inline; filename=\"" + d.getShortName() + "\"");
        String mimeType = "";
        String filename = d.getShortName();
        int idxExtension = filename.lastIndexOf(".");
        if (idxExtension != -1) {
            String extension = filename.substring(idxExtension, filename.length()).toLowerCase();
            MimeType mimeTypeObject = getMimeType(extension);
            if (mimeTypeObject != null) {
                mimeType = mimeTypeObject.getDescription();
            }
        }
        getResponse().setContentType(mimeType);

        ServletOutputStream sos = getResponse().getOutputStream();

        StringBuilder filePath = new StringBuilder(Constants.DOCUMENTS_DIRECTORY_NAME);
        if (!filePath.toString().endsWith(File.separator)) {
            filePath.append(File.separator);
        }
        filePath.append(d.getUrl());
        FileInputStream fis = new FileInputStream(filePath.toString());

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

    /**
     * <p>Gets the mime type for specified filename extension.</p>
     * 
     * @param filenameExtension a <code>String</code> providing the filename extension.
     * @return a <code>MimeType</code> mapped to specified extension. 
     * @since 1.1
     */
    private MimeType getMimeType(String filenameExtension) {
        FileTypeCatalogDAO fileTypeCatalogDAO = DAOUtil.getFactory().getFileTypeCatalogDAO();
        List<FileType> fileTypes = fileTypeCatalogDAO.getFileTypes();
        for (FileType fileType : fileTypes) {
            String fileTypeExtension = fileType.getExtension();
            if (filenameExtension.equals("." + filenameExtension)) {
                Set<MimeType> mimeTypes = fileType.getMimeTypes();
                if (mimeTypes != null) {
                    if (!mimeTypes.isEmpty()) {
                        return mimeTypes.iterator().next();
                    }
                }
            }
        }
        return null;
    }

    /**
     * <p>Checks if current user is granted administrator role.</p>
     * 
     * @return <code>true</code> if current user is administrator; <code>false</code> otherwise.
     * @throws Exception if an unexpected error occurs.
     */
    private boolean isAdmin() throws Exception {
        TCSubject subject = SecurityHelper.getUserSubject(getUser().getId());
        boolean found = false;
        for (Iterator it = subject.getPrincipals().iterator(); it.hasNext() && !found;) {
            found = ((TCPrincipal) it.next()).getId() == Constants.CONTEST_ADMIN_ROLE_ID;
        }
        return found;
    }
}

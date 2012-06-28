/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.util;

import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dto.UploadProgressInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>A default implementation for interface for the listeners to be notified on single <code>Studio</code> submission 
 * uploading progress.</p>
 * 
 * @author isv
 * @version 1.0 (Upload Progress Bar assembly)
 */
public class SubmissionUploadProgressTracker implements SubmissionUploadListener {

    /**
     * <p>An <code>HttpServletRequest</code> representing the incoming request from the client.</p>
     */
    private HttpServletRequest request;
    
    /**
     * <p>Constructs new <code>SubmissionUploadProgressTracker</code> instance. This implementation does nothing.</p>
     * 
     * @param request an <code>HttpServletRequest</code> representing the incoming request from the client.
     * @throws IllegalArgumentException if specified <code>request</code> is <code>null</code>.
     */
    public SubmissionUploadProgressTracker(HttpServletRequest request) {
        if (request == null) {
            throw new IllegalArgumentException("The parameter [request] is NULL");
        }
        this.request = request;
    }

    /**
     * <p>Notifies this listener when uploading starts.</p>
     * 
     * @param bytesTotal a <code>long</code> providing the total number of bytes for submission upload.
     */
    public void onStart(long bytesTotal) {
        String uploadId = this.request.getParameter(Constants.UPLOAD_ID);
        HttpSession session = this.request.getSession();
        Map<String, UploadProgressInfo> uploads 
            = (Map<String, UploadProgressInfo>) session.getAttribute(UploadProgressInfo.SESSION_ATTR);
        if (uploads == null) {
            uploads = new HashMap<String, UploadProgressInfo>();
            session.setAttribute(UploadProgressInfo.SESSION_ATTR, uploads);
        }

        UploadProgressInfo uploadProgressInfo = uploads.get(uploadId);
        if (uploadProgressInfo == null) {
            uploadProgressInfo = new UploadProgressInfo();
            uploadProgressInfo.setStartTime(new Date());
            uploadProgressInfo.setTotalLength(bytesTotal);
            uploads.put(uploadId, uploadProgressInfo);
        }
    }

    /**
     * <p>Notifies this listener when next portion of bytes is read from the request.</p>
     * 
     * @param bytesRead a <code>long</code> providing the number of bytes read from request.
     */
    public void onRead(long bytesRead) {
        UploadProgressInfo uploadProgressInfo = getUploadProcessInfo();
        uploadProgressInfo.addBytesUploaded(bytesRead);
    }

    /**
     * <p>Notifies this listener when uploading is finished.</p>
     */
    public void onFinish() {
        UploadProgressInfo uploadProgressInfo = getUploadProcessInfo();
        uploadProgressInfo.setEndTime(new Date());
    }

    /**
     * <p>Gets the details on progress for the upload mapped to current request.</p>
     * 
     * @return a <code>UploadProgressInfo</code> mapped to current request. 
     */
    private UploadProgressInfo getUploadProcessInfo() {
        String uploadId = this.request.getParameter(Constants.UPLOAD_ID);
        HttpSession session = this.request.getSession();
        Map<String, UploadProgressInfo> uploads 
            = (Map<String, UploadProgressInfo>) session.getAttribute(UploadProgressInfo.SESSION_ATTR);
        return uploads.get(uploadId);
    }
}

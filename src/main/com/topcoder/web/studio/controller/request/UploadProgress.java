/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.json.object.io.JSONEncoder;
import com.topcoder.json.object.io.StandardJSONEncoder;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dto.UploadProgressInfo;

import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;

/**
 * <p>A controller for servicing the requests for getting the current status of process of uploading a single Studio
 * submission. Responds with JSON presentation of the current progress info for requested upload.</p>
 * 
 * @author isv
 * @version 1.0 (Upload Progress Bar assembly)
 */
public class UploadProgress extends BaseProcessor {

    /**
     * <p>A <code>Logger</code> to be used for logging the events while servicing the requests.</p>
     */
    private static final Logger log = Logger.getLogger(UploadProgress.class);

    /**
     * <p>Constructs new <code>UploadProgress</code> instance. This implementation does nothing.</p>
     */
    public UploadProgress() {
    }

    /**
     * <p>Handles the incoming request.</p>
     * 
     * @throws Exception if an unexpected error occurs.
     */
    @Override
    protected void businessProcessing() throws Exception {
        TCRequest request = getRequest();
        HttpSession session = request.getSession();
        String uploadId = request.getParameter(Constants.UPLOAD_ID);
        Map<String, UploadProgressInfo> uploads 
            = (Map<String, UploadProgressInfo>) session.getAttribute(UploadProgressInfo.SESSION_ATTR);
        
        if ((uploads != null) && (uploads.containsKey(uploadId))) {
            // Get the current status for requested upload and convert it to JSON presentation
            UploadProgressInfo uploadProgressInfo = uploads.get(uploadId);
            JSONEncoder jsonEncoder = new StandardJSONEncoder();
            String jsonString = jsonEncoder.encode(uploadProgressInfo.toJSON());
            if (log.isDebugEnabled()) {
                log.debug("Current progress info for upload " + uploadId + ": " + jsonString);
            }

            // Write JSON presentation to response
            TCResponse response = getResponse();
            response.setContentType("text/json");
            PrintWriter responseWriter = response.getWriter();
            responseWriter.write(jsonString);
            response.flushBuffer();
        } else {
            if (log.isDebugEnabled()) {
                log.debug("Could not find progress info for requested upload: " + uploadId);
            }
        }
    }

    /**
     * <p>Removes the progress info fdr specified upload from session associated with the specified request.</p>
     * 
     * @param request a <code>TCRequest</code> wrapping the incoming request from the client. 
     * @param uploadId a <code>String</code> providing the ID of an upload to remove progress info for.
     */
    public static void cleanup(TCRequest request, String uploadId) {
        HttpSession session = request.getSession();
        Map<String, UploadProgressInfo> uploads 
            = (Map<String, UploadProgressInfo>) session.getAttribute(UploadProgressInfo.SESSION_ATTR);
        if ((uploads != null) && (uploads.containsKey(uploadId))) {
            uploads.remove(uploadId);
        }
    }
}

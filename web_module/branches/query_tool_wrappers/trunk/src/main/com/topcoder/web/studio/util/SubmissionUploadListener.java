/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.util;

/**
 * <p>An interface for the listeners to be notified on single <code>Studio</code> submission uploading progress.</p>
 * 
 * @author isv
 * @version 1.0 (Upload Progress Bar assembly)
 */
public interface SubmissionUploadListener {

    /**
     * <p>Notifies this listener when uploading starts.</p>
     * 
     * @param bytesTotal a <code>long</code> providing the total number of bytes for submission upload.
     */
    void onStart(long bytesTotal);
    
    /**
     * <p>Notifies this listener when next portion of bytes is read from the request.</p>
     * 
     * @param bytesRead a <code>long</code> providing the number of bytes read from request.
     */
    void onRead(long bytesRead);
    
    /**
     * <p>Notifies this listener when uploading is finished.</p>
     */
    void onFinish();
}

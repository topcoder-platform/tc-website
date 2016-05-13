/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import java.io.InputStream;

/**
 * Retrieval class used by the Model classes to return a submission input stream for download.
 *
 * @author adic
 * @version 1.0
 */
public class SubmissionDownloadRetrieval extends SuccessResult {

    /**
     * The filename that the downloader should see instead of the local filename.
     */
    private String userFilename = null;

    /**
     * The input stream for the submission data.
     */
    private InputStream inputStream = null;

    /**
     * Constructor.
     *
     * @param userFilename the filename that the downloader should see instead of the local filename
     * @param inputStream the input stream for the submission data
     */
    SubmissionDownloadRetrieval(String userFilename, InputStream inputStream) {
        this.userFilename = userFilename;
        this.inputStream = inputStream;
    }

    /**
     * Return the filename that the downloader should see instead of the local filename.
     *
     * @return the filename
     */
    public String getUserFilename() {
        return userFilename;
    }

    /**
     * Return the input stream for the submission data.
     *
     * @return the input stream
     */
    public InputStream getSubmissionInputStream() {
        return inputStream;
    }

}


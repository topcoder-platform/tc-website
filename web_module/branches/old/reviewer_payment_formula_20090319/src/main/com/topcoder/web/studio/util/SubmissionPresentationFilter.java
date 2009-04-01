/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.util;

import java.io.File;
import java.io.FilenameFilter;

/**
 * <p>A filename filter to be used for finding the file for specified type of alternate presentation of specified
 * submission.</p>
 *
 * @author isv
 * @version 1.1
 * @since TopCoder Studio Modifications Assembly (Req# 5.8, 5.11)
 */
public class SubmissionPresentationFilter implements FilenameFilter {

    /**
     * <p>A <code>String</code> providing the prefix for the filenames to be used for filtering the files.</p>
     */
    private String filenamePrefix = null;

    /**
     * <p>Constructs new <code>SubmissionPresentationFilter</code> instance for finding the file matching the specified
     * prefix.</p>
     *
     * @param filenamePrefix a <code>String</code> providing the filter for file names.
     * @since Studio Submission Slideshow
     */
    public SubmissionPresentationFilter(String filenamePrefix) {
        this.filenamePrefix = filenamePrefix;
    }

    /**
     * <p>Constructs new <code>SubmissionPresentationFilter</code> instance for finding the file for specified type
     * of alternate presentation of specified submission.</p>
     *
     * @param type a <code>String</code> referencing the type of requested alternate presentation.
     * @param submissionId a <code>Long</code> providing the ID of a submission.
     */
    public SubmissionPresentationFilter(String type, Long submissionId) {
        this.filenamePrefix = submissionId + "_" + type + ".";
    }

    /**
     * <p>Tests if a specified file should be included in a file list.</p>
     *
     * @param dir a <code>File</code> representing the directory in which the file was found.
     * @param name a <code>String</code> providing name the name of the file.
     * @return <code>true</code> if and only if the name should be included in the file list; <code>false</code>
     *         otherwise.
     */
    public boolean accept(File dir, String name) {
        return name.startsWith(this.filenamePrefix);
    }
}

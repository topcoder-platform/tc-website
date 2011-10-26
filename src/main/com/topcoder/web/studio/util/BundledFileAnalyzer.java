/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import com.topcoder.web.studio.dto.FileType;

/**
 * <p>An interface for the analyzers of the bundled files of types supported by <code>TopCoder Studio</code>
 * application. Such analyzers are provided with a content of the bundled file and are responsible for parsing that
 * content in accordance with file type specific format and retrieving any necessary details.</p>
 *
 * <p>
 *   Version 1.1 (Re-platforming Studio Release 3 Assembly) Change notes:
 *   <ol>
 *     <li>Updated the logic to use contests hosted in <code>tcs_catalog</code> database instead of
 *     <code>studio_oltp</code> database.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.2 (Replatforming Studio Release 5) change notes:
 *   <ol>
 *     <li>Using the dto classes in com.topcoder.web.studio.dto package instead of in com.topcoder.web.common.model.comp package.</li>
 *   </ol>
 * </p>
 *
 * @author isv, pvmagacho, TCSASSEMBER
 * @version 1.2
 * @since TopCoder Studio Modifications Assembly (Req# 5.6, 5.7)
 */
public interface BundledFileAnalyzer {

    /**
     * <p>Analyzes the provided content of the bundled file and extracts all necessary details.</p>
     *
     * @param content an <code>InputStream</code> providing the content of the submission file.
     * @param retrieveFiles <code>true</code> if the analyzer must retrieve and uncompress the content of desired files;
     *        <code>false</code> otherwise.
     * @throws IOException if an I/O error occurs while reading the content.
     */
    void analyze(InputStream content, boolean retrieveFiles) throws IOException;

    /**
     * <p>Checks if the native submission is available from analyzed bundled file or not.</p>
     *
     * @return <code>true</code> if native submission is available from analyzed bundled file; <code>false</code>
     *         otherwise.
     */
    boolean isNativeSubmissionAvailable();

    /**
     * <p>Checks if the preview image is available from analyzed bundled file or not.</p>
     *
     * @return <code>true</code> if preview image file is available from analyzed bundled file; <code>false</code>
     *         otherwise.
     */
    boolean isPreviewImageAvailable();

    /**
     * <p>Checks if the preview file is available from analyzed bundled file or not.</p>
     *
     * @return <code>true</code> if preview file is available from analyzed bundled file; <code>false</code>
     *         otherwise.
     */
    boolean isPreviewFileAvailable();

    /**
     * <p>Gets the content of the preview image if available from the analyzed file.</p>
     *
     * @return a <code>byte</code> array providing the uncompressed content of the preview image.
     * @throws IllegalStateException if the preview image is not available in analyzed file.
     */
    byte[] getPreviewImageContent();

    /**
     * <p>Gets the content of the bundled submission if available from the analyzed file.</p>
     *
     * @return a <code>byte</code> array providing the uncompressed content of the bundled submission.
     * @throws IllegalStateException if the bundled submission is not available in analyzed file.
     */
    byte[] getPreviewFileContent();

    /**
     * <p>Gets the path to preview image if available from the analyzed file.</p>
     *
     * @return a <code>String</code> providing the path to preview image in the bundled submission.
     * @throws IllegalStateException if the bundled submission is not available in analyzed file.
     */
    String getPreviewImagePath();

    /**
     * <p>Gets the path to preview file if available from the analyzed file.</p>
     *
     * @return a <code>String</code> providing the path to preview file in the bundled submission.
     * @throws IllegalStateException if the bundled submission is not available in analyzed file.
     */
    String getPreviewFilePath();

    /**
     * <p>Gets the file type for preview image if available from the analyzed file.</p>
     *
     * @return a <code>StudioFileType</code> representing the filee type for preview image in the bundled submission.
     * @throws IllegalStateException if the bundled submission is not available in analyzed file.
     */
    FileType getPreviewImageFileType();

    /**
     * <p>Gets the details for the files bundled within the specified content of the bundled file.</p>
     *
     * @param content a <code>byte</code> array providing the content of the bundled file.  
     * @return a <code>Map</code> mapping the names of the files to content of the respective files.
     * @throws IOException if an I/O error occurs while reading the content.
     */
    Map<String, byte[]> getFiles(byte[] content) throws IOException;

}

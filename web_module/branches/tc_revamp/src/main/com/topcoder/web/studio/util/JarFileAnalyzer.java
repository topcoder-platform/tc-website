/*
 * Copyright (C) 2008 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.ByteArrayInputStream;
import java.util.jar.JarInputStream;
import java.util.Map;

/**
 * <p>An analyzer for <code>Java</code> archives. Maps to {@link StudioFileType#JAR_ARCHIVE_TYPE_ID} file type.</p>
 *
 * <p>
 *   Version 1.1 (Re-platforming Studio Release 3 Assembly) Change notes:
 *   <ol>
 *     <li>Updated the logic to use contests hosted in <code>tcs_catalog</code> database instead of
 *     <code>studio_oltp</code> database.</li>
 *   </ol>
 * </p>
 *
 * @author isv, pvmagacho
 * @version 1.1
 * @since TopCoder Studio Modifications Assembly (Req# 5.6, 5.7)
 */
public class JarFileAnalyzer extends ZipFileAnalyzer {

    /**
     * <p>Constructs new <code>SubmissionValidator$JarFileAnalyzer</code> instance. This implementation does
     * nothing.</p>
     */
    public JarFileAnalyzer() {
        super();
    }

    /**
     * <p>Analyzes the provided content of the bundled file and extracts all necessary details.</p>
     *
     * @param content an <code>InputStream</code> providing the content of the submission file.
     * @param retrieveFiles <code>true</code> if the analyzer must retrieve and uncompress the content of desired files;
     *        <code>false</code> otherwise.
     * @throws IOException if an I/O error occurs while reading the content.
     */
    public void analyze(InputStream content, boolean retrieveFiles) throws IOException {
        super.analyze(new JarInputStream(content), retrieveFiles);
    }

    /**
     * <p>Gets the details for the files bundled within the specified content of the bundled file.</p>
     *
     * @param content a <code>byte</code> array providing the content of the bundled file.
     * @return a <code>Map</code> mapping the names of the files to content of the respective files.
     * @throws IOException if an I/O error occurs while reading the content.
     * @since Studio Submission Slideshow
     */
    public Map<String, byte[]> getFiles(byte[] content) throws IOException {
        return getFiles(new JarInputStream(new ByteArrayInputStream(content)));
    }
}

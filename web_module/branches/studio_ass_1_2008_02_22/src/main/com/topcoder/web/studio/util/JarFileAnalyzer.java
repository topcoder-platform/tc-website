/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.util;

import com.topcoder.web.studio.model.StudioFileType;

import java.io.IOException;
import java.io.InputStream;
import java.util.jar.JarInputStream;

/**
 * <p>An analyzer for <code>Java</code> archives. Maps to {@link StudioFileType#JAR_ARCHIVE_TYPE_ID} file type.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly (Req# 5.6, 5.7)
 */
public class JarFileAnalyzer extends ZipFileAnalyzer {

    /**
     * <p>Constructs new <code>SubmissionValidator$JarFileAnalyzer</code> instance. This implementation does
     * nothing.</p>
     */
    public JarFileAnalyzer() {
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
        analyze(new JarInputStream(content), retrieveFiles);
    }
}

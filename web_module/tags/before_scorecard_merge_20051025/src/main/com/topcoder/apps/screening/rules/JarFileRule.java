/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening.rules;

import java.io.File;
import com.topcoder.file.type.MagicNumbers;
import com.topcoder.file.type.FileType;
import com.topcoder.util.archiving.ArchiveUtility;
import com.topcoder.util.archiving.ZipArchiver;
import com.topcoder.apps.screening.ScreeningRule;
import com.topcoder.apps.screening.ScreeningLogger;
import com.topcoder.apps.screening.ResponseCode;
import com.topcoder.apps.screening.SimpleScreeningData;

/**
 * <strong>Purpose</strong>:
 * Checks if the submission is a jar file, and extracts the content to the root.
 *
 * @author WishingBone
 * @version 1.0
 */
public class JarFileRule implements ScreeningRule {

    /**
     * <strong>Purpose</strong>:
     * Screen the submission. Both the file and the root directory are given. Screening responses
     * are written to the ScreeningLogger instance.
     *
     * @param file the file to screen.
     * @param root the root dir of the extracted submission.
     * @param logger the logger to write responses to.
     */
    public boolean screen(File file, File root, ScreeningLogger logger) {
        try {
            if (!file.getName().toLowerCase().endsWith(".jar")) {
                logger.log(new SimpleScreeningData(ResponseCode.NON_JAR_FILE));
                return false;
            }

            FileType type = new MagicNumbers().determineFileType(file);
            if (type == null || !type.getMime().equals("application/zip")) {
                logger.log(new SimpleScreeningData(ResponseCode.NON_JAR_FILE));
                return false;
            }

            root.mkdir();
            ArchiveUtility au = new ArchiveUtility(file, new ZipArchiver());
            au.extractContents(root);

            return true;
        } catch (Exception ex) {
            logger.log(new SimpleScreeningData("Unable to extract from JAR file.", ResponseCode.NON_JAR_FILE));
        }
        return false;
    }

}

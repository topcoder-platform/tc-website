/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening.rules;
import java.io.File;
import com.topcoder.apps.screening.ScreeningRule;
import com.topcoder.apps.screening.ScreeningLogger;
import com.topcoder.apps.screening.ResponseCode;
import com.topcoder.apps.screening.SimpleScreeningData;

/**
 * <strong>Purpose</strong>:
 * Checks if the log directory exists and contains a plain text log and an xml log.
 *
 * @author WishingBone
 * @version 1.0
 */
public class TestLogRule implements ScreeningRule {

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
            File log = new File(root, "log");
            if (!log.exists() || !log.isDirectory()) {
                logger.log(new SimpleScreeningData(ResponseCode.NO_LOG_DIR));
                return false;
            }

            boolean plainText = false;
            boolean xml = false;
            File[] files = log.listFiles();
            for (int i = 0; i < files.length; ++i) {
                if (files[i].isFile() && files[i].length() > 0) {
                    String name = files[i].getName().toLowerCase();
                    if (name.endsWith(".txt")) {
                        plainText = true;
                    }
                    if (name.endsWith(".xml")) {
                        xml = true;
                    }
                }
            }

            if (!plainText) {
                logger.log(new SimpleScreeningData("The plain text log does not exist.", ResponseCode.NO_LOG_FILES));
            }
            if (!xml) {
                logger.log(new SimpleScreeningData("The xml log does not exist.", ResponseCode.NO_LOG_FILES));
            }
            return plainText && xml;
        } catch (Exception ex) {
            logger.log(new SimpleScreeningData("Failed to validate log files.", ResponseCode.NO_LOG_FILES));
        }
        return false;
    }

}

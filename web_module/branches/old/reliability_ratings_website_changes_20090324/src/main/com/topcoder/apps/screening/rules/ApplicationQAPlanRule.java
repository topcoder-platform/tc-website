/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.screening.rules;

import com.topcoder.apps.screening.*;
import com.topcoder.file.type.FileType;
import com.topcoder.file.type.MagicNumbers;

import java.io.File;

/**
 * <strong>Purpose</strong>:
 * Checks if the application specification has the QA plan.
 *
 * @author pulky
 * @version 1.0.0
 */
public class ApplicationQAPlanRule implements ScreeningRule {

    /**
     * <strong>Purpose</strong>:
     * Screen the submission. Both the file and the root directory are given. Screening responses
     * are written to the ScreeningLogger instance.
     *
     * @param file   the file to screen.
     * @param root   the root dir of the extracted submission.
     * @param logger the logger to write responses to.
     * @return true if the rule succedeed.
     * @throws DatabaseException if screening process got DatabaseException.
     */
    public boolean screen(File file, File root, ScreeningLogger logger) {
        try {
            File docs = new File(root, "docs/specification");
            if (!docs.exists() || !docs.isDirectory()) {
                logger.log(new SimpleScreeningData(ResponseCode.NO_QA_PLAN));
                return false;
            }

            File[] files = docs.listFiles();
            MagicNumbers magic = null;
            for (int i = 0; i < files.length; ++i) {
                if (files[i].isFile() && files[i].length() > 0) {
                    String name = files[i].getName().toLowerCase();
                    if (name.indexOf("qa") >= 0 && name.indexOf("plan") >= 0 && name.endsWith(".rtf")) {
                        if (magic == null) {
                            magic = new MagicNumbers();
                        }
                        FileType type = magic.determineFileType(files[i]);
                        if (type != null && type.getMime().equals("application/rtf")) {
                            return true;
                        }
                    }
                }
            }

            logger.log(new SimpleScreeningData(ResponseCode.NO_QA_PLAN));
            return false;
        } catch (DatabaseException dbe) {
            // propagate database exception so submission would be rescreened.
            throw dbe;
        } catch (Exception ex) {
            logger.log(new SimpleScreeningData("Failed to validate QA Plan.", ResponseCode.NO_QA_PLAN));
        }
        return false;
    }

}

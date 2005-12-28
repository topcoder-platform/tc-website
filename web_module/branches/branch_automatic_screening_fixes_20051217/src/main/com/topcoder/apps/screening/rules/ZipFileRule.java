/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening.rules;
import com.topcoder.shared.util.logging.Logger; // plk

import com.topcoder.apps.screening.ScreeningJob; // plk

import java.io.File;
import com.topcoder.util.exec.Exec;
import com.topcoder.file.type.MagicNumbers;
import com.topcoder.file.type.FileType;
import com.topcoder.util.archiving.ArchiveUtility;
import com.topcoder.util.archiving.ZipArchiver;
import com.topcoder.apps.screening.ScreeningRule;
import com.topcoder.apps.screening.ScreeningLogger;
import com.topcoder.apps.screening.ResponseCode;
import com.topcoder.apps.screening.SimpleScreeningData;
import com.topcoder.apps.screening.DatabaseException;

/**
 * <strong>Purpose</strong>:
 * Checks if the submission is a zip file, and extracts the content to the root.
 *
 * Version 1.0.1 Change notes:
 * <ol>
 * <li>
 * DatabaseException is catched and propagated to the ScreeningTool class.
 * </li>
 * </ol>
 *
 * @author WishingBone, pulky
 * @version 1.0.1
 */
public class ZipFileRule implements ScreeningRule {

    /**
     * <strong>Purpose</strong>:
     * Screen the submission. Both the file and the root directory are given. Screening responses
     * are written to the ScreeningLogger instance.
     *
     * @param file the file to screen.
     * @param root the root dir of the extracted submission.
     * @param logger the logger to write responses to.
     *
     * @return true if the rule succedeed.
     *
     * @throws DatabaseException if screening process got DatabaseException.
     */
    public boolean screen(File file, File root, ScreeningLogger logger) {
        try {
            Logger log = null; // plk
            log = Logger.getLogger(ScreeningJob.class); // plk
            log.info("/usr/bin/unzip " + file.getAbsolutePath() + "-d " + root.getAbsolutePath()); // plk

            if (!file.getName().toLowerCase().endsWith(".zip")) {
                logger.log(new SimpleScreeningData(ResponseCode.NON_ZIP_FILE));
                return false;
            }

            FileType type = new MagicNumbers().determineFileType(file);
            if (type == null || !type.getMime().equals("application/zip")) {
                logger.log(new SimpleScreeningData(ResponseCode.NON_ZIP_FILE));
                return false;
            }

            root.mkdir();

            //ExecutionResult er = Exec.execute(new String[] {command, file.getAbsolutePath()}, timeout * 1000);

            ArchiveUtility au = new ArchiveUtility(file, new ZipArchiver());
            au.extractContents(root);

            return true;
        } catch (DatabaseException dbe) {
            // propagate database exception so submission would be rescreened.
            throw dbe;
        } catch (Exception ex) {
            logger.log(new SimpleScreeningData("Unable to extract from ZIP file.", ResponseCode.NON_ZIP_FILE));
        }
        return false;
    }

}

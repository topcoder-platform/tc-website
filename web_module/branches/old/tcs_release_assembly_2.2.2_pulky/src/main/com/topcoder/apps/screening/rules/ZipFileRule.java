/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening.rules;

import java.io.File;
import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.exec.Exec;
import com.topcoder.util.exec.ExecutionException;
import com.topcoder.util.exec.ExecutionResult;
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
     * The namespace for the configuration.
     *
     * @since 1.0.1
     */
    private static final String NAMESPACE = "com.topcoder.apps.screening.rules.ZipFileRule";

    /**
     *
     * @since 1.0.1
     * The name of the property in the configuration file that contains the unzip command.
     */
    private static final String UNZIP_PROPERTY_NAME = "unzip_command";

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
            if (!file.getName().toLowerCase().endsWith(".zip")) {
                logger.log(new SimpleScreeningData(ResponseCode.NON_ZIP_FILE));
                return false;
            }

            FileType type = new MagicNumbers().determineFileType(file);
            if (type == null || !type.getMime().equals("application/zip")) {
                logger.log(new SimpleScreeningData(ResponseCode.NON_ZIP_FILE));
                return false;
            }

            // unzips the file using external tool
            ConfigManager cm = ConfigManager.getInstance();
            String command = cm.getString(NAMESPACE, UNZIP_PROPERTY_NAME);
            command += " " + file.getAbsolutePath() + " -d " + root.getAbsolutePath();

            ExecutionResult er = null;
            try {
                er = Exec.execute(new String[] {command});
            } catch (ExecutionException ee) {
            }
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

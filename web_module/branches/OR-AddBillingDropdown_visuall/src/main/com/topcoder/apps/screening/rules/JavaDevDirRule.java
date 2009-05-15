/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening.rules;

import com.topcoder.apps.screening.*;
import com.topcoder.file.directoryvalidator.DirectoryManager;
import com.topcoder.file.directoryvalidator.XmlFileLoader;

import java.io.File;

/**
 * <strong>Purpose</strong>:
 * Checks if the submission conforms to proper directory structure.
 * <p/>
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
public class JavaDevDirRule implements ScreeningRule {

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
            MyValidationLogger vLogger = new MyValidationLogger(logger);
            new DirectoryManager(vLogger).validate(
                    new XmlFileLoader(new File(ClassLoader.getSystemResource(
                            "com/topcoder/apps/screening/rules/JavaDevDirRule.xml").toString().substring(5))),
                    root.getAbsolutePath());
            return vLogger.isSuccessful();
        } catch (DatabaseException dbe) {
            // propagate database exception so submission would be rescreened.
            throw dbe;
        } catch (Exception ex) {
            logger.log(new SimpleScreeningData("Failed to validate directory structure.", ResponseCode.INVALID_DIRECTORY));
        }
        return false;
    }

}

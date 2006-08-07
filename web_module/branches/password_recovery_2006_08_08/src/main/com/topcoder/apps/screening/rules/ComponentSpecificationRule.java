/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening.rules;

import com.topcoder.apps.screening.*;
import com.topcoder.file.type.FileType;
import com.topcoder.file.type.MagicNumbers;

import java.io.File;

/**
 * <strong>Purpose</strong>:
 * Checks if a component specification exists.
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
public class ComponentSpecificationRule implements ScreeningRule {

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
            File docs = new File(root, "docs");
            if (!docs.exists() || !docs.isDirectory()) {
                logger.log(new SimpleScreeningData(ResponseCode.NO_COMP_SPEC));
                return false;
            }

            File[] files = docs.listFiles();
            MagicNumbers magic = null;
            for (int i = 0; i < files.length; ++i) {
                if (files[i].isFile() && files[i].length() > 0) {
                    String name = files[i].getName().toLowerCase();
                    if (name.indexOf("component") >= 0 && name.indexOf("specification") >= 0 && name.endsWith(".rtf")) {
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

            logger.log(new SimpleScreeningData(ResponseCode.NO_COMP_SPEC));
            return false;
        } catch (DatabaseException dbe) {
            // propagate database exception so submission would be rescreened.
            throw dbe;
        } catch (Exception ex) {
            logger.log(new SimpleScreeningData("Failed to validate component specification.", ResponseCode.NO_COMP_SPEC));
        }
        return false;
    }

}

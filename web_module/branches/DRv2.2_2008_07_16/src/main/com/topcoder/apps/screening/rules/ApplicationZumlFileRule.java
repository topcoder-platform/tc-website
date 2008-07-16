/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.screening.rules;
import com.topcoder.file.type.MagicNumbers;
import com.topcoder.file.type.FileType;
import java.io.File;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.archiving.ArchiveUtility;
import com.topcoder.util.archiving.ZipArchiver;
import com.topcoder.apps.screening.ScreeningRule;
import com.topcoder.apps.screening.ScreeningLogger;
import com.topcoder.apps.screening.ResponseCode;
import com.topcoder.apps.screening.SimpleScreeningData;
import com.topcoder.apps.screening.DatabaseException;
import com.topcoder.apps.screening.applications.specification.ValidationManager;
import com.topcoder.apps.screening.applications.specification.ValidationOutput;
import com.topcoder.apps.screening.applications.specification.ValidationOutputType;
import com.topcoder.apps.screening.applications.specification.impl.formatters.TextValidationOutputFormatter;

/**
 * <strong>Purpose</strong>:
 * Checks the application specification zuml.
 *
 * @author pulky
 * @version 1.0.0
 */
public class ApplicationZumlFileRule implements ScreeningRule {

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
            File docs = new File(root, "docs/specification");
            if (!docs.exists() || !docs.isDirectory()) {
                logger.log(new SimpleScreeningData(ResponseCode.NO_ZUML));
                return false;
            }

            File[] files = docs.listFiles();
            MagicNumbers magic = null;
            for (int i = 0; i < files.length; ++i) {
                if (files[i].isFile() && files[i].length() > 0) {
                    String name = files[i].getName().toLowerCase();
                    if (name.endsWith(".zuml")) {
                        if (magic == null) {
                            magic = new MagicNumbers();
                        }
                        FileType type = magic.determineFileType(files[i]);
                        if (type != null && type.getMime().equals("application/zip")) {
                            return checkPosFile(files[i], new File(root, "_UML_"), logger);
                        }
                    }
                }
            }

            logger.log(new SimpleScreeningData(ResponseCode.NO_ZUML));
            return false;
        } catch (DatabaseException dbe) {
            // propagate database exception so submission would be rescreened.
            throw dbe;
        } catch (Exception ex) {
            logger.log(new SimpleScreeningData("Failed to validate poseidon file.", ResponseCode.NO_ZUML));
        }
        return false;
    }

    /**
     * <strong>Purpose</strong>:
     * Verifies if the pos file contains valid diagrams.
     *
     * @param file the pos file to validate.
     * @param root the folder to extract uml package.
     * @param logger the logger to write responses to.
     */
    private boolean checkPosFile(File file, File root, ScreeningLogger logger) throws Exception {
        root.mkdir();
        ArchiveUtility au = new ArchiveUtility(file, new ZipArchiver());
        au.extractContents(root);

        File[] files = root.listFiles();
        boolean proj3 = false;
        for (int i = 0; i < files.length; ++i) {
            if (files[i].isFile() && files[i].length() > 0) {
                String name = files[i].getName().toLowerCase();
                if (name.endsWith(".xmi")) {
                    file = files[i];
                } else if (name.endsWith(".proj3")) {
                    proj3 = true;
                }
            }
        }

        boolean success = true;
        if (!proj3) {
            logger.log(new SimpleScreeningData("Your poseidon file does not contain a project file.", ResponseCode.NO_POS_DESIGN));
            success = false;
        }

        try {
            // calls application screening validation
            ValidationManager validationManager = new ValidationManager();
            ValidationOutput []validationOutputs = validationManager.validateRaw(file);

            TextValidationOutputFormatter textFormatter = new TextValidationOutputFormatter();
            String []formatted = textFormatter.format(validationOutputs);
            for (int i = 0, n = formatted.length; i < n; i++) {
                logger.log(new SimpleScreeningData(formatted[i], ResponseCode.WRONG_ZUML));

                if (validationOutputs[i].getType().equals(ValidationOutputType.ERROR)) {
                    success = false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.log(new SimpleScreeningData("Failed to validate application zuml.", ResponseCode.WRONG_ZUML));
            success = false;
        }
        return success;
    }

}

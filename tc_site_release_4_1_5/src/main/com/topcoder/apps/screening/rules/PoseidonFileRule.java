/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening.rules;
import com.topcoder.file.type.MagicNumbers;
import com.topcoder.file.type.FileType;
import java.io.File;
import com.topcoder.util.archiving.ArchiveUtility;
import com.topcoder.util.archiving.ZipArchiver;
import com.topcoder.util.xmi.parser.XMIParser;
import com.topcoder.util.xmi.parser.handler.DefaultXMIHandler;
import com.topcoder.util.xmi.parser.data.UMLDiagramTypes;
import com.topcoder.apps.screening.ScreeningRule;
import com.topcoder.apps.screening.ScreeningLogger;
import com.topcoder.apps.screening.ResponseCode;
import com.topcoder.apps.screening.SimpleScreeningData;

/**
 * <strong>Purpose</strong>:
 * Checks if a poseidon file exists. If it does, it further verifies it contains use case diagram,
 * class diagram and sequence diagram.
 *
 * @author WishingBone
 * @version 1.0
 */
public class PoseidonFileRule implements ScreeningRule {

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
            File docs = new File(root, "docs");
            if (!docs.exists() || !docs.isDirectory()) {
                logger.log(new SimpleScreeningData(ResponseCode.NO_POS_DESIGN));
                return false;
            }

            File[] files = docs.listFiles();
            MagicNumbers magic = null;
            for (int i = 0; i < files.length; ++i) {
                if (files[i].isFile() && files[i].length() > 0) {
                    String name = files[i].getName().toLowerCase();
                    if (name.endsWith(".zuml") || name.endsWith(".zargo")) {
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

            logger.log(new SimpleScreeningData(ResponseCode.NO_POS_DESIGN));
            return false;
        } catch (Exception ex) {
            logger.log(new SimpleScreeningData("Failed to validate poseidon file.", ResponseCode.NO_POS_DESIGN));
        }
        return false;
    }

    /**
     * <strong>Purpose</strong>:
     * Verifies if the pos file contains valid use case diagram, class diagram and sequence diagrams.
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

        XMIParser parser = new XMIParser();
        parser.parse(file);
        DefaultXMIHandler handler = (DefaultXMIHandler) parser.getHandler();
        if (handler.getDiagramsOfType(UMLDiagramTypes.UML_USECASE_DIAGRAM).size() == 0) {
            logger.log(new SimpleScreeningData(ResponseCode.NO_USE_CASE_DIAGRAM));
            success = false;
        }
        if (handler.getDiagramsOfType(UMLDiagramTypes.UML_CLASS_DIAGRAM).size() == 0) {
            logger.log(new SimpleScreeningData(ResponseCode.NO_CLASS_DIAGRAM));
            success = false;
        }
        if (handler.getDiagramsOfType(UMLDiagramTypes.UML_SEQUENCE_DIAGRAM).size() == 0) {
            logger.log(new SimpleScreeningData(ResponseCode.NO_SEQUENCE_DIAGRAM));
            success = false;
        }

        return success;
    }

}

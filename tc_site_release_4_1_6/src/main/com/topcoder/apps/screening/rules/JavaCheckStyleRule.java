/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening.rules;
import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.exec.Exec;
import com.topcoder.util.exec.ExecutionResult;
import java.io.File;
import java.io.BufferedReader;
import java.io.StringReader;
import com.topcoder.apps.screening.ScreeningRule;
import com.topcoder.apps.screening.ScreeningLogger;
import com.topcoder.apps.screening.ResponseCode;
import com.topcoder.apps.screening.SimpleScreeningData;

/**
 * <strong>Purpose</strong>:
 * Runs checkstyle on the Java source code.
 *
 * @author WishingBone
 * @version 1.0
 */
public class JavaCheckStyleRule implements ScreeningRule {

    /**
     * The namespace for the configuration.
     */
    private static final String NAMESPACE = "com.topcoder.apps.screening.rules.JavaCheckStyleRule";

    /**
     * The name of the property in the configuration file that contains the checkstyle command.
     */
    private static final String CHECKSTYLE_PROPERTY_NAME = "checkstyle_command";

    /**
     * The name of the property in the configuration file that contains the checkstyle test command.
     */
    private static final String CHECKSTYLE_TEST_PROPERTY_NAME = "checkstyle_test_command";

    /**
     * The timeout for checkstyle (5 minutes).
     */
    private static final int timeout = 300;

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
        File source = new File(new File(new File(root, "src"), "java"), "main");
        checkstyle(source, CHECKSTYLE_PROPERTY_NAME, logger, root);

        File test = new File(new File(new File(root, "src"), "java"), "tests");
        checkstyle(test, CHECKSTYLE_TEST_PROPERTY_NAME, logger, root);

        return true;
    }

    /**
     * <strong>Purpose</strong>:
     * Runs checkstyle on the given folder.
     *
     * @param file the folder to run checkstyle on.
     * @param key the key to get the command line.
     * @param logger the logger to write responses to.
     * @param root the root dir.
     */
    private void checkstyle(File file, String key, ScreeningLogger logger, File root) {
        int strip = root.getAbsolutePath().length() + 1;

        try {
            ConfigManager cm = ConfigManager.getInstance();
            String command = cm.getString(NAMESPACE, key);

            ExecutionResult er = Exec.execute(new String[] {command, file.getAbsolutePath()}, timeout * 1000);
            BufferedReader br = new BufferedReader(new StringReader(er.getOut()));

            String line = br.readLine();
            if (!"Starting audit...".equals(line)) {
                throw new Exception();
            }

            for (;;) {
                line = br.readLine();
                if ("Audit done.".equals(line)) {
                    break;
                }
                if (line == null) {
                    throw new Exception();
                }
                logger.log(new SimpleScreeningData(line.substring(strip), ResponseCode.CHECKSTYLE_WARNING));
            }

            br.close();
        } catch (Exception ex) {
            logger.log(new SimpleScreeningData("Unable to run checkstyle.", ResponseCode.CHECKSTYLE_WARNING));
        }
    }

}

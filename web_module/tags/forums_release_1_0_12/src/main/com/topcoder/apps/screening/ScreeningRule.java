/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

import java.io.File;

/**
 * <strong>Purpose</strong>:
 * ScreeningRule interface defines an interchangeable aspect of the screening tool application.
 * Rules can be incorporated in the ScreeningTool configuration file. Each rule should have
 * a default constructor to instantiate from reflection.
 *
 * @author WishingBone
 * @version 1.0
 */
public interface ScreeningRule {

    /**
     * <strong>Purpose</strong>:
     * Screen the submission. Both the file and the root directory are given. Screening responses
     * are written to the ScreeningLogger instance.
     *
     * @param file the file to screen.
     * @param root the root dir of the extracted submission.
     * @param logger the logger to write responses to.
     */
    boolean screen(File file, File root, ScreeningLogger logger);

}

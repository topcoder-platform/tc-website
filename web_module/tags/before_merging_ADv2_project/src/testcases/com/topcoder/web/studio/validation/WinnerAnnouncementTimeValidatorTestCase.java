/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.validation;

import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import junit.framework.Assert;

/**
 * <p>A unit test for {@link WinnerAnnouncementTimeValidator} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.2)
 */
public class WinnerAnnouncementTimeValidatorTestCase extends TCHibernateTestCase {

    /**
     * <p>A <code>String</code> providing the sample end time for the contest to be used for testing.</p>
     */
    private static final String END_TIME = "2008.03.03 12:18";

    /**
     * <p>The instance of {@link WinnerAnnouncementTimeValidator} which is tested. This instance is initialized in
     * {@link #setUp()} method and released in {@link #tearDown()} method.</p>
     */
    private WinnerAnnouncementTimeValidator testedInstance = null;

    /**
     * <p>Constructs new <code>WinnerAnnouncementTimeValidatorTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public WinnerAnnouncementTimeValidatorTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     */
    public void setUp() {
        super.setUp();
        this.testedInstance = new WinnerAnnouncementTimeValidator(END_TIME);
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     */
    public void tearDown() {
        this.testedInstance = null;
        super.tearDown();
    }

    /**
     * <p>Accuracy test. Tests the {@link WinnerAnnouncementTimeValidator#validate(ValidationInput)} method for accurate
     * behavior.</p>
     *
     * <p>Passes the valid inputs and expects the method to return the results indicating on successful validation.</p>
     */
    public void testValidate_ValidInputs() {
        ValidationInput[] inputs
                = new ValidationInput[] {new StringInput("2008.03.03 12:19"), new StringInput("2008.03.03 13:18"),
                                         new StringInput("2008.03.04 12:18"), new StringInput("2008.04.03 12:18"),
                                         new StringInput("2009.03.03 12:18")};
        for (int i = 0; i < inputs.length; i++) {
            ValidationInput input = inputs[i];
            ValidationResult validationResult = this.testedInstance.validate(input);
            Assert.assertTrue("The valid input is rejected", validationResult.isValid());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link WinnerAnnouncementTimeValidator#validate(ValidationInput)} method for accurate
     * behavior.</p>
     *
     * <p>Passes the invalid inputs and expects the method to return the results indicating on failed validation.</p>
     */
    public void testValidate_InvalidInputs() {
        ValidationInput[] inputs
                = new ValidationInput[] {new StringInput(null), new StringInput("") ,new StringInput(END_TIME),
                                         new StringInput("2008.03.03 12:17"), new StringInput("2008.03.02 12:18"),
                                         new StringInput("2008.01.03 12:18"), new StringInput("2007.03.03 12:18"),
                                         new StringInput("2008.03.03 11:18"), new StringInput("?????????????????")};
        for (int i = 0; i < inputs.length; i++) {
            ValidationInput input = inputs[i];
            ValidationResult validationResult = this.testedInstance.validate(input);
            Assert.assertFalse("The invalid input is accepted", validationResult.isValid());
        }
    }
}

/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.validation;

import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.model.ContestType;
import com.topcoder.web.studio.model.ContestChannel;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import junit.framework.Assert;

/**
 * <p>A unit test for {@link ContestChannelValidator} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.5)
 */
public class ContestChannelValidatorTestCase extends TCHibernateTestCase {

    /**
     * <p>The instance of {@link ContestChannelValidator} which is tested. This instance is initialized in
     * {@link #setUp()} method and released in {@link #tearDown()} method.</p>
     */
    private ContestChannelValidator testedInstance = null;

    /**
     * <p>Constructs new <code>ContestChannelValidatorTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public ContestChannelValidatorTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     */
    public void setUp() {
        super.setUp();
        this.testedInstance = new ContestChannelValidator();
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     */
    public void tearDown() {
        this.testedInstance = null;
        super.tearDown();
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestChannelValidator#validate(ValidationInput)} method for accurate
     * behavior.</p>
     *
     * <p>Passes the valid inputs and expects the method to return the results indicating on successful validation.</p>
     */
    public void testValidate_ValidInputs() {
        ValidationInput[] inputs
                = new ValidationInput[] {new StringInput(String.valueOf(ContestChannel.STUDIO_ADMINISTRATOR)),
                                         new StringInput(String.valueOf(ContestChannel.STUDIO_ADMINISTRATOR_V1)),
                                         new StringInput(String.valueOf(ContestChannel.TOPCODER_DIRECT))};
        for (int i = 0; i < inputs.length; i++) {
            ValidationInput input = inputs[i];
            ValidationResult validationResult = this.testedInstance.validate(input);
            Assert.assertTrue("The valid input is rejected", validationResult.isValid());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ContestChannelValidator#validate(ValidationInput)} method for accurate behavior.
     * </p>
     *
     * <p>Passes the invalid inputs and expects the method to return the results indicating on failed validation.</p>
     */
    public void testValidate_InvalidInputs() {
        ValidationInput[] inputs = new ValidationInput[] {new StringInput(""), new StringInput(null),
                                                          new StringInput("-1"), new StringInput("AAAA"),
                                                          new StringInput("1111")};
        for (int i = 0; i < inputs.length; i++) {
            ValidationInput input = inputs[i];
            ValidationResult validationResult = this.testedInstance.validate(input);
            Assert.assertFalse("The invalid input is accepted", validationResult.isValid());
        }
    }
}

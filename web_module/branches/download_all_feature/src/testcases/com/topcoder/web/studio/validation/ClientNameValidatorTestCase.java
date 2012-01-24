/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.validation;

import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.shared.util.StringUtil;
import junit.framework.Assert;

/**
 * <p>A unit test for {@link ClientNameValidator} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.1)
 */
public class ClientNameValidatorTestCase extends TCHibernateTestCase {

    /**
     * <p>The instance of {@link ClientNameValidator} which is tested. This instance is initialized in {@link #setUp()}
     * method and released in {@link #tearDown()} method.</p>
     */
    private ClientNameValidator testedInstance = null;

    /**
     * <p>Constructs new <code>ClientNameValidatorTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public ClientNameValidatorTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     */
    public void setUp() {
        super.setUp();
        this.testedInstance = new ClientNameValidator();
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     */
    public void tearDown() {
        this.testedInstance = null;
        super.tearDown();
    }

    /**
     * <p>Accuracy test. Tests the {@link ClientNameValidator#validate(ValidationInput)} method for accurate behavior.
     * </p>
     *
     * <p>Passes the valid inputs and expects the method to return the results indicating on successful validation.</p>
     */
    public void testValidate_ValidInputs() {
        String maxName = StringUtil.padRight("ClientName", Constants.MAX_CLIENT_NAME_LENGTH, 'N');
        ValidationInput[] inputs = new ValidationInput[] {new StringInput("C"), new StringInput(maxName),
                                                          new StringInput("TopCoder"), new StringInput(null),
                                                          new StringInput(""), new StringInput("TopCoder Software"),
                                                          new StringInput("AOL")};
        for (int i = 0; i < inputs.length; i++) {
            ValidationInput input = inputs[i];
            ValidationResult validationResult = this.testedInstance.validate(input);
            Assert.assertTrue("The valid input is rejected", validationResult.isValid());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ClientNameValidator#validate(ValidationInput)} method for accurate behavior.
     * </p>
     *
     * <p>Passes the invalid inputs and expects the method to return the results indicating on failed validation.</p>
     */
    public void testValidate_InvalidInputs() {
        String maxName = StringUtil.padRight("ClientName", Constants.MAX_CLIENT_NAME_LENGTH, 'N');
        ValidationInput[] inputs = new ValidationInput[] {new StringInput(maxName + "ZZZZZZZZZZZ"),
                                                          new StringInput(maxName + "Z")};
        for (int i = 0; i < inputs.length; i++) {
            ValidationInput input = inputs[i];
            ValidationResult validationResult = this.testedInstance.validate(input);
            Assert.assertFalse("The invalid input is accepted", validationResult.isValid());
        }
    }
}

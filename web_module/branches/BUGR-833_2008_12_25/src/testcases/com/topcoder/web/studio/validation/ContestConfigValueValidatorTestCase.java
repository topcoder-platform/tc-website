/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.validation;

import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.shared.util.StringUtil;
import junit.framework.Assert;

/**
 * <p>A unit test for {@link ContestConfigValueValidator} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
 */
public class ContestConfigValueValidatorTestCase extends TCHibernateTestCase {

    /**
     * <p>The instance of {@link ContestConfigValueValidator} used for validating required properties which is tested.
     * This instance is initialized in {@link #setUp()} method and released in {@link #tearDown()} method.</p>
     */
    private ContestConfigValueValidator testedInstanceRequired = null;

    /**
     * <p>The instance of {@link ContestConfigValueValidator} used for validating optional properties which is tested.
     * This instance is initialized in {@link #setUp()} method and released in {@link #tearDown()} method.</p>
     */
    private ContestConfigValueValidator testedInstanceOptional = null;

    /**
     * <p>Constructs new <code>ContestConfigValueValidatorTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public ContestConfigValueValidatorTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     */
    public void setUp() {
        super.setUp();
        this.testedInstanceRequired = new ContestConfigValueValidator("Property Name", true);
        this.testedInstanceOptional = new ContestConfigValueValidator("Property Name", false);
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     */
    public void tearDown() {
        this.testedInstanceRequired = null;
        this.testedInstanceOptional = null;
        super.tearDown();
    }

    /**
     * <p>Accuracy test. Tests the {@link ClientNameValidator#validate(ValidationInput)} method for accurate behavior.
     * </p>
     *
     * <p>Passes the valid inputs for required configuration property and expects the method to return the results
     * indicating on successful validation.</p>
     */
    public void testValidate_ValidInputs_Required() {
        String maxValue = StringUtil.padRight("Config", Constants.MAX_CONTEST_CONFIG_VALUE_LENGTH, 'N');
        ValidationInput[] inputs = new ValidationInput[] {new StringInput("C"), new StringInput(maxValue),
                                                          new StringInput("TopCoder"),
                                                          new StringInput("TopCoder Software"), new StringInput("AOL")};
        for (int i = 0; i < inputs.length; i++) {
            ValidationInput input = inputs[i];
            ValidationResult validationResult = this.testedInstanceRequired.validate(input);
            Assert.assertTrue("The valid input is rejected", validationResult.isValid());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ClientNameValidator#validate(ValidationInput)} method for accurate behavior.
     * </p>
     *
     * <p>Passes the invalid inputs for required conifguration property and expects the method to return the results
     * indicating on failed validation.</p>
     */
    public void testValidate_InvalidInputs_Required() {
        String maxValue = StringUtil.padRight("Config", Constants.MAX_CONTEST_CONFIG_VALUE_LENGTH, 'N');
        ValidationInput[] inputs = new ValidationInput[] {new StringInput(maxValue + "ZZZZZZZZZZZ"),
                                                          new StringInput(maxValue + "Z"), new StringInput(""),
                                                          new StringInput("   "), new StringInput("   \t \n "),
                                                          new StringInput(null)};
        for (int i = 0; i < inputs.length; i++) {
            ValidationInput input = inputs[i];
            ValidationResult validationResult = this.testedInstanceRequired.validate(input);
            Assert.assertFalse("The invalid input is accepted", validationResult.isValid());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ClientNameValidator#validate(ValidationInput)} method for accurate behavior.
     * </p>
     *
     * <p>Passes the valid inputs for optional configuration property and expects the method to return the results
     * indicating on successful validation.</p>
     */
    public void testValidate_ValidInputs_Optional() {
        String maxValue = StringUtil.padRight("Config", Constants.MAX_CONTEST_CONFIG_VALUE_LENGTH, 'N');
        ValidationInput[] inputs = new ValidationInput[] {new StringInput("C"), new StringInput(maxValue),
                                                          new StringInput("TopCoder"), new StringInput(null),
                                                          new StringInput("   "), new StringInput("   \t \n "),
                                                          new StringInput("TopCoder Software"), new StringInput("AOL")};
        for (int i = 0; i < inputs.length; i++) {
            ValidationInput input = inputs[i];
            ValidationResult validationResult = this.testedInstanceOptional.validate(input);
            Assert.assertTrue("The valid input is rejected", validationResult.isValid());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ClientNameValidator#validate(ValidationInput)} method for accurate behavior.
     * </p>
     *
     * <p>Passes the invalid inputs for optional conifguration property and expects the method to return the results
     * indicating on failed validation.</p>
     */
    public void testValidate_InvalidInputs_Optional() {
        String maxValue = StringUtil.padRight("Config", Constants.MAX_CONTEST_CONFIG_VALUE_LENGTH, 'N');
        ValidationInput[] inputs = new ValidationInput[] {new StringInput(maxValue + "ZZZZZZZZZZZ"),
                                                          new StringInput(maxValue + "Z")};
        for (int i = 0; i < inputs.length; i++) {
            ValidationInput input = inputs[i];
            ValidationResult validationResult = this.testedInstanceRequired.validate(input);
            Assert.assertFalse("The invalid input is accepted", validationResult.isValid());
        }
    }
}

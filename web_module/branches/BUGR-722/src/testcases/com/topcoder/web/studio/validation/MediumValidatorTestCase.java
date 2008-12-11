/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.validation;

import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.model.Medium;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.ListInput;
import junit.framework.Assert;

import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;

/**
 * <p>A unit test for {@link MediumValidator} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.2)
 */
public class MediumValidatorTestCase extends TCHibernateTestCase {

    /**
     * <p>The instance of {@link MediumValidator} which is tested. This instance is initialized in {@link #setUp()}
     * method and released in {@link #tearDown()} method.</p>
     */
    private MediumValidator testedInstance = null;

    /**
     * <p>Constructs new <code>MediumValidatorTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public MediumValidatorTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     */
    public void setUp() {
        super.setUp();
        this.testedInstance = new MediumValidator();
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     */
    public void tearDown() {
        this.testedInstance = null;
        super.tearDown();
    }

    /**
     * <p>Accuracy test. Tests the {@link MediumValidator#validate(ValidationInput)} method for accurate behavior.</p>
     *
     * <p>Passes the valid inputs and expects the method to return the results indicating on successful validation.</p>
     */
    public void testValidate_ValidInputs() {
        ValidationInput[] inputs = new ValidationInput[4] ;
        inputs[0] = new ListInput(Arrays.asList("1"));
        inputs[1] = new ListInput(Arrays.asList("1", "2", "3", "4"));
        inputs[2] = new ListInput(Arrays.asList("1", "2", "4"));
        inputs[3] = new ListInput(Arrays.asList("1", "2", "4", "5", "7", "8"));

        for (int i = 0; i < inputs.length; i++) {
            ValidationInput input = inputs[i];
            ValidationResult validationResult = this.testedInstance.validate(input);
            Assert.assertTrue("The valid input is rejected", validationResult.isValid());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link MediumValidator#validate(ValidationInput)} method for accurate behavior.</p>
     *
     * <p>Passes the invalid inputs and expects the method to return the results indicating on failed validation.</p>
     */
    public void testValidate_InvalidInputs() {
        ValidationInput[] inputs = new ValidationInput[3] ;
        inputs[0] = new ListInput(new ArrayList());
        inputs[1] = new ListInput(Arrays.asList("1", "2", "123", "4"));
        inputs[2] = new ListInput(Arrays.asList("1", "2", "???", "4"));

        for (int i = 0; i < inputs.length; i++) {
            ValidationInput input = inputs[i];
            ValidationResult validationResult = this.testedInstance.validate(input);
            Assert.assertFalse("The invalid input is accepted", validationResult.isValid());
        }
    }
}

/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.model;

import junit.framework.TestCase;
import junit.framework.Assert;
import com.topcoder.web.common.model.Image;

/**
 * <p>A unit test for {@link SubmissionImage.Identifier} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since Studio Submission Slideshow
 */
public class SubmissionImageIdentifierTestCase extends TestCase {

    /**
     * <p>The instance of {@link SubmissionImage.Identifier} which is tested. This instance is initialized in
     * {@link #setUp()} method and released in {@link #tearDown()} method.</p>
     */
    private SubmissionImage.Identifier testedInstance = null;

    /**
     * <p>Constructs new <code>SubmissionImageIdentifierTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public SubmissionImageIdentifierTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void setUp() throws Exception {
        super.setUp();
        this.testedInstance = new SubmissionImage.Identifier();
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void tearDown() throws Exception {
        this.testedInstance = null;
        super.tearDown();
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionImage.Identifier#setSubmission(Submission)} and
     * {@link SubmissionImage.Identifier#getSubmission()} methods for accurate behavior.</p>
     *
     * <p>Passes the valid values to {@link SubmissionImage.Identifier#setSubmission(Submission)} method and reads them
     * back through {@link SubmissionImage.Identifier#getSubmission()} methods and verifies that the read value is
     * matching the set value.</p>
     */
    public void testSetGetSubmission() {
        Submission[] validValues = new Submission[] {null, new Submission(), new Submission()};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setSubmission(validValues[i]);
            Assert.assertSame("The [submission] property is not set and read correctly",
                              validValues[i], this.testedInstance.getSubmission());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionImage.Identifier#setImage(Image)} and
     * {@link SubmissionImage.Identifier#getImage()} methods for accurate behavior.</p>
     *
     * <p>Passes the valid values to {@link SubmissionImage.Identifier#setImage(Image)} method and reads them back
     * through {@link SubmissionImage.Identifier#getImage()} methods and verifies that the read value is matching the
     * set value.</p>
     */
    public void testSetGetImage() {
        Image[] validValues = new Image[] {null, new Image(), new Image()};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setImage(validValues[i]);
            Assert.assertSame("The [image] property is not set and read correctly",
                              validValues[i], this.testedInstance.getImage());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionImage.Identifier#equals(Object)} method for accurate behavior.</p>
     *
     * <p>Passes the valid values to {@link SubmissionImage.Identifier#equals(Object)} method and verifies that the
     * method returns appropriate result.</p>
     */
    public void testEquals() {
        long imageId = 3;
        long submissionId = 4;

        Image image = new Image();
        image.setId(imageId);

        Submission submission = new Submission();
        submission.setId(submissionId);

        this.testedInstance.setImage(image);
        this.testedInstance.setSubmission(submission);

        Object[] validValues = new Object[10];
        boolean[] expectedResults = new boolean[validValues.length];
        validValues[0] = null;
        expectedResults[0] = false;
        validValues[1] = new StringBuffer();
        expectedResults[1] = false;
        for (int i = 2; i < validValues.length; i++) {
            image = new Image();
            image.setId(new Long(i + 1));

            submission = new Submission();
            submission.setId(new Long(i + 2));

            SubmissionImage.Identifier opponent = new SubmissionImage.Identifier();
            opponent.setImage(image);
            opponent.setSubmission(submission);

            validValues[i] = opponent;
            expectedResults[i] = (imageId == opponent.getImage().getId())
                                 && (submissionId == opponent.getSubmission().getId());
        }

        for (int i = 0; i < validValues.length; i++) {
            boolean result = this.testedInstance.equals(validValues[i]);
            Assert.assertEquals("Wrong equality result ", expectedResults[i], result);
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionImage.Identifier#hashCode()} method for accurate behavior.</p>
     *
     * <p>Verifies that the method returns appropriate result.</p>
     */
    public void testHashCode() {
        SubmissionImage.Identifier[] instances = new SubmissionImage.Identifier[10];
        for (int i = 0; i < instances.length; i++) {
            Image image = new Image();
            image.setId(new Long(i + 1));

            Submission submission = new Submission();
            submission.setId(new Long(i + 2));

            instances[i] = new SubmissionImage.Identifier();
            instances[i].setSubmission(submission);
            instances[i].setImage(image);
        }

        for (int i = 0; i < instances.length; i++) {
            SubmissionImage.Identifier instance1 = instances[i];
            for (int j = 0; j < instances.length; j++) {
                SubmissionImage.Identifier instance2 = instances[j];
                if (i == j) {
                    Assert.assertEquals("Inconsistent hashCode for same instance",
                                        instance1.hashCode(), instance2.hashCode());
                } else {
                    Assert.assertFalse("Inconsistent hashCode for different instances",
                                       instance1.hashCode() == instance2.hashCode());
                }
            }
        }
    }
}

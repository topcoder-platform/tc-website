/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.model;

import junit.framework.TestCase;
import junit.framework.Assert;
import com.topcoder.web.common.model.Image;

/**
 * <p>A unit test for {@link SubmissionImage} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since Studio Submission Slideshow
 */
public class SubmissionImageTestCase extends TestCase {

    /**
     * <p>The instance of {@link SubmissionImage} which is tested. This instance is initialized in {@link #setUp()}
     * method and released in {@link #tearDown()} method.</p>
     */
    private SubmissionImage testedInstance = null;

    /**
     * <p>Constructs new <code>SubmissionImageTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public SubmissionImageTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void setUp() throws Exception {
        super.setUp();
        this.testedInstance = new SubmissionImage();
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
     * <p>Accuracy test. Tests the {@link SubmissionImage#setId(SubmissionImage.Identifier)} and
     * {@link SubmissionImage#getId()} methods for accurate behavior.</p>
     *
     * <p>Passes the valid values to {@link SubmissionImage#setId(SubmissionImage.Identifier)} method and reads them
     * back through {@link SubmissionImage#getId()} methods and verifies that the read value is matching the set value.
     * </p>
     */
    public void testSetGetId() {
        SubmissionImage.Identifier[] validValues = new SubmissionImage.Identifier[] {null,
                                                                                     new SubmissionImage.Identifier(),
                                                                                     new SubmissionImage.Identifier()};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setId(validValues[i]);
            Assert.assertSame("The [id] property is not set and read correctly",
                              validValues[i], this.testedInstance.getId());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionImage#setSubmission(Submission)} and
     * {@link SubmissionImage#getSubmission()} methods for accurate behavior.</p>
     *
     * <p>Passes the valid values to {@link SubmissionImage#setSubmission(Submission)} method and reads them back
     * through {@link SubmissionImage#getSubmission()} methods and verifies that the read value is matching the set
     * value.</p>
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
     * <p>Accuracy test. Tests the {@link SubmissionImage#setImage(Image)} and {@link SubmissionImage#getImage()}
     * methods for accurate behavior.</p>
     *
     * <p>Passes the valid values to {@link SubmissionImage#setImage(Image)} method and reads them back through
     * {@link SubmissionImage#getImage()} methods and verifies that the read value is matching the set value.</p>
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
     * <p>Accuracy test. Tests the {@link SubmissionImage#setSortIndex(Integer)} and
     * {@link SubmissionImage#getSortIndex()} methods for accurate behavior.</p>
     *
     * <p>Passes the valid values to {@link SubmissionImage#setSortIndex(Integer)} method and reads them back through
     * {@link SubmissionImage#getSortIndex()} methods and verifies that the read value is matching the set value.</p>
     */
    public void testSetGetSortIndex() {
        Integer[] validValues = new Integer[] {null, 1, -1, 32232, 121231, 446564, 0};
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setSortIndex(validValues[i]);
            Assert.assertEquals("The [sortIndex] property is not set and read correctly",
                                validValues[i], this.testedInstance.getSortIndex());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionImage#compareTo(Object)} method for accurate behavior.</p>
     *
     * <p>Passes the valid values to {@link SubmissionImage#compareTo(Object)} method and verifies that the method
     * returns appropriate comparison result.</p>
     */
    public void testCompareTo() {
        int index = 5;
        this.testedInstance.setSortIndex(index);
        SubmissionImage[] validValues = new SubmissionImage[10];
        int[] expectedResults = new int[validValues.length];
        validValues[0] = null;
        expectedResults[0] = -1;
        for (int i = 1; i < validValues.length; i++) {
            validValues[i] = new SubmissionImage();
            validValues[i].setSortIndex(i);
            if (i < index) {
                expectedResults[i] = 1;
            } else if (i > index) {
                expectedResults[i] = -1;
            } else {
                expectedResults[i] = 0;
            }
        }
        for (int i = 0; i < validValues.length; i++) {
            int result = this.testedInstance.compareTo(validValues[i]);
            Assert.assertEquals("Wrong comparison result for opponent index", expectedResults[i], result);
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionImage#equals(Object)} method for accurate behavior.</p>
     *
     * <p>Passes the valid values to {@link SubmissionImage#equals(Object)} method and verifies that the method
     * returns appropriate result.</p>
     */
    public void testEquals() {
        int index = 2;
        long imageId = 3;
        long submissionId = 4;

        Image image = new Image();
        image.setId(imageId);

        Submission submission = new Submission();
        submission.setId(submissionId);

        this.testedInstance.setSortIndex(index);
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

            SubmissionImage opponent = new SubmissionImage();
            opponent.setSortIndex(i);
            opponent.setImage(image);
            opponent.setSubmission(submission);

            validValues[i] = opponent;
            expectedResults[i] = (index == opponent.getSortIndex())
                                 && (imageId == opponent.getImage().getId())
                                 && (submissionId == opponent.getSubmission().getId()); 
        }
        
        for (int i = 0; i < validValues.length; i++) {
            boolean result = this.testedInstance.equals(validValues[i]);
            Assert.assertEquals("Wrong equality result ", expectedResults[i], result);
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionImage#hashCode()} method for accurate behavior.</p>
     *
     * <p>Verifies that the method returns appropriate result.</p>
     */
    public void testHashCode() {
        SubmissionImage[] instances = new SubmissionImage[10];
        for (int i = 0; i < instances.length; i++) {
            Image image = new Image();
            image.setId(new Long(i + 1));

            Submission submission = new Submission();
            submission.setId(new Long(i + 2));

            instances[i] = new SubmissionImage();
            instances[i].setSortIndex(i);
            instances[i].setSubmission(submission);
            instances[i].setImage(image);
        }

        for (int i = 0; i < instances.length; i++) {
            SubmissionImage instance1 = instances[i];
            for (int j = 0; j < instances.length; j++) {
                SubmissionImage instance2 = instances[j];
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

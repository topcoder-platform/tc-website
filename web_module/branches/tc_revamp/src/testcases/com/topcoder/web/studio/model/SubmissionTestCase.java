/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.model;

import junit.framework.TestCase;
import junit.framework.Assert;

import java.util.Set;
import java.util.TreeSet;

import com.topcoder.web.common.model.Image;

/**
 * <p>A unit test for {@link Submission} class.</p>
 *
 * @author isv
 * @version 1.1
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.3)
 */
public class SubmissionTestCase extends TestCase {

    /**
     * <p>The instance of {@link Submission} which is tested. This instance is initialized in {@link #setUp()} method
     * and released in {@link #tearDown()} method.</p>
     */
    private Submission testedInstance = null;

    /**
     * <p>Constructs new <code>SubmissionTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public SubmissionTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void setUp() throws Exception {
        super.setUp();
        this.testedInstance = new Submission();
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
     * <p>Accuracy test. Tests the {@link Submission#setImages(Set)} and {@link Submission#getImages()} methods for
     * accurate behavior.</p>
     *
     * <p>Passes the valid values to {@link Submission#setImages(Set)} method and reads them back through
     * {@link Submission#getImages()} methods and verifies that the read value is matching the set value.</p>
     * 
     * @since Studio Submission Slideshow
     */
    public void testSetGetImages() {
        Set<SubmissionImage>[] validValues
                = new Set[] {null, new TreeSet<SubmissionImage>(), new TreeSet<SubmissionImage>()};
        validValues[2].add(new SubmissionImage());
        validValues[2].add(new SubmissionImage());
        validValues[2].add(new SubmissionImage());
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.setImages(validValues[i]);
            Assert.assertEquals("The [images] property is not set and read correctly",
                                validValues[i], this.testedInstance.getImages());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link Submission#addImage(SubmissionImage)} method for accurate behavior.</p>
     *
     * <p>Passes the valid values to method and verifies that the image is added to internal list.</p>
     *
     * @since Studio Submission Slideshow
     */
    public void testAddImage() {
        SubmissionImage[] validValues = new SubmissionImage[] {new SubmissionImage(), new SubmissionImage()};
        validValues[1].setSortIndex(2);
        
        for (int i = 0; i < validValues.length; i++) {
            this.testedInstance.addImage(validValues[i]);
            Assert.assertEquals("The submission is not set", this.testedInstance, validValues[i].getSubmission());
        }
        Set<SubmissionImage> images = this.testedInstance.getImages();
        for (int i = 0; i < validValues.length; i++) {
            Assert.assertTrue("The image is not added", images.contains(validValues[i]));
        }
    }

    /**
     * <p>Failure test. Tests the {@link Submission#addImage(SubmissionImage)} method for proper handling invalid
     * arguments passed to it.</p>
     *
     * <p>Passes <code>null</code> as <code>image</code> argument and expects the <code>IllegalArgumentException</code>
     * to be thrown.</p>
     */
    public void testAddImage_ImageNull() {
        try {
            this.testedInstance.addImage(null);
            Assert.fail("Should have thrown IllegalArgumentException due to NULL image");
        } catch (IllegalArgumentException e) {
            // expected behavior
        }
    }

    /**
     * <p>Failure test. Tests the {@link Submission#addImage(SubmissionImage)} method for proper handling invalid
     * arguments passed to it.</p>
     *
     * <p>Passes <code>null</code> as <code>image</code> argument and expects the <code>IllegalArgumentException</code>
     * to be thrown.</p>
     */
    public void testAddImage_OtherSubmissionImage() {
        Submission anotherSubmission = new Submission();
        anotherSubmission.setId(12L);
        
        SubmissionImage image = new SubmissionImage();
        image.setSortIndex(1);
        image.setImage(new Image());
        image.setSubmission(anotherSubmission);
        
        try {
            this.testedInstance.addImage(image);
            Assert.fail("Should have thrown IllegalArgumentException due to image associated with other submission");
        } catch (IllegalArgumentException e) {
            // expected behavior
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link Submission#getMediumWatermarkedGalleryImagesCount()} method for accurate
     * behavior.</p>
     *
     * <p>Verifies that method returns correct values.</p>
     *
     * @since Studio Submission Slideshow
     */
    public void testGetMediumWatermarkedGalleryImagesCount() {
        int[] imageTypes = new int[] {Image.GALLERY_MEDIUM_WATERMARKED_TYPE_ID, Image.GALLERY_MEDIUM_TYPE_ID,
                                      Image.GALLERY_SMALL_WATERMARKED_TYPE_ID, Image.GALLERY_MEDIUM_WATERMARKED_TYPE_ID,
                                      Image.GALLERY_MEDIUM_WATERMARKED_TYPE_ID};
        int[] expectedCounts = new int[] {1, 1, 1, 2, 3};

        SubmissionImage submissionImage;
        Image image;

        Assert.assertEquals("Wrong number of gallery medium watermarked images",
                            0, this.testedInstance.getMediumWatermarkedGalleryImagesCount());

        for (int i = 0; i < expectedCounts.length; i++) {
            image = new Image();
            image.setImageTypeId(imageTypes[i]);
            submissionImage = new SubmissionImage();
            submissionImage.setImage(image);
            submissionImage.setSortIndex(i + 1);
            this.testedInstance.addImage(submissionImage);
            Assert.assertEquals("Wrong number of gallery medium watermarked images",
                                expectedCounts[i], this.testedInstance.getMediumWatermarkedGalleryImagesCount());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link Submission#getMediumWatermarkedGalleryImagesCount()} method for accurate
     * behavior.</p>
     *
     * <p>Verifies that method returns correct values.</p>
     *
     * @since Studio Submission Slideshow
     */
    public void testGetSmallWatermarkedGalleryImagesCount() {
        int[] imageTypes = new int[] {Image.GALLERY_SMALL_WATERMARKED_TYPE_ID, Image.GALLERY_SMALL_TYPE_ID,
                                      Image.GALLERY_THUMBNAIL_TYPE_ID, Image.GALLERY_SMALL_WATERMARKED_TYPE_ID,
                                      Image.GALLERY_SMALL_WATERMARKED_TYPE_ID, Image.GALLERY_SMALL_WATERMARKED_TYPE_ID};
        int[] expectedCounts = new int[] {1, 1, 1, 2, 3, 4};

        SubmissionImage submissionImage;
        Image image;

        Assert.assertEquals("Wrong number of gallery small watermarked images",
                            0, this.testedInstance.getSmallWatermarkedGalleryImagesCount());

        for (int i = 0; i < expectedCounts.length; i++) {
            image = new Image();
            image.setImageTypeId(imageTypes[i]);
            submissionImage = new SubmissionImage();
            submissionImage.setImage(image);
            submissionImage.setSortIndex(i + 1);
            this.testedInstance.addImage(submissionImage);
            Assert.assertEquals("Wrong number of gallery small watermarked images" + i,
                                expectedCounts[i], this.testedInstance.getSmallWatermarkedGalleryImagesCount());
        }
    }
}

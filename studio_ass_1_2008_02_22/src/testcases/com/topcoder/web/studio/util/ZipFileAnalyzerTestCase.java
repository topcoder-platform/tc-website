/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.util;

import com.topcoder.web.studio.TCHibernateTestCase;
import junit.framework.Assert;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.zip.ZipInputStream;

/**
 * <p>A unit test for {@link ZipFileAnalyzer} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly (Req# 5.7)
 */
public class ZipFileAnalyzerTestCase extends TCHibernateTestCase {

    /**
     * <p>The instance of {@link ZipFileAnalyzer} which is tested. This instance is initialized in {@link #setUp()}
     * method and released in {@link #tearDown()} method.</p>
     */
    private ZipFileAnalyzer testedInstance = null;

    /**
     * <p>Constructs new <code>ZipFileAnalyzerTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public ZipFileAnalyzerTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     */
    public void setUp() {
        super.setUp();
        this.testedInstance = new ZipFileAnalyzer();
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     */
    public void tearDown() {
        this.testedInstance = null;
        super.tearDown();
    }

    /**
     * <p>Accuracy test. Tests the {@link ZipFileAnalyzer#analyze(InputStream, boolean)}  and accompanying methods for
     * accurate behavior.</p>
     *
     * <p>Passes content for various ZIP files and expects the method to analyze the content of the provided files
     * correctly.</p>
     * 
     * @throws Exception if an unexpected error occurs.
     */
    public void testAnalyze_RetrieveFiles() throws Exception {
        String path = "test_files/studio/";
        String[] fileNames = {"nativeempty.zip", "noimage.zip", "nonative.zip", "nosubmission.zip", "tcs.zip"};
        boolean[] expectedNativeAvailable = {false, true, false, true, true};
        boolean[] expectedImageAvailable = {true, false, true, true, true};
        boolean[] expectedFileAvailable = {true, true, true, false, true};

        for (int i = 0; i < fileNames.length; i++) {
            String fileName = fileNames[i];
            this.testedInstance.analyze(new FileInputStream(path + fileName), true);
            Assert.assertEquals("Wrong analyze for native file",
                                expectedNativeAvailable[i], this.testedInstance.isNativeSubmissionAvailable());
            Assert.assertEquals("Wrong analyze for image file",
                                expectedImageAvailable[i], this.testedInstance.isPreviewImageAvailable());
            Assert.assertEquals("Wrong analyze for preview file",
                                expectedFileAvailable[i], this.testedInstance.isPreviewFileAvailable());
            if (expectedImageAvailable[i]) {
                Assert.assertNotNull("The path for preview image is not retrieved",
                                     this.testedInstance.getPreviewImagePath());
                Assert.assertNotNull("The content for preview image is not retrieved",
                                     this.testedInstance.getPreviewImageContent());
            }
            if (expectedFileAvailable[i]) {
                Assert.assertNotNull("The path for preview path is not retrieved",
                                     this.testedInstance.getPreviewFilePath());
                Assert.assertNotNull("The content for preview file is not retrieved",
                                     this.testedInstance.getPreviewFileContent());
            }
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ZipFileAnalyzer#analyze(InputStream, boolean)}  and accompanying methods for
     * accurate behavior.</p>
     *
     * <p>Passes content for various ZIP files and expects the method to analyze the content of the provided files
     * correctly.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testAnalyze_NoRetrieveFiles() throws Exception {
        String path = "test_files/studio/";
        String[] fileNames = {"nativeempty.zip", "noimage.zip", "nonative.zip", "nosubmission.zip", "tcs.zip"};
        boolean[] expectedNativeAvailable = {false, true, false, true, true};
        boolean[] expectedImageAvailable = {true, false, true, true, true};
        boolean[] expectedFileAvailable = {true, true, true, false, true};

        for (int i = 0; i < fileNames.length; i++) {
            String fileName = fileNames[i];
            this.testedInstance.analyze(new FileInputStream(path + fileName), false);
            Assert.assertEquals("Wrong analyze for native file",
                                expectedNativeAvailable[i], this.testedInstance.isNativeSubmissionAvailable());
            Assert.assertEquals("Wrong analyze for image file",
                                expectedImageAvailable[i], this.testedInstance.isPreviewImageAvailable());
            Assert.assertEquals("Wrong analyze for preview file",
                                expectedFileAvailable[i], this.testedInstance.isPreviewFileAvailable());
            if (expectedImageAvailable[i]) {
                Assert.assertNotNull("The path for preview image is not retrieved",
                                     this.testedInstance.getPreviewImagePath());
                Assert.assertNull("The content for preview image is retrieved",
                                  this.testedInstance.getPreviewImageContent());
            }
            if (expectedFileAvailable[i]) {
                Assert.assertNotNull("The path for preview path is not retrieved",
                                     this.testedInstance.getPreviewFilePath());
                Assert.assertNull("The content for preview file is retrieved",
                                  this.testedInstance.getPreviewFileContent());
            }
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ZipFileAnalyzer#analyze(ZipInputStream, boolean)}  and accompanying methods
     * for accurate behavior.</p>
     *
     * <p>Passes content for various ZIP files and expects the method to analyze the content of the provided files
     * correctly.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testAnalyze_RetrieveFiles_Stream() throws Exception {
        String path = "test_files/studio/";
        String[] fileNames = {"nativeempty.zip", "noimage.zip", "nonative.zip", "nosubmission.zip", "tcs.zip"};
        boolean[] expectedNativeAvailable = {false, true, false, true, true};
        boolean[] expectedImageAvailable = {true, false, true, true, true};
        boolean[] expectedFileAvailable = {true, true, true, false, true};

        for (int i = 0; i < fileNames.length; i++) {
            String fileName = fileNames[i];
            this.testedInstance.analyze(new ZipInputStream(new FileInputStream(path + fileName)), true);
            Assert.assertEquals("Wrong analyze for native file",
                                expectedNativeAvailable[i], this.testedInstance.isNativeSubmissionAvailable());
            Assert.assertEquals("Wrong analyze for image file",
                                expectedImageAvailable[i], this.testedInstance.isPreviewImageAvailable());
            Assert.assertEquals("Wrong analyze for preview file",
                                expectedFileAvailable[i], this.testedInstance.isPreviewFileAvailable());
            if (expectedImageAvailable[i]) {
                Assert.assertNotNull("The path for preview image is not retrieved",
                                     this.testedInstance.getPreviewImagePath());
                Assert.assertNotNull("The content for preview image is not retrieved",
                                     this.testedInstance.getPreviewImageContent());
            }
            if (expectedFileAvailable[i]) {
                Assert.assertNotNull("The path for preview path is not retrieved",
                                     this.testedInstance.getPreviewFilePath());
                Assert.assertNotNull("The content for preview file is not retrieved",
                                     this.testedInstance.getPreviewFileContent());
            }
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link ZipFileAnalyzer#analyze(ZipInputStream, boolean)}  and accompanying methods
     * for accurate behavior.</p>
     *
     * <p>Passes content for various ZIP files and expects the method to analyze the content of the provided files
     * correctly.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testAnalyze_NoRetrieveFiles_Stream() throws Exception {
        String path = "test_files/studio/";
        String[] fileNames = {"nativeempty.zip", "noimage.zip", "nonative.zip", "nosubmission.zip", "tcs.zip"};
        boolean[] expectedNativeAvailable = {false, true, false, true, true};
        boolean[] expectedImageAvailable = {true, false, true, true, true};
        boolean[] expectedFileAvailable = {true, true, true, false, true};

        for (int i = 0; i < fileNames.length; i++) {
            String fileName = fileNames[i];
            this.testedInstance.analyze(new ZipInputStream(new FileInputStream(path + fileName)), false);
            Assert.assertEquals("Wrong analyze for native file",
                                expectedNativeAvailable[i], this.testedInstance.isNativeSubmissionAvailable());
            Assert.assertEquals("Wrong analyze for image file",
                                expectedImageAvailable[i], this.testedInstance.isPreviewImageAvailable());
            Assert.assertEquals("Wrong analyze for preview file",
                                expectedFileAvailable[i], this.testedInstance.isPreviewFileAvailable());
            if (expectedImageAvailable[i]) {
                Assert.assertNotNull("The path for preview image is not retrieved",
                                     this.testedInstance.getPreviewImagePath());
                Assert.assertNull("The content for preview image is retrieved",
                                  this.testedInstance.getPreviewImageContent());
            }
            if (expectedFileAvailable[i]) {
                Assert.assertNotNull("The path for preview path is not retrieved",
                                     this.testedInstance.getPreviewFilePath());
                Assert.assertNull("The content for preview file is retrieved",
                                  this.testedInstance.getPreviewFileContent());
            }
        }
    }
}

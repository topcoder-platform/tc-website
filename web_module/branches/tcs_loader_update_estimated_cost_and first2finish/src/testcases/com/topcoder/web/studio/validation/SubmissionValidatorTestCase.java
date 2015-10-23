/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.validation;

import com.topcoder.db.connectionfactory.DBConnectionFactoryImpl;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.web.common.validation.ObjectInput;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.TCHibernateTestCase;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.DatabaseUtil;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.dao.MimeTypeDAO;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.MimeType;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.StudioFileType;
import com.topcoder.web.studio.util.BundledFileAnalyzer;
import com.topcoder.web.studio.util.ZipFileAnalyzer;
import com.topcoder.web.studio.util.JarFileAnalyzer;
import junit.framework.Assert;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.MessageFormat;

/**
 * <p>A unit test for {@link SubmissionValidator} class.</p>
 *
 * @author isv
 * @version 1.1
 * @since TopCoder Studio Modifications Assembly (Req# 5.6, 5.7, 5.11)
 */
public class SubmissionValidatorTestCase extends TCHibernateTestCase {

    /**
     * <p>The instance of {@link SubmissionValidator} which is tested. This instance is initialized in {@link #setUp()}
     * method and released in {@link #tearDown()} method.</p>
     */
    private SubmissionValidator testedInstance = null;

    /**
     * <p>Constructs new <code>SubmissionValidatorTestCase</code> instance with specified test name.</p>
     *
     * @param name a <code>String</code> providing the name of the test.
     */
    public SubmissionValidatorTestCase(String name) {
        setName(name);
    }

    /**
     * <p>Sets up the fixture. This method is called before a test is executed.</p>
     */
    public void setUp() {
        try {
            DBConnectionFactoryImpl connectionFactory
                = new DBConnectionFactoryImpl("com.topcoder.db.connectionfactory.DBConnectionFactoryImpl");
            DatabaseUtil.clearTables(connectionFactory);
            DatabaseUtil.populateTables(connectionFactory);
        } catch (Exception e) {
            throw new IllegalStateException("The setUp() fails", e);
        }

        super.setUp();
    }

    /**
     * <p>Tears down the fixture. This method is called after a test is executed.</p>
     */
    public void tearDown() {
        super.tearDown();
        this.testedInstance = null;
        try {
            DBConnectionFactoryImpl connectionFactory
                = new DBConnectionFactoryImpl("com.topcoder.db.connectionfactory.DBConnectionFactoryImpl");
            DatabaseUtil.clearTables(connectionFactory);
        } catch (Exception e) {
            throw new IllegalArgumentException("The tearDown() fails", e);
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionValidator#validate(ValidationInput)} method for accurate behavior.
     * </p>
     *
     * <p>Configures the validator to validate submissions for contest which requires preview file to be provided and
     * passes the submission which has the preview file bundled and expects the validation to succeed.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testValidate_PreviewFileRequired_success() throws Exception {
        String[] bundledFileExts = new String[] {"zip", "jar"};
        for (int i = 0; i < bundledFileExts.length; i++) {
            byte[] submitted = readSubmissionFile("noimage." + bundledFileExts[i]);
            UploadedFile uploadedFile = new UploadedFileImpl(String.valueOf(System.currentTimeMillis()),
                                                             "application/zip", "submission.zip", submitted.length,
                                                             new ByteArrayInputStream(submitted));
            Contest contest = StudioDAOUtil.getFactory().getContestDAO().find(1L);

            this.testedInstance = new SubmissionValidator(contest);
            ValidationResult validationResult = this.testedInstance.validate(new ObjectInput(uploadedFile));
            Assert.assertTrue("Valid submission is rejected", validationResult.isValid());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionValidator#validate(ValidationInput)} method for accurate behavior.
     * </p>
     *
     * <p>Configures the validator to validate submissions for contest which requires preview file to be provided and
     * passes the submission which does not have the preview file bundled and expects the validation to fail.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testValidate_PreviewFileRequired_failure() throws Exception {
        String[] bundledFileExts = new String[] {"zip", "jar"};
        for (int i = 0; i < bundledFileExts.length; i++) {
            byte[] submitted = readSubmissionFile("nosubmission." + bundledFileExts[i]);
            UploadedFile uploadedFile = new UploadedFileImpl(String.valueOf(System.currentTimeMillis()),
                                                             "application/zip", "submission.zip", submitted.length,
                                                             new ByteArrayInputStream(submitted));
            Contest contest = StudioDAOUtil.getFactory().getContestDAO().find(1L);

            this.testedInstance = new SubmissionValidator(contest);
            ValidationResult validationResult = this.testedInstance.validate(new ObjectInput(uploadedFile));
            Assert.assertFalse("Invalid submission is accepted", validationResult.isValid());
            Assert.assertEquals("Wrong validation message",
                                Constants.ERROR_MSG_NO_PREVIEW_FILE, validationResult.getMessage());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionValidator#validate(ValidationInput)} method for accurate behavior.
     * </p>
     *
     * <p>Configures the validator to validate submissions for contest which requires preview image to be provided and
     * passes the submission which has the preview image bundled and expects the validation to succeed.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testValidate_PreviewImageRequired_success() throws Exception {
        String[] bundledFileExts = new String[] {"zip", "jar"};
        for (int i = 0; i < bundledFileExts.length; i++) {
            byte[] submitted = readSubmissionFile("nosubmission." + bundledFileExts[i]);
            UploadedFile uploadedFile = new UploadedFileImpl(String.valueOf(System.currentTimeMillis()),
                                                             "application/zip", "submission.zip", submitted.length,
                                                             new ByteArrayInputStream(submitted));
            Contest contest = StudioDAOUtil.getFactory().getContestDAO().find(3L);

            this.testedInstance = new SubmissionValidator(contest);
            ValidationResult validationResult = this.testedInstance.validate(new ObjectInput(uploadedFile));
            Assert.assertTrue("Valid submission is rejected", validationResult.isValid());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionValidator#validate(ValidationInput)} method for accurate behavior.
     * </p>
     *
     * <p>Configures the validator to validate submissions for contest which requires preview image to be provided and
     * passes the submission which does not have the preview image bundled and expects the validation to fail.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testValidate_PreviewImageRequired_failure() throws Exception {
        String[] bundledFileExts = new String[] {"zip", "jar"};
        for (int i = 0; i < bundledFileExts.length; i++) {
            byte[] submitted = readSubmissionFile("noimage." + bundledFileExts[i]);
            UploadedFile uploadedFile = new UploadedFileImpl(String.valueOf(System.currentTimeMillis()),
                                                             "application/zip", "submission.zip", submitted.length,
                                                             new ByteArrayInputStream(submitted));
            Contest contest = StudioDAOUtil.getFactory().getContestDAO().find(3L);

            this.testedInstance = new SubmissionValidator(contest);
            ValidationResult validationResult = this.testedInstance.validate(new ObjectInput(uploadedFile));
            Assert.assertFalse("Invalid submission is accepted", validationResult.isValid());
            Assert.assertEquals("Wrong validation message",
                                Constants.ERROR_MSG_NO_PREVIEW_IMAGE, validationResult.getMessage());
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionValidator#validate(ValidationInput)} method for accurate behavior.
     * </p>
     *
     * <p>Configures the validator to validate submissions for contests of various types and passes the submission which
     * has the native submission file bundled and expects the validation to succeed.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testValidate_Native_success() throws Exception {
        String[] bundledFileExts = new String[] {"zip", "jar"};
        for (int i = 0; i < bundledFileExts.length; i++) {
            for (long j = 1; j <= 3; j++) {
                byte[] submitted = readSubmissionFile("tcs." + bundledFileExts[i]);
                UploadedFile uploadedFile = new UploadedFileImpl(String.valueOf(System.currentTimeMillis()),
                                                                 "application/zip", "submission.zip", submitted.length,
                                                                 new ByteArrayInputStream(submitted));
                Contest contest = StudioDAOUtil.getFactory().getContestDAO().find(j);

                this.testedInstance = new SubmissionValidator(contest);
                ValidationResult validationResult = this.testedInstance.validate(new ObjectInput(uploadedFile));
                Assert.assertTrue("Valid submission is rejected", validationResult.isValid());
            }
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionValidator#validate(ValidationInput)} method for accurate behavior.
     * </p>
     *
     * <p>Configures the validator to validate submissions for contests of various types and passes the submission which
     * does not have the native submission file bundled and expects the validation to fail.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testValidate_Native_failure() throws Exception {
        String[] bundledFileExts = new String[] {"zip", "jar"};
        for (int i = 0; i < bundledFileExts.length; i++) {
            for (long j = 1; j <= 3; j++) {
                byte[] submitted = readSubmissionFile("nonative." + bundledFileExts[i]);
                UploadedFile uploadedFile = new UploadedFileImpl(String.valueOf(System.currentTimeMillis()),
                                                                 "application/zip", "submission.zip", submitted.length,
                                                                 new ByteArrayInputStream(submitted));
                Contest contest = StudioDAOUtil.getFactory().getContestDAO().find(j);

                this.testedInstance = new SubmissionValidator(contest);
                ValidationResult validationResult = this.testedInstance.validate(new ObjectInput(uploadedFile));
                Assert.assertFalse("Invalid submission is accepted", validationResult.isValid());
                Assert.assertEquals("Wrong validation message",
                                    Constants.ERROR_MSG_NO_NATIVE_SUBMISSION, validationResult.getMessage());
            }
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionValidator#validate(ValidationInput)} method for accurate behavior.
     * </p>
     *
     * <p>Configures the validator to validate submissions for contests of various types and passes the submission which
     * has the empty native submission file bundled and expects the validation to fail.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testValidate_Native_empty() throws Exception {
        String[] bundledFileExts = new String[] {"zip", "jar"};
        for (int i = 0; i < bundledFileExts.length; i++) {
            for (long j = 1; j <= 3; j++) {
                byte[] submitted = readSubmissionFile("nativeempty." + bundledFileExts[i]);
                UploadedFile uploadedFile = new UploadedFileImpl(String.valueOf(System.currentTimeMillis()),
                                                                 "application/zip", "submission.zip", submitted.length,
                                                                 new ByteArrayInputStream(submitted));
                Contest contest = StudioDAOUtil.getFactory().getContestDAO().find(j);

                this.testedInstance = new SubmissionValidator(contest);
                ValidationResult validationResult = this.testedInstance.validate(new ObjectInput(uploadedFile));
                Assert.assertFalse("Invalid submission is accepted", validationResult.isValid());
                Assert.assertEquals("Wrong validation message",
                                    Constants.ERROR_MSG_NO_NATIVE_SUBMISSION, validationResult.getMessage());
            }
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionValidator#validate(ValidationInput)} method for accurate behavior.
     * </p>
     *
     * <p>Configures the validator to validate submissions for contests of various types and passes the submission which
     * is not a bundled file and expects the validation to fail.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    public void testValidate_NonBundledFiles() throws Exception {
        String[] nonBundledFiles = new String[] {"image.jpg", "testData.sql", "document.doc"};
        String[] nonBundledFileMimeTypes = new String[] {"image/jpeg", "text/plain", "application/msword"};
        for (int i = 0; i < nonBundledFiles.length; i++) {
            for (long j = 1; j <= 3; j++) {
                byte[] submitted = readSubmissionFile(nonBundledFiles[i]);
                UploadedFile uploadedFile = new UploadedFileImpl(String.valueOf(System.currentTimeMillis()),
                                                                 nonBundledFileMimeTypes[i], nonBundledFiles[i],
                                                                 submitted.length,
                                                                 new ByteArrayInputStream(submitted));
                Contest contest = StudioDAOUtil.getFactory().getContestDAO().find(j);

                this.testedInstance = new SubmissionValidator(contest);
                ValidationResult validationResult = this.testedInstance.validate(new ObjectInput(uploadedFile));
                Assert.assertFalse("Non-bundled submission is accepted", validationResult.isValid());
                Assert.assertEquals("Wrong validation message",
                                    "Invalid file type submitted: " + nonBundledFileMimeTypes[i],
                                    validationResult.getMessage());
            }
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionValidator#getBundledFileParser(MimeType)} method for accurate
     * behavior.</p>
     *
     * <p>Verifies that for mime types associated with bundled file types the method returns the file parser of
     * appropriate type.</p>
     */
    public void testGetBundledFileParser_BundledFileTypes() {
        MimeTypeDAO mimeTypeDAO = StudioDAOUtil.getFactory().getMimeTypeDAO();
        int[] zipFileMimeTypes = new int[] {15, 16};
        int[] jarFileMimeTypes = new int[] {20, 21};
        for (int i = 0; i < zipFileMimeTypes.length; i++) {
            MimeType mimeType = mimeTypeDAO.find(zipFileMimeTypes[i]);
            BundledFileAnalyzer fileParser = SubmissionValidator.getBundledFileParser(mimeType);
            Assert.assertEquals("Wrong type of file parser",
                                ZipFileAnalyzer.class.getName(), fileParser.getClass().getName());
        }
        for (int i = 0; i < jarFileMimeTypes.length; i++) {
            MimeType mimeType = mimeTypeDAO.find(jarFileMimeTypes[i]);
            BundledFileAnalyzer fileParser = SubmissionValidator.getBundledFileParser(mimeType);
            Assert.assertEquals("Wrong type of file parser",
                                JarFileAnalyzer.class.getName(), fileParser.getClass().getName());
        }
    }

    /**
     * <p>Failure test. Tests the {@link SubmissionValidator#getBundledFileParser(MimeType)} method for proper handling
     * the invalid usage.</p>
     *
     * <p>Verifies that for mime types associated with non-bundled file types the method raises an
     * <code>IllegalArgumentException</code>.</p> 
     */
    public void testGetBundledFileParser_NonBundledFileTypes() {
        MimeTypeDAO mimeTypeDAO = StudioDAOUtil.getFactory().getMimeTypeDAO();
        int[] nonBundledFileMimeTypes = new int[] {1, 2, 3};
        for (int i = 0; i < nonBundledFileMimeTypes.length; i++) {
            MimeType mimeType = mimeTypeDAO.find(nonBundledFileMimeTypes[i]);
            try {
                SubmissionValidator.getBundledFileParser(mimeType);
                Assert.fail("No error for non-bundled file mime type");
            } catch (IllegalArgumentException e) {
                // expected behavior
            }
        }
    }

    /**
     * <p>Accuracy test. Tests the
     * {@link SubmissionValidator#calcAlternateFileName(Contest, User, Submission, String, String)} method for accurate
     * behavior.</p>
     *
     * <p>Veirifies that the method produces correct filenames based on provided contest, submission, user.</p>
     */
    public void testCalcAlternateFileName() {
        Contest contest = new Contest();
        contest.setId(183L);

        User user = new User();
        user.setId(4949L);
        user.setHandle("isv");

        Submission submission = new Submission();
        submission.setId(2646L);

        String[] alternateTypes = new String[] {"tiny", "small", "medium", "full"};
        String sep = System.getProperty("file.separator");

        String originalName = "submission/storyboard.jar";
        String ext = originalName.substring(originalName.lastIndexOf('.'));

        for (int i = 0; i < alternateTypes.length; i++) {
            String alternateType = alternateTypes[i];
            String expectedFileName = Constants.ROOT_STORAGE_PATH + sep + Constants.SUBMISSIONS_DIRECTORY_NAME + sep
                                      + contest.getId() + sep + user.getHandle().toLowerCase() + "_" + user.getId()
                                      + sep + submission.getId() + "_" + alternateType + ext;
            String fileName = SubmissionValidator.calcAlternateFileName(contest, user, submission, originalName,
                                                                        alternateType);
            Assert.assertEquals("Incorrect file name evaluated", expectedFileName, fileName);
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionValidator#getFileType(String)} method for accurate behavior.</p>
     *
     * <p>Passes the file names for types supported by this application and expects the appropriate
     * <code>StudioFileType</code> instance to be returned.</p>
     */
    public void testGetFileType_SupportedFiles() {
        String[] fileNames = {"1.bmp", "2.doc", "3.gif", "4.html", "5.jar", "6.jpg", "7.mp3", "8.pdf", "9.png", "10.ps",
                              "11.rtf", "12.txt", "13.xls", "14.zip",
                              "1.BMP", "2.Doc", "3.giF", "4.HtmL", "5.jAr", "6.JPg", "7.mP3", "8.PDF", "9.PNG", "10.pS",
                              "11.RTf", "12.tXT", "13.XLS", "14.ZIP"};
        int[] fileTypeIds = {12, 1, 10, 5, 16, 9, 15, 3, 11, 4, 6, 2, 13, 14, 12, 1, 10, 5, 16, 9, 15, 3, 11, 4, 6, 2,
                             13, 14};

        for (int i = 0; i < fileNames.length; i++) {
            String fileName = fileNames[i];
            StudioFileType fileType = SubmissionValidator.getFileType(fileName);
            Assert.assertNotNull("File type is not mapped to valid file", fileType);
            Assert.assertEquals("Wrong file type returned", fileTypeIds[i], fileType.getId().intValue());
        }

    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionValidator#getFileType(String)} method for accurate behavior.</p>
     *
     * <p>Passes the file names for types not supported by this application and expects <code>null</code> to be
     * returned.</p>
     */
    public void testGetFileType_UnsupportedFiles() {
        String[] fileNames = {"1.par", "2.www", "3.cgi"};
        for (int i = 0; i < fileNames.length; i++) {
            String fileName = fileNames[i];
            StudioFileType fileType = SubmissionValidator.getFileType(fileName);
            Assert.assertNull("File type is mapped to unsupported file", fileType);
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionValidator#getFileName(String)} method for accurate behavior.</p>
     *
     * <p>Passes the full paths and expects the appropriate file names to be returned.</p>
     * 
     * @since Studio Submission Slideshow
     */
    public void testGetFileName() {
        String sep = System.getProperty("file.separator");
        String[] filePaths = {"", "studiofiles" + sep + "submissions", "1" + sep + "2" + sep + "3" + sep + "4", "1"};
        String[] fileNames = {"1.par", "2.www", "3.cgi"};

        for (int i = 0; i < fileNames.length; i++) {
            for (int j = 0; j < filePaths.length; j++) {
                String fileName = fileNames[i];
                String name = SubmissionValidator.getFileName(filePaths[j] + sep + fileName);
                Assert.assertEquals("Wrong file name returned", fileName, name);
            }
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionValidator#getBundledFileParser(String)} method for accurate
     * behavior.</p>
     *
     * <p>Verifies that for filenames associated with bundled file types the method returns the file parser of
     * appropriate type.</p>
     *
     * @since Studio Submission Slideshow
     */
    public void testGetBundledFileParser_String_BundledFileTypes() {
        String sep = System.getProperty("file.separator");
        String[] filePaths = {"", "studiofiles" + sep + "submissions", "1" + sep + "2" + sep + "3" + sep + "4", "1"};

        String[] zipFileNames = {"1.zip", "2.zip", "3381238136.1.zip"};
        for (int i = 0; i < zipFileNames.length; i++) {
            for (int j = 0; j < filePaths.length; j++) {
                String fileName = zipFileNames[i];
                BundledFileAnalyzer fileParser
                        = SubmissionValidator.getBundledFileParser(filePaths[j] + sep + fileName);
                Assert.assertEquals("Wrong type of file parser",
                                    ZipFileAnalyzer.class.getName(), fileParser.getClass().getName());
            }
        }

        String[] jarFileNames = {"1.jar", "2.jar", "3381238136.1.jar"};
        for (int i = 0; i < jarFileNames.length; i++) {
            for (int j = 0; j < filePaths.length; j++) {
                String fileName = jarFileNames[i];
                BundledFileAnalyzer fileParser
                        = SubmissionValidator.getBundledFileParser(filePaths[j] + sep + fileName);
                Assert.assertEquals("Wrong type of file parser",
                                    JarFileAnalyzer.class.getName(), fileParser.getClass().getName());
            }
        }
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionValidator#validate(ValidationInput)} method for accurate behavior.
     * </p>
     *
     * <p>Configures the validator to validate submissions for contest which requires preview file to be provided and
     * passes the submission which does not have the <code>submission</code> directory included and expects the
     * validation to fail.</p>
     *
     * @throws Exception if an unexpected error occurs.
     * @since STUDIO-128
     */
    public void testValidate_PreviewFileRequired_NoSubmissionDirectory() throws Exception {
        byte[] submitted = readSubmissionFile("nosubdir.jar");
        UploadedFile uploadedFile = new UploadedFileImpl(String.valueOf(System.currentTimeMillis()),
                                                         "application/java-archive", "nosubdir.jar", submitted.length,
                                                         new ByteArrayInputStream(submitted));
        Contest contest = StudioDAOUtil.getFactory().getContestDAO().find(1L);

        this.testedInstance = new SubmissionValidator(contest);
        ValidationResult validationResult = this.testedInstance.validate(new ObjectInput(uploadedFile));
        Assert.assertFalse("Invalid submission is accepted", validationResult.isValid());
        Assert.assertEquals("Invalid error message",
                            MessageFormat.format(Constants.ERROR_MSG_NO_DIRECTORY, "/" + Constants.SUBMISSION_PATH),
                            validationResult.getMessage());
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionValidator#validate(ValidationInput)} method for accurate behavior.
     * </p>
     *
     * <p>Configures the validator to validate submissions for contest which requires preview image to be provided and
     * passes the submission which does not have the <code>submission</code> directory included and expects the
     * validation to fail.</p>
     *
     * @throws Exception if an unexpected error occurs.
     * @since STUDIO-128
     */
    public void testValidate_PreviewImageRequired_NoSubmissionDirectory() throws Exception {
        byte[] submitted = readSubmissionFile("nosubdir.jar");
        UploadedFile uploadedFile = new UploadedFileImpl(String.valueOf(System.currentTimeMillis()),
                                                         "application/java-archive", "nosubdir.jar", submitted.length,
                                                         new ByteArrayInputStream(submitted));
        Contest contest = StudioDAOUtil.getFactory().getContestDAO().find(3L);

        this.testedInstance = new SubmissionValidator(contest);
        ValidationResult validationResult = this.testedInstance.validate(new ObjectInput(uploadedFile));
        Assert.assertFalse("Invalid submission is accepted", validationResult.isValid());
        Assert.assertEquals("Invalid error message",
                            MessageFormat.format(Constants.ERROR_MSG_NO_DIRECTORY,
                                                 "/" + Constants.SUBMISSION_PATH),
                            validationResult.getMessage());
    }

    /**
     * <p>Accuracy test. Tests the {@link SubmissionValidator#validate(ValidationInput)} method for accurate behavior.
     * </p>
     *
     * <p>Configures the validator to validate submissions for contest which requires preview image to be provided and
     * passes the submission which does not have the <code>source</code> directory included and expects the validation
     * to fail.</p>
     *
     * @throws Exception if an unexpected error occurs.
     * @since STUDIO-128
     */
    public void testValidate_PreviewImageRequired_NoSourceDirectory() throws Exception {
        byte[] submitted = readSubmissionFile("nosourcedir.jar");
        UploadedFile uploadedFile = new UploadedFileImpl(String.valueOf(System.currentTimeMillis()),
                                                         "application/java-archive", "nosourcedir.jar",
                                                         submitted.length, new ByteArrayInputStream(submitted));
        Contest contest = StudioDAOUtil.getFactory().getContestDAO().find(3L);

        this.testedInstance = new SubmissionValidator(contest);
        ValidationResult validationResult = this.testedInstance.validate(new ObjectInput(uploadedFile));
        Assert.assertFalse("Invalid submission is accepted", validationResult.isValid());
        Assert.assertEquals("Invalid error message",
                            MessageFormat.format(Constants.ERROR_MSG_NO_DIRECTORY,
                                                 "/" + Constants.SUBMISSION_SOURCE_PATH),
                            validationResult.getMessage());
    }

    /**
     * <p>Gets the content of the sample submissions file to be used for testing from the disk.</p>
     *
     * @param file a <code>String</code> providing the local name of the file to read.
     * @return a <code>byte</code> array providing the content of the sample submission file.
     * @throws IOException if an I/O error occurs while reading the image file content.
     */
    private byte[] readSubmissionFile(String file) throws IOException {
        InputStream content = new FileInputStream("./test_files/studio/" + file);
        ByteArrayOutputStream baos;
        try {
            baos = new ByteArrayOutputStream();
            byte[] buf = new byte[4096];
            int count = -1;
            while ((count = content.read(buf)) != -1) {
                baos.write(buf, 0, count);
            }
        } finally {
            content.close();
        }
        return baos.toByteArray();
    }

    /**
     * <p>A custom implementation of {@link UploadedFile} to be used for testing.</p>
     *
     * @author isv
     * @version 1.0
     * @since TopCoder Studio Modifications Assembly
     */
    private static class UploadedFileImpl extends UploadedFile {

        /**
         * <p>A <code>String</code> providing the remote name of uploaded file.</p>
         */
        private String remoteFileName = null;

        /**
         * <p>A <code>long</code> providing the size of the uploaded file.</p>
         */
        private long size = 0;

        /**
         * <p>An <code>InputStream</code> providing the content of the uploaded file.</p>
         */
        private InputStream input = null;

        /**
         * <p>Constructs new <code>UploadedFileImpl</code> instance with specified properties of uploaded file.</p>
         *
         * @param fileId a <code>String</code> providing the ID of a file.
         * @param contentType a <code>String</code> providing the mime type of uploaded file.
         * @param remoteFileName a <code>String</code> providing the remote name of uploaded file.
         * @param size a <code>long</code> providing the size of the uploaded file.
         * @param input an <code>InputStream</code> providing the content of the uploaded file.
         */
        public UploadedFileImpl(String fileId, String contentType, String remoteFileName, long size,
                                InputStream input) {
            super(fileId, contentType);
            this.remoteFileName = remoteFileName;
            this.size = size;
            this.input = input;
        }

        /**
         * <p>Gets the remote file name of the uploaded file.</p>
         *
         * @return the remote file name of the uploaded file.
         */
        public String getRemoteFileName() {
            return this.remoteFileName;
        }

        /**
         * <p>Gets the size of the file, in bytes.</p>
         *
         * @return the size of the file, in bytes.
         */
        public long getSize() {
            return this.size;
        }

        /**
         * <p>Gets the input stream pointing to the start of file contents. User is required to close the stream after
         * use.</p>
         *
         * @return the underlying input stream.
         */
        public InputStream getInputStream() {
            return this.input;
        }
    }
}

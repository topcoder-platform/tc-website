/*
 * Copyright (C) 2005-2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

import com.topcoder.common.web.error.TCException;
import com.topcoder.servlet.request.FileDoesNotExistException;
import com.topcoder.servlet.request.MockUploadedFile;
import com.topcoder.servlet.request.PersistenceException;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.errorhandling.BaseException;
import com.topcoder.util.file.DocumentGenerator;
import com.topcoder.util.file.Template;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.IntegerValidator;
import com.topcoder.web.common.validation.ObjectInput;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.DAOFactory;
import com.topcoder.web.studio.dao.DAOUtil;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.dao.UploadDAO;
import com.topcoder.web.studio.dto.ExternalContent;
import com.topcoder.web.studio.dto.ExternalContentProperty;
import com.topcoder.web.studio.dto.ExternalContentType;
import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.dto.Resource;
import com.topcoder.web.studio.dto.ResourceSubmission;
import com.topcoder.web.studio.dto.Submission;
import com.topcoder.web.studio.dto.SubmissionDeclaration;
import com.topcoder.web.studio.dto.Upload;
import com.topcoder.web.studio.util.FileGenerator;
import com.topcoder.web.studio.util.Util;
import com.topcoder.web.studio.validation.ImageSubmissionValidator;
import com.topcoder.web.studio.validation.SourceSubmissionValidator;
import com.topcoder.web.studio.validation.UnifiedSubmissionValidator;

/**
 * <p>
 * A request processor to be used for servicing the requests for uploading the
 * submissions to server. The main purpose of this processor is to validate the
 * submission and store it in local file system. Also generates the alternate
 * presentations for the submission <del>and generates the passing review for those
 * submissions which come from <code>TopCoder Direct</code> contests</del> <ins>BUGR-633 Change</ins>.
 * </p>
 *
 * <p>
 * Change log for Studio Electronic Assignment Document Assembly 1.0
 * Modified dbProcessing method, to insert the electronic assignment record on success submission.
 * </p>
 *
 *
 * <p> Version 1.1 (Studio Declaration Module Assembly) change:
 * Added support for declaration attached to submission: comment and licensed content data.
 * </p>
 *
 * <p>
 *   Version 1.2 (Re-platforming Studio Release 3 Assembly) Change notes:
 *   <ol>
 *     <li>Updated the logic to use contests hosted in <code>tcs_catalog</code> database instead of
 *     <code>studio_oltp</code> database.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.2.1 (Re-platforming Studio Release 4 Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Removed unused code.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.2.2 (Replatforming Studio Release 5) change notes:
 *   <ol>
 *     <li>Using the dto classes in com.topcoder.web.studio.dto package instead of in com.topcoder.web.common.model.comp package.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.3 (Upload Progress Base Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Replaced tab characters with 4 white-spaces sequences.</li>
 *     <li>Updated {@link #dbProcessing()} method to append ID of upload associated with submission to URL of 
 *     <code>ViewSubmissionSuccess</code> action.</li>
 *   </ol>
 * </p>
 *
 * @author dok, isv, Vitta, orange_cloud, pvmagacho, TCSASSEMBER
 * @version 1.3
 */
public class Submit extends BaseSubmissionDataProcessor {	
	private static final Logger log = Logger.getLogger(Submit.class);

    /**
     * Error message parts go below. I'm not responsible for this, reviewers forced me!
     */

    /**
     * Missing name.
     */
    private static final String MISSING_NAME = "Missing name";

    /**
     * Missing.
     */
    private static final String MISSING = "Missing ";

    /**
     * And.
     */
    private static final String AND = " and ";

    /**
     * Url.
     */
    private static final String URL = "url";

    /**
     * File number.
     */
    private static final String FILE_NUMBER = "file number";

    /**
     * Missing name.
     */
    private static final String MISSING_NAME_DOT = "Missing name.";

    /**
     * Missing url.
     */
    private static final String MISSING_URL_DOT = "Missing url.";

    /**
     * Path to submission declaration template path.
     */
    private static final String DECLARATION_FILE_TEMPLATE = "template/submission_declaration.txt";

    /**
     * Font id in external_content_type table.
     */
    private static final long FONT_CONTENT_ID = 1;

    /**
     * Stock art id in external_content_type table.
     */
    private static final long STOCK_ART_CONTENT_ID = 2;

	/**
	 * <p>
	 * A <code>File</code> referencing the uploaded submission as stored in the
	 * local file system.
	 * </p>
	 */
	private File f = null;

	/**
	 * <p>
	 * A <code>List</code> combining the threads currently running by this
	 * controller.
	 * </p>
	 */
	private transient List<Thread> generatorThreads = new ArrayList<Thread>();

	/**
	 * <p>
	 * Implements the business logic for request processing.
	 * </p>
	 * <p/>
	 * <p>
	 * Validates the submission submitted by the user to server and stores it in
	 * local file system. Launches a separate thread for generating the
	 * alternate presentations of the submission. Also for submissions from
	 * <code>
     * TopCoder Direct</code> contests generates the passing review.
	 * </p>
	 *
	 * @throws Exception if an unexpected error occurs.
	 */
	protected void dbProcessing() throws Exception {
		if (userLoggedIn()) {			
			Integer contestId;

			try {
				contestId = new Integer(getRequest().getParameter(Constants.CONTEST_ID));
			} catch (NumberFormatException e) {
				throw new NavigationException("Invalid contest specified.");
			}

			String rank = getRequest().getParameter(Constants.SUBMISSION_RANK);

			DAOFactory factory = DAOUtil.getFactory();
			SubmissionDAO submissionDAO = factory.getSubmissionDAO();
			UploadDAO uploadDAO = factory.getUploadDAO();
			UserDAO userDAO = factory.getUserDAO();

			Project c = factory.getProjectDAO().find(contestId);
			Date now = new Date();
			if (now.before(c.getStartTime()) || now.after(c.getEndTime()) || 
					!Project.STATUS_ACTIVE.equals(c.getStatusId())) {
				throw new NavigationException("Inactive contest specified.");
			}
			User u = userDAO.find(getUser().getId());
			
			Resource resource = RegistrationHelper.getSubmitterResource(c, u.getId());
			boolean isRegistered = (Util.isAdmin(u.getId()) || (String.valueOf(u.getId()).equals(c.getCreateUserId())) 
					|| resource != null);
			if (!isRegistered) {
				// not registered
				StringBuffer buf = new StringBuffer(50);
				buf.append(getSessionInfo().getServletPath());
				buf.append("?" + Constants.MODULE_KEY + "=ViewRegistration&");
				buf.append(Constants.CONTEST_ID + "=").append(contestId);
				setNextPage(buf.toString());
				setIsNextPageInContext(false);
			} else {
				// registered
				MultipartRequest r = (MultipartRequest) getRequest();

				UploadedFile submissionFile = r.getUploadedFile(Constants.SUBMISSION);
				UploadedFile sourceFile = r.getUploadedFile(Constants.SUBMISSION_SOURCE);
				UploadedFile previewFile = r.getUploadedFile(Constants.SUBMISSION_PREVIEW);

                SubmissionDeclaration submissionDeclaration = new SubmissionDeclaration();
                List<ExternalContent> externalContents = new ArrayList<ExternalContent>();
                List<String[]> fontsData = new ArrayList<String[]>();
                List<String[]> stockArtData = new ArrayList<String[]>();
                boolean hasLicensedContent = Boolean.parseBoolean(r.getParameter(Constants.CONTAINS_LICENSED_ELEMENTS));
                ExternalContentType fontType = new ExternalContentType();
                fontType.setId(FONT_CONTENT_ID);
                ExternalContentType saType = new ExternalContentType();
                saType.setId(STOCK_ART_CONTENT_ID);
                if (hasLicensedContent) {
                    // read fonts
                    String[] fontNames = r.getParameterValues(Constants.FONT_NAME);
                    String[] fontUrls = r.getParameterValues(Constants.FONT_URL);
                    for (int i = 0; i < fontNames.length; ++i) {
                        String name = fontNames[i];
                        String url = fontUrls[i];
                        if (blank(name, "Font's Name") && blank(url, "Font's URL Source")) {
                            // if both name and url are missing, just skip it
                            continue;
                        }

                        // validate font data
                        String error = "";
                        if (blank(name, "Font's Name")) {
                            error = MISSING_NAME_DOT;
                        } else if (blank(url, "Font's URL Source")) {
                            error = MISSING_URL_DOT;
                        }
                        fontsData.add(new String[] {name, url, error});
                        if (!blank(error)) {
                            addError(Constants.SUBMISSION_SOURCE + '.' + i, error);
                        }

                        if (!url.startsWith("http://")) {
                        	url = "http://" + url;
                        }

                        // create ExternalContent object
                        ExternalContent font = new ExternalContent();
                        font.setContentType(fontType);
                        font.setDeclaration(submissionDeclaration);
                        font.setDisplayPosition(i);
                        addProperty(font, "Name", name);
                        addProperty(font, "Url", url);
                        externalContents.add(font);
                    }

                    // read stock art
                    String[] saNames = r.getParameterValues(Constants.STOCK_ART_NAME);
                    String[] saUrls = r.getParameterValues(Constants.STOCK_ART_URL);
                    String[] saFileNumbers = r.getParameterValues(Constants.STOCK_ART_FILE_NUMBER);
                    for (int i = 0; i < saNames.length; ++i) {
                        String name = saNames[i];
                        String url = saUrls[i];
                        String fileNumber = saFileNumbers[i];

                        if (blank(name, "Description of photo") && blank(url, "Stock's Art URL Source") && blank(fileNumber, "File Number")) {
                            // if both name url and file number are missing, just skip it
                            continue;
                        }

                        // validate stock art data
                        StringBuilder error = new StringBuilder();
                        if (blank(name, "Description of photo")) {
                            error.append(MISSING_NAME);
                        }
                        if (blank(url, "Stock's Art URL Source")) {
                            if (error.length() == 0) {
                                error.append(MISSING);
                            } else {
                                error.append(AND);
                            }
                            error.append(URL);
                        }
                        if (blank(fileNumber, "File Number")) {
                            if (error.length() == 0) {
                                error.append(MISSING);
                            } else {
                                error.append(AND);
                            }
                            error.append(FILE_NUMBER);
                        }
                        if (error.length() > 0) {
                            error.append(".");
                            addError(Constants.SUBMISSION_SOURCE + '.' + i, error.toString());
                        }

                        if (!url.startsWith("http://")) {
                        	url = "http://" + url;
                        }

                        stockArtData.add(new String[] {name, url, fileNumber, error.toString()});

                        // create ExternalContent object
                        ExternalContent font = new ExternalContent();
                        font.setContentType(saType);
                        font.setDeclaration(submissionDeclaration);
                        font.setDisplayPosition(i);
                        addProperty(font, "Name", name);
                        addProperty(font, "Url", url);
                        addProperty(font, "FileNumber", fileNumber);
                        externalContents.add(font);
                    }
                }

                String contentError = "";
                if (externalContents.size() == 0 && hasLicensedContent) {
                    contentError = "Please enter your declarations below or select 'No' if you have no fonts or stock art to declare.";
                    addError(Constants.CONTAINS_LICENSED_ELEMENTS, contentError);
                }

                submissionDeclaration.setExternalContents(externalContents);
                submissionDeclaration.setHasExternalContent(hasLicensedContent);
                String submissionComment = r.getParameter(Constants.SUBMISSION_COMMENT);
                submissionDeclaration.setComment(submissionComment == null ? "" : (submissionComment.trim().equals("Comments") ? "" : submissionComment));

				log.debug("submission: " + submissionFile.getRemoteFileName());
				log.debug("submission content type: " + submissionFile.getContentType());
				log.debug("submission file id: " + submissionFile.getFileId());

				// Source submission is always required
				ValidationResult submissionValidationResult = new SourceSubmissionValidator(c).validate(new ObjectInput(sourceFile));
				if (!submissionValidationResult.isValid()) {
					addError(Constants.SUBMISSION_SOURCE, submissionValidationResult.getMessage());
				}

				// Submission preview bundled file is always required
                submissionValidationResult = new SourceSubmissionValidator(c).validate(new ObjectInput(submissionFile));
                if (!submissionValidationResult.isValid()) {
                    addError(Constants.SUBMISSION, submissionValidationResult.getMessage());
                }

                // Preview image is always required
                submissionValidationResult = new ImageSubmissionValidator(c).validate(new ObjectInput(previewFile));
                if (!submissionValidationResult.isValid()) {
                    addError(Constants.SUBMISSION_PREVIEW, submissionValidationResult.getMessage());
                }

                StringInput rankInput = new StringInput(rank);
				ValidationResult rankResult = new IntegerValidator("Valid integer expected.").validate(rankInput);
				if (!rankResult.isValid()) {
					addError(Constants.SUBMISSION_RANK, rankResult.getMessage());
				}

				if (hasErrors()) {
                    r.setAttribute("fonts_data", fontsData);
                    r.setAttribute("stock_art_data", stockArtData);
                    r.setAttribute("has_licensed_content", hasLicensedContent);
                    r.setAttribute("submission_comment", submissionComment);
                    r.setAttribute("submission_rank", rank);
                    r.setAttribute("external_content_error", contentError);

					setDefault(Constants.CONTEST_ID, contestId.toString());
					setDefault(Constants.SUBMISSION_RANK, rank);
					loadSubmissionData(u, c, submissionDAO, uploadDAO);
					getRequest().setAttribute("contest", c);
					setNextPage("/submit.jsp");
					setIsNextPageInContext(true);
				} else {
                    // build data for document generator
                    StringBuilder declarationData = new StringBuilder();
                    declarationData.append("<DATA>");
                    declarationData.append("<comment>").append(blank(submissionComment, "Comments") ? "No declarations made" : escapeXML(submissionComment)).append("</comment>");
                    for (int i = 0; i < fontsData.size(); ++i) {
                        String[] font = fontsData.get(i);
                        declarationData.append("<font><index>").append(i + 1).append("</index><name>").
                            append(escapeXML(font[0])).append("</name><url>").append(escapeXML(font[1])).
                            append("</url></font>");
                    }


                    for (int i = 0; i < stockArtData.size(); ++i) {
                        String[] sa = stockArtData.get(i);
                        declarationData.append("<stockArt><index>").append(i + 1).append("</index><name>").
                            append(escapeXML(sa[0])).append("</name><url>").append(escapeXML(sa[1])).
                            append("</url><fileNumber>").append(escapeXML(sa[2])).append("</fileNumber></stockArt>");
                    }
                    declarationData.append("</DATA>");

                    String path = Util.createSubmissionPath(c, u);
					File directory = new File(path);					
					if (!directory.exists()) {
						directory.mkdirs();
					}

                    String declaration = generateDeclarationFile(declarationData.toString());
					submissionFile = generateUnifiedSubmissionFile(submissionFile, sourceFile, previewFile, u, declaration);

					String remoteFileName = submissionFile.getRemoteFileName();

					log.debug("unified submission: " + submissionFile.getRemoteFileName());

					// do thorough validation
					ValidationResult thoroughValidationResult = new UnifiedSubmissionValidator(c).validate(new ObjectInput(submissionFile));
					if (!thoroughValidationResult.isValid()) {
						throw new TCException(thoroughValidationResult.getMessage());
					}


                    Submission s = new Submission();
					s.setCreateUser(u.getId().toString());
					s.setCreateDate(new Timestamp(now.getTime()));
					s.setModifyUser(u.getId().toString());
					s.setModifyDate(new Timestamp(now.getTime()));
					s.setStatusId(Submission.STATUS_ACTIVE);
					s.setTypeId(getSubmissionTypeId(c));
					s.setFileSize(submissionFile.getSize());
					s.setViewCount(0L);
					

                    String systemFileName = createSystemFileName(s, remoteFileName);
					
					Upload upload = new Upload();
					upload.setCreateUser(u.getId().toString());
					upload.setCreateDate(new Timestamp(now.getTime()));
					upload.setModifyUser(u.getId().toString());
					upload.setModifyDate(new Timestamp(now.getTime()));
					upload.setContest(c);
					upload.setResource(resource);
					upload.setParameter(systemFileName);
					upload.setTypeId(Upload.SUBMISSION);
					upload.setStatusId(Upload.STATUS_ACTIVE);					
					
					
					s.setUpload(upload);

                    s.setDeclaration(submissionDeclaration);
                    submissionDeclaration.setSubmission(s);
                   
					if (log.isDebugEnabled()) {
						log.debug("creating file: " + path + System.getProperty("file.separator") + systemFileName);
					}
					f = new File(path, systemFileName);

 					FileOutputStream fos = new FileOutputStream(f);
					byte[] fileBytes = new byte[512];
					InputStream ios = submissionFile.getInputStream();
					int read;
					while ((read=ios.read(fileBytes))!=-1) {
						fos.write(fileBytes,0,read);
					}
					ios.close();
					fos.close(); 
                    
                    List<Upload> uploads = uploadDAO.getUploads(c, resource, Upload.STATUS_ACTIVE, Upload.SUBMISSION);
					Integer maxRank = submissionDAO.getMaxRank(uploads);
					Integer one = 1;
					getRequest().setAttribute("maxRank", maxRank);

					if (maxRank == null) {
						s.setRank(one);
						submissionDAO.saveOrUpdate(s);
					} else {
						Integer newRank = new Integer(rank);
						if (newRank.compareTo(maxRank) > 0) {
							s.setRank(maxRank + 1);
							submissionDAO.saveOrUpdate(s);
						} else if (newRank.compareTo(one) < 0) {
							submissionDAO.changeRank(one, s, uploads);
						} else {
							submissionDAO.changeRank(newRank, s, uploads);
						}
					}
								
					closeConversation();
					// have to wrap up the last stuff, and get into
					// new stuff
					beginCommunication();

					// Since TopCoder Studio Modifications Assembly -
					// generate alternate representations for the
					// submission. Req# 5.7
					u = DAOUtil.getFactory().getUserDAO().find(getUser().getId());
					generateAlternateRepresentations(c, s, submissionFile, u);

					// Create resource_submission entry 
					ResourceSubmission resourceSubmission = new ResourceSubmission();
					resourceSubmission.setSubmission(s);
					resourceSubmission.setResource(resource);
					resourceSubmission.setCreateUser(u.getId().toString());
					resourceSubmission.setCreateDate(new Timestamp(now.getTime()));
					resourceSubmission.setModifyUser(u.getId().toString());
					resourceSubmission.setModifyDate(new Timestamp(now.getTime()));
					s.addResource(resourceSubmission);
					
					submissionDAO = factory.getSubmissionDAO();
					submissionDAO.saveOrUpdate(s);		
					
					StringBuffer nextPage = new StringBuffer(50);
					nextPage.append(getSessionInfo().getServletPath());
					nextPage.append("?" + Constants.MODULE_KEY + "=ViewSubmissionSuccess&");
					nextPage.append(Constants.SUBMISSION_ID + "=").append(s.getId());
                    String queryString = getRequest().getQueryString();
                    int pos = queryString.lastIndexOf(Constants.UPLOAD_ID + "=");
                    String uploadId = queryString.substring(pos + (Constants.UPLOAD_ID + "=").length());
                    nextPage.append("&").append(Constants.UPLOAD_ID + "=").append(uploadId);
                    setNextPage(nextPage.toString());
					setIsNextPageInContext(false);
				}
			}
		} else {
			throw new PermissionException(getUser(), new ClassResource(this.getClass()));
		}
	}


    /**
     * Escapes string to be put into xml node.
     *
     * @param s string to escape
     * @return escaped result
     */
    private static String escapeXML(String s) {
        return "<![CDATA[" + s + "]]>";
    }


	private UploadedFile generateUnifiedSubmissionFile(
			UploadedFile submissionFile, UploadedFile sourceFile,
			UploadedFile previewFile, User u, String declaration) throws IOException, PersistenceException,
			FileDoesNotExistException {
		// Get request
		MultipartRequest request = (MultipartRequest) getRequest();
		
		// Create ZIP file
		File zipFile = new File(Constants.TEMPORARY_STORAGE_PATH + "/" + "generated_" + System.currentTimeMillis() + "_" + u.getId() + "_unifiedSubmission.zip");
		log.debug("Saving zip file to " + zipFile.getAbsolutePath());
		
		FileOutputStream out = new FileOutputStream(zipFile);
		ZipOutputStream archiveFile = new ZipOutputStream(out);

		// submission
		InputStream input = submissionFile.getInputStream();
        String name = Constants.SUBMISSION_PATH + "/" + submissionFile.getRemoteFileName();

        // add declaration file to submission archive
        ZipInputStream zin = new ZipInputStream(input);
        ZipEntry submissionEntry = new ZipEntry(name);
        archiveFile.putNextEntry(submissionEntry);
        ZipOutputStream submissionOutput = new ZipOutputStream(archiveFile);

        // read contents of submission zip file
        ZipEntry e;
        while ((e = zin.getNextEntry()) != null) {
            submissionOutput.putNextEntry(new ZipEntry(e.getName()));
            if (!e.isDirectory()) {
                copyStream(zin, submissionOutput);
            }
            submissionOutput.closeEntry();
        }

        // add declaration file to submission file
        e = new ZipEntry("declaration.txt");
        submissionOutput.putNextEntry(e);
        submissionOutput.write(declaration.getBytes("UTF-8"));
        submissionOutput.closeEntry();

        // finish submission zip file, but do not close underlying stream
        submissionOutput.finish();
        zin.close();

		// source
		input = sourceFile.getInputStream();
		name = Constants.SUBMISSION_SOURCE_PATH + "/" + sourceFile.getRemoteFileName();
		addFileToZip(archiveFile, input, name);

		// preview
		input = previewFile.getInputStream();
		name = Constants.SUBMISSION_PATH + "/" + previewFile.getRemoteFileName();
		addFileToZip(archiveFile, input, name);

		archiveFile.flush();
		archiveFile.close();

		return new MockUploadedFile(zipFile, "application/x-zip");
	}

    /**
     * Buffer for copyStream method.
     */
    private byte[] buffer = null;

    /**
     * Simple routine to copy one stream into another.
     *
     * @param input copy from
     * @param output copy to
     * @throws IOException if anything goes wrong
     */
    public void copyStream(InputStream input, OutputStream output) throws IOException {
        if (buffer == null) {
            buffer = new byte[1 << 17];
        }

        int bytesRead;
        while ((bytesRead = input.read(buffer))!= -1) {
            output.write(buffer, 0, bytesRead);
        }
    }


	private void addFileToZip(ZipOutputStream zipFile, InputStream fileData, String fileName) throws IOException {
		ZipEntry zipEntry = new ZipEntry(fileName);
		zipFile.putNextEntry(zipEntry);
		byte[] buffer = new byte[512];
		int byteRead;
		while ((byteRead = fileData.read(buffer)) > 0) {
			zipFile.write(buffer, 0, byteRead);
		}
		zipFile.closeEntry();
		fileData.close();
	}

	/**
	 * <p>
	 * Handles the case when an exception has been raised while processing the
	 * request. Attempts to delete the uploaded file with submission from the
	 * local file system.
	 * </p>
	 */
	protected void exceptionCallBack() {
		if (f != null) {
			try {
				f.delete();
			} catch (Throwable e) {
				log.error("Error attempting to remove file (" + f.getPath() + f.getName() + ") after exception: " + e.getMessage());
			}
		}
	}

	/**
	 * <p>
	 * Generates the alternate representations for the submission submitted by
	 * the specified user for specified contest.
	 * </p>
	 *
	 * @param contest
	 *            a <code>Contest</code> representing the contest which the
	 *            submission belongs to.
	 * @param submission
	 *            a <code>Submission</code> providing the details for the
	 *            submission.
	 * @param submissionFile
	 *            an <code>UploadedFile</code> representing the submission.
	 * @param submitter
	 *            a <code>User</code> representing the submitter.
	 * @since TopCoder Studio Modifications Assembly (Req# 5.7)
	 */
	private void generateAlternateRepresentations(Project contest, Submission submission, UploadedFile submissionFile, User submitter) {
		FileGenerator fileGenerator = null;
		fileGenerator = new FileGenerator(contest, submission, submissionFile, submitter);
		Thread thread = new Thread(fileGenerator);
		thread.start();
		this.generatorThreads.add(thread);
	}

	/**
	 * <p>
	 * Gets the list of threads currently running by this controller.
	 * </p>
	 *
	 * @return a <code>List</code> combining the threads running by this
	 *         controller.
	 */
	protected List<Thread> getGeneratorThreads() {
		return this.generatorThreads;
	}

    /**
     * Checks whether string is null or empty.
     *
     * @param s string to test
     * @return whether string is null or empty
     */
    private static boolean blank(String s) {
        return s == null || s.trim().length() == 0;
    }

	/**
     * Checks whether string is null or empty (String is considered as empty string if it equlas to a provided string).
     *
     * @param s string to test
	 * @param emptyStr the provided string
     * @return whether string is null or empty (String is considered as empty string if it equlas to a provided string).
     */
    private static boolean blank(String s, String emptyStr) {
		return blank(s) || s.trim().equals(emptyStr);
	}

    /**
     * Adds property to ExternalContent instance.
     *
     * @param content ExternalContent instance
     * @param key property name
     * @param value property value
     */
    private static void addProperty(ExternalContent content, String key, String value) {
        if (content.getProperties() == null) {
            content.setProperties(new HashSet<ExternalContentProperty>());
        }
        ExternalContentProperty property = new ExternalContentProperty();
        property.setName(key);
        property.setValue(value);
        property.setExternalContent(content);
        content.getProperties().add(property);
    }

    /**
     * This method is newly added to add the submission declaration into the submission.zip file.
     *
     * @param data the declaration template data
     * @return the updated submission zip file with declaration text file
     * @throws BaseException when tc components throw errors
     * @throws IOException when some I/O operation fails
     */
    private String generateDeclarationFile(String data) throws IOException, BaseException {
        DocumentGenerator docGen = new DocumentGenerator();

        InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream(DECLARATION_FILE_TEMPLATE);
        ByteArrayOutputStream out = new ByteArrayOutputStream(1 << 9);
        copyStream(is, out);
        is.close();
        String templateText = out.toString("UTF-8");

        Template template = docGen.parseTemplate(templateText);

        return docGen.applyTemplate(template, data);
    }

}
/*
 * Copyright (C) 2005-2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageInputStream;

import com.topcoder.common.web.error.TCException;
import com.topcoder.servlet.request.FileDoesNotExistException;
import com.topcoder.servlet.request.MockUploadedFile;
import com.topcoder.servlet.request.PersistenceException;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.format.ObjectFormatter;
import com.topcoder.util.format.ObjectFormatterFactory;
import com.topcoder.web.common.DateUtils;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.Email;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.tag.CalendarDateFormatMethod;
import com.topcoder.web.common.validation.IntegerValidator;
import com.topcoder.web.common.validation.ObjectInput;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOFactory;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.dao.ElectronicAffirmationDAO;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestChannel;
import com.topcoder.web.studio.model.ContestProperty;
import com.topcoder.web.studio.model.ContestStatus;
import com.topcoder.web.studio.model.ElectronicAffirmation;
import com.topcoder.web.studio.model.FilePath;
import com.topcoder.web.studio.model.MimeType;
import com.topcoder.web.studio.model.ReviewStatus;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.SubmissionStatus;
import com.topcoder.web.studio.model.SubmissionType;
import com.topcoder.web.studio.util.FileGenerator;
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
 * Modified dbProcessing meethod, to insert the electronic assignment record on success submission.
 * </p>
 *
 * @author dok, isv, Vitta
 * @version $Revision$ Date: 2005/01/01 00:00:00 Create Date: Jul 20,
 *          2006
 */
public class Submit extends BaseSubmissionDataProcessor {
	private static final Logger log = Logger.getLogger(Submit.class);

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
	 * @throws Exception
	 *             if an unexpected error occurs.
	 */
	protected void dbProcessing() throws Exception {
		if (userLoggedIn()) {
			Long contestId;

			try {
				contestId = new Long(getRequest().getParameter(
						Constants.CONTEST_ID));
			} catch (NumberFormatException e) {
				throw new NavigationException("Invalid contest specified.");
			}

			String rank = getRequest().getParameter(
					Constants.SUBMISSION_RANK);

			StudioDAOFactory cFactory = StudioDAOUtil.getFactory();
			DAOFactory factory = DAOUtil.getFactory();
			SubmissionDAO dao = cFactory.getSubmissionDAO();
			UserDAO userDAO = factory.getUserDAO();
			ElectronicAffirmationDAO affirmDAO = cFactory.getElectronicAffirmationDAO();

			Contest c = cFactory.getContestDAO().find(contestId);
			Date now = new Date();
			if (now.before(c.getStartTime()) || now.after(c.getEndTime())
					|| !ContestStatus.ACTIVE.equals(c.getStatus().getId())) {
				throw new NavigationException("Inactive contest specified.");
			}
			User u = userDAO.find(getUser().getId());

			if (cFactory.getContestRegistrationDAO().find(c, u) == null) {
				// not registered
				StringBuffer buf = new StringBuffer(50);
				buf.append(getSessionInfo().getServletPath());
				buf.append("?" + Constants.MODULE_KEY
						+ "=ViewRegistration&");
				buf.append(Constants.CONTEST_ID + "=").append(contestId);
				setNextPage(buf.toString());
				setIsNextPageInContext(false);
			} else {
				// registered
				MultipartRequest r = (MultipartRequest) getRequest();

				UploadedFile submissionFile = r
						.getUploadedFile(Constants.SUBMISSION);
				UploadedFile sourceFile = r
						.getUploadedFile(Constants.SUBMISSION_SOURCE);
				UploadedFile previewFile = r
						.getUploadedFile(Constants.SUBMISSION_PREVIEW);

				log.debug("submission: "
						+ submissionFile.getRemoteFileName());
				log.debug("submission content type: "
						+ submissionFile.getContentType());
				log.debug("submission file id: "
						+ submissionFile.getFileId());

				// Source submission is always requried
				ValidationResult submissionValidationResult = new SourceSubmissionValidator()
						.validate(new ObjectInput(sourceFile));
				if (!submissionValidationResult.isValid()) {
					addError(Constants.SUBMISSION_SOURCE,
							submissionValidationResult.getMessage());
				}

				// Submission preview bundled file is not always required
				Map<Integer, String> contestConfig = c.getConfigMap();
				boolean previewFileRequired = Boolean
						.parseBoolean(contestConfig
								.get(ContestProperty.REQUIRE_PREVIEW_FILE));
				if (previewFileRequired) {
					submissionValidationResult = new SourceSubmissionValidator()
							.validate(new ObjectInput(submissionFile));
					if (!submissionValidationResult.isValid()) {
						addError(Constants.SUBMISSION,
								submissionValidationResult.getMessage());
					}
				}

				// Preview image is not always required
				boolean previewImageRequired = Boolean
						.parseBoolean(contestConfig
								.get(ContestProperty.REQUIRE_PREVIEW_IMAGE));
				if (previewImageRequired) {
					submissionValidationResult = new ImageSubmissionValidator()
							.validate(new ObjectInput(previewFile));
					if (!submissionValidationResult.isValid()) {
						addError(Constants.SUBMISSION_PREVIEW,
								submissionValidationResult.getMessage());
					}
				}

				StringInput rankInput = new StringInput(rank);
				ValidationResult rankResult = new IntegerValidator(
						"Please input a valid integer for rank.")
						.validate(rankInput);
				if (!rankResult.isValid()) {
					addError(Constants.SUBMISSION_RANK, rankResult
							.getMessage());
				}

				if (hasErrors()) {
					setDefault(Constants.CONTEST_ID, contestId.toString());
					setDefault(Constants.SUBMISSION_RANK, rank);
					loadSubmissionData(u, c, dao,
							SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE);
					getRequest().setAttribute("contest", c);
					setNextPage("/submit.jsp");
					setIsNextPageInContext(true);
				} else {
				
				

					submissionFile = gnerateUnifiedSubmissionFile(
							submissionFile, sourceFile, previewFile, u);

					String remoteFileName = submissionFile.getRemoteFileName();

					log.debug("unified submission: "
							+ submissionFile.getRemoteFileName());

					// do thorough validation
					ValidationResult thoroughValidationResult = new UnifiedSubmissionValidator(
							c).validate(new ObjectInput(submissionFile));
					if (!thoroughValidationResult.isValid()) {
						throw new TCException(submissionValidationResult.getMessage());
					}

					MimeType mt = UnifiedSubmissionValidator
							.getMimeType(submissionFile);
					Submission s = new Submission();
					s.setContest(c);
					s.setCreateDate(new Timestamp(now.getTime()));
					s.setOriginalFileName(remoteFileName);
					s.setSubmitter(u);
					s.setMimeType(mt);
					s.setStatus(cFactory.getSubmissionStatusDAO().find(
							SubmissionStatus.ACTIVE));

					StringBuffer buf = new StringBuffer(80);
					buf.append(Constants.ROOT_STORAGE_PATH);
					buf.append(System.getProperty("file.separator"));
					buf.append(Constants.SUBMISSIONS_DIRECTORY_NAME);
					buf.append(System.getProperty("file.separator"));
					buf.append(c.getId());
					buf.append(System.getProperty("file.separator"));
					buf.append(u.getHandle().toLowerCase());
					buf.append("_");
					buf.append(u.getId());
					buf.append(System.getProperty("file.separator"));

					FilePath p = new FilePath();
					p.setPath(buf.toString());

					File directory = new File(buf.toString());
					if (!directory.exists()) {
						directory.mkdirs();
					}

					String ext = remoteFileName.substring(remoteFileName
							.lastIndexOf('.'));

					// root/submissions/contest_id/user_id/time.pdf
					s.setPath(p);
					s.setSystemFileName(System.currentTimeMillis() + ext);
					s
							.setType(cFactory
									.getSubmissionTypeDAO()
									.find(
											SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE));

					if (log.isDebugEnabled()) {
						log.debug("creating file: " + p.getPath()
								+ s.getSystemFileName());
					}
					f = new File(p.getPath() + s.getSystemFileName());

 					FileOutputStream fos = new FileOutputStream(f);
					byte[] fileBytes = new byte[512];
					InputStream ios = submissionFile.getInputStream();
					int read;
					while ((read=ios.read(fileBytes))!=-1)
					{
						fos.write(fileBytes,0,read);
					}
					ios.close();
					fos.close(); 

 					if (mt.getFileType().isImageFile()) {
						ImageInputStream iis = ImageIO
								.createImageInputStream(new ByteArrayInputStream(
										fileBytes));
						BufferedImage image = ImageIO.read(iis);
						s.setWidth(image.getWidth());
						s.setHeight(image.getHeight());
					} 

					Integer maxRank = dao.getMaxRank(c, u);
					Integer one = 1;
					getRequest().setAttribute("maxRank", maxRank);

					// BUGR-633 Change: remove the automatic screening of
					// Submissions for TopCoder Cockpit contests
					/*
					// Since TopCoder Studio Modifications Assembly - if
					// contest is from TopCoder Direct then create
					// the passing review immediately. Req# 5.12
					ContestChannel contestChannel = c.getChannel();
					if (contestChannel != null) {
						if (ContestChannel.TOPCODER_DIRECT
								.equals(contestChannel.getId())) {
							SubmissionReview review = new SubmissionReview();
							review.setNew(true);
							review.setReviewer(userDAO.find(c
									.getCreateUserId()));
							review.setStatus(cFactory.getReviewStatusDAO()
									.find(ReviewStatus.PASSED));
							review
									.setText("TopCoder Direct, Automatic pass");
							review.setSubmission(s);
							cFactory.getSubmissionReviewDAO().saveOrUpdate(
									review);

							s.setReview(review);
						}
					}
					*/

					if (maxRank == null) {
						s.setRank(one);
						dao.saveOrUpdate(s);
					} else {
						Integer newRank = new Integer(rank);
						if (newRank.compareTo(maxRank) > 0) {
							s.setRank(maxRank + 1);
							dao.saveOrUpdate(s);
						} else if (newRank.compareTo(one) < 0) {
							dao.changeRank(one, s);
						} else {
							dao.changeRank(newRank, s);
						}
					}
					
					//Insert the electronic affirmation records.
					ElectronicAffirmation electronicAffirmation = new ElectronicAffirmation();
					electronicAffirmation.setSubmissionId(Integer.valueOf(s.getId().toString()));
					electronicAffirmation.setCreateTime(new Timestamp(new Date().getTime()));
					affirmDAO.saveOrUpdate(electronicAffirmation);

					closeConversation();
					// have to wrap up the last stuff, and get into
					// new stuff. we don't want
					// sending email to be in the transaction
					beginCommunication();

					// Since TopCoder Studio Modifications Assembly -
					// generate alternate representations for the
					// submission. Req# 5.7
					generateAlternateRepresentations(c, s, submissionFile,
							u);

					u = DAOUtil.getFactory().getUserDAO().find(
							getUser().getId());

					ContestChannel contestChannel = c.getChannel();
					if (contestChannel != null
							&& u.getPrimaryEmailAddress().getStatusId()
									.equals(Email.STATUS_ID_ACTIVE)) {
						if (ContestChannel.TOPCODER_DIRECT
								.equals(contestChannel.getId())) {

							// BUGR-633 Change: mail text has been changed
							String response = "Your submission has been accepted and shown to the client. It still needs to be screened and you will receive another email alerting you to whether your submission has passed or failed screening.";


							ReviewStatus rs = StudioDAOUtil.getFactory()
									.getReviewStatusDAO().find(
											ReviewStatus.PASSED);

															// BUGR-628 Change: change the parameter for sendEmail() method
							sendEmail(u, response, s.getId(),
									rs, new Date(), c.getName());

						}
					}
					StringBuffer nextPage = new StringBuffer(50);
					nextPage.append(getSessionInfo().getServletPath());
					nextPage.append("?" + Constants.MODULE_KEY
							+ "=ViewSubmissionSuccess&");
					nextPage.append(Constants.SUBMISSION_ID + "=").append(
							s.getId());
					setNextPage(nextPage.toString());
					setIsNextPageInContext(false);
				}
			}
		} else {
			throw new PermissionException(getUser(), new ClassResource(this
					.getClass()));
		}
	}

	private UploadedFile gnerateUnifiedSubmissionFile(
			UploadedFile submissionFile, UploadedFile sourceFile,
			UploadedFile previewFile, User u) throws IOException, PersistenceException,
			FileDoesNotExistException {

		// Create ZIP file
		File zipFile = new File(Constants.TEMPORARY_STORAGE_PATH + "/" + "generated_" + System.currentTimeMillis() + "_" + u.getId() + "_unifiedSubmission.zip");
		FileOutputStream out = new FileOutputStream(zipFile);
		ZipOutputStream archiveFile = new ZipOutputStream(out);

		// submission
		InputStream input = submissionFile.getInputStream();
		String name = Constants.SUBMISSION_PATH + "/"
				+ submissionFile.getRemoteFileName();
		addFileToZip(archiveFile, input, name);

		// source
		input = sourceFile.getInputStream();
		name = Constants.SUBMISSION_SOURCE_PATH + "/"
				+ sourceFile.getRemoteFileName();
		addFileToZip(archiveFile, input, name);

		// preview
		input = previewFile.getInputStream();
		name = Constants.SUBMISSION_PATH + "/"
				+ previewFile.getRemoteFileName();
		addFileToZip(archiveFile, input, name);

		archiveFile.flush();
		archiveFile.close();

		UploadedFile unifiedFile = new MockUploadedFile(zipFile,
				"application/x-zip");

		return unifiedFile;
	}

	private void addFileToZip(ZipOutputStream zipFile, InputStream fileData,
			String fileName) throws IOException {
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
				log.error("Error attempting to remove file (" + f.getPath()
						+ f.getName() + ") after exception: " + e.getMessage());
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
	private void generateAlternateRepresentations(Contest contest,
			Submission submission, UploadedFile submissionFile, User submitter) {
		FileGenerator fileGenerator = null;
		try {
			fileGenerator = new FileGenerator(contest, submission,
					submissionFile.getInputStream(), submitter);
			Thread thread = new Thread(fileGenerator);
			thread.start();
			this.generatorThreads.add(thread);
		} catch (PersistenceException e) {
			log.error(
					"Could not generate alternate presentations for submission ["
							+ submission.getId() + "]", e);
		} catch (FileDoesNotExistException e) {
			log.error(
					"Could not generate alternate presentations for submission ["
							+ submission.getId() + "]", e);
		} catch (IOException e) {
			log.error(
					"Could not generate alternate presentations for submission ["
							+ submission.getId() + "]", e);
		}
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

        // BUGR-628 Change: change the parameter for this method.
        // Change the third parameter 'String fileName' to 'Long SubmissionId', and add a parameter 'String contestName'.
	private void sendEmail(User submitter, String text, Long SubmissionId,
			ReviewStatus status, Date submitDate, String contestName) throws Exception {

		TCSEmailMessage mail = new TCSEmailMessage();
		/* if (ReviewStatus.PASSED.equals(status.getId())) {
			mail.setSubject("Your TopCoder(R) Studio submission passed review");
		} else if (ReviewStatus.FAILED.equals(status.getId())) {
			mail.setSubject("Your TopCoder(R) Studio submission failed review");
		} else if (ReviewStatus.CHEATED.equals(status.getId())) {
			// don't send email
			return;
		} */

		mail.setSubject("Your TopCoder(R) Studio submission has been accepted");

		StringBuffer msgText = new StringBuffer(3000);

		msgText.append("Dear ");
		msgText.append(submitter.getHandle());
		msgText.append(",\n\n");
		msgText.append("This email is in regard to submission Id ");
                // BUGR-628 change: change 'fileName' to 'SubmissionId'
		msgText.append(SubmissionId);
                // BUGR-628 change: add the following two lines
                msgText.append(" for contest ");
                msgText.append(contestName);
		msgText.append(" submitted on ");;

		ObjectFormatter formatter = ObjectFormatterFactory.getEmptyFormatter();
		formatter
				.setFormatMethodForClass(Calendar.class,
						new CalendarDateFormatMethod(
								"EEEE, MMMM d, yyyy 'at' HH:mm z"), true);

		Calendar cal = Calendar.getInstance();
		cal.setTime(DateUtils.getConvertedDate(submitDate, submitter
				.getTimeZone().getDescription()));
		cal.setTimeZone(TimeZone.getTimeZone(submitter.getTimeZone()
				.getDescription()));

		msgText.append(formatter.format(cal));
		msgText.append("\n\n");
		msgText.append(text);
		msgText.append("\n\n");

		msgText.append("Sincerely,\n");
		msgText.append("Cockpit Automatic Screener");

		mail.setBody(msgText.toString());
		mail.addToAddress(submitter.getPrimaryEmailAddress().getAddress(),
				TCSEmailMessage.TO);

		mail
				.setFromAddress("studioadmin@topcoder.com",
						"TopCoder Studio Admin");
		EmailEngine.send(mail);
	}

}
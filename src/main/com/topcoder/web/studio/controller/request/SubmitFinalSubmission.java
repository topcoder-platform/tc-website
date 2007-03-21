package com.topcoder.web.studio.controller.request;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageInputStream;

import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.AssignmentDocument;
import com.topcoder.web.common.model.AssignmentDocumentStatus;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.IntegerValidator;
import com.topcoder.web.common.validation.ObjectInput;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOFactory;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.FilePath;
import com.topcoder.web.studio.model.MimeType;
import com.topcoder.web.studio.model.StudioFileType;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.SubmissionType;
import com.topcoder.web.studio.validation.SubmissionValidator;

/**
 * @author pulky
 */
public class SubmitFinalSubmission extends BaseSubmissionDataProcessor {
    private File f = null;

    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            Long contestId;

            try {
                contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid contest specified.");
            }

            String rank = getRequest().getParameter(Constants.SUBMISSION_RANK);

            StudioDAOFactory cFactory = StudioDAOUtil.getFactory();
            DAOFactory factory = DAOUtil.getFactory();
            SubmissionDAO dao = cFactory.getSubmissionDAO();

            Contest c = cFactory.getContestDAO().find(contestId);
            User u = factory.getUserDAO().find(new Long(getUser().getId()));

            
            if (cFactory.getContestRegistrationDAO().find(c, u) == null) { 
                throw new NavigationException("User not registered for the contest");
            } else if (!isWinner(u, c, cFactory.getSubmissionDAO(), SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE)) {
                throw new NavigationException("User cannot upload final submissions");
            } else {
                //registered and winner

                MultipartRequest r = (MultipartRequest) getRequest();

                UploadedFile submissionFile = r.getUploadedFile(Constants.SUBMISSION);

                // for final submissions only zip files are allowed.
                StudioFileType sft = cFactory.getFileTypeDAO().find(StudioFileType.ZIP_ARCHIVE_TYPE_ID);
                Set ft = new HashSet();
                ft.add(sft);
                c.setFileTypes(ft);
                //do validation
                ValidationResult submissionResult = new SubmissionValidator(c).validate(new ObjectInput(submissionFile));
                if (!submissionResult.isValid()) {
                    addError(Constants.SUBMISSION, submissionResult.getMessage());
                }

                ValidationResult rankResult = new IntegerValidator("Please input a valid integer for rank.").validate(new StringInput(rank));
                if (!rankResult.isValid()) {
                    addError(Constants.SUBMISSION_RANK, rankResult.getMessage());
                }

                if (!"on".equals(getRequest().getParameter(Constants.ACCEPT_AD))) {
                    addError(Constants.ACCEPT_AD_ERROR, "You must accept the Assignment Document in order to upload your final submission");
                }

                List adList = PactsServicesLocator.getService()
                .getAssignmentDocumentByUserIdStudioContestId(u.getId().longValue(), c.getId().longValue());

                AssignmentDocument ad = (AssignmentDocument) adList.get(0);

                Boolean hasHardCopy = PactsServicesLocator.getService()
                .hasHardCopyAssignmentDocumentByUserId(ad.getUser().getId().longValue(), 
                ad.getType().getId().longValue());

                if (hasErrors()) {
                    getRequest().setAttribute("assignment_document", ad);
                    getRequest().setAttribute("has_hard_copy", hasHardCopy);
                    getRequest().setAttribute(Constants.ACCEPT_AD, getRequest().getParameter(Constants.ACCEPT_AD));

                    setDefault(Constants.ACCEPT_AD, String.valueOf("on".equals(getRequest().getParameter(Constants.ACCEPT_AD))));

                    setDefault(Constants.CONTEST_ID, contestId.toString());
                    setDefault(Constants.SUBMISSION_RANK, rank);
                    loadSubmissionData(u, c, dao, SubmissionType.FINAL_SUBMISSION_TYPE);
                    getRequest().setAttribute("contest", c);
                    setNextPage("/submitFinalSubmission.jsp");
                    setIsNextPageInContext(true);
                } else {
                    // affirm the AD.
                    if (ad.getStatus().getId().equals(AssignmentDocumentStatus.PENDING_STATUS_ID) && hasHardCopy.booleanValue()) {
                        PactsServicesLocator.getService().affirmAssignmentDocument(ad);
                    }
                    
                    // accept the file
                    MimeType mt = cFactory.getMimeTypeDAO().find(submissionFile.getContentType());
                    Submission s = new Submission();
                    s.setContest(c);
                    s.setOriginalFileName(submissionFile.getRemoteFileName());
                    s.setSubmitter(u);
                    s.setMimeType(mt);

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

                    String ext = submissionFile.getRemoteFileName().substring(submissionFile.getRemoteFileName().lastIndexOf('.'));

                    //root/submissions/contest_id/user_id/time.pdf
                    s.setPath(p);
                    s.setSystemFileName(System.currentTimeMillis() + ext);
                    s.setType(cFactory.getSubmissionTypeDAO().find(SubmissionType.FINAL_SUBMISSION_TYPE));
                    s.setSubmissionDate(new Timestamp(System.currentTimeMillis()));

                    if (log.isDebugEnabled()) {
                        log.debug("creating file: " + p.getPath() + s.getSystemFileName());
                    }
                    f = new File(p.getPath() + s.getSystemFileName());

                    FileOutputStream fos = new FileOutputStream(f);
                    byte[] fileBytes = new byte[(int) submissionFile.getSize()];
                    submissionFile.getInputStream().read(fileBytes);
                    fos.write(fileBytes);
                    fos.close();

                    if (mt.getFileType().isImageFile()) {
                        ImageInputStream iis = ImageIO.createImageInputStream(new ByteArrayInputStream(fileBytes));
                        BufferedImage image = ImageIO.read(iis);
                        s.setWidth(new Integer(image.getWidth()));
                        s.setHeight(new Integer(image.getHeight()));
                    }

                    Integer maxRank = dao.getMaxRank(c, u);
                    Integer one = new Integer(1);
                    getRequest().setAttribute("maxRank", maxRank);
                    if (maxRank == null) {
                        s.setRank(one);
                        dao.saveOrUpdate(s);
                    } else {
                        Integer newRank = new Integer(rank);
                        if (newRank.compareTo(maxRank) > 0) {
                            s.setRank(new Integer(maxRank.intValue() + 1));
                            dao.saveOrUpdate(s);
                        } else if (newRank.compareTo(one) < 0) {
                            dao.changeRank(one, s);
                        } else {
                            dao.changeRank(newRank, s);
                        }
                    }

                    markForCommit();

                    StringBuffer nextPage = new StringBuffer(50);
                    nextPage.append(getSessionInfo().getServletPath());
                    nextPage.append("?" + Constants.MODULE_KEY + "=ViewFinalSubmissionSuccess&");
                    nextPage.append(Constants.SUBMISSION_ID + "=").append(s.getId());
                    setNextPage(nextPage.toString());
                    setIsNextPageInContext(false);


                }

            }

        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }

    protected void exceptionCallBack() {
        if (f != null) {
            try {
                f.delete();
            } catch (Throwable e) {
                log.error("Error attempting to remove file (" + f.getPath() + f.getName() + ") after exception: " + e.getMessage());
            }
        }
    }
}
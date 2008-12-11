package com.topcoder.web.winformula.controller.request;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.HashSet;
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
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.ObjectInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.dao.WinformulaDAOFactory;
import com.topcoder.web.winformula.dao.WinformulaDAOUtil;
import com.topcoder.web.winformula.dao.SubmissionDAO;
import com.topcoder.web.winformula.model.Contest;
import com.topcoder.web.winformula.model.FilePath;
import com.topcoder.web.winformula.model.MimeType;
import com.topcoder.web.winformula.model.WinformulaFileType;
import com.topcoder.web.winformula.model.Submission;
import com.topcoder.web.winformula.model.SubmissionStatus;
import com.topcoder.web.winformula.model.SubmissionType;
import com.topcoder.web.winformula.validation.SubmissionValidator;

/**
 * @author pulky
 */
public class SubmitFinalSubmission extends BaseSubmissionDataProcessor {
    private File f = null;

    @SuppressWarnings({"ResultOfMethodCallIgnored"})
    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            Long contestId;

            try {
                contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid contest specified.");
            }

            WinformulaDAOFactory cFactory = WinformulaDAOUtil.getFactory();
            DAOFactory factory = DAOUtil.getFactory();
            SubmissionDAO dao = cFactory.getSubmissionDAO();

            Contest c = cFactory.getContestDAO().find(contestId);
            User u = factory.getUserDAO().find(getUser().getId());


            if (cFactory.getContestRegistrationDAO().find(c, u) == null) {
                throw new NavigationException("User not registered for the contest");
            } else if (!userPlaced(u, c, cFactory.getSubmissionDAO())) {
                throw new NavigationException("User cannot upload final submissions");
            } else {
                //registered and winner

                MultipartRequest r = (MultipartRequest) getRequest();

                UploadedFile submissionFile = r.getUploadedFile(Constants.SUBMISSION);

                // for final submissions only zip files are allowed.
                Contest tempContest = new Contest();
                WinformulaFileType sft = cFactory.getFileTypeDAO().find(WinformulaFileType.ZIP_ARCHIVE_TYPE_ID);
                Set<WinformulaFileType> ft = new HashSet<WinformulaFileType>();
                ft.add(sft);
                tempContest.setFileTypes(ft);
                tempContest.setConfig(c.getConfig());
                //do validation
                ValidationResult submissionResult = new SubmissionValidator(tempContest).validate(new ObjectInput(submissionFile));
                if (!submissionResult.isValid()) {
                    addError(Constants.SUBMISSION, submissionResult.getMessage());
                }


                if (hasErrors()) {
                    setDefault(Constants.CONTEST_ID, contestId.toString());
                    loadSubmissionData(u, c, dao, SubmissionType.FINAL_SUBMISSION_TYPE);
                    getRequest().setAttribute("contest", c);
                    setNextPage("/submitFinalSubmission.jsp");
                    setIsNextPageInContext(true);
                } else {
                    // accept the file

                    MimeType mt = SubmissionValidator.getMimeType(submissionFile);
                    Submission s = new Submission();
                    s.setContest(c);
                    s.setOriginalFileName(submissionFile.getRemoteFileName());
                    s.setSubmitter(u);
                    s.setMimeType(mt);
                    s.setStatus(cFactory.getSubmissionStatusDAO().find(SubmissionStatus.ACTIVE));

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
                        s.setWidth(image.getWidth());
                        s.setHeight(image.getHeight());
                    }

                    dao.saveOrUpdate(s);

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
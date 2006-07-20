package com.topcoder.web.creative.controller.request;

import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.HibernateProcessor;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.FileType;
import com.topcoder.web.common.model.User;
import com.topcoder.web.creative.Constants;
import com.topcoder.web.creative.dao.CreativeDAOFactory;
import com.topcoder.web.creative.dao.CreativeDAOUtil;
import com.topcoder.web.creative.model.Contest;
import com.topcoder.web.creative.model.Submission;
import com.topcoder.web.creative.model.SubmissionPath;
import com.topcoder.web.creative.model.SubmissionType;

import java.io.File;
import java.io.FileOutputStream;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class Submit extends HibernateProcessor {
    private File f = null;

    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            Long contestId;

            try {
                contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid Contest Specified");
            }

            CreativeDAOFactory cFactory = CreativeDAOUtil.getFactory();
            DAOFactory factory = DAOUtil.getFactory();

            Contest c = cFactory.getContestDAO().find(contestId);
            User u = factory.getUserDAO().find(new Long(getUser().getId()));

            if (cFactory.getContestRegistrationDAO().find(c, u) == null) {
                //not registered
                setNextPage("/contestReg.jsp");
                setIsNextPageInContext(true);
            } else {
                //registered

                MultipartRequest r = (MultipartRequest) getRequest();

                UploadedFile file = r.getUploadedFile(Constants.SUBMISSION);

                byte[] fileBytes = null;
                int ret = 0;
                if (file != null && file.getContentType() != null) {
                    fileBytes = new byte[(int) file.getSize()];
                    ret = file.getInputStream().read(fileBytes);
                }
                if (ret == 0) {
                    addError(Constants.SUBMISSION, "Submission was empty");
                }

                FileType ft = factory.getFileTypeDAO().find(file.getContentType());

                if (ft == null || !FileType.ADOBE_ACROBAT_TYPE_ID.equals(ft.getId())) {
                    addError(Constants.SUBMISSION, "Unknown or invalid file type submitted, you must submit an Adobe Acrobat PDF file");
                }

                if (hasErrors()) {
                    setDefault(Constants.CONTEST_ID, contestId.toString());
                    setNextPage("/submit.jsp");
                    setIsNextPageInContext(true);
                } else {
                    Submission s = new Submission();
                    s.setContest(c);
                    s.setOriginalFileName(file.getRemoteFileName());
                    s.setSubmitter(u);
                    s.setFileType(ft);

                    StringBuffer buf = new StringBuffer(80);
                    buf.append(Constants.ROOT_STORAGE_PATH);
                    buf.append(File.pathSeparator);
                    buf.append(Constants.SUBMISSIONS_DIRECTORY_NAME);
                    buf.append(File.pathSeparator);
                    buf.append(c.getId());
                    buf.append(File.pathSeparator);
                    buf.append(u.getHandle().toLowerCase());
                    buf.append("_");
                    buf.append(u.getId());
                    buf.append(File.pathSeparator);

                    SubmissionPath p = new SubmissionPath();
                    p.setPath(buf.toString());

                    String ext = file.getRemoteFileName().substring(file.getRemoteFileName().lastIndexOf('.'));

                    //root/submissions/contest_id/user_id/time.pdf
                    s.setPath(p);
                    s.setSystemFileName(System.currentTimeMillis() + ext);
                    s.setType(cFactory.getSubmissionTypeDAO().find(SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE));

                    if (log.isDebugEnabled()) {
                        log.debug("creating file: " + p.getPath() + s.getSystemFileName());
                    }
                    f = new File(p.getPath() + s.getSystemFileName());

                    FileOutputStream fos = new FileOutputStream(f);
                    fos.write(fileBytes);
                    fos.close();

                    cFactory.getSubmissionDAO().saveOrUpdate(s);
                    markForCommit();

                    setNextPage("/submissionSuccess.jsp");
                    setIsNextPageInContext(true);
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

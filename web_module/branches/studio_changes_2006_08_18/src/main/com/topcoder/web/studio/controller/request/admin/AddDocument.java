package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.FileType;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.*;

import java.io.File;
import java.io.FileOutputStream;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public class AddDocument extends Base {

    protected void dbProcessing() throws Exception {
        String contestId = getRequest().getParameter(Constants.CONTEST_ID);

        if ("".equals(StringUtils.checkNull(contestId))) {
            throw new NavigationException("No contest specified");
        } else {

            String dt = getRequest().getParameter(Constants.DOCUMENT_TYPE_ID);
            if ("".equals(StringUtils.checkNull(dt))) {
                addError(Constants.DOCUMENT, "No document type specified");
            }

            DocumentType docType = StudioDAOUtil.getFactory().getDocumentTypeDAO().find(new Integer(dt));
            if (docType == null) {
                addError(Constants.DOCUMENT, "Unknown document type specified");
            }

            MultipartRequest r = (MultipartRequest) getRequest();

            UploadedFile file = r.getUploadedFile(Constants.DOCUMENT);

            byte[] fileBytes = null;
            int ret = 0;
            if (file != null && file.getContentType() != null) {
                fileBytes = new byte[(int) file.getSize()];
                ret = file.getInputStream().read(fileBytes);
            }
            if (ret == 0) {
                addError(Constants.DOCUMENT, "Document was empty");
            }

            FileType ft = DAOUtil.getFactory().getFileTypeDAO().find(file.getContentType());

            if (ft == null) {
                addError(Constants.SUBMISSION, "Unknown file type: " + file.getContentType());
            }

            Contest contest = StudioDAOUtil.getFactory().getContestDAO().find(new Long(contestId));
            if (hasErrors()) {

                loadEditContestData(contest);


                setNextPage("/editContest.jsp");
                setIsNextPageInContext(true);
            } else {
                Document d = new Document();
                d.setOriginalFileName(file.getRemoteFileName());
                d.setFileType(ft);
                d.setType(docType);

                StringBuffer buf = new StringBuffer(80);
                buf.append(Constants.ROOT_STORAGE_PATH);
                buf.append(System.getProperty("file.separator"));
                buf.append(Constants.DOCUMENTS_DIRECTORY_NAME);
                buf.append(System.getProperty("file.separator"));
                buf.append(contest.getId());
                buf.append(System.getProperty("file.separator"));

                FilePath p = new FilePath();
                p.setPath(buf.toString());

                File directory = new File(buf.toString());
                if (!directory.exists()) {
                    directory.mkdirs();
                }

                String ext = file.getRemoteFileName().substring(file.getRemoteFileName().lastIndexOf('.'));

                //root/submissions/contest_id/user_id/time.pdf
                d.setPath(p);
                d.setSystemFileName(System.currentTimeMillis() + ext);
                d.setType(StudioDAOUtil.getFactory().getDocumentTypeDAO().find(SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE));

                if (log.isDebugEnabled()) {
                    log.debug("creating file: " + p.getPath() + d.getSystemFileName());
                }
                File f = new File(p.getPath() + d.getSystemFileName());

                FileOutputStream fos = new FileOutputStream(f);
                fos.write(fileBytes);
                fos.close();

                contest.addDocument(d);

                StudioDAOUtil.getFactory().getContestDAO().saveOrUpdate(contest);
                markForCommit();

                setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                        "=AdminViewContest&" + Constants.CONTEST_ID + "=" + contestId);
                setIsNextPageInContext(false);
            }


        }


    }
}

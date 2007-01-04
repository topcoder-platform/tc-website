package com.topcoder.web.csf.dao;

import com.topcoder.web.studio.dao.*;
import com.topcoder.web.studio.dao.ContestPropertyDAO;
import com.topcoder.web.studio.dao.ContestStatusDAO;
import com.topcoder.web.studio.dao.ContestRegistrationDAO;
import com.topcoder.web.studio.dao.DocumentDAO;
import com.topcoder.web.studio.dao.DocumentTypeDAO;
import com.topcoder.web.studio.dao.ReviewStatusDAO;
import com.topcoder.web.studio.dao.PrizeTypeDAO;
import com.topcoder.web.studio.dao.FileTypeDAO;
import com.topcoder.web.studio.dao.MimeTypeDAO;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public interface StudioDAOFactory {
    com.topcoder.web.studio.dao.ContestDAO getContestDAO();


    ContestPropertyDAO getContestPropertyDAO();

    ContestStatusDAO getContestStatusDAO();

    ContestRegistrationDAO getContestRegistrationDAO();

    DocumentDAO getDocumentDAO();

    SubmissionDAO getSubmissionDAO();

    SubmissionReviewDAO getSubmissionReviewDAO();

    SubmissionTypeDAO getSubmissionTypeDAO();

    DocumentTypeDAO getDocumentTypeDAO();

    ReviewStatusDAO getReviewStatusDAO();

    PrizeTypeDAO getPrizeTypeDAO();

    FileTypeDAO getFileTypeDAO();

    MimeTypeDAO getMimeTypeDAO();

}

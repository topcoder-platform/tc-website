/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.model.DocumentType;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.Document;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.dao.ContestDAO;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;

import java.util.Set;

/**
 * <p>A request processor to be used for servicing the requests for updating the contest document details by the
 * administrator. The administrators may update the document type and description.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.7)
 */
public class SaveDocument extends Base {

    /**
     * <p>Constructs new <code>SaveDocument</code> instance. This implementation does nothing.</p>
     */
    public SaveDocument() {
    }

    /**
     * <p>Implements the business logic for request processing.</p>
     *
     * <p>Verifies that the necessary document details are provided, updates the document and redirects the request to a
     * view with details for original contest.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    protected void dbProcessing() throws Exception {
        String contestId = getRequest().getParameter(Constants.CONTEST_ID);
        String documentId = getRequest().getParameter(Constants.DOCUMENT_ID);

        if ("".equals(StringUtils.checkNull(contestId))) {
            throw new NavigationException("No contest specified");
        } else if ("".equals(StringUtils.checkNull(documentId))) {
            throw new NavigationException("No document specified");
        } else {
            // Get and validate document type
            DocumentType docType = null;
            String dt = getRequest().getParameter(Constants.DOCUMENT_TYPE_ID + '_' + documentId);
            if ("".equals(StringUtils.checkNull(dt))) {
                addError(Constants.DOCUMENT_TYPE_ID + '_' + documentId, "No document type specified");
            } else {
                try {
                    docType = StudioDAOUtil.getFactory().getDocumentTypeDAO().find(new Integer(dt));
                    if (docType == null) {
                        addError(Constants.DOCUMENT_TYPE_ID + '_' + documentId, "Unknown document type specified");
                    }
                } catch (NumberFormatException e) {
                    throw new NavigationException("The document ID is not numeric");
                }
            }

            // Get and validate document description
            String desc = getRequest().getParameter(Constants.DOC_DESC + '_' + documentId);
            if (StringUtils.checkNull(desc).length() > Constants.MAX_DOCUMENT_DESC_VALUE_LENGTH) {
                addError(Constants.DOC_DESC + '_' + documentId, "The document description is too long");
            }
            
            ContestDAO contestDAO = StudioDAOUtil.getFactory().getContestDAO();
            try {
                Contest contest = contestDAO.find(new Long(contestId));
                if (contest != null) {
                    if (hasErrors()) {
                        loadEditContestData(contest);
                        setNextPage("/admin/editContest.jsp");
                        setIsNextPageInContext(true);
                    } else {
                        boolean documentFound = false;
                        Set<Document> documents = contest.getDocuments();
                        for (Document document : documents) {
                            if (documentId.equals(String.valueOf(document.getId()))) {
                                documentFound = true;
                                document.setType(docType);
                                document.setDescription(desc);
                                break;
                            }
                        }
                        if (!documentFound) {
                            throw new NavigationException("The requested document is not found");
                        }
                        contestDAO.saveOrUpdate(contest);
                        setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                                "=ViewContest&" + Constants.CONTEST_ID + "=" + contestId);
                        setIsNextPageInContext(false);
                    }
                } else {
                    throw new NavigationException("The requested contest is not found");
                }
            } catch (NumberFormatException e) {
                throw new NavigationException("The contest ID is not numeric");
            }
        }
    }
}

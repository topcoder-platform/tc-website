package com.topcoder.web.csf.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.csf.Constants;
import com.topcoder.web.csf.model.Contest;
import com.topcoder.web.csf.model.Document;
import com.topcoder.web.csf.dao.CSFDAOUtil;

import java.util.Iterator;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public class RemoveDocument extends Base {

    protected void dbProcessing() throws Exception {
        String contestId = getRequest().getParameter(Constants.CONTEST_ID);
        String documentId = getRequest().getParameter(Constants.DOCUMENT_ID);

        if ("".equals(StringUtils.checkNull(contestId))) {
            throw new NavigationException("No contest specified");
        } else if ("".equals(StringUtils.checkNull(documentId))) {
            throw new NavigationException("No document specified");
        } else {
            Contest contest = CSFDAOUtil.getFactory().getContestDAO().find(new Long(contestId));

            Set docs = contest.getDocuments();
            Document curr;
            if (log.isDebugEnabled()) {
                log.debug("size before: " + docs.size());
            }
            boolean found = false;
            for (Iterator it = docs.iterator(); it.hasNext() && !found;) {
                curr = (Document) it.next();
                if (curr.getId().equals(new Long(documentId))) {
                    docs.remove(curr);
                    found = true;
                }
            }
            if (log.isDebugEnabled()) {
                log.debug("size after: " + docs.size());
            }
            if (!found) {
                throw new NavigationException("Could not find the document specified " + contestId + " " + documentId);
            }


            CSFDAOUtil.getFactory().getContestDAO().saveOrUpdate(contest);
            markForCommit();

            setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                    "=AdminViewContest&" + Constants.CONTEST_ID + "=" + contestId);
            setIsNextPageInContext(false);

        }


    }
}

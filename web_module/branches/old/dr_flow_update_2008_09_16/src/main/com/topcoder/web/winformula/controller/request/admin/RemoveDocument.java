package com.topcoder.web.winformula.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.dao.WinformulaDAOUtil;
import com.topcoder.web.winformula.model.Contest;
import com.topcoder.web.winformula.model.Document;

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
            Contest contest = WinformulaDAOUtil.getFactory().getContestDAO().find(new Long(contestId));

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


            WinformulaDAOUtil.getFactory().getContestDAO().saveOrUpdate(contest);

            setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                    "=ViewContest&" + Constants.CONTEST_ID + "=" + contestId);
            setIsNextPageInContext(false);

        }


    }
}

package com.topcoder.web.csf.controller.request.admin;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.csf.Constants;
import com.topcoder.web.csf.dao.CSFDAOUtil;
import com.topcoder.web.csf.model.Contest;
import com.topcoder.web.csf.model.Submission;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 1, 2007
 */
public class ViewElectionCreation extends Base {
    protected void dbProcessing() throws Exception {

        String contestId = getRequest().getParameter(Constants.CONTEST_ID);

        if (!"".equals(StringUtils.checkNull(contestId))) {
            //load
            Contest contest = CSFDAOUtil.getFactory().getContestDAO().find(new Long(contestId));
            ArrayList a = new ArrayList(contest.getSubmissions());
            Collections.sort(a, new Comparator() {
                public int compare(Object o1, Object o2) {
                    return ((Submission) o1).getId().compareTo(((Submission) o2).getId());
                }
            });
            getRequest().setAttribute("submissions", a);
            setDefault(Constants.CONTEST_ID, contest.getId());
        }

        setNextPage("/admin/electionCreation.jsp");
        setIsNextPageInContext(true);

    }
}

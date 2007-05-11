package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOFactory;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.Candidate;
import com.topcoder.web.oracle.model.CandidateInfo;
import com.topcoder.web.oracle.model.Round;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 4, 2007
 */
public class ViewCandidate extends Base {

    protected void dbProcessing() throws Exception {

        String roundId = getRequest().getParameter(Constants.ROUND_ID);
        String candidateId = getRequest().getParameter(Constants.CANDIDATE_ID);

        OracleDAOFactory f = OracleDAOUtil.getFactory();

        Candidate c = null;
        Round round = null;

        if ("".equals(StringUtils.checkNull(candidateId))) {
            round = f.getRoundDAO().find(new Integer(roundId));
            if (round == null) {
                throw new NavigationException("Invalid round specified.");
            } else {
                setDefault(Constants.ROUND_ID, round.getId());
                getRequest().setAttribute("round", round);
            }
        } else {
            c = f.getCandidateDAO().find(new Integer(candidateId));
            if (c == null) {
                throw new NavigationException("Invalid candidate specified.");
            } else {
                round = f.getRoundDAO().find(new Integer(roundId));
                if (round == null) {
                    throw new NavigationException("Invalid round specified.");
                } else {
                    getRequest().setAttribute("candidate", c);
                    setDefault(Constants.ROUND_ID, round.getId());
                    setDefault(Constants.CANDIDATE_ID, c.getId());
                    getRequest().setAttribute("round", round);
                    for (CandidateInfo info : c.getInfo()) {
                        setDefault(Constants.CANDIDATE_PROPERTY + info.getProperty().getId(), info.getValue());
                    }
                }

            }
        }
        getRequest().setAttribute("properties", f.getCandidatePropertyDAO().getProperties());

        setNextPage("/admin/editCandidate.jsp");
        setIsNextPageInContext(true);

    }
}

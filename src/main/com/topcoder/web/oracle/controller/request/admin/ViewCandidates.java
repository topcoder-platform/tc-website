package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOFactory;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.Round;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2007
 */
public class ViewCandidates extends Base {
    protected void dbProcessing() throws Exception {
        //load up all the candidates in the rounds


        String roundId = getRequest().getParameter(Constants.ROUND_ID);

        OracleDAOFactory f = OracleDAOUtil.getFactory();

        Round round;

        if ("".equals(StringUtils.checkNull(roundId))) {
            throw new NavigationException("Invalid round specified.");
        } else {
            round = f.getRoundDAO().find(new Integer(roundId));
            if (round == null) {
                throw new NavigationException("Invalid round specified.");
            } else {
                getRequest().setAttribute("candidates", f.getCandidateDAO().getCandidates(round));
                getRequest().setAttribute("round", round);
            }
        }

        setNextPage("/admin/candidates.jsp");
        setIsNextPageInContext(true);
    }
}

package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOFactory;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.Contest;
import com.topcoder.web.oracle.model.Round;
import com.topcoder.web.oracle.model.RoundStatus;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2007
 */
public class ViewRound extends Base {

    protected void dbProcessing() throws Exception {

        String roundId = getRequest().getParameter(Constants.ROUND_ID);
        String contestId = getRequest().getParameter(Constants.CONTEST_ID);

        OracleDAOFactory f = OracleDAOUtil.getFactory();

        Contest c=null;
        Round round=null;

        if ("".equals(StringUtils.checkNull(roundId))) {
            c = f.getContestDAO().find(new Integer(contestId));
            if (c==null) {
                throw new NavigationException("Invalid contest specified.");
            } else {
                setDefault(Constants.ROUND_STATUS_ID, RoundStatus.UNACTIVE);
                loadGeneralEditRoundData();
                setDefault(Constants.CONTEST_ID, c.getId());
            }
        } else {
            round = f.getRoundDAO().find(new Integer(roundId));
            if (round==null) {
                throw new NavigationException("Invalid round specified.");
            } else {
                loadEditRoundData(round);
            }
        }

        setNextPage("/admin/editRound.jsp");
        setIsNextPageInContext(true);

    }
}

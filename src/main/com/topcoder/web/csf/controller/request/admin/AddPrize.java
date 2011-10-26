package com.topcoder.web.csf.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.csf.Constants;
import com.topcoder.web.csf.dao.CSFDAOUtil;
import com.topcoder.web.csf.model.Contest;
import com.topcoder.web.csf.model.Prize;
import com.topcoder.web.csf.model.PrizeType;
import com.topcoder.web.csf.validation.PlaceValidator;
import com.topcoder.web.csf.validation.PrizeValidator;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public class AddPrize extends Base {

    protected void dbProcessing() throws Exception {
        String contestId = getRequest().getParameter(Constants.CONTEST_ID);

        if ("".equals(StringUtils.checkNull(contestId))) {
            throw new NavigationException("No contest specified");
        } else {
            Contest contest = CSFDAOUtil.getFactory().getContestDAO().find(new Long(contestId));
            String place = getRequest().getParameter(Constants.PRIZE_PLACE);
            String prize = getRequest().getParameter(Constants.PRIZE_VALUE);

            ValidationResult placeResult = new PlaceValidator(contest).validate(new StringInput(place));
            if (!placeResult.isValid()) {
                addError(Constants.PRIZE_PLACE, placeResult.getMessage());
            }
            ValidationResult prizeResult = new PrizeValidator().validate(new StringInput(prize));
            if (!prizeResult.isValid()) {
                addError(Constants.PRIZE_VALUE, prizeResult.getMessage());
            }

            if (hasErrors()) {
                loadEditContestData(contest);
                setNextPage("/admin/editContest.jsp");
                setIsNextPageInContext(true);
            } else {
                Prize cp = new Prize();
                cp.setAmount(new Float(prize));
                cp.setPlace(new Integer(place));
                cp.setType(CSFDAOUtil.getFactory().getPrizeTypeDAO().find(PrizeType.CONTEST));
                contest.addPrize(cp);
                CSFDAOUtil.getFactory().getContestDAO().saveOrUpdate(contest);
                markForCommit();
                setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                        "=AdminViewContest&" + Constants.CONTEST_ID + "=" + contestId);
                setIsNextPageInContext(false);
            }


        }


    }
}

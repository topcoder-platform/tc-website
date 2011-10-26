package com.topcoder.web.truveo.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.truveo.Constants;
import com.topcoder.web.truveo.dao.TruveoDAOUtil;
import com.topcoder.web.truveo.model.Contest;
import com.topcoder.web.truveo.model.Prize;
import com.topcoder.web.truveo.model.PrizeType;
import com.topcoder.web.truveo.validation.PlaceValidator;
import com.topcoder.web.truveo.validation.PrizeValidator;

/**
 * @author dok
 * @version $Revision: 70395 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public class AddPrize extends Base {

    protected void dbProcessing() throws Exception {
        String contestId = getRequest().getParameter(Constants.CONTEST_ID);

        if ("".equals(StringUtils.checkNull(contestId))) {
            throw new NavigationException("No contest specified");
        } else {
            Contest contest = TruveoDAOUtil.getFactory().getContestDAO().find(new Long(contestId));
            String prizeTypeId = getRequest().getParameter(Constants.PRIZE_TYPE_ID);
            PrizeType pt = TruveoDAOUtil.getFactory().getPrizeTypeDAO().find(new Integer(prizeTypeId));

            String place = null;
            if (pt.getId().equals(PrizeType.CONTEST)) {
                place = getRequest().getParameter(Constants.PRIZE_PLACE);
                ValidationResult placeResult = new PlaceValidator(contest).validate(new StringInput(place));
                if (!placeResult.isValid()) {
                    addError(Constants.PRIZE_PLACE, placeResult.getMessage());
                }
            }
            String prize = getRequest().getParameter(Constants.PRIZE_VALUE);

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
                if (pt.getId().equals(PrizeType.CONTEST)) {
                    cp.setPlace(new Integer(place));
                }
                cp.setType(pt);
                contest.addPrize(cp);
                TruveoDAOUtil.getFactory().getContestDAO().saveOrUpdate(contest);
                if (log.isDebugEnabled()) {
                    log.debug("prizes: ");
                    for (Prize p : contest.getPrizes()) {
                        log.debug("id: " + p.getId() + " place " + p.getPlace() + " amount " + p.getAmount() + " type " + p.getType().getDescription());
                    }
                }
                setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                        "=ViewContest&" + Constants.CONTEST_ID + "=" + contestId);
                setIsNextPageInContext(false);
            }


        }


    }
}

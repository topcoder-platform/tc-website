package com.topcoder.web.creative.controller.request.admin;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.creative.Constants;
import com.topcoder.web.creative.dao.CreativeDAOUtil;
import com.topcoder.web.creative.model.Contest;
import com.topcoder.web.creative.model.ContestPrize;
import com.topcoder.web.creative.model.ContestProperty;
import com.topcoder.web.creative.validation.PlaceValidator;
import com.topcoder.web.creative.validation.PrizeValidator;

import java.text.SimpleDateFormat;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public class AddPrize extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
        String contestId = getRequest().getParameter(Constants.CONTEST_ID);

        if ("".equals(StringUtils.checkNull(contestId))) {
            throw new NavigationException("No contest specified");
        } else {
            Contest contest = CreativeDAOUtil.getFactory().getContestDAO().find(new Long(contestId));
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
                getRequest().setAttribute("contest", contest);

                SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);

                setDefault(Constants.CONTEST_PROPERTY + ContestProperty.CONTEST_OVERVIEW_TEXT,
                        contest.getOverview().getValue());
                setDefault(Constants.CONTEST_PROPERTY + ContestProperty.PRIZE_DESCRIPTION,
                        contest.getPrizeDescription().getValue());

                setDefault(Constants.CONTEST_ID, contest.getId());
                setDefault(Constants.CONTEST_NAME, contest.getName());
                setDefault(Constants.START_TIME, sdf.format(contest.getStartTime()));
                setDefault(Constants.END_TIME, sdf.format(contest.getEndTime()));
                setNextPage("/admin/editContest.jsp");
                setIsNextPageInContext(true);
            } else {
                ContestPrize cp = new ContestPrize();
                cp.setAmount(new Float(prize));
                cp.setPlace(new Integer(place));
                cp.setContest(contest);
                cp.getId().setContest(contest);
                cp.getId().setPlace(cp.getPlace());
                contest.addPrize(cp);
                CreativeDAOUtil.getFactory().getContestDAO().saveOrUpdate(contest);
                markForCommit();
                setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                        "=AdminViewContest&" + Constants.CONTEST_ID + "=" + contestId);
                setIsNextPageInContext(false);
            }


        }


    }
}

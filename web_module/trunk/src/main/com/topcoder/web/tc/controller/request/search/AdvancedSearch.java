package com.topcoder.web.tc.controller.request.search;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.MemberSearch;

public class AdvancedSearch extends SimpleSearch {

    protected void businessProcessing() throws TCWebException {
        try {

            MemberSearch m = getResults();
            getRequest().setAttribute("memberSearch", m);
            setDefaults(m);
            if (m.getTotal() == 1) {
                long userId = m.getResults().getLongItem(0, "user_id");
                setNextPage("/stat?c=member_profile&cr=" + userId);
                setIsNextPageInContext(false);
            } else {
                setNextPage(Constants.ADVANCED_SEARCH_RESULTS);
                setIsNextPageInContext(true);
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }


    }

    protected void setDefaults(MemberSearch m) {
        super.setDefaults(m);
        setDefault(Constants.STATE_CODE, m.getStateCode() == null ? "" : m.getStateCode().toString());
        setDefault(Constants.COUNTRY_CODE, m.getCountryCode() == null ? "" : m.getCountryCode().toString());
        setDefault(Constants.SCHOOL_NAME, m.getSchoolName() == null ? "" : m.getSchoolName().toString());
        setDefault(Constants.MIN_RATING, m.getMinRating() == null ? "" : m.getMinRating().toString());
        setDefault(Constants.MAX_RATING, m.getMaxRating() == null ? "" : m.getMaxRating().toString());
        setDefault(Constants.MIN_NUM_RATINGS, m.getMinNumRatings() == null ? "" : m.getMinNumRatings().toString());
        setDefault(Constants.MAX_NUM_RATINGS, m.getMaxNumRatings() == null ? "" : m.getMaxNumRatings().toString());
        setDefault(Constants.MAX_DAYS_SINCE_LAST_COMP, m.getMaxDaysSinceLastComp() == null ? "" : m.getMaxDaysSinceLastComp().toString());
    }

    /**
     * pull the info out of the request and do some error checking
     * @return
     * @throws Exception
     */
    protected MemberSearch buildMemberSearch() throws Exception {
        MemberSearch ret = super.buildMemberSearch();
        String stateCode = StringUtils.checkNull(getRequest().getParameter(Constants.STATE_CODE));
        if (!stateCode.equals(""))
            ret.setStateCode(stateCode);

        String countryCode = StringUtils.checkNull(getRequest().getParameter(Constants.COUNTRY_CODE));
        if (!countryCode.equals(""))
            ret.setCountryCode(countryCode);

        String schoolName = StringUtils.checkNull(getRequest().getParameter(Constants.SCHOOL_NAME));
        if (!schoolName.equals(""))
            ret.setSchoolName(schoolName);

        String minRating = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_RATING));
        if (!minRating.equals(""))
            ret.setMinRating(new Integer(minRating));

        String maxRating = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_RATING));
        if (!maxRating.equals(""))
            ret.setMaxRating(new Integer(maxRating));

        String minNumRatings = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_NUM_RATINGS));
        if (!minNumRatings.equals(""))
            ret.setMinNumRatings(new Integer(minNumRatings));

        String maxNumRatings = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_NUM_RATINGS));
        if (!maxNumRatings.equals(""))
            ret.setMaxNumRatings(new Integer(maxNumRatings));

        String maxDaysSinceLastComp = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_DAYS_SINCE_LAST_COMP));
        if (!maxDaysSinceLastComp.equals(""))
            ret.setMaxDaysSinceLastComp(new Integer(maxDaysSinceLastComp));


        ret.setStateList(getStateList());
        ret.setCountryList(getCountryList());
        return ret;
    }

}

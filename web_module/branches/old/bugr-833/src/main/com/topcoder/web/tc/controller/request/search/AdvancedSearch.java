package com.topcoder.web.tc.controller.request.search;

import com.topcoder.shared.dataAccess.DataAccessConstants;
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
                setNextPage("/tc?module=MemberProfile&cr=" + userId);
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
        setDefault(Constants.STATE_CODE, m.getStateCode() == null ? "" : m.getStateCode());
        setDefault(Constants.COUNTRY_CODE, m.getCountryCode() == null ? "" : m.getCountryCode());
        setDefault(Constants.SCHOOL_NAME, m.getSchoolName() == null ? "" : m.getSchoolName());
        setDefault(Constants.MIN_RATING, m.getMinRating() == null ? "" : m.getMinRating().toString());
        setDefault(Constants.MAX_RATING, m.getMaxRating() == null ? "" : m.getMaxRating().toString());
        setDefault(Constants.MIN_DESIGN_RATING, m.getMinDesignRating() == null ? "" : m.getMinDesignRating().toString());
        setDefault(Constants.MAX_DESIGN_RATING, m.getMaxDesignRating() == null ? "" : m.getMaxDesignRating().toString());
        setDefault(Constants.MIN_DEV_RATING, m.getMinDevRating() == null ? "" : m.getMinDevRating().toString());
        setDefault(Constants.MAX_DEV_RATING, m.getMaxDevRating() == null ? "" : m.getMaxDevRating().toString());
        setDefault(Constants.MIN_NUM_RATINGS, m.getMinNumRatings() == null ? "" : m.getMinNumRatings().toString());
        setDefault(Constants.MAX_NUM_RATINGS, m.getMaxNumRatings() == null ? "" : m.getMaxNumRatings().toString());
        setDefault(Constants.MAX_DAYS_SINCE_LAST_COMP, m.getMaxDaysSinceLastComp() == null ? "" : m.getMaxDaysSinceLastComp().toString());
        setDefault(Constants.MIN_HS_RATING, m.getMinHSRating() == null ? "" : m.getMinHSRating().toString());
        setDefault(Constants.MAX_HS_RATING, m.getMaxHSRating() == null ? "" : m.getMaxHSRating().toString());
        setDefault(Constants.MIN_NUM_HS_RATINGS, m.getMinNumHSRatings() == null ? "" : m.getMinNumHSRatings().toString());
        setDefault(Constants.MAX_NUM_HS_RATINGS, m.getMaxNumHSRatings() == null ? "" : m.getMaxNumHSRatings().toString());
        setDefault(Constants.MAX_DAYS_SINCE_LAST_HS_COMP, m.getMaxDaysSinceLastHSComp() == null ? "" : m.getMaxDaysSinceLastHSComp().toString());
        setDefault(Constants.MIN_MAR_RATING, m.getMinMarRating() == null ? "" : m.getMinMarRating().toString());
        setDefault(Constants.MAX_MAR_RATING, m.getMaxMarRating() == null ? "" : m.getMaxMarRating().toString());
        setDefault(Constants.MIN_NUM_MAR_RATINGS, m.getMinNumMarRatings() == null ? "" : m.getMinNumMarRatings().toString());
        setDefault(Constants.MAX_NUM_MAR_RATINGS, m.getMaxNumMarRatings() == null ? "" : m.getMaxNumMarRatings().toString());
        setDefault(Constants.MAX_DAYS_SINCE_LAST_MAR_COMP, m.getMaxDaysSinceLastMarComp() == null ? "" : m.getMaxDaysSinceLastMarComp().toString());
        setDefault(DataAccessConstants.SORT_COLUMN, getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        setDefault(DataAccessConstants.SORT_DIRECTION, getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
    }

    /**
     * pull the info out of the request and do some error checking
     *
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

        String minDesignRating = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_DESIGN_RATING));
        if (!minDesignRating.equals(""))
            ret.setMinDesignRating(new Integer(minDesignRating));

        String maxDesignRating = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_DESIGN_RATING));
        if (!maxDesignRating.equals(""))
            ret.setMaxDesignRating(new Integer(maxDesignRating));

        String minDevRating = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_DEV_RATING));
        if (!minDevRating.equals(""))
            ret.setMinDevRating(new Integer(minDevRating));

        String maxDevRating = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_DEV_RATING));
        if (!maxDevRating.equals(""))
            ret.setMaxDevRating(new Integer(maxDevRating));

        String minNumRatings = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_NUM_RATINGS));
        if (!minNumRatings.equals(""))
            ret.setMinNumRatings(new Integer(minNumRatings));

        String maxNumRatings = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_NUM_RATINGS));
        if (!maxNumRatings.equals(""))
            ret.setMaxNumRatings(new Integer(maxNumRatings));

        String maxDaysSinceLastComp = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_DAYS_SINCE_LAST_COMP));
        if (!maxDaysSinceLastComp.equals(""))
            ret.setMaxDaysSinceLastComp(new Integer(maxDaysSinceLastComp));

        String minHSRating = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_HS_RATING));
        if (!minHSRating.equals(""))
            ret.setMinHSRating(new Integer(minHSRating));

        String maxHSRating = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_HS_RATING));
        if (!maxHSRating.equals(""))
            ret.setMaxHSRating(new Integer(maxHSRating));

        String minNumHSRatings = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_NUM_HS_RATINGS));
        if (!minNumHSRatings.equals(""))
            ret.setMinNumHSRatings(new Integer(minNumHSRatings));

        String maxNumHSRatings = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_NUM_HS_RATINGS));
        if (!maxNumHSRatings.equals(""))
            ret.setMaxNumHSRatings(new Integer(maxNumHSRatings));

        String maxDaysSinceLastHSComp = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_DAYS_SINCE_LAST_HS_COMP));
        if (!maxDaysSinceLastHSComp.equals(""))
            ret.setMaxDaysSinceLastHSComp(new Integer(maxDaysSinceLastHSComp));

        // Marathon
        String minMarRating = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_MAR_RATING));
        if (!minMarRating.equals(""))
            ret.setMinMarRating(new Integer(minMarRating));

        String maxMarRating = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_MAR_RATING));
        if (!maxMarRating.equals(""))
            ret.setMaxMarRating(new Integer(maxMarRating));

        String minNumMarRatings = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_NUM_MAR_RATINGS));
        if (!minNumMarRatings.equals(""))
            ret.setMinNumMarRatings(new Integer(minNumMarRatings));

        String maxNumMarRatings = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_NUM_MAR_RATINGS));
        if (!maxNumMarRatings.equals(""))
            ret.setMaxNumMarRatings(new Integer(maxNumMarRatings));

        String maxDaysSinceLastMarComp = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_DAYS_SINCE_LAST_MAR_COMP));
        if (!maxDaysSinceLastMarComp.equals(""))
            ret.setMaxDaysSinceLastMarComp(new Integer(maxDaysSinceLastMarComp));

        ret.setStateList(getStateList());
        ret.setCountryList(getCountryList());
        return ret;
    }

}

/*
 * Copyright (c) 2006-2009 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.web.tc.controller.request.search;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.MemberSearch;

/**
 * <p>
 * This class perform an advance member search.
 * </p>
 * 
 * <p>
 *   Version 1.1 (Member Profile Enhancement 1.0) Change notes:
 *   <ol>
 *     <li>
 *     Added support to search for members using the newly
 *     added tracks (conceptualization, specification, architecture, assembly,
 *     and application testing).
 *     </li>
 *   </ol>
 * </p>
 * 
 * <p>
 *   Version 1.2 Change notes:
 *   <ol>
 *     <li>Added support for the Test Scenarios, UI Prototype and RIA Build tracks.</li>
 *   </ol>
 * </p>
 * 
 * @author elkhawajah, TCSDEVELOPER, VolodymyrK
 * @version 1.2
 */
public class AdvancedSearch extends SimpleSearch {

    /**
     * <p>
     * Process search for member using the given search information.
     * If the return result contains only one member, then the result
     * will display the profile page of that member instead of displaying
     * the result in the advance search page.
     * </p>
     */
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

    /**
     * <p>
     * Set the default values of the member seach.
     * </p>
     *  
     * @since Member Profile Enhancment
     */
    protected void setDefaults(MemberSearch m) {
        System.out.println("Constants loaded from : " + Constants.class.getResource("Constants.class"));
        super.setDefaults(m);
        setDefault(Constants.STATE_CODE, m.getStateCode() == null ? "" : m.getStateCode());
        setDefault(Constants.COUNTRY_CODE, m.getCountryCode() == null ? "" : m.getCountryCode());
        setDefault(Constants.SCHOOL_NAME, m.getSchoolName() == null ? "" : m.getSchoolName());
        System.out.println("Constants.MIN_RATING : " + Constants.MIN_RATING);
        setDefault(Constants.MIN_RATING, m.getMinRating() == null ? "" : m.getMinRating().toString());
        System.out.println("Constants.MAX_RATING : " + Constants.MAX_RATING);
        setDefault(Constants.MAX_RATING, m.getMaxRating() == null ? "" : m.getMaxRating().toString());
        System.out.println("Constants.MIN_CONCEPT_RATING : " + Constants.MIN_CONCEPT_RATING);
        setDefault(Constants.MIN_CONCEPT_RATING, m.getMinConceptRating() == null ? "" : m.getMinConceptRating().toString());
        System.out.println("Constants.MAX_CONCEPT_RATING : " + Constants.MAX_CONCEPT_RATING);
        setDefault(Constants.MAX_CONCEPT_RATING, m.getMaxConceptRating() == null ? "" : m.getMaxConceptRating().toString());
        setDefault(Constants.MIN_SPEC_RATING, m.getMinSpecRating() == null ? "" : m.getMinSpecRating().toString());
        setDefault(Constants.MAX_SPEC_RATING, m.getMaxSpecRating() == null ? "" : m.getMaxSpecRating().toString());
        setDefault(Constants.MIN_ARCH_RATING, m.getMinArchRating() == null ? "" : m.getMinArchRating().toString());
        setDefault(Constants.MAX_ARCH_RATING, m.getMaxArchRating() == null ? "" : m.getMaxArchRating().toString());
        setDefault(Constants.MIN_DESIGN_RATING, m.getMinDesignRating() == null ? "" : m.getMinDesignRating().toString());
        setDefault(Constants.MAX_DESIGN_RATING, m.getMaxDesignRating() == null ? "" : m.getMaxDesignRating().toString());
        setDefault(Constants.MIN_DEV_RATING, m.getMinDevRating() == null ? "" : m.getMinDevRating().toString());
        setDefault(Constants.MAX_DEV_RATING, m.getMaxDevRating() == null ? "" : m.getMaxDevRating().toString());
        setDefault(Constants.MIN_ASS_RATING, m.getMinAssRating() == null ? "" : m.getMinAssRating().toString());
        setDefault(Constants.MAX_ASS_RATING, m.getMaxAssRating() == null ? "" : m.getMaxAssRating().toString());
        setDefault(Constants.MIN_TEST_RATING, m.getMinTestRating() == null ? "" : m.getMinTestRating().toString());
        setDefault(Constants.MAX_TEST_RATING, m.getMaxTestRating() == null ? "" : m.getMaxTestRating().toString());
        setDefault(Constants.MIN_TEST_SCENARIOS_RATING, m.getMinTestScenariosRating() == null ? "" : m.getMinTestScenariosRating().toString());
        setDefault(Constants.MAX_TEST_SCENARIOS_RATING, m.getMaxTestScenariosRating() == null ? "" : m.getMaxTestScenariosRating().toString());
        setDefault(Constants.MIN_UI_PROTOTYPE_RATING, m.getMinUIPrototypeRating() == null ? "" : m.getMinUIPrototypeRating().toString());
        setDefault(Constants.MAX_UI_PROTOTYPE_RATING, m.getMaxUIPrototypeRating() == null ? "" : m.getMaxUIPrototypeRating().toString());
        setDefault(Constants.MIN_RIA_BUILD_RATING, m.getMinRIABuildRating() == null ? "" : m.getMinRIABuildRating().toString());
        setDefault(Constants.MAX_RIA_BUILD_RATING, m.getMaxRIABuildRating() == null ? "" : m.getMaxRIABuildRating().toString());						
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
     * @return the built member search instance.
     * @throws Exception
     *
     * @since Member Profile Enhancment
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

        // Conceptualization
        String minConceptRating = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_CONCEPT_RATING));
        if (!minConceptRating.equals(""))
            ret.setMinConceptRating(new Integer(minConceptRating));

        String maxConceptRating = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_CONCEPT_RATING));
        if (!maxConceptRating.equals(""))
            ret.setMaxConceptRating(new Integer(maxConceptRating));

        // Specification
        String minSpecRating = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_SPEC_RATING));
        if (!minSpecRating.equals(""))
            ret.setMinSpecRating(new Integer(minSpecRating));

        String maxSpecRating = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_SPEC_RATING));
        if (!maxSpecRating.equals(""))
            ret.setMaxSpecRating(new Integer(maxSpecRating));

        // Architecture
        String minArchRating = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_ARCH_RATING));
        if (!minArchRating.equals(""))
            ret.setMinArchRating(new Integer(minArchRating));

        String maxArchRating = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_ARCH_RATING));
        if (!maxArchRating.equals(""))
            ret.setMaxArchRating(new Integer(maxArchRating));

        // Design
        String minDesignRating = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_DESIGN_RATING));
        if (!minDesignRating.equals(""))
            ret.setMinDesignRating(new Integer(minDesignRating));

        String maxDesignRating = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_DESIGN_RATING));
        if (!maxDesignRating.equals(""))
            ret.setMaxDesignRating(new Integer(maxDesignRating));

        // Development
        String minDevRating = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_DEV_RATING));
        if (!minDevRating.equals(""))
            ret.setMinDevRating(new Integer(minDevRating));

        String maxDevRating = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_DEV_RATING));
        if (!maxDevRating.equals(""))
            ret.setMaxDevRating(new Integer(maxDevRating));

        // Assembly
        String minAssRating = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_ASS_RATING));
        if (!minAssRating.equals(""))
            ret.setMinAssRating(new Integer(minAssRating));

        String maxAssRating = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_ASS_RATING));
        if (!maxAssRating.equals(""))
            ret.setMaxAssRating(new Integer(maxAssRating));

        // Test Suites
        String minTestRating = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_TEST_RATING));
        if (!minTestRating.equals(""))
            ret.setMinTestRating(new Integer(minTestRating));

        String maxTestRating = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_TEST_RATING));
        if (!maxTestRating.equals(""))
            ret.setMaxTestRating(new Integer(maxTestRating));
			
        // Test Scenarios
        String minTestScenariosRating = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_TEST_SCENARIOS_RATING));
        if (!minTestScenariosRating.equals(""))
            ret.setMinTestScenariosRating(new Integer(minTestScenariosRating));

        String maxTestScenariosRating = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_TEST_SCENARIOS_RATING));
        if (!maxTestScenariosRating.equals(""))
            ret.setMaxTestScenariosRating(new Integer(maxTestScenariosRating));
			
        // UI Prototype
        String minUIPrototypeRating = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_UI_PROTOTYPE_RATING));
        if (!minUIPrototypeRating.equals(""))
            ret.setMinUIPrototypeRating(new Integer(minUIPrototypeRating));

        String maxUIPrototypeRating = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_UI_PROTOTYPE_RATING));
        if (!maxUIPrototypeRating.equals(""))
            ret.setMaxUIPrototypeRating(new Integer(maxUIPrototypeRating));
			
        // RIA Build
        String minRIABuildRating = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_RIA_BUILD_RATING));
        if (!minRIABuildRating.equals(""))
            ret.setMinRIABuildRating(new Integer(minRIABuildRating));

        String maxRIABuildRating = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_RIA_BUILD_RATING));
        if (!maxRIABuildRating.equals(""))
            ret.setMaxRIABuildRating(new Integer(maxRIABuildRating));									

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

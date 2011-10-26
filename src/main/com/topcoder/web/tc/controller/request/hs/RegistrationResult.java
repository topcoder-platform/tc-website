package com.topcoder.web.tc.controller.request.hs;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Season;
import com.topcoder.web.tc.Constants;

/**
 * Displays the result of registering for HS, that depending on the parameter can be success or that the user is not eligible.
 * 
 * @author Cucu
 */
public class RegistrationResult extends ShortHibernateProcessor {
    public final static String SUCCESS = "succ";
    
    protected void dbProcessing() throws Exception {

        Integer seasonId = new Integer(getRequest().getParameter(Constants.SEASON_ID));
        Season season = DAOUtil.getFactory().getSeasonDAO().find(seasonId);
        getRequest().setAttribute("season", season);
        
        boolean success = "1".equals(getRequest().getParameter(SUCCESS));
        setNextPage(success? Constants.HS_REGISTER_SUCCESS : Constants.HS_REGISTER_NOT_ELIGIBLE);
        setIsNextPageInContext(true);
    }

}

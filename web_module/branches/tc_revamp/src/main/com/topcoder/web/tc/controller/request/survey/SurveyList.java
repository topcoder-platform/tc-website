package com.topcoder.web.tc.controller.request.survey;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

public class SurveyList extends Base {

    protected void businessProcessing() throws TCWebException {
        Request r = new Request();
        try {
            r.setContentHandle("survey_list");
            r.setProperty("cr", String.valueOf(getAuthentication().getActiveUser().getId()));

            String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
            if (startRank.equals("") || Integer.parseInt(startRank) <= 0) {
                startRank = "1";
            }

            int endRank = Integer.parseInt(startRank) + Integer.parseInt(Constants.DEFAULT_SURVEY_SCROLL_SIZE) - 1;

            ResultSetContainer rsc = (ResultSetContainer) getDataAccess().getData(r).get("survey_list");
            setDefault(DataAccessConstants.START_RANK, startRank);

            getRequest().setAttribute("surveyList", rsc.subList(Integer.parseInt(startRank) - 1, endRank));
        } catch (Exception e) {
            throw new TCWebException(e);
        }

        setNextPage(Constants.SURVEY_LIST);
        setIsNextPageInContext(true);
    }


}

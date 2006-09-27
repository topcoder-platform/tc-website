package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

import java.util.Map;

/**
 * @author  cucu
 */
public class SelectPaymentTypeReference extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        try {
            int refId = Integer.parseInt(getRequest().getParameter("reference_id"));
            int type = Integer.parseInt(getRequest().getParameter("payment_type_id"));
            String search = getRequest().getParameter("search_text");

            DataInterfaceBean dib = new DataInterfaceBean();

            if (search != null) {
                Map map = null;
                switch (refId) {
                    case REFERENCE_ALGORITHM_PROBLEM_ID:
                        map = dib.findProblems("%" + search + "%");
                        getRequest().setAttribute(ALGORITHM_PROBLEM_LIST, map.get(ALGORITHM_PROBLEM_LIST));
                        break;
                    case REFERENCE_COMPONENT_PROJECT_ID:
                        map = dib.findProjects("%" + search + "%");
                        getRequest().setAttribute(COMPONENT_PROJECT_LIST, map.get(COMPONENT_PROJECT_LIST));
                        break;
                    case REFERENCE_ALGORITHM_ROUND_ID:
                        if (type == ALGORITHM_CONTEST_PAYMENT) {
                            map = dib.findRounds("%" + search + "%", new int[] {1,2,3,17,18}); // fix values
                        } else if (type == MARATHON_MATCH_PAYMENT) {
                            map = dib.findRounds("%" + search + "%", new int[] {10,11,12}); // fix values
                        }
                        getRequest().setAttribute(ALGORITHM_ROUND_LIST, map.get(ALGORITHM_ROUND_LIST));
                        break;
                }
            } else {
                Map map = null;
                switch (refId) {
                    case REFERENCE_DIGITAL_RUN_SEASON_ID:
                        map = dib.getDigitalRunSeasonList();
                        getRequest().setAttribute(DIGITAL_RUN_SEASON_LIST, map.get(DIGITAL_RUN_SEASON_LIST));
                        break;
                    case REFERENCE_DIGITAL_RUN_STAGE_ID:
                        map = dib.getDigitalRunStageList();
                        getRequest().setAttribute(DIGITAL_RUN_STAGE_LIST, map.get(DIGITAL_RUN_STAGE_LIST));
                        break;
                }

            }
            getRequest().setAttribute("reference_id", refId + "");
            getRequest().setAttribute("search", search);
            setNextPage(INTERNAL_SELECT_PAYMENT_TYPE_REFERENCE);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}


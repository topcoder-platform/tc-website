package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.ajax;

import java.util.Map;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * @author  cucu
 */
public class SelectPaymentTypeReference extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        try {
            int type = Integer.parseInt(getRequest().getParameter("payment_type_id"));
            int refId =BasePayment.getReferenceTypeId(type);
            String search = getRequest().getParameter("search_text");

            DataInterfaceBean dib = new DataInterfaceBean();

            Map map = null;
            String field = "";
            if (search != null) {
                // If a search is being done...
                switch (refId) {
                    case REFERENCE_ALGORITHM_PROBLEM_ID:
                        map = dib.findProblems("%" + search + "%");
                        getRequest().setAttribute(ALGORITHM_PROBLEM_LIST, map.get(ALGORITHM_PROBLEM_LIST));
                        field = "algorithm_problem_id";
                        break;

                    case REFERENCE_ALGORITHM_ROUND_ID:
                        if (type == ALGORITHM_CONTEST_PAYMENT) {
                            map = dib.findRounds("%" + search + "%", ALGORITHM_CONTEST_ROUND_TYPES);

                        } else if (type == MARATHON_MATCH_PAYMENT) {
                            map = dib.findRounds("%" + search + "%", MARATHON_MATCH_ROUND_TYPES);

                        }  else if (type == ALGORITHM_TOURNAMENT_PRIZE_PAYMENT) {
                              map = dib.findRounds("%" + search + "%", ALGORITHM_TOURNAMENT_ROUND_TYPES);
                        }
                        getRequest().setAttribute(ALGORITHM_ROUND_LIST, map.get(ALGORITHM_ROUND_LIST));
                        field = "algorithm_round_id";
                        break;

                    case REFERENCE_COMPONENT_PROJECT_ID:
                        map = dib.findProjects("%" + search + "%");
                        getRequest().setAttribute(COMPONENT_PROJECT_LIST, map.get(COMPONENT_PROJECT_LIST));
                        field = "component_project_id";
                        break;

                    case REFERENCE_COMPONENT_CONTEST_ID:
                        map = dib.findComponentContests("%" + search + "%");
                        getRequest().setAttribute(COMPONENT_CONTEST_LIST, map.get(COMPONENT_CONTEST_LIST));
                        field = "component_contest_id";
                        break;

                    case REFERENCE_STUDIO_CONTEST_ID:
                        map = dib.findStudioContests("%" + search + "%");
                        getRequest().setAttribute(STUDIO_CONTEST_LIST, map.get(STUDIO_CONTEST_LIST));
                        field = "studio_contest_id";
                        break;

                    case REFERENCE_PARENT_PAYMENT_ID:
                        map = dib.findPaymentsByDescription("%" + search + "%");
                        getRequest().setAttribute(PARENT_REFERENCE_LIST, map.get(PARENT_REFERENCE_LIST));
                        field = "parent_reference_id";
                        break;

                }
            }
            switch (refId) {
                case REFERENCE_DIGITAL_RUN_SEASON_ID:
                    map = dib.getDigitalRunSeasonList();
                    getRequest().setAttribute(DIGITAL_RUN_SEASON_LIST, map.get(DIGITAL_RUN_SEASON_LIST));
                    field = "digital_run_stage_id";
                    break;

                case REFERENCE_DIGITAL_RUN_STAGE_ID:
                    map = dib.getDigitalRunStageList();
                    getRequest().setAttribute(DIGITAL_RUN_STAGE_LIST, map.get(DIGITAL_RUN_STAGE_LIST));
                    field = "digital_run_season_id";
                    break;
            }


            setDefault("client", getRequest().getParameter("client"));
            getRequest().setAttribute("reference_type_id", refId + "");
            //getRequest().setAttribute("reference_field_name", field);
            getRequest().setAttribute("reference_id", getRequest().getParameter("reference_id"));
            getRequest().setAttribute("search", search);
            setNextPage(INTERNAL_AJAX_SELECT_PAYMENT_TYPE_REFERENCE);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}


/*
 * Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.ajax;

import java.util.Map;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * <strong>Purpose</strong>:
 * A processor to select payment type reference
 *
 * <p>
 *   Version 1.1 (Testing Competition Split Release Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated Application Testing to Test Suites</li>
 *     <li>Added support for new Test Scenarios competitions</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.2 (Copilot Selection Contest Online Review and TC Site Integration Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added support for new Copilot Posting competitions.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.3 (Content Creation Contest Online Review and TC Site Integration Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated {@link #businessProcessing()} method.</li>
 *   </ol>
 * </p>
 *
 * @author cucu, pulky, Blues, FireIce
 * @version 1.3
 */
public class SelectPaymentTypeReference extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        try {
            int type = Integer.parseInt(getRequest().getParameter("payment_type_id"));
            int refId = BasePayment.getReferenceTypeId(type);

            String search = getRequest().getParameter("search_text");
            boolean optionalReference = false;
            DataInterfaceBean dib = new DataInterfaceBean();

            getRequest().setAttribute("requiresClient", new Boolean(dib.requiresClient(type) > 0));

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

                        } else if (type == MARATHON_MATCH_PAYMENT || type == MARATHON_MATCH_TOURNAMENT_PRIZE_PAYMENT) {
                            map = dib.findRounds("%" + search + "%", MARATHON_MATCH_ROUND_TYPES);

                        }  else if (type == HIGH_SCHOOL_TOURNAMENT_PRIZE_PAYMENT) {
                              map = dib.findRounds("%" + search + "%", HIGH_SCHOOL_TOURNAMENT_ROUND_TYPES);

                        }  else if (type == ALGORITHM_TOURNAMENT_PRIZE_PAYMENT) {
                            map = dib.findRounds("%" + search + "%", ALGORITHM_TOURNAMENT_ROUND_TYPES);

                        } else if (type == PROBLEM_TESTING_PAYMENT) {
                            map = dib.findRounds("%" + search + "%", PROBLEM_TESTING_ROUND_TYPES);
                        }
                        getRequest().setAttribute(ALGORITHM_ROUND_LIST, map.get(ALGORITHM_ROUND_LIST));
                        field = "algorithm_round_id";
                        break;

                    case REFERENCE_COMPONENT_PROJECT_ID:
                        if (type == ASSEMBLY_COMPETITION_REVIEW || type == ASSEMBLY_PAYMENT) {
                            map = dib.findProjects("%" + search + "%", ASSEMBLY_PROJECT_CATEGORY_LU);
                        } else if (type == ARCHITECTURE_PAYMENT) {
                            map = dib.findProjects("%" + search + "%", ARCHITECTURE_PROJECT_CATEGORY_LU);
                        } else if (type == CONCEPTUALIZATION_CONTEST_PAYMENT) {
                            map = dib.findProjects("%" + search + "%", CONCEPTUALIZATION_PROJECT_CATEGORY_LU);
                        } else if (type == SPECIFICATION_CONTEST_PAYMENT) {
                            map = dib.findProjects("%" + search + "%", SPECIFICATION_PROJECT_CATEGORY_LU);
                        } else if (type == TEST_SUITES_PAYMENT) {
                            map = dib.findProjects("%" + search + "%", TEST_SUITES_PROJECT_CATEGORY_LU);
                        } else if (type == TEST_SCENARIOS_PAYMENT) {
                            map = dib.findProjects("%" + search + "%", TEST_SCENARIOS_PROJECT_CATEGORY_LU);
                        } else if (type == UI_PROTOTYPE_COMPETITION_PAYMENT) {
                            map = dib.findProjects("%" + search + "%", UI_PROTOTYPE_COMPETITION_PROJECT_CATEGORY_LU);
                        } else if (type == RIA_BUILD_COMPETITION_PAYMENT) {
                            map = dib.findProjects("%" + search + "%", RIA_BUILD_COMPETITION_PROJECT_CATEGORY_LU);
                        } else if (type == RIA_COMPONENT_COMPETITION_PAYMENT) {
                            map = dib.findProjects("%" + search + "%", RIA_COMPONENT_COMPETITION_PROJECT_CATEGORY_LU);
                        } else if (type == COPILOT_POSTING_PAYMENT) {
                            map = dib.findProjects("%" + search + "%", COPILOT_POSTING_PROJECT_CATEGORY_LU);
                        } else if (type == CONTENT_CREATION_PAYMENT) {
                            map = dib.findProjects("%" + search + "%", CONTENT_CREATION_PROJECT_CATEGORY_LU);
                        } else {
                            map = dib.findProjects("%" + search + "%");
                        }

                        getRequest().setAttribute(COMPONENT_PROJECT_LIST, map.get(COMPONENT_PROJECT_LIST));
                        field = "component_project_id";
                        break;

                    case REFERENCE_COMPONENT_CONTEST_ID:
                        map = dib.findComponentContests("%" + search + "%");
                        getRequest().setAttribute(COMPONENT_CONTEST_LIST, map.get(COMPONENT_CONTEST_LIST));
                        field = "component_contest_id";
                        break;

                    case REFERENCE_STUDIO_CONTEST_ID:
                        map = dib.findProjects("%" + search + "%");
                        getRequest().setAttribute(STUDIO_CONTEST_LIST, map.get(COMPONENT_PROJECT_LIST));
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
                case REFERENCE_DIGITAL_RUN_TRACK_ID:
                    map = dib.getDigitalRunTrackList();
                    getRequest().setAttribute(DIGITAL_RUN_TRACK_LIST, map.get(DIGITAL_RUN_TRACK_LIST));
                    field = "digital_run_track_id";
                    break;
            }

            if (type == PROBLEM_TESTING_PAYMENT) {
                optionalReference = true;
            }

            setDefault("client", getRequest().getParameter("client"));
            getRequest().setAttribute("type", type + "");
            getRequest().setAttribute("reference_type_id", refId + "");
            getRequest().setAttribute("reference_id", getRequest().getParameter("reference_id"));
            getRequest().setAttribute("round_unknown", getRequest().getParameter("round_unknown"));
            getRequest().setAttribute("optional_reference", Boolean.valueOf(optionalReference));
            getRequest().setAttribute("search", search);
            setNextPage(INTERNAL_AJAX_SELECT_PAYMENT_TYPE_REFERENCE);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}


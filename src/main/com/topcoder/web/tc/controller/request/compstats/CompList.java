/*
 * Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.compstats;

import java.util.ArrayList;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.Contains;
import com.topcoder.shared.dataAccess.resultSet.ResultFilter;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;

/**
 * <p><strong>Purpose</strong>: This processor handle requests to preview past contests for a specific
 * project type (using phase id).</p>
 *
 * <p>
 *   Version 1.1 (Studio Coding In Online Review) Change notes:
 *   <ol>
 *     <li>Added support for new UI Prototype, RIA Build and RIA Component competitions.</li>
 *   </ol>
 *
 *   Version 1.2 (Testing Competition Split Release Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated Application Testing to Test Suites</li>
 *     <li>Added support for new Test Scenarios competitions</li>
 *   </ol>
 * </p>
 * <p>
 *   Version 1.3 (Copilot Selection Contest Online Review and TC Site Integration Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added support for new Copilot Posting.</li>
 *   </ol>
 * </p>
 * <p>
 *   Version 1.4 (Content Creation Contest Online Review and TC Site Integration Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated {@link #businessProcessing()} method.</li>
 *   </ol>
 * </p>
 *  <p>
 *   Version 1.5 (Add Reporting Contest Type) Change notes:
 *   <ol>
 *     <li>Updated {@link #businessProcessing()} method to display Reporting contests.</li>
 *   </ol>
 * </p>
 * @author cucu, pulky, Blues, FireIce, lmmortal
 * @version 1.5
 */
public class CompList extends Base {

    /**
     * <p>Handles the request for displaying the past contests page of requested project type provided as
     * {@link Constants#PROJECT_TYPE_ID} request parameter or {@link Constants#PHASE_ID} request parameter.</p>
     *
     * @throws TCWebException if an unexpected error occurs or if requested project type is not supported.
     */
    protected void businessProcessing() throws TCWebException {
        try {
            Request r = new Request();

            String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));

            String numRecords = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));
            //String phaseId = StringUtils.checkNull(getRequest().getParameter(Constants.PHASE_ID));
            int projectTypeId= com.topcoder.web.tc.controller.request.development.Base.getProjectTypeId(getRequest());

            String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

            if (!(Constants.DESIGN_PROJECT_TYPE == projectTypeId
                  || Constants.DEVELOPMENT_PROJECT_TYPE == projectTypeId
                  || Constants.CONCEPTUALIZATION_PROJECT_TYPE == projectTypeId
                  || Constants.SPECIFICATION_PROJECT_TYPE == projectTypeId
                  || Constants.ARCHITECTURE_PROJECT_TYPE == projectTypeId
                  || Constants.ASSEMBLY_PROJECT_TYPE == projectTypeId
                  || Constants.TEST_SUITES_PROJECT_TYPE == projectTypeId
                  || Constants.TEST_SCENARIOS_PROJECT_TYPE == projectTypeId
                  || Constants.UI_PROTOTYPE_PROJECT_TYPE == projectTypeId
                  || Constants.RIA_BUILD_PROJECT_TYPE == projectTypeId
                  || Constants.RIA_COMPONENT_PROJECT_TYPE == projectTypeId
                  || Constants.COPILOT_POSTING_PROJECT_TYPE == projectTypeId
                  || Constants.CONTENT_CREATION_PROJECT_TYPE == projectTypeId
                  || Constants.REPORTING_PROJECT_TYPE == projectTypeId)) {
                throw new TCWebException("Invalid project_type_id (" + projectTypeId + ") parameter");
            }

            String projectTypeIds;
            // add component testing project to the development page
            if (Constants.DEVELOPMENT_PROJECT_TYPE==projectTypeId) {
                projectTypeIds = projectTypeId + ", " + Constants.COMPONENT_TESTING_PROJECT_TYPE;
            } else {
                projectTypeIds = String.valueOf(projectTypeId);
            }


            ArrayList<ResultFilter> filters = new ArrayList<ResultFilter>(1);
            String contestName = StringUtils.checkNull(getRequest().getParameter(Constants.CONTEST_NAME));
            if (!contestName.equals("")) {
                if (log.isDebugEnabled()) {
                    log.debug("add contest name filter: " + contestName);
                }
                filters.add(new Contains(contestName, "component_name"));
                setDefault(Constants.CONTEST_NAME, contestName);
            }


            if ("".equals(numRecords)) {
                numRecords = "50";
            } else if (Integer.parseInt(numRecords) > 200) {
                numRecords = "200";
            }

            if (startRank.equals("") || Integer.parseInt(startRank) <= 0) {
                startRank = "1";
            }

            int endRank = Integer.parseInt(startRank) + Integer.parseInt(numRecords) - 1;

            r.setContentHandle("comp_list");
            r.setProperty(Constants.PROJECT_TYPES_ID, projectTypeIds);

            Map result = getDataAccess(true).getData(r);

            ResultSetContainer rsc = (ResultSetContainer) result.get("comp_list");
            if (!sortCol.equals("")) {
                rsc.sortByColumn(Integer.parseInt(sortCol), !"desc".equals(sortDir));
                setDefault(DataAccessConstants.SORT_COLUMN, sortCol);
                setDefault(DataAccessConstants.SORT_DIRECTION, sortDir);
            }

            if (filters.size() > 0) {
                rsc = new ResultSetContainer(rsc, filters.toArray(new ResultFilter[0]));
            }
            rsc = new ResultSetContainer(rsc, Integer.parseInt(startRank), endRank);

            result.put("comp_list", rsc);

            SortInfo s = new SortInfo();
            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

            setDefault(DataAccessConstants.NUMBER_RECORDS, numRecords);

            setDefault(DataAccessConstants.START_RANK, startRank);


            getRequest().setAttribute("resultMap", result);
            getRequest().setAttribute(Constants.PROJECT_TYPE_ID, projectTypeId);

            setNextPage("/compstats/compList.jsp");
            setIsNextPageInContext(true);

        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}

package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Map;

/**
 * User: dok
 * Date: Jul 19, 2004
 * Time: 4:02:16 PM
 */
public class ProblemArchive extends Base {

    protected void businessProcessing() throws TCWebException {

        try {
            Request r = new Request();
            r.setContentHandle("problem_archive");

            String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

            if (!(sortCol.equals("") || sortDir.equals(""))) {
                r.setProperty(DataAccessConstants.SORT_DIRECTION, sortDir);
                r.setProperty(DataAccessConstants.SORT_COLUMN, sortCol);
                r.setProperty(DataAccessConstants.SORT_QUERY, "problem_list");
            }

            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);
            ResultSetContainer rsc = (ResultSetContainer) result.get("problem_list");

            String className = StringUtils.checkNull(getRequest().getParameter(Constants.CLASS_NAME));
            String category = StringUtils.checkNull(getRequest().getParameter(Constants.CATEGORY));
            String minDiv1Success = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_DIV1_SUCCESS));
            String minDiv2Success = StringUtils.checkNull(getRequest().getParameter(Constants.MIN_DIV2_SUCCESS));
            String maxDiv1Success = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_DIV1_SUCCESS));
            String maxDiv2Success = StringUtils.checkNull(getRequest().getParameter(Constants.MAX_DIV2_SUCCESS));
            String div1Level = StringUtils.checkNull(getRequest().getParameter(Constants.DIV1_LEVEL));
            String div2Level = StringUtils.checkNull(getRequest().getParameter(Constants.DIV2_LEVEL));

            ArrayList filters = new ArrayList();
            if (!className.equals("")) {
                log.debug("add problem name filter: " + className);
                filters.add(new Contains(className, "problem_name"));
                setDefault(Constants.CLASS_NAME, className);
            }
            if (!category.equals("")) {
                log.debug("add category filter: " + category);
                filters.add(new Contains(category, "categories"));
                setDefault(Constants.CATEGORY, category);
            }
            if (!minDiv1Success.equals("")) {
                log.debug("add min div 1 success filter");
                filters.add(new GreaterThanOrEqual(makePercentage(minDiv1Success), "div1_success"));
                setDefault(Constants.MIN_DIV1_SUCCESS, minDiv1Success);
            }
            if (!minDiv2Success.equals("")) {
                log.debug("add min div 2 success filter");
                filters.add(new GreaterThanOrEqual(makePercentage(minDiv2Success), "div2_success"));
                setDefault(Constants.MIN_DIV2_SUCCESS, minDiv2Success);
            }
            if (!maxDiv1Success.equals("")) {
                log.debug("add max div 1 success filter");
                filters.add(new LessThanOrEqual(makePercentage(maxDiv1Success), "div1_success"));
                setDefault(Constants.MAX_DIV1_SUCCESS, maxDiv1Success);
            }
            if (!maxDiv2Success.equals("")) {
                log.debug("add max div 2 success filter");
                filters.add(new LessThanOrEqual(makePercentage(maxDiv2Success), "div2_success"));
                setDefault(Constants.MAX_DIV2_SUCCESS, maxDiv2Success);
            }
            if (!div1Level.equals("")) {
                log.debug("add div 1 level filter");
                filters.add(new Equals(new Integer(div1Level), "div1_level"));
                setDefault(Constants.DIV1_LEVEL, div1Level);
            }
            if (!div2Level.equals("")) {
                log.debug("add div 2 level filter");
                filters.add(new Equals(new Integer(div2Level), "div2_level"));
                setDefault(Constants.DIV2_LEVEL, div2Level);
            }

            if (filters.size() > 0) {
                rsc = new ResultSetContainer(rsc, (ResultFilter[]) filters.toArray(new ResultFilter[0]));
            }

            String start = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
            if (start.equals(""))
                start = "1";
            //r.setProperty(DataAccessConstants.START_RANK, start);

            String end = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.END_RANK));
            if (end.equals(""))
                end = String.valueOf(Constants.PROBLEM_ARCHIVE_SCROLL_SIZE);
            //r.setProperty(DataAccessConstants.END_RANK, end);

            //make sure we like the size they they're searching for
            if (Integer.parseInt(end) - Integer.parseInt(start) > (Constants.PROBLEM_ARCHIVE_SCROLL_SIZE - 1)) {
                r.setProperty(DataAccessConstants.END_RANK, String.valueOf(Integer.parseInt(start) + Constants.PROBLEM_ARCHIVE_SCROLL_SIZE - 1));
            }

            rsc = new ResultSetContainer(rsc, Integer.parseInt(start), Integer.parseInt(end));

            result.put("problem_list", rsc);

            SortInfo s = new SortInfo();
            s.addDefault(rsc.getColumnIndex("problem_name"), "asc");
            s.addDefault(rsc.getColumnIndex("contest_name"), "asc");
            s.addDefault(rsc.getColumnIndex("contest_date"), "desc");
            s.addDefault(rsc.getColumnIndex("div1_level"), "asc");
            s.addDefault(rsc.getColumnIndex("div2_level"), "asc");
            s.addDefault(rsc.getColumnIndex("div1_success"), "desc");
            s.addDefault(rsc.getColumnIndex("div2_success"), "desc");
            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
            getRequest().setAttribute("resultMap", result);

            setNextPage(Constants.PROBLEM_ARCHIVE);
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private BigDecimal makePercentage(String s) {
        BigDecimal temp = new BigDecimal(s);
        if (temp.compareTo(new BigDecimal("1")) < 0)
            return temp;
        else
            return temp.divide(new BigDecimal("100"), 4, BigDecimal.ROUND_HALF_UP);
    }

}

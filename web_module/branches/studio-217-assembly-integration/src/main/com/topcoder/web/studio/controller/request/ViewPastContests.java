package com.topcoder.web.studio.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.studio.Constants;
import java.util.ArrayList;
import java.util.Date;
import java.util.Calendar;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00 Create Date: Aug 7,
 *          2006
 */
public class ViewPastContests extends BaseProcessor {
    protected void businessProcessing() throws Exception {
        // load up the contests
        DataAccess da = new DataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("past_contests");

        String col = StringUtils.checkNull(getRequest().getParameter(
                DataAccessConstants.SORT_COLUMN));
        String dir = StringUtils.checkNull(getRequest().getParameter(
                DataAccessConstants.SORT_DIRECTION));

        if (!"".equals(col) && !"".equals(dir)) {
            r.setProperty(DataAccessConstants.SORT_COLUMN, getRequest()
                    .getParameter(DataAccessConstants.SORT_COLUMN));
            r.setProperty(DataAccessConstants.SORT_DIRECTION, getRequest()
                    .getParameter(DataAccessConstants.SORT_DIRECTION));
            r.setProperty(DataAccessConstants.SORT_QUERY, "past_contests");
        }

        String month = StringUtils.checkNull(getRequest().getParameter(
                "filterMonth"));
        String year = StringUtils.checkNull(getRequest().getParameter(
                "filterYear"));
        month = (month == null || month.trim().length() == 0) ? String
                .valueOf(Calendar.getInstance().get(Calendar.MONTH) + 1)
                : month;
        year = (year == null || year.trim().length() == 0) ? String
                .valueOf(Calendar.getInstance().get(Calendar.YEAR)) : year;

        if (!month.equals("All")) {
        	r.setProperty("startdate" ,year + "-" + month + "-01 00:00:00");
		int endMonth = Integer.parseInt(month) + 1;
        	r.setProperty("enddate" ,year + "-" + endMonth + "-01 00:00:00");
	} else {
        	if (!year.equals("All")) {
        		r.setProperty("startdate" ,year + "-01-01 00:00:00");
			int endYear = Integer.parseInt(year) + 1;
        		r.setProperty("enddate" ,endYear + "-01-01 00:00:00");
		} else {
        		r.setProperty("startdate" , "1990-01-01 00:00:00");
        		r.setProperty("enddate" , "2099-01-01 00:00:00");
		}
	}

        ResultSetContainer rsc = da.getData(r).get("past_contests");
        getRequest().setAttribute("contests", rsc);
/*
        int startIdx = 0, endIdx = 0;
        if (year.equals("All")) {
            startIdx = 0;
            endIdx = rsc.size() - 1;
        } else {
            DateFormat yearMonthDF = new SimpleDateFormat("yyyy-MM");
            Calendar startDate = Calendar.getInstance();
            Calendar endDate = Calendar.getInstance();

            if (!month.equals("All")) {
                startDate.setTime(yearMonthDF.parse(year + "-" + month));
                endDate.setTime(yearMonthDF.parse(year + "-" + month));
                endDate.add(Calendar.MONTH, 1);
            } else {
                startDate = Calendar.getInstance();
                startDate.setTime(yearMonthDF.parse(year + "-1"));

                endDate = Calendar.getInstance();
                endDate.setTime(yearMonthDF.parse(year + "-1"));
                endDate.add(Calendar.YEAR, 1);
            }

            DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.S");
            for (int i = 0; i < rsc.size(); i++) {
                String myDate = rsc.getRow(i).getStringItem("start_time");
                Date contestTime = df.parse(myDate);
                if (contestTime.before(startDate.getTime())) {
                    endIdx = i;
                    break;
                }
            }

            for (int i = 0; i < rsc.size(); i++) {
                String myDate = rsc.getRow(i).getStringItem("start_time");
                Date contestTime = df.parse(myDate);
                if (contestTime.before(endDate.getTime())) {
                    startIdx = i;
                    break;
                }
            }
        }
        rsc = (ResultSetContainer) rsc.subList(startIdx, endIdx);
*/
        getRequest().setAttribute("contests", rsc);
        getRequest().setAttribute("filterMonth", month);
        getRequest().setAttribute("filterYear", year);

        SortInfo s = new SortInfo();
        s.addDefault(rsc.getColumnIndex("name"), "asc");
        s.addDefault(rsc.getColumnIndex("start_time"), "desc");
        s.addDefault(rsc.getColumnIndex("end_time"), "desc");
        s.addDefault(rsc.getColumnIndex("amount"), "desc");
        s.addDefault(rsc.getColumnIndex("registrants"), "desc");
        s.addDefault(rsc.getColumnIndex("submission_count"), "desc");
        s.addDefault(rsc.getColumnIndex("passing_submission_count"), "desc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

        setNextPage("/pastContests.jsp");
        setIsNextPageInContext(true);
    }
}

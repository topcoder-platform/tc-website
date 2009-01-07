package com.topcoder.web.studio.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.SortInfo;
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
        	int endMonth = (Integer.parseInt(month) %12) + 1;
        	String endYear=new String(year);
        	if (endMonth==1) { // The period's end is next year.
        		endYear=String.valueOf(Integer.parseInt(year)+1);
        	}
        	r.setProperty("enddate" ,endYear + "-" + endMonth + "-01 00:00:00");
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

        if (rsc.size() == 0 && month.equals(String
                .valueOf(Calendar.getInstance().get(Calendar.MONTH) + 1)) && year.equals(String
                .valueOf(Calendar.getInstance().get(Calendar.YEAR)))) {
            // query past 30 days contents
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

            Calendar now = Calendar.getInstance();
            Calendar thirtyDaysBefore = Calendar.getInstance();
            thirtyDaysBefore.add(Calendar.DAY_OF_MONTH, -30);

            r.setProperty("startdate" , df.format(thirtyDaysBefore.getTime()));
            r.setProperty("enddate" , df.format(now.getTime()));

            rsc = da.getData(r).get("past_contests");
        }
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

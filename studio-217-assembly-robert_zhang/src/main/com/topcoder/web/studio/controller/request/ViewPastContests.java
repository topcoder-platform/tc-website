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
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 7, 2006
 */
public class ViewPastContests extends BaseProcessor {
    protected void businessProcessing() throws Exception {
        //load up the contests
        DataAccess da = new DataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("past_contests");

        String col = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String dir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
	 String date = StringUtils.checkNull(getRequest().getParameter("filterDate"));

        if (!"".equals(col) && !"".equals(dir)) {
            r.setProperty(DataAccessConstants.SORT_COLUMN, getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
            r.setProperty(DataAccessConstants.SORT_DIRECTION, getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            r.setProperty(DataAccessConstants.SORT_QUERY, "past_contests");
        }

	if(date == null || date.equals("")) date="2592000000";	

       ResultSetContainer rsc = da.getData(r).get("past_contests");
	rsc.sortByColumn("start_time",false);

	if(!date.equals("-1")){
		long now = System.currentTimeMillis();
		int i=0;
		for(;i<rsc.size();i++){
			String myDate = rsc.getRow(i).getStringItem("start_time");
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.S");
			long myTime = (df.parse(myDate)).getTime();
			if(now-myTime>Long.parseLong(date)) 
				break;
		}
		rsc = (ResultSetContainer) rsc.subList(0, i);
	}

       String start = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
	if(start.equals("")){
		start="0";
	}

       String end = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.END_RANK));
	if(end.equals("")){
		end = String.valueOf(Constants.VIEW_SUBMISSIONS_SCROLL_SIZE);
	}

	if(Integer.parseInt(end)-Integer.parseInt(start)>Constants.VIEW_SUBMISSIONS_SCROLL_SIZE){
		end = String.valueOf(Integer.parseInt(start)+Constants.VIEW_SUBMISSIONS_SCROLL_SIZE);
		throw new NullPointerException(end);
	}

       getRequest().setAttribute("contests", rsc.subList(Integer.parseInt(start),Integer.parseInt(end)));
	getRequest().setAttribute("filterDate", date);

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
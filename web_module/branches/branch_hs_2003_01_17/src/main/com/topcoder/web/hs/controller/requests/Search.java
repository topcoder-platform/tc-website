package com.topcoder.web.hs.controller.requests;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.shared.util.*;
import com.topcoder.shared.util.logging.*;
import com.topcoder.web.hs.model.*;

import java.rmi.*;
import java.util.*;
import javax.ejb.*;
import javax.naming.*;
import javax.servlet.*;
import javax.sql.*;

public class Search extends Base {

  private final static String STATE_INPUT_CODE="st";

  private final static String SEARCH_BASE="/search/";

  private final static String ADVANCED_SEARCH_PAGE="advanced_search.jsp";

  private final static String SEARCH_CMD="adv";

  private final static Logger log=Logger.getLogger(Search.class);

  protected void businessProcessing() throws Exception {

    String cmd=request.getParameter("cmd");

    log.info("Search: cmd="+cmd);

    if (cmd==null||cmd.equals("")) {
      log.debug("Search processing '' command.");

      SearchBean sb=new SearchBean();
      populateSearchWithDefaults(sb);
      populateSearchStaticContent(sb);
      request.setAttribute("search",sb);

      setNextPage(SEARCH_BASE+ADVANCED_SEARCH_PAGE);
      setIsNextPageInContext(true);
    }
    else if (cmd.equals(SEARCH_CMD)) {
      log.debug("Search processing 'adv' command.");

      SearchBean sb=new SearchBean();
      populateSearchWithDefaults(sb);
      populateSearchFromRequest(request,sb);
      populateSearchStaticContent(sb);
      request.setAttribute("search",sb);

      setNextPage(SEARCH_BASE+ADVANCED_SEARCH_PAGE);
      setIsNextPageInContext(true);
    }
    else {
    }
  }

  private void populateSearchWithDefaults(SearchBean _sb) {
    _sb.setHandle("");
    _sb.setMinRating(new Integer(-1));
    _sb.setMaxRating(new Integer(-1));
    _sb.setStateCode("");
    _sb.setSchoolId(new Long(-1));
  }

  private void populateSearchFromRequest(ServletRequest _request,
                                         SearchBean _sb) {
    _sb.setHandle(getParameter(_request,"handle",_sb.getHandle()));
    _sb.setMinRating(getParameterInteger(_request,"min_rating",
                                         _sb.getMinRating()));
    _sb.setMaxRating(getParameterInteger(_request,"max_rating",
                                         _sb.getMaxRating()));
    _sb.setStateCode(getParameter(_request,"state_code",_sb.getStateCode()));
    _sb.setSchoolId(getParameterLong(_request,"school_id",_sb.getSchoolId()));
  }

  private void populateSearchStaticContent(SearchBean _sb) throws Exception {
    Context ctx=TCContext.getInitial();
    DataSource ds=(DataSource)ctx.lookup(DBMS.OLTP_DATASOURCE_NAME);
    DataAccessInt dai=new CachedDataAccess(ds);
    Map map=new HashMap();

    map.put(DataAccessConstants.COMMAND,"state_list");
    Request req=new Request(map);
    Map data=dai.getData(req);

    ResultSetContainer rsc;
    ResultSetContainer.ResultSetRow rsr;

    rsc=(ResultSetContainer)data.get("state_list");
    List state_list=new ArrayList();
    state_list.add(new ListPairBean(null,"Pick a state"));
    for (Iterator i=rsc.iterator();i.hasNext();) {
      rsr=(ResultSetContainer.ResultSetRow)i.next();
      String state_code=(String)rsr.getItem("state_code").getResultData();
      String state_name=(String)rsr.getItem("state_name").getResultData();
      state_list.add(new ListPairBean(state_code,state_name));
    }

    _sb.setStateList(state_list);


    List school_list=new ArrayList();
    school_list.add(new ListPairBean(null,"Pick a school"));
    if (isValidListValue(_sb.getStateCode(),_sb.getStateList())) {
      map.put(DataAccessConstants.COMMAND,"state_schools");
      map.put(STATE_INPUT_CODE,_sb.getStateCode());
      req=new Request(map);
      Map schools=dai.getData(req);

      rsc=(ResultSetContainer)schools.get("state_schools");
      for (Iterator i=rsc.iterator();i.hasNext();) {
        rsr=(ResultSetContainer.ResultSetRow)i.next();
        Long school_id=(Long)rsr.getItem("school_id").getResultData();
        String full_name=(String)rsr.getItem("full_name").getResultData();
        school_list.add(new ListPairBean(school_id,full_name));
      }

    }
    _sb.setSchoolList(school_list);
  }

  private String getParameter(ServletRequest _request,String _param,
                              String _default) {
    String value=_request.getParameter(_param);
    return(value==null||value.trim().length()==0?_default:value.trim());
  }

  private Long getParameterLong(ServletRequest _request,String _param,
                                Long _default) {
    Long value=_default;
    try {
      value=new Long(_request.getParameter(_param));
    }
    catch (NumberFormatException _nfe) {
      /* do nothing */
    }
    return(value);
  }

  private Integer getParameterInteger(ServletRequest _request,String _param,
                                      Integer _default) {
    Integer value=_default;
    try {
      value=new Integer(_request.getParameter(_param));
    }
    catch (NumberFormatException _nfe) {
      /* do nothing */
    }
    return(value);
  }

  private static boolean isValidListValue(Object _value,List _list) {
    if (_value==null) {
      return(false);
    }
    for (Iterator iterator=_list.iterator();iterator.hasNext();) {
      ListPairBean lpb=(ListPairBean)iterator.next();
      if (_value.equals(lpb.getValue())) {
        return(true);
      }
    }
    return(false);
  }
};

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

  private final static String HANDLE_INPUT_CODE="hap";

  private final static String SCHOOL_NAME_INPUT_CODE="snp";

  private final static String MIN_RATING_INPUT_CODE="minra";

  private final static String MAX_RATING_INPUT_CODE="maxra";

  private final static String SEARCH_BASE="/search/";

  private final static String ADVANCED_SEARCH_PAGE="advanced_search.jsp";

  private final static String SEARCH_CMD="adv";

  private final static String INVALID_STATE_CODE="Please select a state";

  private final static String INVALID_SCHOOL_ID="Please select a school";

  private final static String INVALID_STATE_SCHOOL="Invalid school/state "+
                                                   "combination";

  private final static String NEGATIVE_MIN_RATING="Ensure Min Rating "+
                                                  "non-negative";
  
  private final static String INVALID_MIN_RATING="Invalid number for Min "+
                                                 "Rating";

  private final static String NEGATIVE_MAX_RATING="Ensure Max Rating "+
                                                  "non-negative";
  
  private final static String INVALID_MAX_RATING="Invalid number for Max "+
                                                 "Rating";

  private final static String INVALID_MIN_MAX="Max Rating less than Min "+
                                              "Rating";

  private final static Logger log=Logger.getLogger(Search.class);

  protected void businessProcessing() throws Exception {

    String cmd=request.getParameter("cmd");

    log.info("Search: cmd="+cmd);

    if (cmd==null||cmd.equals("")) {
      log.debug("Search processing '' command.");

      SearchBean sb=new SearchBean();
      populateSearchWithDefaults(sb);
      populateSearchFromRequest(request,sb);
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

      HashMap errors=new HashMap();
      request.setAttribute("form_errors",errors);

      List member_list=null;

      if (isValidSearch(errors,sb)) {
        int count=findMembers(member_list,sb);
        log.debug("Search found '"+count+"' matching members");
      }
      else {
        log.debug("invalid");
      }

      sb.setMemberList(member_list);

      setNextPage(SEARCH_BASE+ADVANCED_SEARCH_PAGE);
      setIsNextPageInContext(true);
    }
    else {
    }
  }

  private void populateSearchWithDefaults(SearchBean _sb) {
    _sb.setPrev(new Integer(0));
    _sb.setNext(new Integer(SearchBean.getMaxResultsPerPage()));
    _sb.setHandle("");
    _sb.setMinRating("");
    _sb.setMaxRating("");
    _sb.setStateCode("");
    _sb.setSchoolId(new Long(-1));
  }

  private void populateSearchFromRequest(ServletRequest _request,
                                         SearchBean _sb) {
    _sb.setPrev(getParameterInteger(_request,"prev",_sb.getPrev()));
    _sb.setNext(getParameterInteger(_request,"next",_sb.getNext()));
    _sb.setHandle(getParameter(_request,"handle",_sb.getHandle()));
    _sb.setMinRating(getParameter(_request,"min_rating",_sb.getMinRating()));
    _sb.setMaxRating(getParameter(_request,"max_rating",_sb.getMaxRating()));
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
    state_list.add(new ListPairBean("","Any state"));
    for (Iterator i=rsc.iterator();i.hasNext();) {
      rsr=(ResultSetContainer.ResultSetRow)i.next();
      String state_code=(String)rsr.getItem("state_code").getResultData();
      String state_name=(String)rsr.getItem("state_name").getResultData();
      state_list.add(new ListPairBean(state_code,state_name));
    }

    _sb.setStateList(state_list);


    List school_list=new ArrayList();
    school_list.add(new ListPairBean(new Long(-1),"Any school"));
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

  private boolean isValidListValue(Object _value,List _list) {
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

  private Object getListTextFromValue(Object _value,List _list) {
    if (_value==null) {
      return(null);
    }
    for (Iterator iterator=_list.iterator();iterator.hasNext();) {
      ListPairBean lpb=(ListPairBean)iterator.next();
      if (_value.equals(lpb.getValue())) {
        return(lpb.getText());
      }
    }
    return(null);
  }

  private boolean isValidSearch(Map _errors,SearchBean _sb) {
    boolean valid=true;
    valid&=checkValidHandle(_errors,_sb.getHandle());
    log.debug("valid handle: "+valid);
    valid&=(checkValidState(_errors,_sb.getStateCode(),_sb.getStateList())&&
            checkValidSchool(_errors,_sb.getSchoolId(),_sb.getSchoolList()));
    log.debug("valid state and school: "+valid);
    valid&=checkValidStateSchool(_errors,_sb.getStateCode(),_sb.getSchoolId());
    log.debug("valid state/school: "+valid);
    valid&=checkValidMinRating(_errors,_sb.getMinRating());
    log.debug("valid min rating: "+valid);
    valid&=checkValidMaxRating(_errors,_sb.getMaxRating());
    log.debug("valid mxx rating: "+valid);
    valid&=checkValidMinMax(_errors,_sb.getMinRating(),_sb.getMaxRating());
    log.debug("valid min/max rating: "+valid);
    return(valid);
  }

  private void addErrorMessage(Map _errors,String _key,String _message) {
    List msgs=(List)_errors.get(_key);
    if (msgs==null) {
      msgs=new ArrayList();
      _errors.put(_key,msgs);
    }
    msgs.add(_message);
  }

  private boolean checkValidHandle(Map _errors,String _handle) {
    if (_handle==null) {
      return(false);
    }
    return(true);
  }

  /**
   * Check for valid state code
   */
  private boolean checkValidState(Map _errors,String _state_code,List _list) {
    if (!isValidListValue(_state_code,_list)) {
      addErrorMessage(_errors,"StateCode",INVALID_STATE_CODE);
      return(false);
    }
    return(true);
  }

  /**
   * Check for valid school
   */
  private boolean checkValidSchool(Map _errors,Long _school_id,
                                          List _list) {
    if (!isValidListValue(_school_id,_list)) {
      addErrorMessage(_errors,"SchoolId",INVALID_SCHOOL_ID);
      return(false);
    }
    return(true);
  }

  /**
   * Check for valid state/school combination
   */
  private boolean checkValidStateSchool(Map _errors,String _state_code,
                                        Long _school_id) {
    if (_state_code.equals("")&&_school_id.longValue()!=-1) {
      addErrorMessage(_errors,"StateCode",INVALID_STATE_SCHOOL);
      return(false);
    }
    return(true);
  }

  private boolean checkValidMinRating(Map _errors,String _min_rating) {
    if ("".equals(_min_rating)) {
      return(true);
    }
    try {
      Integer min_rating=new Integer(_min_rating);
      if (min_rating.intValue()<0) {
        addErrorMessage(_errors,"MinRating",NEGATIVE_MIN_RATING);
        return(false);
      }
    }
    catch (NumberFormatException _nfe) {
      addErrorMessage(_errors,"MinRating",INVALID_MIN_RATING);
      return(false);
    }
    return(true);
  }

  private boolean checkValidMaxRating(Map _errors,String _max_rating) {
    if ("".equals(_max_rating)) {
      return(true);
    }
    try {
      Integer max_rating=new Integer(_max_rating);
      if (max_rating.intValue()<0) {
        addErrorMessage(_errors,"MaxRating",NEGATIVE_MAX_RATING);
        return(false);
      }
    }
    catch (NumberFormatException _nfe) {
      addErrorMessage(_errors,"MaxRating",INVALID_MAX_RATING);
      return(false);
    }
    return(true);
  }

  private boolean checkValidMinMax(Map _errors,String _min_rating,
                                   String _max_rating) {
    try {
      Integer min_rating=new Integer(_min_rating);
      Integer max_rating=new Integer(_max_rating);
      if (max_rating.intValue()<min_rating.intValue()) {
        addErrorMessage(_errors,"MinMax",INVALID_MIN_MAX);
        return(false);
      }
    }
    catch (NumberFormatException _nfe) {
      /* do nothing */
    }
    return(true);
  }

  private int findMembers(List _member_list,SearchBean _sb) throws Exception {
    Context ctx=TCContext.getInitial();
    DataSource ds=(DataSource)ctx.lookup(DBMS.DW_DATASOURCE_NAME);
    DataAccessInt dai=new CachedDataAccess(ds);
    Map map=new HashMap();

    String handle_pattern="%";
    Integer min_rating=new Integer(0);
    Integer max_rating=new Integer(1000000);
    String state_code_pattern="%";
    String school_name_pattern="%";

    try {
      if (!"".equals(_sb.getHandle())) {
        handle_pattern=_sb.getHandle();
      }
      if (!"".equals(_sb.getMinRating())) {
        min_rating=new Integer(_sb.getMinRating());
      }
      if (!"".equals(_sb.getMaxRating())) {
        max_rating=new Integer(_sb.getMaxRating());
      }
      if (!"".equals(_sb.getStateCode())) {
        state_code_pattern=_sb.getStateCode();
      }
      if (-1!=_sb.getSchoolId().longValue()) {
        school_name_pattern=getListTextFromValue(_sb.getSchoolId(),
                                                _sb.getSchoolList()).toString();
      }
    }
    catch (NumberFormatException _nfe) {
     /* this should never happen */
      _nfe.printStackTrace();
    }
    
    map.put(DataAccessConstants.COMMAND,"member_search");
    map.put(HANDLE_INPUT_CODE,handle_pattern);
    map.put(MIN_RATING_INPUT_CODE,min_rating);
    map.put(MAX_RATING_INPUT_CODE,max_rating);
    map.put(STATE_INPUT_CODE,state_code_pattern);
    map.put(SCHOOL_NAME_INPUT_CODE,school_name_pattern);
    Request req=new Request(map);
    Map data=dai.getData(req);

    ResultSetContainer rsc;
    ResultSetContainer.ResultSetRow rsr;

    int count=0;
    rsc=(ResultSetContainer)data.get("member_search");
    for (Iterator i=rsc.iterator();i.hasNext();count++) {
      rsr=(ResultSetContainer.ResultSetRow)i.next();
      SearchMemberBean smb=new SearchMemberBean();
      smb.setUserId((Long)rsr.getItem("user_id").getResultData());
      smb.setHandle((String)rsr.getItem("handle").getResultData());
      smb.setRating((Integer)rsr.getItem("rating").getResultData());
      smb.setStateCode((String)rsr.getItem("state_code").getResultData());
      smb.setSchoolName((String)rsr.getItem("school_name").getResultData());
      smb.setLastCompeted((Date)rsr.getItem("last_competed").getResultData());
      _member_list.add(smb);
    }

    return(count);
  }

};

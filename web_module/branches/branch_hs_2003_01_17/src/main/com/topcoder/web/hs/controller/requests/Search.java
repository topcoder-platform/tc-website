package com.topcoder.web.hs.controller.requests;

import com.topcoder.shared.util.logging.*;
import com.topcoder.web.hs.model.*;

import java.util.*;
import javax.servlet.*;

public class Search extends Base {

  private final static String SEARCH_BASE="/search/";

  private final static String ADVANCED_SEARCH_PAGE="advanced_search.jsp";

  private final static String SEARCH_CMD="adv";

  private final static Logger log=Logger.getLogger(Search.class);

  protected void businessProcessing() throws Exception {

    String cmd=request.getParameter("cmd");

    log.info("Search: cmd="+cmd);

    if (cmd==null||cmd.equals("")) {
      log.debug("Search processing '' command.");

      setNextPage(SEARCH_BASE+ADVANCED_SEARCH_PAGE);
      setIsNextPageInContext(true);
    }
    else if (cmd.equals(SEARCH_CMD)) {
      log.debug("Search processing 'adv' command.");

      
    }
    else {
    }
  }
};

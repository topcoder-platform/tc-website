package com.topcoder.web.servlet;

import com.topcoder.common.web.constant.Sort;
import com.topcoder.common.web.constant.TCServlet;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.util.Cache;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.ejb.CoderStatistics.CoderStatistics;
import com.topcoder.ejb.CoderStatistics.CoderStatisticsHome;
import com.topcoder.ejb.DataCache.DataCache;
import com.topcoder.ejb.Search.Search;
import com.topcoder.ejb.Search.SearchHome;
import com.topcoder.shared.docGen.xml.*;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.Context;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;


public final class TaskSearch {


    private static Logger log = Logger.getLogger(TaskSearch.class);
    private static final String XSL_DIR = TCServlet.XSL_ROOT + "search/";
    private static final int DEFAULT_ROW_COUNT = 15;

    static String process(HttpServletRequest request, HttpServletResponse response,
                          HTMLRenderer HTMLmaker, Navigation nav, XMLDocument document)
            throws NavigationException {
        String result = null;
        try {
            StringBuffer url = new StringBuffer(request.getRequestURI());
            String query = request.getQueryString();
            if (query != null) {
                url.append("/?");
                url.append(query);
            }
            RecordTag listTag = new RecordTag("MEMBER_SEARCH");
            listTag.addTag(new ValueTag("User", nav.getUser().getHandle()));
            listTag.addTag(new ValueTag("Email", nav.getUser().getEmail()));
            MemberSearch search = getMemberSearch(nav);
            String command = Conversion.checkNull(request.getParameter("c"));

            //***************THIS CODE RUNS PRIOR TO COMMAND BEING SET********************
            if (command.equals("")) {
                if (!(nav.getLoggedIn() && ProcessAuthentication.hasMinimumPermission(nav.getUser())))
                    throw new NavigationException(
                            "You must login to view the member search page" // MESSAGE WILL APPEAR ABOVE LOGIN
                            , TCServlet.LOGIN_PAGE // THE LOGIN PAGE FILE
                            , url.toString()
                    );
                result = displaySearch(HTMLmaker, request, nav, document, search, listTag);
            }
            //****************************Get Coders*********************************
            else if (command.equals("member_search")) {
                if (!(nav.getLoggedIn() && ProcessAuthentication.hasMinimumPermission(nav.getUser())))
                    throw new NavigationException(
                            "You must login to view the member search page" // MESSAGE WILL APPEAR ABOVE LOGIN
                            , TCServlet.LOGIN_PAGE // THE LOGIN PAGE FILE
                            , url.toString()
                    );
                result = search(HTMLmaker, request, nav, document, search, listTag);
            }
            //****************************abridged search *********************************
            else if (command.equals("simple_search")) {
                result = search(HTMLmaker, request, nav, document, search, listTag);
            }
            //****************************Get More Coders*********************************
            else if (command.equals("Scroll")) {
                result = scroll(HTMLmaker, request, nav, document, search, listTag);
            }
            //****************************refer*********************************
            else if (command.equals("refer")) {
                if (!(nav.getLoggedIn() && ProcessAuthentication.hasMinimumPermission(nav.getUser())))
                    throw new NavigationException(
                            "You must login to view the member search page" // MESSAGE WILL APPEAR ABOVE LOGIN
                            , TCServlet.LOGIN_PAGE // THE LOGIN PAGE FILE
                            , url.toString()
                    );
                result = displayReferrals(HTMLmaker, request, nav, document, search, listTag);
            } else {
                result = TaskStatic.process(request, response, HTMLmaker, nav, document);
            }
        } catch (NavigationException ne) {
            log.debug("TaskSearch:ERROR:\n" + ne.getMessage());
            throw ne;
        } catch (Exception e) {
            StringBuffer msg = new StringBuffer(150);
            msg.append("TaskSearch:process:");
            msg.append(":ERROR:\n");
            msg.append(e);
            throw new NavigationException(msg.toString(), TCServlet.INTERNAL_ERROR_PAGE);
        }
        return result;
    }


    static MemberSearch getMemberSearch(Navigation nav)
            throws Exception {
        MemberSearch result = null;
        try {
            HashMap sessionObjects = nav.getSessionObjects();
            if (!sessionObjects.containsKey("memberSearch")) {
                log.debug("XXX search was not in cache");
                result = new MemberSearch();
                sessionObjects.put("memberSearch", result);
            } else {
                log.debug("XXX search was in cache");
                result = (MemberSearch) sessionObjects.get("memberSearch");
            }
        } catch (Exception e) {
            throw new Exception("TaskSearch:getMemberSearch:ERROR:\n" + e);
        }
        return result;
    }


    private static String displaySearch(HTMLRenderer HTMLmaker, HttpServletRequest request,
                                        Navigation nav, XMLDocument document, MemberSearch search, RecordTag listTag)
            throws NavigationException {
        String result = null;
        String xsldocURLString = null;
        try {
            search.setMinRating(-1);
            search.setMaxRating(-1);
            search.setMinNumRatings(-1);
            search.setMaxNumRatings(-1);
            search.setHandle("%");
            search.setState("%");
            search.setIsResult(false);

            DataCache cache = Cache.get();
            listTag.addTag(RecordTag.getListXML("States", cache.getStates()));
            listTag.addTag(search.getXML());
            document.addTag(listTag);

            log.debug(document.getXML(2));
            xsldocURLString = XSL_DIR + "member_search.xsl";
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (Exception e) {
            throw new NavigationException("TaskSearch:RENDERING ERROR:",
                    TCServlet.NAVIGATION_ERROR_PAGE);
        }
        return result;
    }


    /**
     **********************************************************************************
     * search()
     * Makes bean call to search for coders.
     * @author Greg Paul
     * @param HTMLmaker
     * @param request
     * @param nav
     * @param document
     * @param search
     * @param listTag
     * @return String - the generated HTML page
     * @throws NavigationException
     *********************************************************************************
     */
    private static String search(HTMLRenderer HTMLmaker, HttpServletRequest request,
                                 Navigation nav, XMLDocument document, MemberSearch search, RecordTag listTag)
            throws NavigationException {
        log.debug("TaskSearch.search called...");

        String result = null;
        Context ctx = null;
        RecordTag searchTag = null;
        String xsldocURLString = null;
        try {

            if (Conversion.checkNull(request.getParameter("Next")).equals("true") || Conversion.checkNull(request.getParameter("Next")).equals("false"))
                return scroll(HTMLmaker, request, nav, document, search, listTag);

            search.setHandle(Conversion.checkNull(request.getParameter("SearchHandle")));
            if (search.getHandle().equals("")) {
                search.setHandle("%");
            }
            search.setState(Conversion.checkNull(request.getParameter("State")));
            if (search.getState().equals("") || search.getState().equals("All")) {
                search.setState("%");
            }
            if ((Conversion.checkNull(request.getParameter("MinRating")).equals("")))
                search.setMinRating(-1);
            else
                search.setMinRating(Integer.parseInt(request.getParameter("MinRating")));
            if ((Conversion.checkNull(request.getParameter("MaxRating")).equals("")))
                search.setMaxRating(-1);
            else
                search.setMaxRating(Integer.parseInt(request.getParameter("MaxRating")));
            if ((Conversion.checkNull(request.getParameter("MinNumRatings")).equals("")))
                search.setMinNumRatings(-1);
            else
                search.setMinNumRatings(Integer.parseInt(request.getParameter("MinNumRatings")));
            if ((Conversion.checkNull(request.getParameter("MaxNumRatings")).equals("")))
                search.setMaxNumRatings(-1);
            else
                search.setMaxNumRatings(Integer.parseInt(request.getParameter("MaxNumRatings")));

            search.getScroll().setRow(1);
            search.getScroll().setReturns(DEFAULT_ROW_COUNT);

            ctx = TCContext.getInitial();
            DataCache cache = Cache.get(ctx);
            listTag.addTag(RecordTag.getListXML("States", cache.getStates()));

            SearchHome sHome = (SearchHome) ctx.lookup(ApplicationServer.SEARCH);
            Search s = sHome.create();
            search = s.getCoders(search);

            search.setIsResult(true);
            searchTag = search.getXML();
            listTag.addTag(searchTag);
            document.addTag(listTag);

            log.debug(document.getXML(2));
            String command = Conversion.checkNull(request.getParameter("c"));
            xsldocURLString = XSL_DIR + command + ".xsl";
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException("TaskSearch:displayCoders:ERROR:\n" + e,
                    TCServlet.NAVIGATION_ERROR_PAGE);
        } finally {
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    /**
     **********************************************************************************
     * scroll()
     * Handles the scrolling of the results of a member search
     * @author Greg Paul
     * @param HTMLmaker
     * @param request
     * @param nav
     * @param document
     * @param search
     * @param listTag
     * @return String - the generated HTML page
     * @throws NavigationException
     *********************************************************************************
     */
    private static String scroll(HTMLRenderer HTMLmaker, HttpServletRequest request,
                                 Navigation nav, XMLDocument document, MemberSearch search, RecordTag listTag)
            throws NavigationException {
        log.debug("TaskSearch.scroll called...");

        String result = null;
        Context ctx = null;
        RecordTag searchTag = null;
        Scroll scroll = null;
        String xsldocURLString = null;
        try {

            ctx = TCContext.getInitial();
            DataCache cache = Cache.get(ctx);
            listTag.addTag(RecordTag.getListXML("States", cache.getStates()));

            scroll = search.getScroll();
            scroll.setNext(Boolean.valueOf(request.getParameter("Next")).booleanValue());

            /** in an effort to stop the burrows' of the world, we'll check to make sure
             * we need to go to the bean.  if we're already at either edge of the resultset,
             * there is no need to go to the bean, just return the current.
             */
            if ((scroll.getNext() && ((scroll.getRow() - 1 + scroll.getReturns()) < scroll.getSize())) ||
                    (!scroll.getNext() && ((scroll.getRow() - scroll.getReturns()) > 0))) {

                SearchHome sHome = (SearchHome) ctx.lookup(ApplicationServer.SEARCH);
                Search s = sHome.create();
                search = s.scroll(search);
            }
            search.setIsResult(true);
            searchTag = search.getXML();
            listTag.addTag(searchTag);
            document.addTag(listTag);

            log.debug(document.getXML(2));
            xsldocURLString = XSL_DIR + Conversion.checkNull(request.getParameter("c")) + ".xsl";
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException("TaskSearch:displayCoders:ERROR:\n" + e,
                    TCServlet.NAVIGATION_ERROR_PAGE);
        } finally {
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    private static String displayReferrals(HTMLRenderer HTMLmaker, HttpServletRequest request,
                                           Navigation nav, XMLDocument document, MemberSearch search, RecordTag listTag)
            throws NavigationException {
        String result = null;
        Context ctx = null;
        try {
            HashMap sessionObjects = nav.getSessionObjects();
            ArrayList referrals = null;
            if (sessionObjects.containsKey("Referrals")) {
                referrals = (ArrayList) sessionObjects.get("Referrals");
            } else {
                ctx = TCContext.getInitial();
                SearchHome sHome = (SearchHome) ctx.lookup(ApplicationServer.SEARCH);
                Search s = sHome.create();
                referrals = s.getReferrals(nav.getUser().getUserId());
                if (referrals != null) {
                    CoderStatisticsHome csHome = (CoderStatisticsHome) ctx.lookup(ApplicationServer.CODER_STATISTICS);
                    CoderStatistics cs = csHome.create();
                    for (int i = 0; i < referrals.size(); i++) {
                        com.topcoder.common.web.data.stat.coder.Coder referral = (com.topcoder.common.web.data.stat.coder.Coder) referrals.get(i);
                        com.topcoder.common.web.data.stat.coder.Coder stat = cs.getCoderStatistics(referral.getCoderId());
                        if (stat != null) {
                            referrals.remove(i);
                            referrals.add(i, stat);
                        }
                    }
                    Collections.sort(referrals);
                    sessionObjects.put("Referrals", referrals);
                }
            }
            String mode = "sort";
            Scroll scroll = nav.getScroll(TCServlet.REFERRAL_SORT_SCROLL, "ReferralScroll");
            // EVALUATE MODE TO PROCESS SESSION
            if (request.getParameterValues("Mode") != null) {
                mode = (String) request.getParameter("Mode");
                //************************ watch sort mode *************************
                if (mode.equals("sort")) {
                    int key = Sort.DEFAULT_REFERRAL_SORT_KEY;
                    char dir = 'D';
                    try {
                        if (referrals.size() > 0) {
                            key = Integer.parseInt(request.getParameter("Key"));
                            String strDir = Conversion.checkNull(request.getParameter("Dir"));
                            dir = strDir.charAt(0);
                            com.topcoder.common.web.data.stat.coder.Coder referral = (com.topcoder.common.web.data.stat.coder.Coder) referrals.get(0);
                            SortKey sortKey = referral.getSort();
                            sortKey.setKey(key);
                            sortKey.setDir(dir);
                            Collections.sort(referrals);
                            listTag.addTag(sortKey.getXML());
                            scroll.setNext(true);
                            scroll.setRow(1);
                            scroll.setReturns(TCServlet.REFERRAL_SORT_SCROLL);
                            scroll.setSize(0);
                            scroll.setAllowPrevious(false);
                            scroll.setAllowNext(false);
                        }
                    } catch (Exception ignore) {
                        ignore.printStackTrace();
                    }
                }
                //************************ watch scroll mode *************************
                else if (mode.equals("scroll")) {
                    scroll.setNext(Boolean.valueOf(request.getParameter("Next")).booleanValue());
                    if (
                            scroll.getNext()
                            && scroll.getRow() + scroll.getReturns() <= scroll.getSize()
                    ) {
                        scroll.setRow(scroll.getRow() + scroll.getReturns());
                    }
                }
            }
            if (referrals != null) {
                listTag.addTag(getScrollXML("Referrals", scroll, referrals));
            }
            document.addTag(listTag);
            log.debug(document.getXML(2));
            String xsldocURLString = XSL_DIR + "refer.xsl";
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException("TaskSearch:displayReferrals:ERROR:\n" + e,
                    TCServlet.NAVIGATION_ERROR_PAGE);
        } finally {
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }

    private static RecordTag getScrollXML(String tagName, Scroll scroll, List list)
            throws Exception {
        RecordTag result = new RecordTag(tagName);
        try {
            scroll.setSize(list.size());
            TagRenderer att = null;
            int recCount = 1;
            if (scroll.getRow() > scroll.getSize()) {
                if (scroll.getReturns() >= scroll.getSize()) {
                    scroll.setRow(1);
                    scroll.setNext(true);
                } else {
                    int maxScrolls = scroll.getSize() / scroll.getReturns();
                    if (scroll.getSize() % scroll.getReturns() == 0) {
                        maxScrolls--;
                    }
                    scroll.setRow(maxScrolls * scroll.getReturns() + 1);
                    scroll.setNext(true);
                }
            } else if (scroll.getRow() <= 1) {
                scroll.setRow(1);
                scroll.setNext(true);
            }
            for (; recCount <= scroll.getSize(); recCount++) {
                if (scroll.getNext()) {
                    if (recCount >= scroll.getRow()) {
                        for (; recCount < scroll.getRow() + scroll.getReturns(); recCount++) {
                            att = (TagRenderer) list.get(recCount - 1);
                            result.addTag(att.getXML());
                            if (recCount == scroll.getSize()) {
                                break;
                            }
                        }
                        break;
                    }
                } else {
                    if ((recCount >= (scroll.getRow() - scroll.getReturns())) && (recCount < scroll.getRow())) {
                        for (; recCount < scroll.getRow(); recCount++) {
                            att = (TagRenderer) list.get(recCount - 1);

                            result.addTag(att.getXML());
                            if (recCount == scroll.getSize()) {
                                break;
                            }
                        }
                        scroll.setRow(scroll.getRow() - scroll.getReturns());
                        scroll.setNext(true);
                        break;
                    }
                }
            }
            if (scroll.getRow() + scroll.getReturns() > scroll.getSize()) {
                scroll.setAllowNext(false);
            } else {
                scroll.setAllowNext(true);
            }
            if (scroll.getRow() - scroll.getReturns() < 0) {
                scroll.setAllowPrevious(false);
            } else {
                scroll.setAllowPrevious(true);
            }
            result.addTag(scroll.getXML());
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("common.web.xml.XMl:getScrollXML:ERROR:" + e.getMessage());
        }
        return result;
    }


}

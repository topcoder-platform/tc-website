package com.topcoder.web.corp.controller;

import org.faceless.graph.Style;
import org.faceless.graph.Graph;
import org.faceless.graph.BarGraph;
import org.faceless.graph.output.PNGOutput;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpUtils;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.rmi.PortableRemoteObject;
import java.awt.*;
import java.io.IOException;
import java.io.ByteArrayOutputStream;
import java.util.Map;
import java.util.Iterator;
import java.util.Date;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.common.web.constant.TCServlet;
import com.fx4m.plot13.HistoryPlot;


/**
 *  A servlet to generate graph images
 *
 * @version $Revision$
 * @author Greg Paul
 */

public final class GraphServlet extends HttpServlet {

    private static final int DW_DB_TYPE = 3;

    private static final Color GREEN = new Color(0x99, 0xff, 0x33);
    private static final Color YELLOW = new Color(0xff, 0xcc, 0x00);
    private static final Color RED = new Color(0xff, 0x00, 0x00);
    private static final Color GOLD = new Color(0xff, 0xff, 0x00);
    private static final Color BLUE = new Color(0x66, 0xcc, 0xcc);
    private static final Color GRAY = new Color(0xcc, 0xcc, 0xcc);
    private static final String[] rating_segments = {"0-99", "100-199", "200-299", "300-399",
                                                     "400-499", "500-599", "600-699", "700-799", "800-899", "900-999",
                                                     "1000-1099", "1100-1199", "1200-1299", "1300-1399", "1400-1499", "1500-1599",
                                                     "1600-1699", "1700-1799", "1800-1899", "1900-1999", "2000-2099", "2100-2199",
                                                     "2200-2299", "2300-2399", "2400-2499", "2500-2599", "2600-2699", "2700-2799",
                                                     "2800-2899", "2900 & up"};
    private static final String LICENSE_KEY = "8C6BE93G3B21D6D";

    private static final Style axisStyle = new Style(YELLOW, "Verdana", Font.PLAIN, 10);
    private static final Style labelStyle = new Style(YELLOW, "Verdana", Font.PLAIN, 14);
    private static final Style titleStyle = new Style(YELLOW, "Verdana", Font.PLAIN, 18);
    private static Logger log = Logger.getLogger(GraphServlet.class);

    private static CacheClient client = null;

    public synchronized void init(ServletConfig config) throws ServletException {
        log.debug("SERVLET INIT CALLED");
        super.init(config);
    }

    public final void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.debug("get");
        process(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.debug("post");
    }

    public void process(HttpServletRequest request, HttpServletResponse response) {
        ServletOutputStream o = null;
        byte[] result = null;
        Request dataRequest = null;
        try {
            Graph.setLicenseKey(LICENSE_KEY);
            dataRequest = new Request(HttpUtils.parseQueryString(request.getQueryString()));

            WebAuthentication authentication = new BasicAuthentication(
                    new SessionPersistor(request.getSession()), request, response, BasicAuthentication.CORP_SITE);

            log.info("[*** graph *** " + dataRequest.getContentHandle() + " *** " + authentication.getActiveUser().getUserName() + " ***]");

            /***********************************************************************/
            if (dataRequest.getContentHandle().equals("rating_distribution_graph")) {
                result = getFromCache(dataRequest);
                if (result == null) {
                    result = getRatingsDistribution(dataRequest, authentication.getActiveUser().getId());
                }
                addToCache(dataRequest, result);
            }
            /***********************************************************************/
            else if (dataRequest.getContentHandle().equals("rating_history_graph")) {
                result = getFromCache(dataRequest);
                if (result == null) {
                    result = getRatingsHistory(dataRequest, authentication.getActiveUser().getId());
                }
                addToCache(dataRequest, result);
            }
            /***********************************************************************/
            else {
                throw new NavigationException("GraphServlet:process:ERROR:invalid command: " +
                        dataRequest.getContentHandle(),
                        TCServlet.NAVIGATION_ERROR_PAGE);
            }
            response.setContentType("image/gif");
            response.setHeader("content-disposition","inline; filename=graph.png");
            response.setContentType("image/png");
            o = response.getOutputStream();
            o.write(result);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private static byte[] getFromCache(RequestInt dataRequest) {
        byte[] ret = null;
        connectToCache();
        try {
            ret = (byte[]) client.get(getCacheKey(dataRequest));
        } catch (Exception e) {
            log.error("ERROR GETTING OBJECT FROM CACHE");
        }
        if (ret != null) log.debug("graph found in cache");
        return ret;
    }

    private static void connectToCache() {
        if (client == null) {
            try {
                client = CacheClientFactory.createCacheClient();
            } catch (Exception e) {
                log.error("ERROR INITIALIZING CACHE CLIENT");
            }
        }
    }

    private static String getCacheKey(RequestInt dataRequest) {
        return "graph:" + dataRequest.toString();
    }

    private static void addToCache(RequestInt dataRequest, byte[] value) {
        connectToCache();
        try {
            client.set(getCacheKey(dataRequest), value, 1000 * 60 * 60 * 24 * 7); //1 week
        } catch (Exception e) {
            log.error("ERROR GETTING OBJECT FROM CACHE");
        }
    }

    private static byte[] getRatingsHistory(RequestInt dataRequest, long userId)
            throws NavigationException {
        log.debug("taskGraph:getRatingsHistory called...");

        Map resultMap = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        ResultSetContainer.ResultSetRow rsr = null;

        try {

            dai = new CachedDataAccess(getDw(userId));
            resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("Rating_History_Graph");

            if (rsc != null) {
                Date[] dates = new Date[rsc.size()];
                int[] ratings = new int[rsc.size()];
                int i = 0;
                for (Iterator it = rsc.iterator(); it.hasNext(); i++) {
                    rsr = (ResultSetContainer.ResultSetRow) it.next();
                    dates[i] = (Date) rsr.getItem("date").getResultData();
                    ratings[i] = rsr.getIntItem("rating");
                }
                return HistoryPlot.plot(ratings, dates, rsc.getItem(0, "handle").toString());
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException("GraphServlet:getRatingDistGraph:ERROR:",
                    TCServlet.NAVIGATION_ERROR_PAGE);
        }
        return null;
    }


    private static byte[] getRatingsDistribution(RequestInt dataRequest, long userId)
            throws NavigationException {

        log.debug("taskGraph:getRatingsDistribution called...");

        BarGraph g = null;
        ByteArrayOutputStream baos = null;
        Iterator it = null;
        Map resultMap = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        ResultSetContainer.ResultSetRow rsr = null;

        try {
            dai = new CachedDataAccess(getDw(userId));
            resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("Rating_Distribution_Graph");

            g = new BarGraph();
            g.optionTitle("Rating Distribution");
            g.optionTitleStyle(titleStyle);
            g.optionXAxisLabel("Rating");
            g.optionYAxisLabel("Number of Coders");
            g.optionXAxisLabelStyle(labelStyle);
            g.optionYAxisLabelStyle(labelStyle);
            g.optionYAxisStyle(axisStyle);
            g.optionXAxisStyle(axisStyle);
            g.optionXAxisTextRotation(45);

            g.optionAxisStyle(new Style(YELLOW));

            it = rsc.iterator();
            while (it.hasNext()) {  //there's only gonna be one
                rsr = (ResultSetContainer.ResultSetRow) it.next();
                for (int i = 0; i < rsc.getColumnCount(); i++) {
                    g.set(rating_segments[i],
                            ((java.math.BigInteger) (rsr.getItem(i)).getResultData()).doubleValue());
                    if (i < 9)
                        g.setColor(rating_segments[i], GRAY);
                    else if (i >= 9 && i < 12)
                        g.setColor(rating_segments[i], GREEN);
                    else if (i >= 12 && i < 15)
                        g.setColor(rating_segments[i], BLUE);
                    else if (i >= 15 && i < 22)
                        g.setColor(rating_segments[i], GOLD);
                    else if (i >= 22 && i < 30)
                        g.setColor(rating_segments[i], RED);
                }
            }
            baos = new ByteArrayOutputStream();
            PNGOutput out = new PNGOutput(600, 400, Color.black, baos);
            out.setMargin(10, 10, 10, 10);
            out.render(g);
            return baos.toByteArray();

        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException("GraphServlet:getRatingDistGraph:ERROR:",
                    TCServlet.NAVIGATION_ERROR_PAGE);
        }
    }


        /**
     * returns the datawarehouse database to be used for
     * the authenticated user.  if it's not in the database
     * we'll return a default
     * @return
     * @throws java.lang.Exception
     */
    protected static String getDw(long userId) throws Exception {
        String ret = getDb(DW_DB_TYPE, userId);
        if (ret==null) {
            ret = DBMS.DW_DATASOURCE_NAME;
        }
        return ret;
    }

    private static String getDb(int type, long userId) throws Exception {
        Request r = new Request();
        r.setContentHandle("contact_datasource");
        r.setProperty("uid", String.valueOf(userId));
        r.setProperty("dstid", String.valueOf(type));
        Map m = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, true).getData(r);
        ResultSetContainer rsc = (ResultSetContainer)m.get("contact_datasource");
        String ret = null;
        if (!(rsc==null || rsc.isEmpty())) {
            ret = rsc.getStringItem(0, "datasource_name");
        }
        return ret;
    }


    protected static DataAccessInt getDataAccess(String db) throws Exception {
        return getDataAccess(db, false);
    }

    protected static DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if (datasource == null)
            throw new IllegalArgumentException("datasource name is null.");
        DataAccessInt dAccess = null;
        if (cached)
            dAccess = new CachedDataAccess(datasource);
        else
            dAccess = new DataAccess(datasource);
        return dAccess;
    }


}


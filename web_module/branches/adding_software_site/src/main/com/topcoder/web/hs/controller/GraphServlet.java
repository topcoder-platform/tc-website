package com.topcoder.web.hs.controller;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.shared.distCache.*;
import com.topcoder.shared.util.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.*;
import com.topcoder.web.common.*;
import com.topcoder.web.common.security.*;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.constant.TCServlet;
import com.fx4m.plot13.HistoryPlot;

import org.faceless.graph.*;
import org.faceless.graph.output.PNGOutput;

import javax.servlet.*;
import javax.servlet.http.*;
import java.awt.*;
import java.io.*;
import java.text.*;
import java.util.*;

/**
 *  A servlet for graph images.
 *
 * @author Greg Paul, Ambrose Feinstein
 */

public class GraphServlet extends HttpServlet {

    private static final Color GREEN = new Color(0x99, 0xff, 0x33);
    private static final Color DARK_BLUE = new Color(0x00, 0x19, 0x35);
    private static final Color YELLOW = new Color(0xff, 0xcc, 0x00);
    private static final Color RED = new Color(0xff, 0x00, 0x00);
    private static final Color GOLD = new Color(0xff, 0xff, 0x00);
    private static final Color BLUE = new Color(0x66, 0xcc, 0xcc);
    private static final Color LIGHT_GREEN = new Color(0xcc, 0xff, 0x99);
    private static final Color GRAY = new Color(0xcc, 0xcc, 0xcc);
    private static final Color MAROON = new Color(0x88, 0x00, 0x22);
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
    private static final Style subTitleStyle = new Style(YELLOW, "Verdana", Font.PLAIN, 14);

    private static final Style axisStyleDark = new Style(Color.black, "Verdana", Font.PLAIN, 10);
    private static final Style labelStyleDark = new Style(Color.black, "Verdana", Font.PLAIN, 14);
    private static final Style titleStyleDark = new Style(Color.black, "Verdana", Font.PLAIN, 18);
    private static Logger log = Logger.getLogger(GraphServlet.class);

    private static CacheClient client = null;

    public synchronized void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Persistor persistor = new SessionPersistor((request).getSession());
            WebAuthentication auth = new BasicAuthentication(persistor,
                    HttpObjectFactory.createRequest(request),
                    HttpObjectFactory.createResponse(response), BasicAuthentication.HS_SITE);
            Authorization hsa = new HSAuthorization(auth.getActiveUser());
            Resource r = new ClassResource(this.getClass());
            if(!hsa.hasPermission(r))
                throw new PermissionException(auth.getUser(), r);
        } catch(Exception e) {
            log.fatal("permission check failed, giving up", e);
            return;  // just give them a red x
        }

        ServletOutputStream o = null;
        byte[] result = null;
        Request dataRequest = null;
        try {
            Graph.setLicenseKey(LICENSE_KEY);
            dataRequest = new Request(HttpUtils.parseQueryString(request.getQueryString()));

            /***********************************************************************/
            if (dataRequest.getContentHandle().equals("rating_distribution_graph")) {
                result = getFromCache(dataRequest);
                if (result == null) {
                    result = getRatingsDistribution(dataRequest);
                }
                addToCache(dataRequest, result);
            }
            /***********************************************************************/
            else if (dataRequest.getContentHandle().equals("rating_distribution_graph_dark")) {
                result = getFromCache(dataRequest);
                if (result == null) {
                    result = getRatingsDistributionDark(dataRequest);
                }
                addToCache(dataRequest, result);
            }
            /***********************************************************************/
            else if (dataRequest.getContentHandle().equals("rating_history_graph")) {
                result = getFromCache(dataRequest);
                if (result == null) {
                    result = getRatingsHistory(dataRequest);
                }
                addToCache(dataRequest, result);
            }
            /***********************************************************************/
            else if (dataRequest.getContentHandle().equals("problem_distribution_graph")) {
                result = getFromCache(dataRequest);
                if (result == null) {
                    result = getProblemDistribution(dataRequest);
                }
                addToCache(dataRequest, result);
            }
            /***********************************************************************/
            else {
                throw new NavigationException();
            }
            response.setContentType("image/gif");
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



    private static byte[] getRatingsHistory(RequestInt dataRequest)
            throws NavigationException {
        log.debug("taskGraph:getRatingsHistory called...");

        Map resultMap = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        ResultSetContainer.ResultSetRow rsr = null;

        try {

            dai = new CachedDataAccess(DBMS.HS_DW_DATASOURCE_NAME);
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


    private static byte[] getRatingsDistribution(RequestInt dataRequest)
            throws NavigationException {

        log.debug("GraphServlet:getRatingsDistribution called...");

        BarGraph g = null;
        ByteArrayOutputStream baos = null;
        Iterator it = null;
        Map resultMap = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        ResultSetContainer.ResultSetRow rsr = null;

        try {
            dai = new CachedDataAccess(DBMS.HS_DW_DATASOURCE_NAME);
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
            throw new NavigationException("GraphServlet:getRatingsDistribution:ERROR:",
                    TCServlet.NAVIGATION_ERROR_PAGE);
        }
    }

    private static byte[] getRatingsDistributionDark(RequestInt dataRequest)
            throws NavigationException {

        log.debug("GraphServlet:getRatingsDistributionDark called...");

        BarGraph g = null;
        ByteArrayOutputStream baos = null;
        Iterator it = null;
        Map resultMap = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        ResultSetContainer.ResultSetRow rsr = null;

        try {
            dai = new CachedDataAccess(DBMS.HS_DW_DATASOURCE_NAME);
            resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("Rating_Distribution_Graph");

            g = new BarGraph();
            g.optionTitle("Rating Distribution");
            g.optionTitleStyle(titleStyleDark);
            g.optionXAxisLabel("Rating");
            g.optionYAxisLabel("Number of Coders");
            g.optionXAxisLabelStyle(labelStyleDark);
            g.optionYAxisLabelStyle(labelStyleDark);
            g.optionYAxisStyle(axisStyleDark);
            g.optionXAxisStyle(axisStyleDark);
            g.optionXAxisTextRotation(45);

            g.optionAxisStyle(new Style(Color.black));

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
            PNGOutput out = new PNGOutput(600, 400, Color.white, baos);
            out.setMargin(10, 10, 10, 10);
            out.render(g);
            return baos.toByteArray();

        } catch (Exception e) {
            throw new NavigationException("GraphServlet:getRatingsDistributionDark:ERROR:",
                    TCServlet.NAVIGATION_ERROR_PAGE);
        }
    }

    private static byte[] getProblemDistribution(RequestInt dataRequest)
            throws NavigationException {

        log.debug("GraphServlet:getRatingsDistribution called...");

        BarGraph g = null;
        ByteArrayOutputStream baos = null;
        Iterator it = null;
        Map resultMap = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        ResultSetContainer.ResultSetRow rsr = null;

        try {
            dai = new CachedDataAccess(DBMS.HS_DW_DATASOURCE_NAME);
            resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("Problem_Distribution_Graph");
            ResultSetContainer info = (ResultSetContainer) resultMap.get("Problem_Distribution_Info");

            g = new BarGraph();
            g.optionTitleStyle(titleStyle);
            g.optionXAxisLabel("Score");
            g.optionYAxisLabel("Number of Correct Submissions");
            g.optionXAxisLabelStyle(labelStyle);
            g.optionYAxisLabelStyle(labelStyle);
            g.optionYAxisStyle(axisStyle);
            g.optionXAxisStyle(axisStyle);
            g.optionXAxisTextRotation(45);
            g.optionSubTitleStyle(subTitleStyle);

            g.optionAxisStyle(new Style(YELLOW));
            it = rsc.iterator();
            DecimalFormat df = new DecimalFormat("0.0");
            String problemName = null;
            while (it.hasNext()) {  //there's only gonna be one
                rsr = (ResultSetContainer.ResultSetRow) it.next();
                double points = new Double(rsr.getItem("points").toString()).doubleValue();
                problemName = rsr.getItem("name").toString();
                g.optionTitle("Problem Distribution :: "+problemName);
                int columns = rsc.getColumnCount()-2;
                double pointsPerBucket = (points*.7)/columns;
                double start = points*.3;
                for (int i = 0; i < columns; i++) {
                    String columnName = df.format(start+pointsPerBucket*i) + " - " + df.format(start+pointsPerBucket*(i+1));
                    g.set(columnName,
                            ((java.math.BigInteger) (rsr.getItem(i)).getResultData()).doubleValue());
                    g.setColor(columnName, MAROON);
                }
            }
            it = info.iterator();
            while(it.hasNext()){
                rsr = (ResultSetContainer.ResultSetRow) it.next();
                int opened = Integer.parseInt(rsr.getItem("opened").toString());
                int challenged = Integer.parseInt(rsr.getItem("challenged").toString());
                int passed = Integer.parseInt(rsr.getItem("passed").toString());
                int failed = Integer.parseInt(rsr.getItem("failed").toString());
                g.optionSubTitle((opened+challenged+failed)+" out of "+(opened+challenged+failed+passed)+" coders who opened "+problemName+", received 0 points.");
            }
            baos = new ByteArrayOutputStream();
            PNGOutput out = new PNGOutput(600, 400, Color.black, baos);
            out.setMargin(10, 10, 10, 10);
            out.render(g);
            return baos.toByteArray();

        } catch (Exception e) {
            throw new NavigationException("GraphServlet:getProblemDistribution:ERROR:",
                    TCServlet.NAVIGATION_ERROR_PAGE);
        }
    }
}

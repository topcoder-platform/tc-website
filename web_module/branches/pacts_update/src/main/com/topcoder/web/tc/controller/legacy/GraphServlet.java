package com.topcoder.web.tc.controller.legacy;

import com.fx4m.plot13.HistoryPlot;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import org.faceless.graph.BarGraph;
import org.faceless.graph.Graph;
import org.faceless.graph.PieGraph;
import org.faceless.graph.Style;
import org.faceless.graph.formatter.NullFormatter;
import org.faceless.graph.output.PNGOutput;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpUtils;
import java.awt.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

/**
 *  A servlet to generate graph images
 *
 * @version $Revision$
 * @author Greg Paul
 */

public final class GraphServlet extends HttpServlet {


    private static final Color GREEN = new Color(0x00, 0xa9, 0x00);
    private static final Color YELLOW = new Color(0xff, 0xcc, 0x00);
    private static final Color RED = new Color(0xee, 0x00, 0x00);
    private static final Color GOLD = new Color(0xdd, 0xcc, 0x00);
    private static final Color BLUE = new Color(0x66, 0x66, 0xff);
    private static final Color GRAY = new Color(0x99, 0x99, 0x99);

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
        Navigation nav = null;
        try {
            Graph.setLicenseKey(LICENSE_KEY);
            dataRequest = new Request(HttpUtils.parseQueryString(request.getQueryString()));
            nav = (Navigation) request.getSession().getAttribute("navigation");
            if (nav == null) {
                nav = new Navigation(request, response);
                request.getSession(true).setAttribute("navigation", nav);
            }
            log.info("[*** graph *** " + dataRequest.getContentHandle() + " *** " + nav.getSessionInfo().getHandle() + " ***]");

            /***********************************************************************/
            if (dataRequest.getContentHandle().equals("rating_distribution_graph")) {
                result = getFromCache(dataRequest);
                if (result == null) {
                    result = getRatingsDistribution(dataRequest);
                }
                addToCache(dataRequest, result);
            }
            /***********************************************************************/
            else if (dataRequest.getContentHandle().equals("rating_distribution_graph_profile")) {
                result = getFromCache(dataRequest);
                if (result == null) {
                    result = getRatingsDistributionProfile(dataRequest);
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
            else if (dataRequest.getContentHandle().equals("school_membership")) {
                result = getSchoolMembership(dataRequest);
            }
            /***********************************************************************/
            else if (dataRequest.getContentHandle().equals("pro_interest_graph")) {
                result = getProInterest(dataRequest);
            }
            /***********************************************************************/
            else if (dataRequest.getContentHandle().equals("student_interest_graph")) {
                result = getStudentInterest(dataRequest);
            }
            /***********************************************************************/
            else if (dataRequest.getContentHandle().equals("pro_industry_graph")) {
                result = getProIndustry(dataRequest);
            }
            /***********************************************************************/
            else if (dataRequest.getContentHandle().equals("pro_title_graph")) {
                result = getProTitle(dataRequest);
            }
            /***********************************************************************/
            else if (dataRequest.getContentHandle().equals("pro_area_interest_graph")) {
                result = getProAreaInterest(dataRequest);
            }
            /***********************************************************************/
            else if (dataRequest.getContentHandle().equals("pro_referral_graph")) {
                result = getProReferral(dataRequest);
            }
            /***********************************************************************/
            else if (dataRequest.getContentHandle().equals("student_referral_graph")) {
                result = getStudentReferral(dataRequest);
            }
            /***********************************************************************/
            else {
                throw new NavigationException("unknown graph: " + dataRequest.getContentHandle());
            }
            response.setContentType("image/gif");
            response.setHeader("content-disposition", "inline; filename=graph.png");
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

    private static byte[] getSchoolMembership(RequestInt dataRequest) throws NavigationException {
        log.debug("GraphServlet:getSchoolMemberShip called...");

        ByteArrayOutputStream baos = null;
        BarGraph g = null;
        Map resultMap = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        ResultSetContainer.ResultSetRow rsr = null;
        Iterator it = null;

        try {
            dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("School_Membership");

            g = new BarGraph();
            it = rsc.iterator();
            int i = 0;
            while (it.hasNext() && i < 10) {
                i++;
                rsr = (ResultSetContainer.ResultSetRow) it.next();
                g.set((String) (rsr.getItem("school_name")).getResultData(),
                        ((Long) (rsr.getItem("number_of_students")).getResultData()).doubleValue());
            }
            g.optionZRotation(90);
            g.optionTitle("Top 10 Schools - Membership");
            g.optionTitleStyle(titleStyleDark);
            g.optionBarWidth(.70);
            g.optionDisplayKey(Graph.KEY_BOXED_BOTTOM);
            g.optionKeyStyle(axisStyleDark);
            g.optionKeyBoxStyle(new Style(Color.white));
            g.optionYAxisStyle(axisStyleDark);
            g.optionXAxisStyle(axisStyleDark);
            g.optionAxisStyle(new Style(Color.black));
            g.optionXFormatter(new NullFormatter());

            baos = new ByteArrayOutputStream();
            PNGOutput out = new PNGOutput(500, 400, Color.white, baos);
            out.setMargin(10, 10, 10, 10);
            out.render(g);
            return baos.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException(e);
        }
    }


    private static byte[] getProInterest(RequestInt dataRequest) throws NavigationException {
        log.debug("GraphServlet:getProInterest called...");

        ByteArrayOutputStream baos = null;
        PieGraph g = null;
        Map resultMap = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        ResultSetContainer.ResultSetRow rsr = null;
        Iterator it = null;

        try {
            dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            dataRequest.setProperty("ct", "2");   //Professional
            dataRequest.setProperty("dq", "5");   //What's your primary interest in tc
            resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("Demographic_Graph");

            g = new PieGraph();
            it = rsc.iterator();
            while (it.hasNext()) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();
                g.set((String) (rsr.getItem("answer")).getResultData(),
                        ((Long) (rsr.getItem("count")).getResultData()).doubleValue());
            }
            g.optionTitle("Professionals");
            g.optionSubTitle("Primary Interest");
            g.optionTitleStyle(titleStyleDark);
            g.optionSubTitleStyle(labelStyleDark);
            g.optionDisplayKey(Graph.KEY_BOXED_BOTTOM);
            g.optionKeyStyle(axisStyleDark);
            g.optionKeyBoxStyle(new Style(Color.white));
            g.optionKeyStyle(labelStyleDark);
            g.optionDisplayPercentage(PieGraph.PERCENTAGE_WITH_KEY);

            baos = new ByteArrayOutputStream();
            PNGOutput out = new PNGOutput(500, 400, Color.white, baos);
            out.setMargin(10, 10, 10, 10);
            out.render(g);
            return baos.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException(e);
        }
    }


    private static byte[] getProIndustry(RequestInt dataRequest) throws NavigationException {
        log.debug("GraphServlet:getProIndustry called...");

        ByteArrayOutputStream baos = null;
        PieGraph g = null;
        Map resultMap = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        ResultSetContainer.ResultSetRow rsr = null;
        Iterator it = null;
        String[] answers = null;
        double[] counts = null;
        final double minPercentage = .05;

        try {
            dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            dataRequest.setProperty("ct", "2");   //Professional
            dataRequest.setProperty("dq", "7");   //What Industry are you in
            resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("Demographic_Graph");

            g = new PieGraph();
            it = rsc.iterator();
            int i = 0;
            answers = new String[rsc.size()];
            counts = new double[rsc.size()];
            while (it.hasNext()) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();

                answers[i] = (String) (rsr.getItem("answer")).getResultData();
                counts[i] = ((Long) (rsr.getItem("count")).getResultData()).doubleValue();
                i++;
            }

            //get the sum of respondants
            double sum = 0;
            for (int k = 0; k < counts.length; k++) {
                sum += counts[k];
            }

            //only include those slices that are at least minPercentage of total
            // otherwise, just consider them "other"
            double otherSum = 0;
            for (int k = 0; k < counts.length; k++) {
                if ((double) counts[k] / (double) sum > minPercentage) {
                    g.set(answers[k], counts[k]);
                } else {
                    otherSum += counts[k];
                }
            }
            if (otherSum > 0) {
                g.set("Other", otherSum);
            }


            g.optionTitle("Professionals");
            g.optionSubTitle("Industry");
            g.optionTitleStyle(titleStyleDark);
            g.optionSubTitleStyle(labelStyleDark);
            g.optionDisplayKey(Graph.KEY_BOXED_BOTTOM);
            g.optionKeyStyle(axisStyleDark);
            g.optionKeyBoxStyle(new Style(Color.white));
            g.optionKeyStyle(labelStyleDark);
            g.optionDisplayPercentage(PieGraph.PERCENTAGE_WITH_KEY);

            baos = new ByteArrayOutputStream();
            PNGOutput out = new PNGOutput(500, 400, Color.white, baos);
            out.setMargin(10, 10, 10, 10);
            out.render(g);
            return baos.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException(e);
        }
    }


    private static byte[] getStudentInterest(RequestInt dataRequest) throws NavigationException {
        log.debug("GraphServlet:getStudentInterest called...");

        ByteArrayOutputStream baos = null;
        PieGraph g = null;
        Map resultMap = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        ResultSetContainer.ResultSetRow rsr = null;
        Iterator it = null;

        try {
            dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            dataRequest.setProperty("ct", "1");   //Student
            dataRequest.setProperty("dq", "5");   //What's your primary interest in tc
            resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("Demographic_Graph");

            g = new PieGraph();
            it = rsc.iterator();
            while (it.hasNext()) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();
                g.set((String) (rsr.getItem("answer")).getResultData(),
                        ((Long) (rsr.getItem("count")).getResultData()).doubleValue());
            }
            g.optionTitle("Students");
            g.optionSubTitle("Primary Interest");
            g.optionTitleStyle(titleStyleDark);
            g.optionSubTitleStyle(labelStyleDark);
            g.optionDisplayKey(Graph.KEY_BOXED_BOTTOM);
            g.optionKeyStyle(axisStyleDark);
            g.optionKeyBoxStyle(new Style(Color.white));
            g.optionKeyStyle(labelStyleDark);
            g.optionDisplayPercentage(PieGraph.PERCENTAGE_WITH_KEY);

            baos = new ByteArrayOutputStream();
            PNGOutput out = new PNGOutput(500, 400, Color.white, baos);
            out.setMargin(10, 10, 10, 10);
            out.render(g);
            return baos.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException(e);
        }
    }


    private static byte[] getProTitle(RequestInt dataRequest) throws NavigationException {
        log.debug("GraphServlet:getProTitle called...");

        ByteArrayOutputStream baos = null;
        PieGraph g = null;
        Map resultMap = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        ResultSetContainer.ResultSetRow rsr = null;
        Iterator it = null;
        String[] answers = null;
        double[] counts = null;
        final double minPercentage = .05;

        try {
            dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            dataRequest.setProperty("ct", "2");   //Professional
            dataRequest.setProperty("dq", "8");   //What's your job title
            resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("Demographic_Graph");

            answers = new String[rsc.size()];
            counts = new double[rsc.size()];
            g = new PieGraph();
            it = rsc.iterator();
            int i = 0;
            while (it.hasNext()) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();
                answers[i] = (String) (rsr.getItem("answer")).getResultData();
                counts[i] = ((Long) (rsr.getItem("count")).getResultData()).doubleValue();
                i++;
            }

            //get the sum of respondants
            double sum = 0;
            for (int k = 0; k < counts.length; k++) {
                sum += counts[k];
            }

            //only include those slices that are at least minPercentage of total
            // otherwise, just consider them "other"
            double otherSum = 0;
            for (int k = 0; k < counts.length; k++) {
                if ((double) counts[k] / (double) sum > minPercentage) {
                    g.set(answers[k], counts[k]);
                } else {
                    otherSum += counts[k];
                }
            }
            if (otherSum > 0) {
                g.set("Other", otherSum);
            }


            g.optionTitle("Professionals");
            g.optionSubTitle("Job Title");
            g.optionTitleStyle(titleStyleDark);
            g.optionSubTitleStyle(labelStyleDark);
            g.optionDisplayKey(Graph.KEY_BOXED_BOTTOM);
            g.optionKeyStyle(axisStyleDark);
            g.optionKeyBoxStyle(new Style(Color.white));
            g.optionKeyStyle(axisStyleDark);
            g.optionDisplayPercentage(PieGraph.PERCENTAGE_WITH_KEY);

            baos = new ByteArrayOutputStream();
            PNGOutput out = new PNGOutput(500, 500, Color.white, baos);
            out.setMargin(10, 10, 10, 10);
            out.render(g);
            return baos.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException(e);
        }
    }


    private static byte[] getProAreaInterest(RequestInt dataRequest) throws NavigationException {
        log.debug("GraphServlet:getProAreaInterest called...");

        ByteArrayOutputStream baos = null;
        PieGraph g = null;
        Map resultMap = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        ResultSetContainer.ResultSetRow rsr = null;
        Iterator it = null;
        String[] answers = null;
        double[] counts = null;
        final double minPercentage = .05;

        try {
            dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            dataRequest.setProperty("ct", "2");   //Professional
            dataRequest.setProperty("dq", "12");  //What's your area of interest
            resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("Demographic_Graph");

            answers = new String[rsc.size()];
            counts = new double[rsc.size()];
            g = new PieGraph();
            it = rsc.iterator();
            int i = 0;
            while (it.hasNext()) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();
                answers[i] = (String) (rsr.getItem("answer")).getResultData();
                counts[i] = ((Long) (rsr.getItem("count")).getResultData()).doubleValue();
                i++;
            }

            //get the sum of respondants
            double sum = 0;
            for (int k = 0; k < counts.length; k++) {
                sum += counts[k];
            }

            //only include those slices that are at least minPercentage of total
            // otherwise, just consider them "other"
            double otherSum = 0;
            for (int k = 0; k < counts.length; k++) {
                if ((double) counts[k] / (double) sum > minPercentage) {
                    g.set(answers[k], counts[k]);
                } else {
                    otherSum += counts[k];
                }
            }
            if (otherSum > 0) {
                g.set("Other", otherSum);
            }


            g.optionTitle("Professionals");
            g.optionSubTitle("Area of Interest");
            g.optionTitleStyle(titleStyleDark);
            g.optionSubTitleStyle(labelStyleDark);
            g.optionDisplayKey(Graph.KEY_BOXED_BOTTOM);
            g.optionKeyStyle(axisStyleDark);
            g.optionKeyBoxStyle(new Style(Color.white));
            g.optionKeyStyle(axisStyleDark);
            g.optionDisplayPercentage(PieGraph.PERCENTAGE_WITH_KEY);

            baos = new ByteArrayOutputStream();
            PNGOutput out = new PNGOutput(500, 500, Color.white, baos);
            out.setMargin(10, 10, 10, 10);
            out.render(g);
            return baos.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException(e);
        }
    }

    private static byte[] getProReferral(RequestInt dataRequest) throws NavigationException {
        log.debug("GraphServlet:getProReferral called...");

        ByteArrayOutputStream baos = null;
        PieGraph g = null;
        Map resultMap = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        ResultSetContainer.ResultSetRow rsr = null;
        Iterator it = null;
        String[] answers = null;
        double[] counts = null;
        final double minPercentage = .05;

        try {
            dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            dataRequest.setProperty("ct", "2");   //Professional
            resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("Referral_Graph");

            answers = new String[rsc.size()];
            counts = new double[rsc.size()];
            g = new PieGraph();
            it = rsc.iterator();
            int i = 0;
            while (it.hasNext()) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();
                answers[i] = (String) (rsr.getItem("referral_type")).getResultData();
                counts[i] = ((Long) (rsr.getItem("count")).getResultData()).doubleValue();
                i++;
            }

            //get the sum of respondants
            double sum = 0;
            for (int k = 0; k < counts.length; k++) {
                sum += counts[k];
            }

            //only include those slices that are at least minPercentage of total
            // otherwise, just consider them "other"
            double otherSum = 0;
            for (int k = 0; k < counts.length; k++) {
                if ((double) counts[k] / (double) sum > minPercentage) {
                    g.set(answers[k], counts[k]);
                } else {
                    otherSum += counts[k];
                }
            }
            if (otherSum > 0) {
                g.set("Other", otherSum);
            }


            g.optionTitle("Professionals");
            g.optionSubTitle("Learned of TopCoder");
            g.optionTitleStyle(titleStyleDark);
            g.optionSubTitleStyle(labelStyleDark);
            g.optionDisplayKey(Graph.KEY_BOXED_BOTTOM);
            g.optionKeyStyle(axisStyleDark);
            g.optionKeyBoxStyle(new Style(Color.white));
            g.optionKeyStyle(axisStyleDark);
            g.optionDisplayPercentage(PieGraph.PERCENTAGE_WITH_KEY);

            baos = new ByteArrayOutputStream();
            PNGOutput out = new PNGOutput(500, 500, Color.white, baos);
            out.setMargin(10, 10, 10, 10);
            out.render(g);
            return baos.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException(e);
        }
    }


    private static byte[] getStudentReferral(RequestInt dataRequest) throws NavigationException {
        log.debug("GraphServlet:getStudentReferral called...");

        ByteArrayOutputStream baos = null;
        PieGraph g = null;
        Map resultMap = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        ResultSetContainer.ResultSetRow rsr = null;
        Iterator it = null;
        String[] answers = null;
        double[] counts = null;
        final double minPercentage = .05;

        try {
            dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            dataRequest.setProperty("ct", "1");   //Student
            resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("Referral_Graph");

            answers = new String[rsc.size()];
            counts = new double[rsc.size()];
            g = new PieGraph();
            it = rsc.iterator();
            int i = 0;
            while (it.hasNext()) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();
                answers[i] = (String) (rsr.getItem("referral_type")).getResultData();
                counts[i] = ((Long) (rsr.getItem("count")).getResultData()).doubleValue();
                i++;
            }

            //get the sum of respondants
            double sum = 0;
            for (int k = 0; k < counts.length; k++) {
                sum += counts[k];
            }

            //only include those slices that are at least minPercentage of total
            // otherwise, just consider them "other"
            double otherSum = 0;
            for (int k = 0; k < counts.length; k++) {
                if ((double) counts[k] / (double) sum > minPercentage) {
                    g.set(answers[k], counts[k]);
                } else {
                    otherSum += counts[k];
                }
            }
            if (otherSum > 0) {
                g.set("Other", otherSum);
            }


            g.optionTitle("Students");
            g.optionSubTitle("Learned of TopCoder");
            g.optionTitleStyle(titleStyleDark);
            g.optionSubTitleStyle(labelStyleDark);
            g.optionDisplayKey(Graph.KEY_BOXED_BOTTOM);
            g.optionKeyStyle(axisStyleDark);
            g.optionKeyBoxStyle(new Style(Color.white));
            g.optionKeyStyle(axisStyleDark);
            g.optionDisplayPercentage(PieGraph.PERCENTAGE_WITH_KEY);

            baos = new ByteArrayOutputStream();
            PNGOutput out = new PNGOutput(500, 500, Color.white, baos);
            out.setMargin(10, 10, 10, 10);
            out.render(g);
            return baos.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException(e);
        }
    }



    /**
     ****************************************************************************************
     * getRatingsHistory()
     * Builds a line graph that plots a coder's rating history.
     ****************************************************************************************
     */
/*
    private static byte[] getRatingsHistory(RequestInt dataRequest)
            throws NavigationException {
        log.debug("taskGraph:getRatingsHistory called...");

        ByteArrayOutputStream baos = null;
        LineGraph g = null;
        DataCurve coderRatingCurve = null;
        Iterator it = null;
        Map resultMap = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        ResultSetContainer.ResultSetRow rsr = null;

        try {

            dai = new CachedDataAccess((javax.sql.DataSource) TCContext.getInitial().lookup(DBMS.DW_DATASOURCE_NAME));
            resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("Rating_History_Graph");

            coderRatingCurve = new DataCurve();

            it = rsc.iterator();
            while (it.hasNext()) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();

                coderRatingCurve.set(DateFormatter.toDouble((java.sql.Timestamp) ((TCTimestampResult) rsr.getItem("date")).getResultData()),
                        ((Integer) ((TCIntResult) rsr.getItem("rating")).getResultData()).doubleValue());
            }

            g = new LineGraph();
            g.optionYStretchToZero(true);
            g.setCurve("Coder Rating History", coderRatingCurve, Color.red);
            g.optionTitle("Rating History");
            g.optionTitleStyle(titleStyle);
            g.optionXAxisLabel("Date");
            g.optionYAxisLabel("Rating");
            g.optionXAxisLabelStyle(labelStyle);
            g.optionYAxisLabelStyle(labelStyle);
            g.optionDisplayKey(Graph.KEY_NONE);
            g.optionXFormatter(new DateFormatter(new SimpleDateFormat("MM-dd-yyyy")));
            g.optionYAxisStyle(axisStyle);
            g.optionXAxisStyle(axisStyle);
            g.optionXAxisTextRotation(45);
            g.optionAxisStyle(new Style(YELLOW));

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

*/



    private static byte[] getRatingsHistory(RequestInt dataRequest)
            throws NavigationException {
        log.debug("taskGraph:getRatingsHistory called...");

        Map resultMap = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        ResultSetContainer.ResultSetRow rsr = null;

        try {

            dai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
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
            throw new NavigationException(e);
        }
        return null;
    }


    private static byte[] getRatingsDistribution(RequestInt dataRequest)
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
            dai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
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
            throw new NavigationException(e);
        }
    }
    
    private static byte[] getRatingsDistributionProfile(RequestInt dataRequest)
            throws NavigationException {

        log.debug("taskGraph:getRatingsDistributionProfile called...");

        BarGraph g = null;
        ByteArrayOutputStream baos = null;
        Iterator it = null;
        Map resultMap = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        ResultSetContainer.ResultSetRow rsr = null;

        try {
            dai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
            resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("Rating_Distribution_Graph");

            g = new BarGraph();
            g.optionTitle("Rating Distribution");
            g.optionTitleStyle(titleStyle);
            g.optionXAxisLabel("Rating - line indicates " + dataRequest.getProperty("hn") + "'s rating");
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
            
            int rating = Integer.parseInt(dataRequest.getProperty("rt"));
            
            int rs = rating / 100;
            if(rating > 2900)
                rs = 29;
            
            baos = new ByteArrayOutputStream();
            PNGOutput out = new PNGOutput(600, 400, Color.black, baos);
            
            out.setMargin(10, 10, 10, 10);
            
            if (rs < 9)
                out.setColor(GRAY);
            else if (rs >= 9 && rs < 12)
                out.setColor(GREEN);
            else if (rs >= 12 && rs < 15)
                out.setColor(BLUE);
            else if (rs >= 15 && rs < 22)
                out.setColor(GOLD);
            else if (rs >= 22 && rs < 30)
                out.setColor(RED);
            
            out.line(78+ (16*rs),79,78+ (16*rs),348);
            out.line(77+ (16*rs),79,77+ (16*rs),348);
            out.render(g);
            return baos.toByteArray();

        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException(e);
        }
    }


    private static byte[] getRatingsDistributionDark(RequestInt dataRequest)
            throws NavigationException {

        log.debug("taskGraph:getRatingsDistributionDark called...");

        BarGraph g = null;
        ByteArrayOutputStream baos = null;
        Iterator it = null;
        Map resultMap = null;
        DataAccessInt dai = null;
        ResultSetContainer rsc = null;
        ResultSetContainer.ResultSetRow rsr = null;

        try {
            dai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
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
            e.printStackTrace();
            throw new NavigationException(e);
        }
    }

    private static byte[] getProblemDistribution(RequestInt dataRequest)
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
            dai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
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
                g.optionTitle("Problem Distribution :: " + problemName);
                int columns = rsc.getColumnCount() - 2;
                double pointsPerBucket = (points * .7) / columns;
                double start = points * .3;
                for (int i = 0; i < columns; i++) {
                    String columnName = df.format(start + pointsPerBucket * i) + " - " + df.format(start + pointsPerBucket * (i + 1));
                    g.set(columnName,
                            ((java.math.BigInteger) (rsr.getItem(i)).getResultData()).doubleValue());
                    g.setColor(columnName, MAROON);
                }
            }
            it = info.iterator();
            while (it.hasNext()) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();
                int opened = Integer.parseInt(rsr.getItem("opened").toString());
                int challenged = Integer.parseInt(rsr.getItem("challenged").toString());
                int passed = Integer.parseInt(rsr.getItem("passed").toString());
                int failed = Integer.parseInt(rsr.getItem("failed").toString());
                g.optionSubTitle((opened + challenged + failed) + " out of " + (opened + challenged + failed + passed) + " coders who opened " + problemName + ", received 0 points.");
            }
            baos = new ByteArrayOutputStream();
            PNGOutput out = new PNGOutput(600, 400, Color.black, baos);
            out.setMargin(10, 10, 10, 10);
            out.render(g);
            return baos.toByteArray();

        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException(e);
        }
    }

}

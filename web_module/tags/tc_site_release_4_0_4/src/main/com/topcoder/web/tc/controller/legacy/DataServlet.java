package com.topcoder.web.tc.controller.legacy;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * A servlet to generate "dumps" of data from the db
 * it receives a query string which is converted to command
 * for the statistics bean to retrieve data from a db.
 * It is then returned to a jsp which displays the data, or
 * is returned directly to the browser as xml.
 *
 * @version $Revision$
 * @author Greg Paul
 */

public class DataServlet extends HttpServlet {

    private static Logger log = Logger.getLogger(DataServlet.class);

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
        StringBuffer buf = null;

        try {
            if (request.getParameter(DataAccessConstants.COMMAND).equals("member_profile")) {

                buf = new StringBuffer(1000);
                buf.append(getXML());
                response.setContentType("text/xml");
                o = response.getOutputStream();
                o.write(asciiGetBytes(buf.toString()));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private String getXML() {
        String ret = "<?xml version=\"1.0\"?>" +
                "" +
                "<memberStats>" +
                "<name memberColor=\"red\">schveiguy</name>" +
                "<primaryStats>" +
                "<rating>2344</rating>" +
                "<volatilityFactor>281</volatilityFactor>" +
                "<memberSince>03.25.02</memberSince>" +
                "<totalEarnings>$1168.00</totalEarnings>" +
                "<competitions>46</competitions>" +
                "<avgPPC>496.01</avgPPC>" +
                "<maxRating>2369</maxRating>" +
                "<minRating>1173</minRating>" +
                "</primaryStats>" +
                "" +
                "<competitionStats>" +
                "<div1SubInfo>" +
                "<problem name=\"Level One\">" +
                "<failedChallenge>4</failedChallenge>" +
                "<failedSysTest>3</failedSysTest>" +
                "<submitted>44</submitted>" +
                "<success>84.09%</success>" +
                "</problem>" +
                "<problem name=\"Level Two\">" +
                "<failedChallenge>2</failedChallenge>" +
                "<failedSysTest>10</failedSysTest>" +
                "<submitted>40</submitted>" +
                "<success>70.00%</success>" +
                "</problem>" +
                "<problem name=\"Level Three\">" +
                "<failedChallenge>3</failedChallenge>" +
                "<failedSysTest>4</failedSysTest>" +
                "<submitted>14</submitted>" +
                "<success>50.00%</success>" +
                "</problem>" +
                "<problem name=\"Total\">" +
                "<failedChallenge>9</failedChallenge>" +
                "<failedSysTest>17</failedSysTest>" +
                "<submitted>98</submitted>" +
                "<success>73.47%</success>" +
                "</problem>" +
                "</div1SubInfo>" +
                "" +
                "<div2SubInfo>" +
                "<problem name=\"Level One\">" +
                "<failedChallenge>0</failedChallenge>" +
                "<failedSysTest>1</failedSysTest>" +
                "<submitted>2</submitted>" +
                "<success>50.00%</success>" +
                "</problem>" +
                "<problem name=\"Level Two\">" +
                "<failedChallenge>0</failedChallenge>" +
                "<failedSysTest>0</failedSysTest>" +
                "<submitted>2</submitted>" +
                "<success>100.00%</success>" +
                "</problem>" +
                "<problem name=\"Level Three\">" +
                "<failedChallenge>0</failedChallenge>" +
                "<failedSysTest>0</failedSysTest>" +
                "<submitted>1</submitted>" +
                "<success>100.00%</success>" +
                "</problem>" +
                "<problem name=\"Total\">" +
                "<failedChallenge>0</failedChallenge>" +
                "<failedSysTest>1</failedSysTest>" +
                "<submitted>5</submitted>" +
                "<success>80.00%</success>" +
                "</problem>" +
                "</div2SubInfo>" +
                "" +
                "<challengeInfo>" +
                "<problem name=\"Level One\">" +
                "<failedChallenge>3</failedChallenge>" +
                "<failedSysTest>10</failedSysTest>" +
                "<success>70.00%</success>" +
                "</problem>" +
                "<problem name=\"Level Two\">" +
                "<failedChallenge>0</failedChallenge>" +
                "<failedSysTest>0</failedSysTest>" +
                "<success>40.00%</success>" +
                "</problem>" +
                "<problem name=\"Level Three\">" +
                "<failedChallenge>0</failedChallenge>" +
                "<failedSysTest>0</failedSysTest>" +
                "<success>100.00%</success>" +
                "</problem>" +
                "<problem name=\"Total\">" +
                "<failedChallenge>0</failedChallenge>" +
                "<failedSysTest>1</failedSysTest>" +
                "<success>57.14%</success>" +
                "</problem>" +
                "</challengeInfo>" +
                "</competitionStats>" +
                "</memberStats>";
        return ret;
    }


/*
    private boolean isAuthenticated(HttpServletRequest request, HttpServletResponse response) {
        Navigation nav = null;
        String command = null;

        DataAccessInt dai = null;
        Request dataRequest = null;
        Map resultMap = null;

        try {

            command = request.getParameter("c") == null ? "" : request.getParameter("c");
            nav = (Navigation) request.getSession().getAttribute("navigation");
            if (nav == null || !nav.isIdentified())
                response.sendRedirect("http://" + request.getServerName() +
                        "/tc?module=Login&message=" +
                        "You must log in to view this portion of the site.&nextpage=" +
                        request.getRequestURI());


            else {
                log.info("[*** data *** " + command + " *** " + nav.getUser().getHandle() + " ***]");

                dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
                dataRequest = new Request();
                dataRequest.setContentHandle("authenticate_data_user");
                dataRequest.setProperty("cr", "" + nav.getUserId());
                dataRequest.setProperty("sector", command);
                resultMap = dai.getData(dataRequest);

                if (((ResultSetContainer) resultMap.get("Authenticate_Data_User")).size() == 1) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
*/


    //Some utility type methods

/*    private String replace(String s) {

        if (s == null) {
            return "";
        } else {
            StringBuffer buffer = new StringBuffer(s);
            for (int i = 0; i < buffer.length(); i++) {
                if (buffer.charAt(i) == '&') {
                    buffer.replace(i, i + 1, "%26");
                    i += 3;
                }
            }
            return buffer.toString();
        }
    }*/

    private byte[] asciiGetBytes(String s) {
        int size = s.length();
        byte[] result = new byte[size];
        for (int i = 0; i < size; i++) {
            result[i] = (byte) s.charAt(i);
        }
        return result;
    }

}


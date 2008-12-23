package com.topcoder.utilities;

import com.meterware.httpunit.*;
import com.topcoder.shared.language.CPPLanguage;
import com.topcoder.shared.language.CSharpLanguage;
import com.topcoder.shared.language.JavaLanguage;
import com.topcoder.shared.language.VBLanguage;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author rfairfax
 */
public class WebScreeningBot {

    public int COMPANY_ID = 1;
    public String HANDLE = "rfairfax@topcoder.com";
    public String PASSWORD = "EoB7_TCi";

    private static Logger log = Logger.getLogger(WebScreeningBot.class);

    private final int[] languages = new int[]{JavaLanguage.ID, CPPLanguage.ID, CSharpLanguage.ID};

    private String getSubmissionText(int lang) {
        switch (lang) {
            case JavaLanguage.ID:
                return "public class Average {\npublic int belowAvg(int[] a, int[] b){\nreturn 0;\n}\n}";
            case CPPLanguage.ID:
                return "#include<vector>\nusing namespace std;\nclass Average {\npublic:\nint belowAvg(vector<int> a, vector<int> b) { return 0; }\n};";
            case VBLanguage.ID:
                return "Public Class Average\nPublic Function belowAvg(a as Integer(), b as Integer()) as Integer\nReturn 0\nEnd Function\nEnd Class";
            case CSharpLanguage.ID:
                return "public class Average {\npublic int belowAvg(int[] a, int[] b){\nreturn 0;\n}\n}";
            default:
                return "";
        }
    }

    boolean errors = false;

    public void printErrors() {
        if (errorText.equals("")) {
            errors = false;
            return;
        }

        log.error("ERROR : " + errorText);
        //send email, only once
        if (!errors) {
            errors = true;
            try {
                TCSEmailMessage em = new TCSEmailMessage();
                em.addToAddress("8609182841@mmode.com", TCSEmailMessage.TO);
                em.addToAddress("8604626228@vtext.com", TCSEmailMessage.TO);
                em.addToAddress("6508045266@vtext.com", TCSEmailMessage.TO);
                em.addToAddress("8604656205@mobile.mycingular.com", TCSEmailMessage.TO);
                em.addToAddress("8606144043@vtext.com", TCSEmailMessage.TO);

                em.setSubject("Server Error");
                em.setBody("Tech Assess Error:\n" + shortError);
                em.setFromAddress("rfairfax@topcoder.com");

                EmailEngine.send(em);

                em = new TCSEmailMessage();
                em.addToAddress("gpaul@topcoder.com", TCSEmailMessage.TO);
                em.addToAddress("rfairfax@topcoder.com", TCSEmailMessage.TO);
                em.addToAddress("mlydon@topcoder.com", TCSEmailMessage.TO);
                em.addToAddress("thaas@topcoder.com", TCSEmailMessage.TO);
                em.addToAddress("ivern@topcoder.com", TCSEmailMessage.TO);
                em.addToAddress("mtong@topcoder.com", TCSEmailMessage.TO);
                em.addToAddress("javier-topcoder-alarm@ivern.org", TCSEmailMessage.TO);
                em.addToAddress("8602686127@messaging.sprintpcs.com", TCSEmailMessage.TO);

                em.setSubject("Server Error");
                em.setBody("Tech Assess Error:\n" + errorText);
                em.setFromAddress("rfairfax@topcoder.com");

                EmailEngine.send(em);
            } catch (Exception e) {
                System.out.println("HERE" + e.getClass());
                e.printStackTrace();
            }
        }

        errorText = "";
        shortError = "";

    }

    String errorText = "";
    String shortError = "";

    private void error(String shortText, String longText) {
        shortError += shortText + "\n";
        errorText += longText + "\n";
    }

    public void runTests() {
        WebConversation wc = new WebConversation();
        //get the login page
        WebRequest wr = new GetMethodWebRequest("http://www.topcoder.com/techassess/techassess?module=Login&cm=" + COMPANY_ID + "&sid=27634");
        WebResponse resp = null;
        try {
            resp = wc.getResponse(wr);
            if (!validResponse(resp)) {
                return;
            }

            log.debug("resp: " + resp.toString());
            log.debug("len: " + resp.getContentLength());
            InputStream is = resp.getInputStream();
            char ch = 0;
            while ((ch = (char) is.read()) >= 0) {
                System.out.print(ch);
            }
            String[] elements = resp.getElementNames();
            for (int i = 0; i < elements.length; i++) {
                log.debug(i + " " + elements[i]);
            }
            //check to make sure we're on the right page.
            //In this case, we can check if the login form exists
            if (resp.getFormWithName("loginForm") == null) {
                error("No login form found", "No login form found");
                return;
            }

            //get the login form
            WebForm form = resp.getFormWithName("loginForm");
            form.setParameter("ha", HANDLE);
            form.setParameter("ps", PASSWORD);
            resp = form.submit();

            if (!validResponse(resp)) {
                return;
            }
            //check to make sure we're on the right page
            //In this case, we check for the frameset.
            if (resp.getFrameNames().length != 2) {
                error("No frames found", "No frames found");
                return;
            }

            //get mainFrame
            resp = wc.getFrameContents("mainFrame");
            if (!validResponse(resp)) {
                return;
            }

            //get the example link
            WebLink[] links = resp.getLinks();
            WebLink exampleLink = null;
            for (int i = 0; i < links.length; i++) {
                if (links[i].getURLString().equals("/techassess/techassess?module=ViewProblemSet&ptid=3")) {
                    exampleLink = links[i];
                    break;
                }
            }

            if (exampleLink == null) {
                error("No link found", "No link found");
                return;
            }

            exampleLink.click();
            resp = wc.getFrameContents("mainFrame");
            if (!validResponse(resp)) {
                return;
            }

            links = resp.getLinks();
            exampleLink = null;
            for (int i = 0; i < links.length; i++) {
                if (links[i].getURLString().indexOf("/techassess/techassess?module=ViewProblem&ptid=3") != -1) {
                    exampleLink = links[i];
                    break;
                }
            }

            if (exampleLink == null) {
                error("No link found", "No link found");
                return;
            }

            exampleLink.click();
            resp = wc.getFrameContents("mainFrame");
            if (!validResponse(resp)) {
                return;
            }

            //loop over languages
            for (int l = 0; l < languages.length; l++) {

                log.info("TESTING " + languages[l]);

                if (resp.getFormWithName("problemForm") == null) {
                    error("No form found", "No form found");
                    return;
                }

                //get the form (problemForm)
                form = resp.getFormWithName("problemForm");
                //set our code
                form.setParameter("code", getSubmissionText(languages[l]));
                form.setParameter("lid", String.valueOf(languages[l])); //java

                //try to save
                links = resp.getLinks();
                exampleLink = null;
                for (int i = 0; i < links.length; i++) {
                    if (links[i].getURLString().indexOf("JavaScript:doSubmit('Save')") != -1) {
                        exampleLink = links[i];
                        break;
                    }
                }

                if (exampleLink == null) {
                    error("No link found", "No link found");
                    return;
                }

                exampleLink.click();
                resp = wc.getFrameContents("mainFrame");
                if (!validResponse(resp)) {
                    return;
                }

                if (resp.getText().indexOf("Code saved successfully") == -1) {
                    error("Save Failed", "Save Failed");
                    return;
                }

                //try to compile
                links = resp.getLinks();
                exampleLink = null;
                for (int i = 0; i < links.length; i++) {
                    if (links[i].getURLString().indexOf("JavaScript:doSubmit('Compile')") != -1) {
                        exampleLink = links[i];
                        break;
                    }
                }

                if (exampleLink == null) {
                    error("No link found", "No link found");
                    return;
                }

                exampleLink.click();
                resp = wc.getFrameContents("mainFrame");
                if (!validResponse(resp)) {
                    return;
                }

                if (resp.getText().indexOf("Your code compiled successfully") == -1) {
                    error("Compile failed", "Compile failed");
                    return;
                }

                //get the form (problemForm)
                form = resp.getFormWithName("problemForm");
                //set our code
                WebRequest testRequest = form.newUnvalidatedRequest();
                testRequest.setParameter("module", "Test");
                testRequest.setParameter("arg0", "200,400");
                testRequest.setParameter("argDim0", "1");
                testRequest.setParameter("arg1", "200,400");
                testRequest.setParameter("argDim1", "1");

                WebResponse testResp = wc.getResponse(testRequest);

                if (!validResponse(testResp)) {
                    return;
                }

                if (testResp.getText().indexOf("Return Value:<br />0") == -1) {
                    error("Test failed", "Test failed");
                    return;
                }
            }

            //try a submit
            links = resp.getLinks();
            exampleLink = null;
            for (int i = 0; i < links.length; i++) {
                if (links[i].getURLString().indexOf("JavaScript:doSubmit('Submit')") != -1) {
                    exampleLink = links[i];
                    break;
                }
            }

            if (exampleLink == null) {
                error("No link found", "No link found");
                return;
            }

            exampleLink.click();
            resp = wc.getFrameContents("mainFrame");
            if (!validResponse(resp)) {
                return;
            }

            /*for(int i = 0; i < links.length; i++) {
                if(links[i].getURLString().indexOf("Logout") != -1) {
                    exampleLink = links[i];
                    break;
                }
            }

            if(exampleLink == null) {
                error("No link found", "No link found");
                return;
            }
            exampleLink.click();
            */
        } catch (Exception e) {
            e.printStackTrace();
            error("Exception", e.getMessage());
        }
    }

    public static void main(String[] args) {
        WebScreeningBot client = new WebScreeningBot();

        boolean b = true;
        while (b) {
            client.runTests();
            client.printErrors();
            client.cleanup();
            try {
                Thread.sleep(5 * 60 * 1000);
            } catch (Exception e) {
            }
        }
    }

    //verifies that the return code of the result page is correct
    private boolean validResponse(WebResponse resp) {
        if (resp.getResponseCode() != 200) {
            error("Bad Page Response", "Bad Response Code from " + resp.getURL().toString() + " (Resp: " + resp.getResponseCode() + ")");
            return false;
        }

        log.info("Good Response from " + resp.getURL().toString());
        return true;
    }


    private static final int COMPONENT_STATE_ID = 1710451;
    private static final int SUBMISSION_NUMBER_THRESHOLD = 900;

    // delete submission records to avoid field overflows (submission_number, compile_count, etc)
    private void cleanup() {
        log.info("Performing cleanup...");
        Connection connection;
        try {
            connection = createConnection();
        } catch (SQLException e) {
            e.printStackTrace();
            return;
        }

        int submissionNumber = getSubmissionNumber(connection);
        log.info("submission_number = " + submissionNumber + ", threshold = " + SUBMISSION_NUMBER_THRESHOLD);
        if (submissionNumber >= SUBMISSION_NUMBER_THRESHOLD) {
            executeCleanupUpdate(connection, "delete from submission where component_state_id = ?;");
            executeCleanupUpdate(connection, "delete from submission_class_file where component_state_id = ?;");
            executeCleanupUpdate(connection, "update component_state set submission_number = 1, compile_count = 1, test_count = 1 where component_state_id = ?;");
        }

        DBMS.close(connection);
        log.info("Cleanup complete");
    }

    private Connection createConnection() throws SQLException {
        Connection connection = DBMS.getDirectConnection();
        return connection;
    }

    private int getSubmissionNumber(Connection connection) {
        String query = "select submission_number from component_state where component_state_id = ?;";
        PreparedStatement statement = null;
        ResultSet rs = null;
        int result = 0;
        try {
            statement = prepareStatement(connection, query);
            rs = statement.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBMS.close(rs);
            DBMS.close(statement);
        }
        return result;
    }

    private int executeCleanupUpdate(Connection connection, String query) {
        log.info("Executing cleanup update: " + query);
        PreparedStatement statement = null;
        int result = 0;
        try {
            statement = prepareStatement(connection, query);
            result = statement.executeUpdate();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBMS.close(statement);
        }
        log.info(result + " records modified");
        return result;
    }

    private PreparedStatement prepareStatement(Connection connection, String query) throws SQLException {
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, COMPONENT_STATE_ID);
        return statement;
    }

}

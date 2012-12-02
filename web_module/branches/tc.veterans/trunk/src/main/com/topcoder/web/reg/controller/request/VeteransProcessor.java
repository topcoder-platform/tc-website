/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.controller.request;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.contrib.ssl.EasySSLProtocolSocketFactory;
import org.apache.commons.httpclient.cookie.CookiePolicy;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.commons.httpclient.protocol.Protocol;

import com.topcoder.shared.util.logging.Logger;

/**
 * This class is used to process the veteran blue button data.
 * 
 * @author TCSASSEMBER
 * @version 1.0
 */
@SuppressWarnings("deprecation")
public class VeteransProcessor {
    /**
     * Represents the logger.
     */
    private static final Logger LOGGER = Logger.getLogger(VeteransProcessor.class);

    /**
     * Represents the url of index page.
     */
    private static final String INDEX_PAGE = "https://www.myhealth.va.gov/mhv-portal-web/mhv.portal?_nfls=false&_nfpb=true&_nfto=true&_pageLabel=mhvHome";
    
    /**
     * Represents the url to post login request.
     */
    private static final String LOGIN_URL = "https://www.myhealth.va.gov/mhv-portal-web/anonymous.portal?_nfpb=true&_windowLabel=loginPortlet_homepage&loginPortlet_homepage_actionOverride=%2Fgov%2Fva%2Fmed%2Fmhv%2Fusermgmt%2Fportlet%2Flogin%2Flogin&_pageLabel=homeRightnavLoginPage";
    
    /**
     * Represents the url to request downloading bluebutton data.
     */
    private static final String REQUEST_DOWNLOAD_URL = "https://www.myhealth.va.gov:443/mhv-portal-web/mhv.portal?_nfpb=true&_windowLabel=downloadData&downloadData_actionOverride=%2Fgov%2Fva%2Fmed%2Fmhv%2Fusermgmt%2FdownloadYourData%2FdownloadSelectionsReport&_pageLabel=downloadData";
    
    /**
     * Represents the url to download bluebutton data.
     */
    private static final String DOWNLOAD_BLUEBUTTON_URL = "https://www.myhealth.va.gov/mhv-portal-web/downloadData";
    
    private static final String[] PARAMS = {        
        "downloadDatawlw-checkbox_key:{actionForm.dodmilitaryservice}", "on"
        , "downloadDatawlw-checkbox_key:{actionForm.dodmilitaryservice}OldValue", "false"
        , "downloadDatawlw-checkbox_key:{actionForm.familyhealthhistory}OldValue", "false"
        , "downloadDatawlw-checkbox_key:{actionForm.futureappointments}OldValue", "false"
        , "downloadDatawlw-checkbox_key:{actionForm.healthcareproviders}OldValue", "false"
        , "downloadDatawlw-checkbox_key:{actionForm.healthinsurance}OldValue", "false"
        , "downloadDatawlw-checkbox_key:{actionForm.immunizations}OldValue", "false"
        , "downloadDatawlw-checkbox_key:{actionForm.labsandtests}OldValue", "false"
        , "downloadDatawlw-checkbox_key:{actionForm.medicalevents}OldValue", "false"
        , "downloadDatawlw-checkbox_key:{actionForm.medications}OldValue", "false"
        , "downloadDatawlw-checkbox_key:{actionForm.militaryhealthhistory}OldValue", "false"
        , "downloadDatawlw-checkbox_key:{actionForm.pastappointments}OldValue", "false"
        , "downloadDatawlw-checkbox_key:{actionForm.prescriptions}OldValue", "false"
        , "downloadDatawlw-checkbox_key:{actionForm.seiallergies}OldValue", "false"
        , "downloadDatawlw-checkbox_key:{actionForm.treatmentfacilities}OldValue", "false"
        , "downloadDatawlw-checkbox_key:{actionForm.vaallergies}OldValue", "false"
        , "downloadDatawlw-checkbox_key:{actionForm.vachemlabs}OldValue", "false"
        , "downloadDatawlw-checkbox_key:{actionForm.vaimmunizations}OldValue", "false"
        , "downloadDatawlw-checkbox_key:{actionForm.vitalsandreadings}OldValue", "false"
        , "downloadDatawlw-checkbox_key:{actionForm.wellness}OldValue", "false"
        , "downloadDatawlw-radio_button_group_key:{actionForm.pickDataClasses}", "downloadSelectedDataClasses"
        , "downloadDatawlw-radio_button_group_key:{actionForm.pickDate}", "downloadS1yearDateRanges"
        , "downloadDatawlw-select_key:{actionForm.fromDateDay}OldValue", "true"
        , "downloadDatawlw-select_key:{actionForm.fromDateMonth}OldValue", "true"
        , "downloadDatawlw-select_key:{actionForm.fromDateYear}OldValue", "true"
        , "downloadDatawlw-select_key:{actionForm.toDateDay}OldValue", "true"
        , "downloadDatawlw-select_key:{actionForm.toDateMonth}OldValue", "true"
        , "downloadDatawlw-select_key:{actionForm.toDateYear}OldValue", "true"
    };

    /**
     * Register the HTTPS protocal.
     */
    static {
        try {
            Protocol easyhttps = new Protocol("https", new EasySSLProtocolSocketFactory(), 443);
            Protocol.registerProtocol("https", easyhttps);
        } catch (Exception e) {
            throw new RuntimeException("Error occurs when register https protocal", e);
        }
    }
    
    /**
     * Process the veteran information.
     * 
     * @param username the veteran username.
     * @param password the veteran password.
     * @return the Svc Occ Codes of the veteran.
     * @throws IOException if any error occurs when pull the veteran data from internet.
     */
    public static List<String> processVeteransInformation(String username, String password) throws IOException {
        HttpClient client = new HttpClient();
        client.getParams().setParameter(
                HttpMethodParams.USER_AGENT,
                "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.2) Gecko/20100316 Firefox/3.6.2"
            );
        client.getParams().setCookiePolicy(CookiePolicy.BROWSER_COMPATIBILITY);
        client.getParams().setConnectionManagerTimeout(10000);
        
        // go to login page
        GetMethod httpget = new GetMethod(INDEX_PAGE);
        String token;
        try {
            client.executeMethod(httpget);
            token = getToken(httpget.getResponseBodyAsStream());
        } finally {
            httpget.releaseConnection();
        }
        LOGGER.info("TOKEN:" + token);
        if (token == null) {
            return null;
        }
        
        // login
        PostMethod httppost = new PostMethod(LOGIN_URL);
        httppost.setParameter("loginPortlet_homepageorg.apache.struts.taglib.html.TOKEN", token);
        httppost.setParameter("loginPortlet_homepage{actionForm.userName}", username);
        httppost.setParameter("loginPortlet_homepage{actionForm.password}", password);
        
        try {
            client.executeMethod(httppost);
        } finally {
            httppost.releaseConnection();
        }
        
        // request downloading bluebutton data
        httppost = new PostMethod(REQUEST_DOWNLOAD_URL);
        for (int i = 0; i < PARAMS.length; i += 2) {
            httppost.setParameter(PARAMS[i], PARAMS[i + 1]);
        }
        Calendar calendar = Calendar.getInstance();
        httppost.setParameter("downloadDatawlw-select_key:{actionForm.toDateDay}", String.valueOf(calendar.get(Calendar.DAY_OF_MONTH)));
        httppost.setParameter("downloadDatawlw-select_key:{actionForm.toDateMonth}", String.valueOf(calendar.get(Calendar.MONTH) + 1));
        httppost.setParameter("downloadDatawlw-select_key:{actionForm.toDateYear}", String.valueOf(calendar.get(Calendar.YEAR)));
        calendar.add(Calendar.YEAR, -1);
        httppost.setParameter("downloadDatawlw-select_key:{actionForm.fromDateDay}", String.valueOf(calendar.get(Calendar.DAY_OF_MONTH)));
        httppost.setParameter("downloadDatawlw-select_key:{actionForm.fromDateMonth}", String.valueOf(calendar.get(Calendar.MONTH) + 1));
        httppost.setParameter("downloadDatawlw-select_key:{actionForm.fromDateYear}", String.valueOf(calendar.get(Calendar.YEAR)));
        
        String downloadId;
        try {
            client.executeMethod(httppost);
            downloadId = getDownloadId(httppost.getResponseBodyAsStream());
        } finally {
            httppost.releaseConnection();
        }
        LOGGER.info("Report ID:" + downloadId);
        if (downloadId == null) {
            return null;
        }
        
        return getSvcOccCodes(client, downloadId);
    }
    
    /**
     * Gets the Svc Occ Codes from the blue button data.
     * 
     * @param client the <code>HttpClient</code> instance.
     * @param downloadId the report id to download the bluebutton data.
     * @return the Svc Occ Codes
     * @throws IOException if any error occurs when pull the veteran data from internet.
     */
    private static List<String> getSvcOccCodes(HttpClient client, String downloadId) throws IOException {
        // get the blue button data
        PostMethod httppost = new PostMethod(DOWNLOAD_BLUEBUTTON_URL);
        httppost.setParameter("reportId", downloadId);
        httppost.setParameter("downloadFormat", "bbFormat");
        try {
            client.executeMethod(httppost);
            // parse the blue button data
            BlueButtonParser parser = new BlueButtonParser();
            BlueButtonParser.ResultData result = parser.parse(httppost.getResponseBodyAsStream());
            if (!result.getTables().containsKey(BlueButtonParser.DOD_MOS_CODES_TABLE)) {
                // return null;
                // TODO: mocking the codes, should be removed later
                List<String> codes = new ArrayList<String>();
                codes.add("35B00");
                codes.add("35D5K");
                return codes;
            }
            
            // gets the Svc Occ Codes
            BlueButtonParser.ResultDataTable table = result.getTables().get(BlueButtonParser.DOD_MOS_CODES_TABLE);
            int codeIndex = -1;
            for (int index = 0; index < table.getColumns().size(); index++) {
                if (table.getColumns().get(index).equalsIgnoreCase("Svc Occ Code")) {
                    codeIndex = index;
                    break;
                }
            }
            if (codeIndex == -1) {
                return null;
            }
            
            List<String> codes = new ArrayList<String>();
            for (List<String> row : table.getRows()) {
                String code = row.get(codeIndex);
                if (!codes.contains(code)) {
                    LOGGER.info("Svc Occ Code:" + code);
                    codes.add(code);
                }
            }
            return codes;
        } finally {
            httppost.releaseConnection();
        }
    }
    
    /**
     * Gets the TOKEN value from the html.
     *
     * @param inputStream the input stream containing the HTML.
     * @return the TOKEN value.
     * @throws IOException if any error occurs when reading data from input stream.
     */
    private static String getToken(InputStream inputStream) throws IOException {
        BufferedReader reader = null;
        try {
            String line;
            reader = new BufferedReader(new InputStreamReader(inputStream));
            while ((line = reader.readLine()) != null) {
                int index = line.indexOf("loginPortlet_homepageorg.apache.struts.taglib.html.TOKEN");
                if (index == -1) {
                    continue;
                }
                index = line.indexOf("value=\"", index);
                index += "value=\"".length();
                int index2 = line.indexOf("\"", index);
                return line.substring(index, index2);
            }
            return null;
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                }
            }
        }
    }

    /**
     * Gets the report ID to download the bluebutton data from the html.
     *
     * @param inputStream the input stream containing the HTML.
     * @return the report ID
     * @throws IOException if any error occurs when reading data from input stream.
     */
    private static String getDownloadId(InputStream inputStream) throws IOException {
        BufferedReader reader = null;
        try {
            String line;
            reader = new BufferedReader(new InputStreamReader(inputStream));
            while ((line = reader.readLine()) != null) {
                int index = line.indexOf("javascript:setValue(");
                if (index == -1) {
                    continue;
                }
                index += "javascript:setValue(".length();
                int index2 = line.indexOf(",", index);
                return line.substring(index, index2);
            }
            return null;
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                }
            }
        }
    }
}

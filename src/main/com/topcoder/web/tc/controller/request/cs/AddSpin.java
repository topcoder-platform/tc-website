/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.cs;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserApiSpinDAO;
import com.topcoder.web.common.model.UserApiSpin;
import org.apache.commons.httpclient.HttpStatus;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * <p>
 * Add spin API.
 * </p>
 *
 * <p>
 * Thread safety: The controller instances will be created for the new requests, thus there won't be multiple
 * threads using the same controller instance.Thus there's no thread-safety concern.
 * </p>
 *
 * <p>
 *   Version 1.0 (Release Assembly - Porting CS Mashathon pages to TopCoder website) Change notes:
 *   <ol>
 *      <li>The first version of this processor.</li>
 *   </ol>
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0
 */
public class AddSpin extends ShortHibernateProcessor{
    /**
     * The class name.
     */
    private final static String CLASS_NAME = AddSpin.class.getName();

    /**
     * The API limit.
     */
    private final static int API_LIMIT = 3;

    /**
     * The API candidates.
     */
    private final static String[] APIS = new String[] {
        "AWS",
        "Google",
        "Yelp",
        "Facebook",
        "Smartsheet",
        "Docusign",
        "Twitter",
        "CS / TC",
        "Pick One",
        "FinancialForce"
    };

    /**
     * The process method. Add spin API here.
     *
     * @throws Exception if error occurs when write to response.
     */
    protected void dbProcessing() throws Exception {
        log.debug("Enter method " + CLASS_NAME + "#dbProcessing().");

        if (!userIdentified()) {
            writeResponse(false, "user is not identified.");
            return;
        }

        UserApiSpinDAO dao = DAOUtil.getFactory().getUserApiSpinDAO();
        List<UserApiSpin> spins = dao.findByUserId(getUser().getId());

        if (spins.size() >= API_LIMIT) {
            writeResponse(false, String.format("user has already picked %d APIs.", API_LIMIT));
            return;
        }

        Set<String> currentSpins = new HashSet<String>();
        for (UserApiSpin spin : spins) {
            currentSpins.add(spin.getApiName());
        }
        List<String> candidatesToSample = new ArrayList<String>();
        for (String api : APIS) {
            if (!currentSpins.contains(api)) {
                candidatesToSample.add(api);
            }
        }

        UserApiSpin api = new UserApiSpin();
        api.setId(new UserApiSpin.Identifier(getUser().getId(), spins.size() + 1));
        api.setApiName(candidatesToSample.get((int) (Math.random() * 1000) % candidatesToSample.size()));
        dao.saveOrUpdate(api);

        writeResponse(true, api.getApiName());
    }

    /**
     * <p>
     * Populate the response.
     * </p>
     *
     * @param success
     *            whether success.
     * @param message
     *            the response message if an error occurs.
     * @throws Exception
     *             If unable to write into response.
     */
    private void writeResponse(boolean success, String message) throws Exception {
        TCResponse response = getResponse();
        response.setContentType("application/json");
        response.setStatus(HttpStatus.SC_OK);
        PrintWriter responseWriter = response.getWriter();
        String jsonString;
        if (success) {
            jsonString = String.format("{\"api\" : \"%s\"}", message);
        } else {
            jsonString = String.format("{\"error\" : \"%s\"}", message);
        }
        responseWriter.write(jsonString);
        // to commit the HttpServletResponse
        response.flushBuffer();

        // log leaving here as we will leave process once write response
        log.debug("Leave method " + CLASS_NAME + "#dbProcessing().");
    }
}

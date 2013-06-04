/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.memberphoto.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.topcoder.json.object.JSONObject;
import com.topcoder.web.common.BaseServlet;

/**
 * The proxy class is used to dispatch photo request to corresponding servlet.
 * 
 * <p>
 * <strong>Thread safety:</strong> This class is thread-safe when serving user
 * requests.
 * </p>
 * 
 * @author TCSASSEMBLER
 * @version 1.0
 */
public class PhotoProxyServlet extends HttpServlet {
    /**
     * Generated serial version UID.
     */
    private static final long serialVersionUID = -1506535024902188892L;

    /**
     * The module field name.
     */
    private static final String MODULE_FIELD_NAME = "module_key";

    /**
     * The upload servlet's name.
     */
    private static final String UPLOAD_SERVLET_NAME = "photoUploadServlet";

    /**
     * The removal servlet's name.
     */
    private static final String REMOVAL_SERVLET_NAME = "photoRemovalServlet";

    /**
     * The error page field name.
     */
    private static final String ERROR_PAGE_NAME = "errorPage";

    /**
     * The message name.
     */
    private static final String MESSAGE_NAME = "message";

    /**
     * The module name.
     */
    private String moduleName;

    /**
     * The erro page name.
     */
    private String errorPage;

    /**
     * The upload servlet.
     */
    private MemberPhotoUploadServlet uploadServlet;

    /**
     * The removal servlet.
     */
    private MemberPhotoRemovalServlet removalServlet;

    /**
     * The initiate method, used to initiate some fields.
     * 
     * @param config
     *            the servlet config.
     * @throws ServletException
     *             if any exception occurs.
     */
    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        moduleName = config.getInitParameter(MODULE_FIELD_NAME);
        errorPage = config.getInitParameter(ERROR_PAGE_NAME);

        WebApplicationContext wac = WebApplicationContextUtils
                .getRequiredWebApplicationContext(getServletContext());
        uploadServlet = (MemberPhotoUploadServlet) wac
                .getBean(UPLOAD_SERVLET_NAME);
        removalServlet = (MemberPhotoRemovalServlet) wac
                .getBean(REMOVAL_SERVLET_NAME);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * 
     * @param request
     *            servlet request
     * @param response
     *            servlet response
     * @throws ServletException
     *             if a servlet-specific error occurs
     * @throws IOException
     *             if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String module = request.getParameter(moduleName);

        if ("upload".equals(module)) {
            try {
                uploadServlet.doPost(request, response);
            } catch (Exception e) {
                request.setAttribute(BaseServlet.MESSAGE_KEY, e.getMessage());
                request.getRequestDispatcher(errorPage).forward(request,
                        response);
            }

        } else if ("remove".equals(module)) {
            try {
                removalServlet.doPost(request, response);
            } catch (Exception e) {
                JSONObject json = new JSONObject();
                json.setString(MESSAGE_NAME, e.getMessage());

                Helper.writeJSONResult(response, json, false);
            }

        } else {
            throw new ServletException("Can't find specified module.");
        }
    }
}

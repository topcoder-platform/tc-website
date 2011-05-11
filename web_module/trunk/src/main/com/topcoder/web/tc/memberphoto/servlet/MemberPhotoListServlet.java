/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.memberphoto.servlet;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.Date;

import javax.annotation.PostConstruct;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.util.log.Level;
import com.topcoder.util.log.Log;
import com.topcoder.util.log.LogManager;
import com.topcoder.web.memberphoto.entities.MemberImage;
import com.topcoder.web.memberphoto.manager.MemberPhotoManagementException;
import com.topcoder.web.memberphoto.manager.MemberPhotoManager;
import com.topcoder.web.memberphoto.manager.PagedResult;

/**
 * <p>
 * This class extends the HttpServlet, and it allows web site administrators to list/view particular member
 * photos. <br>
 * The listing is paged based on the input parameters or specific defaults are assumed (see method doc) The
 * MemberPhotoManager is used to get the photos information from persistence, and get the image file in order
 * to allow the user to view the file(s) It will validated the submitted form data, if validation fails, it
 * will forward to a configured validation error url, and if everything goes well, it will forward to a
 * configured success url.
 * </p>
 * <p>
 * All its instance variables will be injected by the Spring. It should be marked with @Transactional
 * annotation to ensure the operation is transactional.
 * </p>
 * <p>
 * <i>Sample code: </i><br>
 * <p>
 * 1.Sample Spring framework configuration file:
 * </p>
 *
 * <pre>
 * &lt;?xml version="1.0" encoding="UTF-8" ?&gt;
 * &lt;beans xmlns="http://www.springframework.org/schema/beans" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 * xsi:schemaLocation="http://www.springframework.org/schema/beans
 * http://www.springframework.org/schema/beans/spring-beans-2.0.xsd"&gt;
 *     &lt;bean id="listServlet" class="com.topcoder.web.memberphoto.servlet.MemberPhotoListServlet"&gt;
 *         &lt;property name="memberIdParameterName"&gt;
 *             &lt;value&gt;
 *                 member_id
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="isAdministratorSessionKey"&gt;
 *             &lt;value&gt;
 *                 is_admin_session_key
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="notAdministratorErrorName"&gt;
 *             &lt;value&gt;
 *                 not_admin_error_name
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="validationErrorForwardUrl"&gt;
 *             &lt;value&gt;
 *                 validation_error_forward_url
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="successResultForwardUrl"&gt;
 *             &lt;value&gt;
 *                 success_result_forward_url
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="pageNumberParameterName"&gt;
 *             &lt;value&gt;
 *                 page_number_parameter_name
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="pageSizeParameterName"&gt;
 *             &lt;value&gt;
 *                 page_size_parameter_name
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="photoListName"&gt;
 *             &lt;value&gt;
 *                 photo_list_name
 *             &lt;/value&gt;
 *         &lt;/property&gt;
 *         &lt;property name="memberPhotoManager" ref="memberPhotoManager" /&gt;
 *     &lt;/bean&gt;
 *     &lt;bean id="memberPhotoManager" class="com.topcoder.web.memberphoto.servlet.MockMemberPhotoManagerImpl"&gt;
 *     &lt;/bean&gt;
 * &lt;/beans&gt;
 * </pre>
 * <p>
 * 2.API usage.
 * </p>
 *
 * <pre>
 * Resource rs = new ClassPathResource(conf_file);
 * BeanFactory factory = new XmlBeanFactory(rs);
 * MemberPhotoListServlet bean = (MemberPhotoListServlet) factory.getBean(&quot;listServlet&quot;);
 * return bean;
 * </pre>
 *
 * </p>
 * <p>
 * <b>Thread-safety:</b> The injected instance variables are immutable after injection. So this class is
 * thread-safe when serving user requests.
 * </p>
 * @author AleaActaEst, microsky
 * @version 1.0
 */
@SuppressWarnings("serial")
public class MemberPhotoListServlet extends HttpServlet {
    /**
     * <p>
     * This is the default page number when the page number is not provided.
     * </p>
     */
    private static final long DEFAULT_PAGE_NUMBER = 1;

    /**
     * <p>
     * THis is the default page size when it has not been provided.
     * </p>
     */
    private static final long DEFAULT_PAGE_SIZE = 10;

    /**
     * <p>
     * Represents the request parameter name for member id.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String memberIdParameterName;

    /**
     * <p>
     * Represents the request parameter name for the page number.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String pageNumberParameterName;

    /**
     * <p>
     * Represents the request parameter name for the page size.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String pageSizeParameterName;

    /**
     * <p>
     * Represents the session key for the isAdministrator flag, which indicating the user is an administrator
     * or not.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String isAdministratorSessionKey;

    /**
     * <p>
     * Represents the request attribute name of the error message if the user is not an administrator.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String notAdministratorErrorName;

    /**
     * <p>
     * Represent the url to forward to if the validation error occurs.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String validationErrorForwardUrl;

    /**
     * <p>
     * Represent the url to forward to if the operation succeeds
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null, non-empty string.
     * </p>
     */
    private String successResultForwardUrl;

    /**
     * <p>
     * Represents the MemberPhotoManager to get the the member photos.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null.
     * </p>
     */
    private MemberPhotoManager memberPhotoManager;

    /**
     * <p>
     * Represents the name of the photo list attribute under which type list of photos will be stored.
     * </p>
     * <p>
     * It's injected by the Spring.
     * </p>
     * <p>
     * After injection, it must be non-null , non-empty string .
     * </p>
     */
    private String photoListName;

    /**
     * <p>
     * This is a logger which will be used to perform logging operations.
     * </p>
     * <p>
     * It's created upon initialization with the class name of this class as the logger name.
     * </p>
     * <p>
     * After injection, it must be non-null.
     * </p>
     */
    private Log log;

    /**
     * <p>
     * Empty constructor.
     * </p>
     */
    public MemberPhotoListServlet() {
    }

    /**
     * <p>
     * The method to init logger.
     * </p>
     */
    @PostConstruct
    public void init() {
        this.log = LogManager.getLog();
    }

    /**
     * <p>
     * it allows web site administrators to list (paginated) photos for a particular member.
     * </p>
     * @param response the response.
     * @param request the request.
     * @throws IllegalArgumentException if any arg is null.
     * @throws IllegalStateException if the instance variables are not injected
     *             correctly (refer to each variable's constraint in its
     *             documentation).
     * @throws IOException if any i/o error occurs.
     * @throws MemberPhotoListingException if any unexpected error occurs. (it's
     *             used to wrap all underlying exceptions).
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException,
        MemberPhotoListingException {
        logMsg(MessageFormat.format("{0} : Entering " + "MemberPhotoListServlet#doPost"
            + "(HttpServletRequest, HttpServletResponse)" + " - request {1}, response {2},", new Date(),
            request, response));
        try {
            // 'request' should not be null
            Helper.checkNull(request, "request");

            // 'response' should not be null
            Helper.checkNull(response, "response");
            try {
                checkState();
                // get memberId from request
                long memberId = Long.parseLong(request.getParameter(memberIdParameterName));

                // get page number
                long pageNo = parseLong(request.getParameter(pageNumberParameterName), DEFAULT_PAGE_NUMBER);

                // get page size
                long pageSize = parseLong(request.getParameter(pageSizeParameterName), DEFAULT_PAGE_SIZE);

                // get isAdministrator flag.
                Boolean isAdministrator = (Boolean) request.getSession().getAttribute(
                    isAdministratorSessionKey);

                // validate submitted form
                Boolean validationError = false;
                if (isAdministrator == null || !isAdministrator) {
                    validationError = true;
                    request.setAttribute(notAdministratorErrorName, "The user is not an administrator.");
                }

                // Report validation errors
                if (validationError) {
                    request.getRequestDispatcher(validationErrorForwardUrl).forward(request, response);
                    return;
                }

                // get all the member photos
                PagedResult<MemberImage> result = memberPhotoManager.getMemberPhotos((int) pageNo,
                    (int) pageSize);
                // fill in the request and response
                request.setAttribute(photoListName, result.getRecords());

                // forward to the result url
                request.getRequestDispatcher(successResultForwardUrl).forward(request, response);
            } catch (ClassCastException e) {
                throw new MemberPhotoListingException("The 'isAdministrator' is not valid boolean value.", e);
            } catch (NumberFormatException e) {
                throw new MemberPhotoListingException("The input is not a number or is null value.", e);
            } catch (ServletException e) {
                throw new MemberPhotoListingException("Servlet exception occurs.", e);
            } catch (MemberPhotoManagementException e) {
                throw new MemberPhotoListingException(
                    "MemberPhotoManagementException occurs when get photo list.", e);
            }
        } catch (IllegalArgumentException e) {
            throw logMsg("any arg is null", e);
        } catch (IllegalStateException e) {
            throw logMsg("the instance variables are not injected correctly", e);
        } catch (IOException e) {
            throw logMsg("i/o error occurs", e);
        } catch (MemberPhotoListingException e) {
            throw logMsg("unexpected error occurs. details:" + e.getMessage(), e);
        } finally {
            logMsg(MessageFormat.format("{0} : Exiting " + "MemberPhotoListServlet#doPost"
                + "(HttpServletRequest, HttpServletResponse)", new Date()));
        }

    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param memberIdParameterName the member id parameter name.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setMemberIdParameterName(String memberIdParameterName) {
        Helper.checkString(memberIdParameterName, "memberIdParameterName");
        this.memberIdParameterName = memberIdParameterName;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param pageNumberParameterName the page number parameter name used to
     *            fetch paging information from request
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setPageNumberParameterName(String pageNumberParameterName) {
        Helper.checkString(pageNumberParameterName, "pageNumberParameterName");
        this.pageNumberParameterName = pageNumberParameterName;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param pageSizeParameterName the page size parameter name used to fetch
     *            paging information from request
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setPageSizeParameterName(String pageSizeParameterName) {
        Helper.checkString(pageSizeParameterName, "pageSizeParameterName");
        this.pageSizeParameterName = pageSizeParameterName;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param isAdministratorSessionKey is administrator session key.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setIsAdministratorSessionKey(String isAdministratorSessionKey) {
        Helper.checkString(isAdministratorSessionKey, "isAdministratorSessionKey");
        this.isAdministratorSessionKey = isAdministratorSessionKey;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param notAdministratorErrorName not administrator error name.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setNotAdministratorErrorName(String notAdministratorErrorName) {
        Helper.checkString(notAdministratorErrorName, "notAdministratorErrorName");
        this.notAdministratorErrorName = notAdministratorErrorName;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param validationErrorForwardUrl validation error forward url.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setValidationErrorForwardUrl(String validationErrorForwardUrl) {
        Helper.checkString(validationErrorForwardUrl, "validationErrorForwardUrl");
        this.validationErrorForwardUrl = validationErrorForwardUrl;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param successResultForwardUrl success result forward url.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setSuccessResultForwardUrl(String successResultForwardUrl) {
        Helper.checkString(successResultForwardUrl, "successResultForwardUrl");
        this.successResultForwardUrl = successResultForwardUrl;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param memberPhotoManager member photo manager.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setMemberPhotoManager(MemberPhotoManager memberPhotoManager) {
        Helper.checkNull(memberPhotoManager, "memberPhotoManager");
        this.memberPhotoManager = memberPhotoManager;
    }

    /**
     * <p>
     * Setter for the namesake instance variable.
     * </p>
     * @param photoListName the photo list name.
     * @throws IllegalArgumentException if the argument is null or empty string.
     */
    public void setPhotoListName(String photoListName) {
        Helper.checkString(photoListName, "photoListName");
        this.photoListName = photoListName;
    }

    /**
     * <p>
     * Check the state.
     * </p>
     * @throws IllegalStateException if the instance variables are not injected
     *             correctly (refer to each variable's constraint in its
     *             documentation).
     */
    private void checkState() {
        // check 'memberIdParameterName' field state
        Helper.checkState(memberIdParameterName, "memberIdParameterName");

        // check 'isAdministratorSessionKey' field state
        Helper.checkState(isAdministratorSessionKey, "isAdministratorSessionKey");

        // check 'notAdministratorErrorName' field state
        Helper.checkState(notAdministratorErrorName, "notAdministratorErrorName");

        // check 'memberPhotoManager' field state
        checkObjectState(memberPhotoManager, "memberPhotoManager");

        // check 'validationErrorForwardUrl' field state
        Helper.checkState(validationErrorForwardUrl, "validationErrorForwardUrl");

        // check 'successResultForwardUrl' field state
        Helper.checkState(successResultForwardUrl, "successResultForwardUrl");

        // check 'pageNumberParameterName' field state
        Helper.checkState(pageNumberParameterName, "pageNumberParameterName");

        // check 'pageSizeParameterName' field state
        Helper.checkState(pageSizeParameterName, "pageSizeParameterName");

        // check 'photoListName' field state
        Helper.checkState(photoListName, "photoListName");

    }

    /**
     * <p>
     * Checks whether an object is null, if it is, <code>IllegalStateException</code> is thrown.
     * </p>
     * @param param the integer to check
     * @param paramName the parameter name
     * @throws IllegalStateException if the object is null
     */
    private void checkObjectState(Object param, final String paramName) {
        if (param == null) {
            throw new IllegalStateException("The parameter '" + paramName + "' should not be null.");
        }
    }

    /**
     * Logs the INFO message.
     * @param message
     *            the message to log.
     */
    private void logMsg(String message) {
        if (log != null) {
            log.log(Level.INFO, message);
        }
    }

    /**
     * Logs the ERROR message.
     * @param <T>
     *            the error type.
     * @param message
     *            the message to log.
     * @param e
     *            the error
     * @return the passed in exception.
     */
    private <T extends Throwable> T logMsg(String message, T e) {
        if (log != null) {
            log.log(Level.ERROR, e, message);
        }
        return e;
    }

    /**
     * <p>
     * Parse the String to long.
     * </p>
     * @param stringLong the string to parse.
     * @param defaultLong the default long.
     * @return the long parsed.
     */
    private long parseLong(String stringLong, long defaultLong) {
        long num;
        try {
            num = Long.parseLong(stringLong);
        } catch (NumberFormatException e) {
            // if there was an error or the value is not set. Set it to
            // default.
            num = defaultLong;
        }
        return num;
    }
}

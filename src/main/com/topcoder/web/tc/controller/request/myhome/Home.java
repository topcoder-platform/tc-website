/*
 * Copyright (C) 2007 - 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.myhome;

import com.topcoder.web.tc.controller.PayoneerService;
import com.topcoder.web.tc.controller.PayoneerServiceException;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.HSRegistrationHelper;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;

import java.util.*;

/**
 * <p>
 * This class is used to process visit home request.
 * </p>
 * 
 * <p>
 * <strong>Thread safety:</strong> This class is thread-safe.
 * </p>
 *
 * <p>
 * Version 1.1 (Assembly - Upload Avatar to TC) Change notes:
 *   <ol>
 *     <li>Update dbProcessing method to retrieve image info.</li>
 *     <li>Update dbProcessing method to retrieve image path info.</li>
 *   </ol>
 * </p>
 * 
 * @author Pablo Wolfus (pulky), pvmagacho, VolodymyrK
 * @version 1.1
 */
public class Home extends ShortHibernateProcessor {

    List<Long> payoneerTestGroup = Arrays.asList(8518361l);

    /**
     * Handle http request.
     * 
     * @throws Exception if any exception occurs.
     */
    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        User u = DAOUtil.getFactory().getUserDAO().find(getUser().getId());        
        getRequest().setAttribute("isInHS",
                DAOUtil.getFactory().getSecurityGroupDAO().hasGroup(u.getId(), HSRegistrationHelper.HS_GROUP_ID));
        getRequest().setAttribute("regUser", u);

        // Added - image from informixoltp - since 1.1
        Request r = new Request();
        r.setContentHandle("member_image");
        r.setProperty("cr", String.valueOf(getUser().getId()));
        ResultSetContainer imageResult = new DataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("coder_image_data");

        Integer image = null;
        if ((imageResult.size() > 0) && (imageResult.getItem(0, "image_id").getResultData() != null) && (imageResult.getIntItem(0, "image_id") != 0)) {
            image = imageResult.getIntItem(0, "image_id");
            String image_path = imageResult.getStringItem(0, "image_path");
            String fileName = imageResult.getStringItem(0, "file_name");
            getRequest().setAttribute("pathImage", image_path + fileName);
            
        }
        getRequest().setAttribute("userImage", image);

        try {
            PayoneerService.PayeeStatus payeeStatus = PayoneerService.getPayeeStatus(getLoggedInUser().getId());
            if (payeeStatus == PayoneerService.PayeeStatus.NOT_REGISTERED) {
                getRequest().setAttribute("payoneerRegistered", false);

                if (payoneerTestGroup.contains(getLoggedInUser().getId())) {
                    getRequest().setAttribute("payoneerRegLink", PayoneerService.getRegistrationLink(getLoggedInUser().getId()));
                }
            } else {
                getRequest().setAttribute("payoneerRegistered", true);
            }
        } catch (PayoneerServiceException pse) {
            // If an exception happened assume user is not registered but don't show the registration link
            getRequest().setAttribute("payoneerRegistered", false);
            log.error("Payoneer service error.", pse);
        }

        setNextPage("/my_home/index.jsp");
        setIsNextPageInContext(true);
    }
}

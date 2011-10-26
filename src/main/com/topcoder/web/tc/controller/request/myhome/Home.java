/*
 * Copyright (C) 2007 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.myhome;

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
 * @author Pablo Wolfus (pulky), pvmagacho
 * @version 1.1
 */
public class Home extends ShortHibernateProcessor {
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

        setNextPage("/my_home/index.jsp");
        setIsNextPageInContext(true);
    }
}

/*
* Copyright (C) - 2014 TopCoder Inc., All Rights Reserved.
*/
package com.topcoder.web.tc.controller.legacy.pacts.controller.request.member;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * <p>
 * Changes in version 1.1 (Module Assembly - DocuSign Integration v1.0):
 * <ol>
 *      <li>Update {@link #businessProcessing()} method to add has_notarized_affidavit
 *          the check if the user has any notarized affidavit.</li>
 * </ol>
 * </p>
 * @author  cucu, gonia_119
 * @version 1.1
 */
public class AffidavitHistory extends BaseProcessor implements PactsConstants {

	public static final String FULL_LIST = "full_list";
	public static final String AFFIDAVITS = "affidavits";
	public static final String CODER = "cr";

	/**
	 * the business process.
	 * @throws TCWebException
	 *     if any error occur.
	 */
    protected void businessProcessing() throws TCWebException {
        try {
        	boolean fullList = "true".equals(getRequest().getParameter(FULL_LIST));
            String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
            String endRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.END_RANK));
            String sortColStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
            
        	boolean sortAscending= !"desc".equals(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        	int sortCol = 3;
        	
        	if (sortColStr.trim().length() > 0) {
        		sortCol = Integer.parseInt(sortColStr);
        	}
        	
            // Normalizes optional parameters and sets defaults
            if ("".equals(startRank) || Integer.parseInt(startRank) <= 0) {
                startRank = "1";
            }
            setDefault(DataAccessConstants.START_RANK, startRank);

            if ("".equals(endRank)) {
                endRank = String.valueOf(Integer.parseInt(startRank) + PactsConstants.AFFIDAVIT_HISTORY_PAGE_SIZE - 1); 
            } else if (Integer.parseInt(endRank) - Integer.parseInt(startRank) > Constants.MAX_HISTORY) {
                endRank = String.valueOf(Integer.parseInt(startRank) + Constants.MAX_HISTORY);
            }
            setDefault(DataAccessConstants.END_RANK, endRank);

            
            DataInterfaceBean dib = new DataInterfaceBean();
            ResultSetContainer rsc = new ResultSetContainer(dib.getAffidavitHistory(getUser().getId(), !fullList, sortCol, sortAscending), Integer.parseInt(startRank), Integer.parseInt(endRank));
            
            setDefault(DataAccessConstants.SORT_COLUMN, sortCol + "");
            setDefault(DataAccessConstants.SORT_DIRECTION, sortAscending + "");
            
            getRequest().setAttribute(AFFIDAVITS, rsc);
            getRequest().setAttribute(CODER, getUser().getId() + "");
        	getRequest().setAttribute(FULL_LIST, Boolean.valueOf(fullList));
        	
        	//check if the user has any notarized affidavit,
        	//and set the result to the request attribute "has_notarized_affidavit"
        	boolean hasNotarizedAffidavit = dib.hasNotarizedAffidavit(getUser().getId(), 0);
            getRequest().setAttribute("has_notarized_affidavit", hasNotarizedAffidavit);
            
            setNextPage(PactsConstants.AFFIDAVIT_HISTORY_JSP);
            setIsNextPageInContext(true);
        	
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}


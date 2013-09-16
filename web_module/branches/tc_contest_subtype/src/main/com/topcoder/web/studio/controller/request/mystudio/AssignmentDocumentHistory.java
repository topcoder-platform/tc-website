package com.topcoder.web.studio.controller.request.mystudio;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocument;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentType;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.controller.request.PactsServicesLocator;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.ArrayList;

/**
 * This processor handles the request for the assignment document history for a particular
 * user providing the links for affirmation.
 *
 * @author  pulky
 */
public class AssignmentDocumentHistory extends BaseProcessor {

    public static final String FULL_LIST = "full_list";
    public static final String ASSIGNMENT_DOCUMENTS = "assignment_documents";
    public static final String CODER = "cr";
    public static final int SUBMISSION_TITLE_COL = 1;
    public static final int TIME_LEFT_COL = 2;
    public static final int STATUS_COL = 3;
        
    protected void businessProcessing() throws TCWebException {
        try {
            boolean fullList = "true".equals(getRequest().getParameter(FULL_LIST));
            String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
            String endRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.END_RANK));
            String sortColStr = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
            
            boolean sortAscending= "asc".equals(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            int sortCol = 2;
            
            if (sortColStr.trim().length() > 0) {
                sortCol = Integer.parseInt(sortColStr);
            }
            
            // Normalizes optional parameters and sets defaults
            if ("".equals(startRank) || Integer.parseInt(startRank) <= 0) {
                startRank = "1";
            }
            setDefault(DataAccessConstants.START_RANK, startRank);

            if ("".equals(endRank)) {
                endRank = String.valueOf(Integer.parseInt(startRank) + 30 - 1);
            } else if (Integer.parseInt(endRank) - Integer.parseInt(startRank) > 200) {
                endRank = String.valueOf(Integer.parseInt(startRank) + 200);
            }
            setDefault(DataAccessConstants.END_RANK, endRank);

            boolean hasGlobalAd = false;
            long globalAdId = 0;
            if ("on".equalsIgnoreCase(Constants.GLOBAL_AD_FLAG)) {
                hasGlobalAd = PactsServicesLocator.getService().hasGlobalAD(getUser().getId());
                if (hasGlobalAd) {
                    globalAdId = PactsServicesLocator.getService().getGlobalADId(getUser().getId());
                }
            }

            // if the user has global AD, we don't need to show anything in the "current" tab
            List result = new ArrayList(); 
            if (!(hasGlobalAd && !fullList)) {
                // gets, sorts and crops data.
                result = PactsServicesLocator.getService().getAssignmentDocumentByUserId(getUser().getId(), 
                        AssignmentDocumentType.STUDIO_CONTEST_TYPE_ID.longValue(), !fullList);
            }
            
            sortResult(result, sortCol, sortAscending);
            result = cropResult(result, Integer.parseInt(startRank), Integer.parseInt(endRank));

            // sets params and defaults
            setDefault(DataAccessConstants.SORT_COLUMN, sortCol + "");
            setDefault(DataAccessConstants.SORT_DIRECTION, sortAscending + "");
            
            if ("on".equalsIgnoreCase(Constants.GLOBAL_AD_FLAG)) {
                getRequest().setAttribute("has_global_ad", hasGlobalAd);
                getRequest().setAttribute("global_ad_id", globalAdId);
            }

            getRequest().setAttribute(ASSIGNMENT_DOCUMENTS, result);
            getRequest().setAttribute(CODER, getUser().getId() + "");
            getRequest().setAttribute(FULL_LIST, Boolean.valueOf(fullList));
            setNextPage("/mystudio/assignmentDocumentHistory.jsp");
            setIsNextPageInContext(true);
            
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private List cropResult(List result, int startRank, int endRank) {
        Boolean croppedDataAfter = Boolean.TRUE;
        if (endRank >= result.size()) {
            endRank = result.size();
            croppedDataAfter = Boolean.FALSE;
        }
        getRequest().setAttribute("croppedDataAfter", croppedDataAfter);        
        getRequest().setAttribute("croppedDataBefore", new Boolean(startRank > 1));
        
        if (result.size() > 0) {
            return result.subList(startRank - 1, endRank);
        } else {
            return result;
        }
    }

    private void sortResult(List result, int sortCol, boolean sortAscending) {
        switch (sortCol) {
            case SUBMISSION_TITLE_COL:
                Collections.sort(result, new Comparator() {
                    public int compare(Object arg0, Object arg1) {
                        return ((AssignmentDocument) arg0).getSubmissionTitle().toLowerCase().compareTo(((AssignmentDocument) arg1).getSubmissionTitle().toLowerCase());
                    }
                });
                break;
            case TIME_LEFT_COL:
                Collections.sort(result, new Comparator() {
                    public int compare(Object arg0, Object arg1) {
                        return ((AssignmentDocument) arg0).getDaysLeftToExpire().compareTo(((AssignmentDocument) arg1).getDaysLeftToExpire());
                    }
                });
                break;
            case STATUS_COL:
                Collections.sort(result, new Comparator() {
                    public int compare(Object arg0, Object arg1) {
                        return ((AssignmentDocument) arg0).getStatus().getDescription().toLowerCase().compareTo(((AssignmentDocument) arg1).getStatus().getDescription().toLowerCase());
                    }
                });
                break;
        }
        if (!sortAscending) {
            Collections.reverse(result);
        }
    }
}


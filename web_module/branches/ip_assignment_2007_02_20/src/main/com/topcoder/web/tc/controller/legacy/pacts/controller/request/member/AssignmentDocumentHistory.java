package com.topcoder.web.tc.controller.legacy.pacts.controller.request.member;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.AssignmentDocument;
import com.topcoder.web.common.model.AssignmentDocumentType;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 *
 * @author  pulky
 */
public class AssignmentDocumentHistory extends BaseProcessor implements PactsConstants {

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
            
        	boolean sortAscending= !"desc".equals(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
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
                endRank = String.valueOf(Integer.parseInt(startRank) + PactsConstants.ASSIGNMENT_DOCUMENT_HISTORY_PAGE_SIZE - 1);
                log.debug("endRank1: " + endRank);
            } else if (Integer.parseInt(endRank) - Integer.parseInt(startRank) > Constants.MAX_HISTORY) {
                endRank = String.valueOf(Integer.parseInt(startRank) + Constants.MAX_HISTORY);
                log.debug("endRank2: " + endRank);
            }
            setDefault(DataAccessConstants.END_RANK, endRank);

            
            DataInterfaceBean dib = new DataInterfaceBean();
            List result = dib.getAssignmentDocumentByUserId(getUser().getId(), 
                    AssignmentDocumentType.COMPONENT_COMPETITION_TYPE_ID.longValue(), !fullList);
            
            sortResult(result, sortCol, sortAscending);

            log.debug("new result size after crop: " + result.size());
            log.debug("Integer.parseInt(endRank): " + Integer.parseInt(endRank));

            cropResult(result, Integer.parseInt(startRank), Integer.parseInt(endRank));
                
            setDefault(DataAccessConstants.SORT_COLUMN, sortCol + "");
            setDefault(DataAccessConstants.SORT_DIRECTION, sortAscending + "");
            
            getRequest().setAttribute(ASSIGNMENT_DOCUMENTS, result);
            getRequest().setAttribute(CODER, getUser().getId() + "");
        	getRequest().setAttribute(FULL_LIST, Boolean.valueOf(fullList));
            setNextPage(PactsConstants.ASSIGNMENT_DOCUMENT_HISTORY_JSP);
            setIsNextPageInContext(true);
        	
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private void cropResult(List result, int startRank, int endRank) {
        log.debug("Crop result called: " + result.size() + " / " + startRank + " / " + endRank);
        Boolean croppedDataAfter = Boolean.TRUE;
        if (endRank >= result.size()) {
            endRank = result.size();
            croppedDataAfter = Boolean.FALSE;
        }
        getRequest().setAttribute("croppedDataAfter", croppedDataAfter);        
        getRequest().setAttribute("croppedDataBefore", new Boolean(startRank > 1));
        
        log.debug("(2): " + endRank + " / " + new Boolean(startRank > 1) + " / " + croppedDataAfter);

        if (result.size() > 0) {
            result = result.subList(startRank - 1, endRank);

            log.debug("Sublist: " + result.size() + " / " + (startRank - 1) + " / " + endRank);
        }
    }

    private void sortResult(List result, int sortCol, boolean sortAscending) {
        switch (sortCol) {
            case SUBMISSION_TITLE_COL:
                log.debug("Sort results by Submission title");
                Collections.sort(result, new Comparator() {
                    public int compare(Object arg0, Object arg1) {
                        log.debug("1: " + ((AssignmentDocument) arg0).getSubmissionTitle().toLowerCase() + " / " + ((AssignmentDocument) arg1).getSubmissionTitle().toLowerCase() + " : " + ((AssignmentDocument) arg0).getSubmissionTitle().toLowerCase().compareTo(((AssignmentDocument) arg1).getSubmissionTitle().toLowerCase()));
                        return ((AssignmentDocument) arg0).getSubmissionTitle().toLowerCase().compareTo(((AssignmentDocument) arg1).getSubmissionTitle().toLowerCase());
                    }
                });
                break;
            case TIME_LEFT_COL:
                log.debug("Sort results by Time left");
                Collections.sort(result, new Comparator() {
                    public int compare(Object arg0, Object arg1) {
                        log.debug("2: " + ((AssignmentDocument) arg0).getDaysLeftToExpire() + " / " + ((AssignmentDocument) arg1).getDaysLeftToExpire() + " : " + ((AssignmentDocument) arg1).getDaysLeftToExpire().compareTo(((AssignmentDocument) arg0).getDaysLeftToExpire()));
                        return ((AssignmentDocument) arg1).getDaysLeftToExpire().compareTo(((AssignmentDocument) arg0).getDaysLeftToExpire());
                    }
                });
                break;
            case STATUS_COL:
                log.debug("Sort results by Status");
                Collections.sort(result, new Comparator() {
                    public int compare(Object arg0, Object arg1) {
                        log.debug("3: " + ((AssignmentDocument) arg0).getStatus().getDescription().toLowerCase() + " / " + ((AssignmentDocument) arg1).getStatus().getDescription().toLowerCase() + " : " + ((AssignmentDocument) arg0).getStatus().getDescription().toLowerCase().compareTo(((AssignmentDocument) arg1).getStatus().getDescription().toLowerCase()));
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


package com.topcoder.web.screening.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.common.PermissionDeniedException;
import com.topcoder.web.screening.model.CandidateInfo;

import java.util.Map;

/**
 * Processing for the Note List page.
 * @author Porgery
 */
public class NoteList extends BaseProcessor {
    
    /** Implements the processing step.
     * @throws Exception
     */
    public void process() throws Exception {
        DataAccessInt dAccess = getDataAccess();
        
        Request dr = new Request();
        dr.setProperties(getParameterMap());
        dr.setContentHandle("noteList");
        dr.setProperty("uid", String.valueOf(getAuthentication().getActiveUser().getId()));
        
        Map map = dAccess.getData(dr);

        if(map != null)
        {
            CandidateInfo cinfo = new CandidateInfo();
            ResultSetContainer result =
                (ResultSetContainer)map.get("candidateInfo");
            if(result.getRowCount() == 0){
                throw new PermissionDeniedException(getAuthentication().getActiveUser(),
                    "User not authorized to view information about candidate: " +
                        dr.getProperty("cid")==null?"?":dr.getProperty("cid"));
            }
            cinfo.setUserName(result.getRow(0).getItem("email").toString());
            cinfo.setUserId(Long.valueOf(getRequest().getParameter(Constants.CANDIDATE_ID)));
            
            result = (ResultSetContainer)map.get("noteList");
            cinfo.setNoteList(result);
            
            getRequest().setAttribute("candidateInfo",cinfo);
        }

        setNextPage(Constants.NOTE_LIST_PAGE);
        setNextPageInContext(true);
    }
    
}

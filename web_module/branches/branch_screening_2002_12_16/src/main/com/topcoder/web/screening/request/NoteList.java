package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.*;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.screening.model.CandidateInfo;

import javax.naming.InitialContext;
import javax.sql.DataSource;
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
//        authorize(getSelfRedirect());
        
        InitialContext context = new InitialContext();
        DataAccessInt dAccess = new DataAccess(
            (DataSource)context.lookup(Constants.DATA_SOURCE));
        
        Request dr = new Request();
        dr.setProperties(getRequest().getParameterMap());
        dr.setContentHandle("noteList");
        dr.setProperty("uid", String.valueOf(getAuthentication().getUser().getId()));
        
        Map map = dAccess.getData(dr);

        if(map != null && map.size() == 1)
        {
            CandidateInfo cinfo = new CandidateInfo();
            ResultSetContainer result =
                (ResultSetContainer)map.get("candidateInfo");
            if(result.getRowCount() == 0){
                throw new PermissionDeniedException(
                    "You are not authorized to view information about that candidate.");
            }
            cinfo.setEmailAddress(result.getItem(0, "email").toString());
            
            result = (ResultSetContainer)map.get("noteList");
            cinfo.setNoteList(result);
            
            getRequest().setAttribute("candidateInfo",cinfo);
        }

        setNextPage(Constants.NOTE_LIST_PAGE);
        setNextPageInContext(true);
    }
    
}

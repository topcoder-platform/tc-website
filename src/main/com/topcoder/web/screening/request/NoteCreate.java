package com.topcoder.web.screening.request;

import com.topcoder.web.ejb.note.Note;
import com.topcoder.web.ejb.note.NoteHome;
import com.topcoder.web.ejb.user.UserNote;
import com.topcoder.web.ejb.user.UserNoteHome;
import com.topcoder.web.screening.common.*;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.Transaction;
import com.topcoder.web.screening.model.CandidateInfo;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.transaction.UserTransaction;
import java.util.Map;

/**
 * Processing for NoteCreate page.
 * @author Porgery
 */
public class NoteCreate extends BaseProcessor {
    
    /** Implements the processing step.
     * @throws Exception
     */
    public void process() throws Exception {
        requireLogin();
        
        String candId = getRequest().getParameter(Constants.CANDIDATE_ID);

        if( candId == null || candId.equals("") ){
            throw new Exception("Missing required parameter");
        }
        
        InitialContext context = new InitialContext();
        DataAccessInt dAccess = new DataAccess(
            (DataSource)context.lookup(Constants.DATA_SOURCE));
        
        Request dr = new Request();
        dr.setContentHandle("candidateInfo");
        dr.setProperty("uid", String.valueOf(getAuthentication().getUser().getId()));
        dr.setProperty("cid", candId);
        
        Map map = dAccess.getData(dr);
        if(map == null){
            throw new Exception("No data obtained!");
        }
        
        CandidateInfo cinfo = new CandidateInfo();
        ResultSetContainer result =
            (ResultSetContainer)map.get("candidateInfo");
        if(result.getRowCount() == 0){
            throw new PermissionDeniedException(
                "You are not authorized to view information about that candidate.");
        }
      
        cinfo.setUserId(Long.valueOf(candId));
        cinfo.setEmailAddress(result.getRow(0).getItem("email").toString());
        getRequest().setAttribute("candidateInfo",cinfo);

        String noteText = getRequest().getParameter(Constants.NOTE_TEXT);
        
        if( noteText == null || noteText.trim().equals("") ){
            String firstVisit = getRequest().getParameter(Constants.FIRST_ATTEMPT);
            if( firstVisit!=null && firstVisit.equals("false") ){
                getRequest().setAttribute(Constants.MESSAGE_PARAMETER,
                    "Please enter the text of the note.");
            }
            setNextPage(Constants.NOTE_CREATE_PAGE);
            setNextPageInContext(true);
            return;
        }

        UserTransaction ut = Transaction.get(context);
        ut.begin();

        try {
            NoteHome nHome = (NoteHome)context.lookup(NoteHome.class.getName());
            Note note = nHome.create();
            
            long noteId = note.createNote(noteText, getAuthentication().getUser().getId(), 1);
            
            UserNoteHome uHome = (UserNoteHome)context.lookup("screening:"+UserNoteHome.class.getName());
            UserNote unote = uHome.create();
            
            unote.createUserNote(Long.parseLong(candId), noteId);
        } catch(Exception e) {
            ut.rollback();
            throw e;
        }
        ut.commit();
            
        setNextPage(Constants.CONTROLLER_URL + '?' +
                    Constants.REQUEST_PROCESSOR + '=' + "NoteList" + '&' +
                    Constants.CANDIDATE_ID + '=' + candId);
        setNextPageInContext(false);
    }
    
}

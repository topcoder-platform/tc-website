/*
 * Submit.java
 *
 * Created on October 8, 2004, 12:14 PM
 */

package com.topcoder.web.tc.controller.request.contracting;

import com.topcoder.web.tc.model.ContractingInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

import java.util.*;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.*;

import javax.transaction.UserTransaction;
import com.topcoder.shared.util.*;

import com.topcoder.web.ejb.user.UserPreference;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.ejb.coderskill.CoderSkill;
import com.topcoder.web.ejb.note.Note;
import com.topcoder.web.ejb.user.UserNote;

import javax.naming.Context;
import javax.naming.InitialContext;
/**
 *
 * @author  rfairfax
 */
public class Submit  extends ContractingBase {


    protected void contractingProcessing() throws TCWebException {
        try {
            UserTransaction ut = Transaction.get(getInitialContext());
            ut.begin();

            try {
                //prefs
                InitialContext ctx = TCContext.getInitial();
                UserPreference prefbean = (UserPreference)createEJB(ctx, UserPreference.class);
                
                if(info.isEdit()) {
                    //load pref group list, iterate through each one, deleting, updating
                    Request r = new Request();
                    r.setContentHandle("preference_groups");

                    ResultSetContainer rsc = (ResultSetContainer)getDataAccess().getData(r).get("preference_groups");
                    for(int i = 0; i < rsc.size(); i++) {
                        ResultSetContainer rscPrefs = prefbean.getPreferencesByGroup(info.getUserID(), rsc.getIntItem(i, "preference_group_id"),DBMS.COMMON_OLTP_DATASOURCE_NAME);
                        for(int j = 0; j < rscPrefs.size(); j++) {
                            //check if info object has this preference
                            if(info.getPreference(rscPrefs.getStringItem(j, "preference_id")) == null) {
                                //delete
                                prefbean.removeUserPreference(info.getUserID(), rscPrefs.getIntItem(j, "preference_id"), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                            } else {
                                //update
                                prefbean.setPreferenceValueID(info.getUserID(), rscPrefs.getIntItem(j, "preference_id"),
                                    Integer.parseInt(info.getPreference(rscPrefs.getStringItem(j, "preference_id"))), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                                info.removePref(rscPrefs.getStringItem(j, "preference_id"));
                            }
                        }
                    }
                }
                //insert
                Iterator it = info.getPreferenceNames();
                while(it.hasNext()) {
                    String s = (String)it.next();
                    prefbean.createUserPreference(info.getUserID(), Integer.parseInt(s), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    prefbean.setPreferenceValueID(info.getUserID(), Integer.parseInt(s), Integer.parseInt(info.getPreference(s)), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                }
                
                //resume
                if(info.getResume() != null)
                {
                    byte[] fileBytes = null;
                    String fileName = "";
                    int fileType = -1;

                    fileBytes = new byte[(int) info.getResume().getSize()];
                    info.getResume().getInputStream().read(fileBytes);
                    if (fileBytes == null || fileBytes.length == 0) {
                        //ignore this
                    }
                    else {
                        //fileType = Integer.parseInt(file.getParameter("fileType"));
                        Map types = getFileTypes();
                        if(types.containsKey(info.getResume().getContentType()) )
                        {
                            log.debug("FOUND TYPE");
                            fileType = ((Long) types.get(info.getResume().getContentType())).intValue();
                        }
                        else
                        {
                            log.debug("DID NOT FIND TYPE " + info.getResume().getContentType());
                        }
                        fileName = info.getResume().getRemoteFileName();
                        ResumeServices resumeServices = (ResumeServices) createEJB(getInitialContext(), ResumeServices.class);
                        resumeServices.putResume(info.getUserID(), fileType, fileName, fileBytes, DBMS.OLTP_DATASOURCE_NAME);
                    }
                }
                
                //skills
                CoderSkill skillbean = (CoderSkill)createEJB(ctx, CoderSkill.class);
                
                if(info.isEdit()) {
                    Hashtable edits = new Hashtable();
                    ArrayList deletes = new ArrayList();
                    
                    //load skill type list, iterate through each one, deleting, updating
                    Request r = new Request();
                    r.setContentHandle("skill_types");

                    ResultSetContainer rsc = (ResultSetContainer)getDataAccess().getData(r).get("skill_types");
                    for(int i = 0; i < rsc.size(); i++) {
                        ResultSetContainer rscSkills = skillbean.getSkillsByType(info.getUserID(), rsc.getIntItem(i, "skill_type_id"),DBMS.OLTP_DATASOURCE_NAME);
                        for(int j = 0; j < rscSkills.size(); j++) {
                            //check if info object has this skill
                            if(info.getSkill(rscSkills.getStringItem(j, "skill_id")) == null) {
                                //delete
                                deletes.add(rscSkills.getStringItem(j, "skill_id"));
                            } else {
                                //update
                                edits.put(rscSkills.getStringItem(j, "skill_id"), info.getSkill(rscSkills.getStringItem(j, "skill_id")));
                                info.removeSkill(rscSkills.getStringItem(j, "skill_id"));
                            }
                        }
                    }
                    
                    //process bulk deletes / updates
                    int[] deleteArray = new int[deletes.size()];
                    for(int i = 0; i < deletes.size(); i++) {
                        deleteArray[i] = Integer.parseInt((String)deletes.get(i));
                    }
                    skillbean.bulkRemoveCoderSkill(info.getUserID(), deleteArray, DBMS.OLTP_DATASOURCE_NAME);
                    
                    int[] updateSkillIdArray = new int[edits.keySet().size()];
                    int[] updateRankingArray = new int[edits.keySet().size()];
                    Iterator t = edits.keySet().iterator();
                    for(int i = 0; i < edits.keySet().size(); i++) {
                        String s = (String)t.next();
                        updateSkillIdArray[i] = Integer.parseInt(s);
                        updateRankingArray[i] = Integer.parseInt((String)edits.get(s));
                    }
                    skillbean.bulkSetRanking(info.getUserID(), updateSkillIdArray, updateRankingArray, DBMS.OLTP_DATASOURCE_NAME);
                }
                
                //inserts
                int[] insertSkillIdArray = new int[info.getSkillCount()];
                int[] insertRankingArray = new int[info.getSkillCount()];
                it = info.getSkillNames();
                for(int i = 0; i < info.getSkillCount(); i++) {
                    String s = (String)it.next();
                    insertSkillIdArray[i] = Integer.parseInt(s);
                    insertRankingArray[i] = Integer.parseInt(info.getSkill(s));
                }
                skillbean.bulkCreateCoderSkill(info.getUserID(), insertSkillIdArray, insertRankingArray, DBMS.OLTP_DATASOURCE_NAME);
                
                //notes
                Note notebean = (Note)createEJB(ctx, Note.class);
                UserNote usernotebean = (UserNote)createEJB(ctx, UserNote.class);
                
                if(info.isEdit()) {
                    //get user's notes for contracting, add update where appropriate
                    Request r = new Request();
                    r.setContentHandle("contracting_user_notes");

                    ResultSetContainer rsc = (ResultSetContainer)getDataAccess().getData(r).get("contracting_user_notes");
                    for(int i = 0; i < rsc.size(); i++) {
                        
                        if(info.getNote(rsc.getStringItem(i, "note_id")) == null) {
                            //delete
                            usernotebean.removeUserNote(info.getUserID(), rsc.getLongItem(i, "note_id"), DBMS.OLTP_DATASOURCE_NAME);
                        } else {
                            //update
                            notebean.setText(rsc.getLongItem(i, "note_id"), info.getNote(rsc.getStringItem(i, "note_id")), DBMS.OLTP_DATASOURCE_NAME);
                            info.removeNote(rsc.getStringItem(i, "note_id"));
                        }
                    }
                }
                
                //insert
                it = info.getNoteNames();
                while(it.hasNext()) {
                    String s = (String)it.next();
                    long noteId = notebean.createNote(info.getNote(s), info.getUserID(), Integer.parseInt(s), DBMS.OLTP_DATASOURCE_NAME, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    usernotebean.createUserNote(info.getUserID(), noteId, DBMS.OLTP_DATASOURCE_NAME);
                }
                
                
                ut.commit();
                clearInfo();
            } catch(Exception e) {
                ut.rollback();
                throw e;
            }
        } catch(TCWebException tce) {
            throw tce;
        } catch(Exception e) {
            throw new TCWebException(e);
        }
    }
    
    protected Map getFileTypes() throws Exception {
        Request r = new Request();
        r.setContentHandle("file_types");
        Map qMap = getDataAccess().getData(r);
        ResultSetContainer questions = (ResultSetContainer) qMap.get("file_types");
        ResultSetContainer.ResultSetRow row = null;

        Map ret = new HashMap();
        for (Iterator it = questions.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            ret.put(row.getStringItem("mime_type"), new Long( row.getLongItem("file_type_id")) );
        }
        return ret;
    }

    protected void setNextPage() {
        
        setNextPage(Constants.CONTRACTING_SUCCESS_PAGE); 
        setIsNextPageInContext(true);
    }
    
}

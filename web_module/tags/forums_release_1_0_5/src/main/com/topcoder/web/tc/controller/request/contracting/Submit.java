/*
 * Submit.java
 *
 * Created on October 8, 2004, 12:14 PM
 */

package com.topcoder.web.tc.controller.request.contracting;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.*;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.coderskill.CoderSkill;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.note.Note;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.ejb.user.UserNote;
import com.topcoder.web.ejb.user.UserPreference;
import com.topcoder.web.tc.Constants;

import javax.transaction.TransactionManager;
import javax.transaction.Status;
import java.util.*;

/**
 *
 * @author  rfairfax
 */
public class Submit extends ContractingBase {


    protected void contractingProcessing() throws TCWebException {
        try {
            TransactionManager tm = (TransactionManager)getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
            tm.begin();
            try {
                //prefs
                UserPreference prefbean = (UserPreference) createEJB(getInitialContext(), UserPreference.class);

                //load pref group list, iterate through each one, deleting, updating
                Request r = new Request();
                r.setContentHandle("preference_groups");

                ResultSetContainer rsc = (ResultSetContainer) getDataAccess().getData(r).get("preference_groups");
                for (int i = 0; i < rsc.size(); i++) {
                    ResultSetContainer rscPrefs = prefbean.getPreferencesByGroup(info.getUserID(), rsc.getIntItem(i, "preference_group_id"), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    for (int j = 0; j < rscPrefs.size(); j++) {
                        //check if info object has this preference
                        if (info.getPreference(rscPrefs.getStringItem(j, "preference_id")) == null) {
                            //delete
                            prefbean.removeUserPreference(info.getUserID(), rscPrefs.getIntItem(j, "preference_id"), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                        } else {
                            //update
                            if (rscPrefs.getIntItem(j, "preference_type_id") == Constants.PREFERENCE_TEXT_ANSWER) {
                                prefbean.setValue(info.getUserID(), rscPrefs.getIntItem(j, "preference_id"),
                                        info.getPreference(rscPrefs.getStringItem(j, "preference_id")), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                            } else {
                                prefbean.setPreferenceValueID(info.getUserID(), rscPrefs.getIntItem(j, "preference_id"),
                                        Integer.parseInt(info.getPreference(rscPrefs.getStringItem(j, "preference_id"))), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                            }
                            info.removePref(rscPrefs.getStringItem(j, "preference_id"));
                        }
                    }
                }

                //insert
                Iterator it = info.getPreferenceNames();
                while (it.hasNext()) {
                    String s = (String) it.next();
                    prefbean.createUserPreference(info.getUserID(), Integer.parseInt(s), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    try {
                        prefbean.setPreferenceValueID(info.getUserID(), Integer.parseInt(s), Integer.parseInt(info.getPreference(s)), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    } catch (NumberFormatException ne) {
                        //text field
                        prefbean.setValue(info.getUserID(), Integer.parseInt(s), info.getPreference(s), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    }

                }

                //resume
                if (info.getResume() != null) {
                    int fileType = 7; //generic

                    //fileBytes = new byte[(int) info.getResume().getSize()];
                    if (info.getResume() == null || info.getResume().length == 0) {
                        //ignore this
                    } else {
                        //fileType = Integer.parseInt(file.getParameter("fileType"));
                        Map types = getFileTypes();
                        if (types.containsKey(info.getResumeContentType())) {
                            log.debug("FOUND TYPE");
                            fileType = ((Long) types.get(info.getResumeContentType())).intValue();
                        } else {
                            log.info("DID NOT FIND TYPE " + info.getResumeContentType());
                        }
                        ResumeServices resumeServices = (ResumeServices) createEJB(getInitialContext(), ResumeServices.class);
                        resumeServices.putResume(info.getUserID(), fileType, info.getResumeFileName(), info.getResume(), DBMS.OLTP_DATASOURCE_NAME);
                    }
                }

                //skills
                CoderSkill skillbean = (CoderSkill) createEJB(getInitialContext(), CoderSkill.class);

                Hashtable edits = new Hashtable();
                ArrayList deletes = new ArrayList();

                //load skill type list, iterate through each one, deleting, updating
                r = new Request();
                r.setContentHandle("skill_types");

                rsc = (ResultSetContainer) getDataAccess().getData(r).get("skill_types");
                for (int i = 0; i < rsc.size(); i++) {
                    ResultSetContainer rscSkills = skillbean.getSkillsByType(info.getUserID(), rsc.getIntItem(i, "skill_type_id"), DBMS.OLTP_DATASOURCE_NAME);
                    for (int j = 0; j < rscSkills.size(); j++) {
                        //check if info object has this skill
                        if (info.getSkill(rscSkills.getStringItem(j, "skill_id")) == null) {
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
                for (int i = 0; i < deletes.size(); i++) {
                    deleteArray[i] = Integer.parseInt((String) deletes.get(i));
                }
                skillbean.bulkRemoveCoderSkill(info.getUserID(), deleteArray, DBMS.OLTP_DATASOURCE_NAME);

                int[] updateSkillIdArray = new int[edits.keySet().size()];
                int[] updateRankingArray = new int[edits.keySet().size()];
                Iterator t = edits.keySet().iterator();
                for (int i = 0; i < edits.keySet().size(); i++) {
                    String s = (String) t.next();
                    updateSkillIdArray[i] = Integer.parseInt(s);
                    updateRankingArray[i] = Integer.parseInt((String) edits.get(s));
                }
                skillbean.bulkSetRanking(info.getUserID(), updateSkillIdArray, updateRankingArray, DBMS.OLTP_DATASOURCE_NAME);

                //inserts
                int[] insertSkillIdArray = new int[info.getSkillCount()];
                int[] insertRankingArray = new int[info.getSkillCount()];
                it = info.getSkillNames();
                for (int i = 0; i < info.getSkillCount(); i++) {
                    String s = (String) it.next();
                    insertSkillIdArray[i] = Integer.parseInt(s);
                    insertRankingArray[i] = Integer.parseInt(info.getSkill(s));
                }
                skillbean.bulkCreateCoderSkill(info.getUserID(), insertSkillIdArray, insertRankingArray, DBMS.OLTP_DATASOURCE_NAME);

                //notes
                Note notebean = (Note) createEJB(getInitialContext(), Note.class);
                UserNote usernotebean = (UserNote) createEJB(getInitialContext(), UserNote.class);

                //get user's notes for contracting, add update where appropriate
                r = new Request();
                r.setContentHandle("contracting_user_notes");
                r.setProperty("uid", String.valueOf(info.getUserID()));

                rsc = (ResultSetContainer) getDataAccess().getData(r).get("contracting_user_notes");
                for (int i = 0; i < rsc.size(); i++) {

                    if (info.getNote(rsc.getStringItem(i, "note_type_id")) == null) {
                        //delete
                        usernotebean.removeUserNote(info.getUserID(), rsc.getLongItem(i, "note_id"), DBMS.OLTP_DATASOURCE_NAME);
                    } else {
                        //update
                        notebean.setText(rsc.getLongItem(i, "note_id"), info.getNote(rsc.getStringItem(i, "note_type_id")), DBMS.OLTP_DATASOURCE_NAME);
                        info.removeNote(rsc.getStringItem(i, "note_type_id"));
                    }
                }

                //insert
                it = info.getNoteNames();
                while (it.hasNext()) {
                    String s = (String) it.next();
                    long noteId = notebean.createNote(info.getNote(s), info.getUserID(), Integer.parseInt(s), DBMS.OLTP_DATASOURCE_NAME, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    usernotebean.createUserNote(info.getUserID(), noteId, DBMS.OLTP_DATASOURCE_NAME);
                }


                tm.commit();
                clearInfo();
            } catch (Exception e) {
                if (tm!=null && tm.getStatus()==Status.STATUS_ACTIVE)
                    tm.rollback();
                throw e;
            }

            //send confirmation email

            //lookup email address
            Email emailbean = (Email) createEJB(getInitialContext(), Email.class);
            String email = "";
            long emailId = emailbean.getPrimaryEmailId(info.getUserID(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
            email = emailbean.getAddress(emailId, DBMS.COMMON_OLTP_DATASOURCE_NAME);

            log.debug("Emailing: " + email);

            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject("TopCoder Placement Registration");
            StringBuffer msgText = new StringBuffer(3000);

            msgText.append("Thank you for registering/updating your personal information and skills in the TopCoder Placement database.  When a position arises for which you are a match, a TopCoder representative will contact you.\n\n");
            msgText.append("If you have any questions, please contact us at service@topcoder.com.\n\n");
            msgText.append("- The TopCoder Placement Team");

            mail.setBody(msgText.toString());
            mail.addToAddress(email, TCSEmailMessage.TO);
            mail.setFromAddress("service@topcoder.com");
            EmailEngine.send(mail);
        } catch (TCWebException tce) {
            throw tce;
        } catch (Exception e) {
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
            ret.put(row.getStringItem("mime_type"), new Long(row.getLongItem("file_type_id")));
        }
        return ret;
    }

    protected void setNextPage() {

        setNextPage(Constants.CONTRACTING_SUCCESS_PAGE);
        setIsNextPageInContext(true);
    }

}

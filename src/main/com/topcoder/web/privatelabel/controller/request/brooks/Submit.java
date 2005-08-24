package com.topcoder.web.privatelabel.controller.request.brooks;

import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.ScreeningException;
import com.topcoder.web.corp.ejb.coder.Coder;
import com.topcoder.web.corp.ejb.coder.CompanyCandidate;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.ejb.session.Session;
import com.topcoder.web.ejb.session.SessionHome;
import com.topcoder.web.ejb.session.SessionSegment;
import com.topcoder.web.ejb.session.SessionSegmentHome;
import com.topcoder.web.ejb.sessionprofile.*;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.BaseActivate;
import com.topcoder.web.privatelabel.controller.request.FullRegSubmit;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.ResumeRegInfo;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

import javax.rmi.PortableRemoteObject;
import javax.transaction.TransactionManager;
import javax.transaction.Status;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author dok
 * Date: Jan 22, 2004
 */
public class Submit extends FullRegSubmit {


    protected void setNextPage() {
        if (isEligible((FullRegInfo) regInfo)) {
            if (hasErrors()) {
                setNextPage(Constants.BROOKS_REG_PAGE);
                setIsNextPageInContext(true);
            } else {
                SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
                StringBuffer buf = new StringBuffer(150);
                buf.append("http://");
                buf.append(ApplicationServer.SERVER_NAME);
                buf.append(info.getServletPath());
                buf.append("?");
                buf.append(Constants.MODULE_KEY);
                buf.append("=");
                buf.append(Constants.STATIC);
                buf.append(Constants.BROOKS_REG_SUCCESS_PAGE);
                setNextPage(buf.toString());
                setIsNextPageInContext(false);
            }
        } else {
            throw new RuntimeException("impossible, isEligible returned false, fix the code");
        }
    }

    protected long commit(SimpleRegInfo regInfo) throws TCWebException {

        long ret = 0;
        UserPrincipal newUser = null;
        TransactionManager tm = null;
        try {
            tm = (TransactionManager)getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
            tm.begin();

            PrincipalMgrRemote mgr = (PrincipalMgrRemote) com.topcoder.web.common.security.Constants.createEJB(PrincipalMgrRemote.class);
            newUser = mgr.createUser(regInfo.getHandle(), regInfo.getPassword(), CREATE_USER);

            //i don't like this cuz we're mondifing the input, but i don't have a smart solution yet
            regInfo.setUserId(newUser.getId());

            ret = store(regInfo);
            tm.commit();
        } catch (Exception e) {
            Exception ex = null;
            try {
                if (tm != null && tm.getStatus()==Status.STATUS_ACTIVE) {
                    tm.rollback();
                }
            } catch (Exception x) {
                throw new TCWebException(e);
            }

            try {
                //since we don't have a transaction spanning the security
                //stuff, attempt to remove this newly created user manually
                //todo perhaps we can wack this since we're on jboss and the transaction should span
                if (newUser != null && newUser.getId() > 0 && regInfo.isNew()) {
                    PrincipalMgrRemote mgr = (PrincipalMgrRemote)
                            com.topcoder.web.common.security.Constants.createEJB(PrincipalMgrRemote.class);
                    mgr.removeUser(newUser, CREATE_USER);
                }
            } catch (Exception x) {
                if (ex==null) ex = x;
                throw new TCWebException(x);
            }
            throw new TCWebException(e);
        }
        return ret;
    }



    protected long store(SimpleRegInfo regInfo) throws Exception {
        long ret = super.storeWithoutCoder(regInfo);

        //need to add coder record to avoid breaking a bunch of foreign keys
        Coder coder = (Coder) createEJB(getInitialContext(), Coder.class);
        coder.createCoder(ret, 1);

        super.setCoderType(ret, ((FullRegInfo) regInfo).getCoderType());
        super.storeQuestions(regInfo, ret);

        //check for resume save
        ResumeRegInfo info = (ResumeRegInfo) regInfo;
        if (info.getUploadedFile() != null) {
            byte[] fileBytes = null;
            String fileName = "";
            int fileType = -1;

            fileBytes = new byte[(int) info.getUploadedFile().getSize()];
            info.getUploadedFile().getInputStream().read(fileBytes);
            if (fileBytes == null || fileBytes.length == 0)
                addError(Constants.FILE, "Sorry, the file you attempted to upload was empty.");
            else {
                //fileType = Integer.parseInt(file.getParameter("fileType"));
                Map types = getFileTypes(transDb);
                if (types.containsKey(info.getUploadedFile().getContentType())) {
                    log.debug("FOUND TYPE");
                    fileType = ((Long) types.get(info.getUploadedFile().getContentType())).intValue();
                } else {
                    log.debug("DID NOT FIND TYPE " + info.getUploadedFile().getContentType());
                }
                fileName = info.getUploadedFile().getRemoteFileName();
                ResumeServices resumeServices = (ResumeServices) createEJB(getInitialContext(), ResumeServices.class);
                resumeServices.putResume(ret, fileType, fileName, fileBytes, transDb);
            }
        }
        return ret;
    }

    protected Map getFileTypes(String db) throws Exception {
        Request r = new Request();
        r.setContentHandle("file_types");
        Map qMap = getDataAccess(db, true).getData(r);
        ResultSetContainer questions = (ResultSetContainer) qMap.get("file_types");
        ResultSetContainer.ResultSetRow row = null;

        Map ret = new HashMap();
        for (Iterator it = questions.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            ret.put(row.getStringItem("mime_type"), new Long(row.getLongItem("file_type_id")));
        }
        return ret;
    }

    protected void handleActivation(SimpleRegInfo info, long userId) throws TCWebException {
        try {

            //UserTransaction ut = Transaction.get(getInitialContext());
            //ut.begin();

            try {
                //placed here to fix transaction woes.
                CompanyCandidate candidate = (CompanyCandidate) createEJB(getInitialContext(), CompanyCandidate.class);

                long companyId = Long.parseLong(getRequestParameter(Constants.COMPANY_ID));

                candidate.createCompanyCandidate(companyId, userId);

                //still todo: Session, Session Segments
                // 96 hour session from current hour
                SessionProfileHome spHome = (SessionProfileHome)
                        PortableRemoteObject.narrow(
                                getInitialContext().lookup(SessionProfileHome.class.getName()),
                                SessionProfileHome.class);
                SessionProfile profile = spHome.create();
                SessionProfileLanguageHome splHome = (SessionProfileLanguageHome)
                        PortableRemoteObject.narrow(
                                getInitialContext().lookup(SessionProfileLanguageHome.class.getName()),
                                SessionProfileLanguageHome.class);
                SessionProfileLanguage language = splHome.create();
                SessionProfileProblemHome sppHome = (SessionProfileProblemHome)
                        PortableRemoteObject.narrow(
                                getInitialContext().lookup(SessionProfileProblemHome.class.getName()),
                                SessionProfileProblemHome.class);
                SessionProfileProblem problem = sppHome.create();

                //get problem with least assignments from company
                DataAccessInt access = getDataAccess(transDb, false);
                Request dataRequest = new Request();
                dataRequest.setProperty(DataAccessConstants.COMMAND,
                        "company_reg_problem_assignment");
                dataRequest.setProperty("cm", String.valueOf(companyId));
                dataRequest.setProperty("jpid", String.valueOf(super.getJobId()));
                Map map = access.getData(dataRequest);
                ResultSetContainer rsc = (ResultSetContainer)
                        map.get("company_reg_problem_assignment");

                ResultSetContainer.ResultSetRow row =
                        (ResultSetContainer.ResultSetRow) rsc.get(0);
                long problemId = row.getLongItem("problem_id");
                long roundId = row.getLongItem("round_id");

                //lookup session profile id, check if it exists
                //company_session_profile
                long spid = 0;

                dataRequest = new Request();
                dataRequest.setProperty(DataAccessConstants.COMMAND,
                        "company_session_profile");
                dataRequest.setProperty("cm", String.valueOf(companyId));
                dataRequest.setProperty("pid", String.valueOf(problemId));
                map = access.getData(dataRequest);
                rsc = (ResultSetContainer)
                        map.get("company_session_profile");

                if (rsc.getRowCount() != 0) {
                    spid = rsc.getIntItem(0, "session_profile_id");
                } else {
                    //create a session somehow
                    spid = profile.createSessionProfile("Problem: " + problemId, companyId);

                    //now add in the example problem
                    int index = com.topcoder.web.corp.common.Constants.EXAMPLE_PROBLEM_ID.indexOf(",");
                    problem.createSessionProfileProblem(spid,
                            Long.parseLong(com.topcoder.web.corp.common.Constants.EXAMPLE_PROBLEM_ID.substring(index + 1)),
                            Integer.parseInt(com.topcoder.web.corp.common.Constants.PROBLEM_TYPE_EXAMPLE_ID),
                            1,
                            Long.parseLong(com.topcoder.web.corp.common.Constants.EXAMPLE_PROBLEM_ID.substring(0, index)));

                    //now do the test set b problem
                    problem.createSessionProfileProblem(spid,
                            problemId,
                            com.topcoder.web.corp.common.Constants.PROBLEM_TYPE_TEST_SET_B_ID,
                            1,
                            roundId);

                    //all languages
                    int[] languages = new int[]{1, 3, 4};
                    for (int i = 0; i < languages.length; ++i) {
                        language.createProfileLanguage(spid, languages[i]);
                    }
                }

                //calc time
                Calendar c = Calendar.getInstance();
                String beginMonth = String.valueOf(c.get(Calendar.MONTH) + 1);
                String beginDay = String.valueOf(c.get(Calendar.DAY_OF_MONTH));
                String beginYear = String.valueOf(c.get(Calendar.YEAR));
                String beginHour = String.valueOf(c.get(Calendar.HOUR_OF_DAY));

                Date beginDate = formDate(beginYear, beginMonth, beginDay, beginHour);
                Date endDate = formEndDate(beginYear, beginMonth, beginDay, beginHour);

                //create session
                SessionHome sHome = (SessionHome)
                        PortableRemoteObject.narrow(
                                getInitialContext().lookup(SessionHome.class.getName()),
                                SessionHome.class);
                Session session = sHome.create();
                SessionSegmentHome ssHome = (SessionSegmentHome)
                        PortableRemoteObject.narrow(
                                getInitialContext().lookup(SessionSegmentHome.class.getName()),
                                SessionSegmentHome.class);
                SessionSegment segment = ssHome.create();

                long sessionId =
                        session.createSession(spid,
                                userId,
                                new Timestamp(beginDate.getTime()),
                                new Timestamp(endDate.getTime()),
                                false,
                                false,
                                0);

                session.setJobId(sessionId, getJobId());

                //now get info for segments
                dataRequest = new Request();
                dataRequest.setProperty(DataAccessConstants.COMMAND,
                        com.topcoder.web.corp.common.Constants.SESSION_SEGMENT_COMMAND);
                dataRequest.setProperty("sid", String.valueOf(sessionId));

                access = getDataAccess(com.topcoder.web.corp.common.Constants.TX_DATA_SOURCE, false);

                map = access.getData(dataRequest);

                rsc = (ResultSetContainer)
                        map.get(com.topcoder.web.corp.common.Constants.SESSION_SEGMENT_TEST_SET_A_QUERY_KEY);
                row = null;
                if (rsc.size() != 0) {
                    row = (ResultSetContainer.ResultSetRow) rsc.get(0);

                    //somehow get dates out and subtract them
                    Timestamp start = (Timestamp) row.getItem("start_time").getResultData();
                    Timestamp end = (Timestamp) row.getItem("end_time").getResultData();
                    long testSetASegment = end.getTime() - start.getTime();

                    segment.createSessionSegment(sessionId, Long.parseLong(com.topcoder.web.corp.common.Constants.SESSION_SEGMENT_TEST_SET_A_ID), testSetASegment);
                }

                rsc = (ResultSetContainer)
                        map.get(com.topcoder.web.corp.common.Constants.SESSION_SEGMENT_TEST_SET_B_QUERY_KEY);
                if (rsc.size() == 0) {
                    throw new ScreeningException(
                            "Problem with session segment test set b for new session " + sessionId);
                }
                row = (ResultSetContainer.ResultSetRow) rsc.get(0);

                long testSetBSegment = Long.parseLong(row.getItem("count").toString()) *
                        Long.parseLong(com.topcoder.web.corp.common.Constants.TEST_SET_B_SEGMENT_INTERVAL);
                segment.createSessionSegment(sessionId, Long.parseLong(com.topcoder.web.corp.common.Constants.SESSION_SEGMENT_TEST_SET_B_ID), testSetBSegment);

                //send email
                StringBuffer buf = new StringBuffer(1000);

                TCSEmailMessage mail = new TCSEmailMessage();
                mail.setSubject("Invitation to Brooks Automation Technical Assessment Tool");

                Date transBegin = translateDate(beginDate);
                Date transEnd = translateDate(endDate);


                buf.append("Thank you for your interest in employment opportunities with Brooks Automation Private Limited in Chennai, India.  As part of our candidate selection and evaluation process, we would like you to participate in the Brooks Automation Technical Assessment Tool, powered by TopCoder.  Through this Technical Assessment Tool, you will be asked to solve algorithmic problems as an objective measure of your programming and technical problem solving ability.\n\n");
                buf.append("Please review the Help Manual before getting started:\n");
                buf.append("http://");
                buf.append(ApplicationServer.SERVER_NAME);
                buf.append("/techassess/techassess?module=Static&d1=help&d2=index");
                buf.append("\n\n");
                buf.append("The following session has been scheduled for you:\n\n");
                buf.append("Begin: ");
                buf.append(new SimpleDateFormat("MM/dd/yyyy hh:mm a").format(transBegin));
                buf.append(" IST\n");
                buf.append("End: ");
                buf.append(new SimpleDateFormat("MM/dd/yyyy hh:mm a").format(transEnd));
                buf.append(" IST\n");
                buf.append("Login: ");
                buf.append(info.getHandle());
                buf.append("\n");
                buf.append("Password: ");
                buf.append(info.getPassword());
                buf.append("\n\n");
                buf.append("PLEASE NOTE THAT YOU MUST COMPLETE ALL PORTIONS OF THE TECHNICAL ASSESSMENT TOOL PRIOR TO THE END TIME SHOWN ABOVE.  YOU SHOULD ALLOW APPROXIMATELY 1 HOUR TO COMPLETE ALL PORTIONS OF THE TEST.\n\n");
                buf.append("You may access the Technical Assessment Tool here:\n");
                buf.append("http://");
                buf.append(ApplicationServer.SERVER_NAME);
                buf.append("/techassess/techassess?module=Login&cm=");
                buf.append(companyId);
                buf.append("\n\n");
                buf.append("If you encounter any technical problems while using the Technical Assessment Tool, please contact us at brooks@topcoder.com.\n\n");
                buf.append("Thank you,\n\n");
                buf.append("Brooks Automation Private Limited\n");
                buf.append("Chennai, India");

                mail.setBody(buf.toString());
                mail.addToAddress(info.getEmail(), TCSEmailMessage.TO);
                mail.setFromAddress("brooks@topcoder.com", "Brooks Automation Private Limited, Chennai");
                EmailEngine.send(mail);
                log.info("sent registration email to " + info.getEmail());

                //ut.commit();
            } catch (Exception e) {
                //ut.rollback();
                throw e;
            }
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private String getUrl(String code) {
        StringBuffer buf = new StringBuffer(200);
        buf.append("http://");
        buf.append(ApplicationServer.SERVER_NAME);
        SessionInfo sInfo = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
        buf.append(sInfo.getServletPath());
        buf.append("?");
        buf.append(Constants.MODULE_KEY);
        buf.append("=");
        buf.append(Constants.DC_ACTIVATION);
        buf.append("&");
        buf.append(BaseActivate.ACTIVATION_CODE);
        buf.append("=");
        buf.append(code);
        buf.append("&");
        buf.append(Constants.COMPANY_ID);
        buf.append("=");
        buf.append(regInfo.getCompanyId());
        return buf.toString();
    }

    private Date formDate(String year, String month, String day, String hour) {
        //if we don't have all the values then just exit
        if (year == null || month == null || day == null || hour == null) {
            return new Date(); //so we don't blow up in certain places
        }
        Calendar c = Calendar.getInstance();
        c.set(Integer.parseInt(year),
                months[Integer.parseInt(month)],
                Integer.parseInt(day),
                Integer.parseInt(hour), 0, 0);
        c.set(Calendar.MILLISECOND, 0);
        return c.getTime();
    }

    private Date formEndDate(String year, String month, String day, String hour) {
        //if we don't have all the values then just exit
        if (year == null || month == null || day == null || hour == null) {
            return new Date(); //so we don't blow up in certain places
        }
        Calendar c = Calendar.getInstance();
        c.set(Integer.parseInt(year),
                months[Integer.parseInt(month)],
                Integer.parseInt(day),
                Integer.parseInt(hour), 0, 0);
        c.set(Calendar.MILLISECOND, 0);

        //96 hours
        c.add(Calendar.DATE, 4);
        return c.getTime();
    }

    private Date translateDate(Date d) {
        log.debug("TIME1: " + d);
        log.debug("TIME1: " + d.getTime());
        Calendar c = new GregorianCalendar();
        c.setTime(d);
        Date ret = new Date(d.getTime());

        //bring to GMT
        log.debug("TIME: " + c.get(GregorianCalendar.YEAR));
        log.debug("EST: " + TimeZone.getTimeZone("EST").getOffset(1, 1900 + c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.DAY_OF_WEEK), 0));
        log.debug("IST: " + TimeZone.getTimeZone("IST").getOffset(1, 1900 + c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.DAY_OF_WEEK), 0));
        ret = new Date(ret.getTime() - TimeZone.getTimeZone("EST").getOffset(1, 1900 + c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.DAY_OF_WEEK), 0));
        ret = new Date(ret.getTime() + TimeZone.getTimeZone("IST").getOffset(1, 1900 + c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.DAY_OF_WEEK), 0));

        return ret;
    }

    private static int[] months =
            new int[]{-1, Calendar.JANUARY, Calendar.FEBRUARY, Calendar.MARCH,
                      Calendar.APRIL, Calendar.MAY, Calendar.JUNE, Calendar.JULY,
                      Calendar.AUGUST, Calendar.SEPTEMBER, Calendar.OCTOBER,
                      Calendar.NOVEMBER, Calendar.DECEMBER};
}

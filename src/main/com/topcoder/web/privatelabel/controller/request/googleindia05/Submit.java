package com.topcoder.web.privatelabel.controller.request.googleindia05;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.BaseActivate;
import com.topcoder.web.privatelabel.controller.request.FullRegSubmit;
import com.topcoder.web.privatelabel.model.ResumeRegInfo;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 26, 2005
 */
public class Submit extends FullRegSubmit {

    //protected UserPrincipal commit(SimpleRegInfo regInfo) throws TCWebException {
    protected long store(SimpleRegInfo regInfo) throws Exception {
        long userId = super.store(regInfo);

        try {
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
                    resumeServices.putResume(userId, fileType, fileName, fileBytes, transDb);
                }
            }
            User user = (User) createEJB(getInitialContext(), User.class);
            user.setPassword(userId, info.getPassword(), transDb);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

        return userId;
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

    protected void setNextPage() {
        SessionInfo sInfo = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
        setNextPage(sInfo.getServletPath() + "?" + Constants.MODULE_KEY + "=" + Constants.STATIC + Constants.GOOGLE_INDIA_05_REG_SUCCESS_PAGE);
        setIsNextPageInContext(false);
    }

    protected void handleActivation(SimpleRegInfo info, long userId) throws TCWebException {
        try {
            StringBuffer buf = new StringBuffer(1000);
            User user = (User) createEJB(getInitialContext(), User.class);
            String code = user.getActivationCode(userId, db);

            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject("IMPORTANT - Google(TM) India Code Jam 2005 Activation Email");

            buf.append("You're invited to take part in the Google(TM) India Code Jam 2005, Powered by TopCoder(R), a programming competition that will be worthy of your time, your skills and your interest.\n\n");

            buf.append("GOOGLE INDIA CODE JAM 2005 ACTIVATION INFORMATION\n\n");

            buf.append("Your Google activation code is ");
            buf.append(code);
            buf.append("\n\n");

            buf.append("To activate your account, navigate to the following WWW URL:\n");

            buf.append(getUrl(code));

            buf.append("\n\nIf you cannot click on the web address above, please copy the address into your web browser to continue.  If the address spans two lines, please make sure you copy and paste both sections without any spaces between them.\n\n");

            buf.append("Your handle and password will provide you with access to the Competition Arena, where you can practice and chat, and where you'll compete in the Google India Code Jam 2005.\n\n");

            buf.append("PRACTICING FOR THE EVENT\n");
            buf.append("There is a practice room available to you that will allow you to become acclimated with the competition environment before you participate in the Google India Code Jam 2005.  The practice room contains a problem set that will be very similar in nature to the problems you will encounter during competition.  The practice room will be available from 9:00AM IST on February 8, 2005 through 5:00PM IST on March 26, 2005.\n\n");

            buf.append("You can access the practice rooms by navigating to ");
            buf.append("http://");
            buf.append(ApplicationServer.SERVER_NAME);
            buf.append("/gicj05 and clicking on the Competition Arena tab.\n\n");

            buf.append("COMPETING IN THE QUALIFICATION ROUND\n");
            buf.append("You may participate in the Qualification Round at any time between Saturday, February 26 at 12:00PM (Noon) IST and Sunday, February 27 at 12:00PM (Noon) IST.  You will have up to one hour to solve two problems. It is recommended that you utilize the practice area prior to participating in the Qualification Round.\n\n");

            buf.append("LAUNCHING THE ARENA\n");
            buf.append("You can launch and login to the Competition Arena at the appropriate time by navigating to ");
            buf.append("http://");
            buf.append(ApplicationServer.SERVER_NAME);

            buf.append("/gicj05 and clicking on the Competition Arena tab.\n\n");

            buf.append("You will need to have the Java 1.4.x runtime installed in order to launch the arena.\n\n");

            buf.append("We also suggest that you read up on the competition process by navigating to ");
            buf.append("http://");
            buf.append(ApplicationServer.SERVER_NAME);
            buf.append("/gicj05 and reading over the Competition Instructions.\n\n");

            buf.append("If you have any questions about how to participate, please email them to gicj05@topcoder.com\n\n");

            buf.append("Thank you for registering for the Google India Code Jam 2005, Powered by TopCoder.  We look forward to seeing you in the Arena!\n\n");


            mail.setBody(buf.toString());
            mail.addToAddress(info.getEmail(), TCSEmailMessage.TO);
            mail.setFromAddress("gicj05@topcoder.com", "Google India Code Jam Team");
            log.info("sent registration email to " + info.getEmail());
            EmailEngine.send(mail);
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
        buf.append(Constants.GOOGLE_INDIA_05_ACTIVATION);
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
}

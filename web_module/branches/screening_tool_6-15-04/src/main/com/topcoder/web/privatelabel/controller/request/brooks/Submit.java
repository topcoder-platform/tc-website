package com.topcoder.web.privatelabel.controller.request.brooks;

import com.topcoder.security.UserPrincipal;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.ResumeRegInfo;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.BaseActivate;
import com.topcoder.web.privatelabel.controller.request.FullRegSubmit;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.shared.util.*;
import com.topcoder.web.corp.ejb.coder.*;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.rmi.PortableRemoteObject;

import java.util.*;

/**
 * @author dok
 * Date: Jan 22, 2004
 */
public class Submit extends FullRegSubmit {


    protected void setNextPage() {
        if (isEligible((FullRegInfo)regInfo)) {
            if (hasErrors()) {
                setNextPage(Constants.BROOKS_REG_PAGE);
                setIsNextPageInContext(true);
            } else {
                SessionInfo info = (SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
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
    
    protected UserPrincipal store(SimpleRegInfo regInfo, UserPrincipal newUser) throws Exception {
        UserPrincipal ret = super.storeWithoutCoder(regInfo, newUser);
        
        //need to add coder record to avoid breaking a bunch of foreign keys
        CoderHome cHome = (CoderHome)
                PortableRemoteObject.narrow(
                        getInitialContext().lookup(CoderHome.class.getName()), CoderHome.class);
        Coder coder = cHome.create();
        coder.createCoder(newUser.getId(), 1);
        
        ret = super.storeQuestions(regInfo, ret);
        
        //check for resume save
        ResumeRegInfo info = (ResumeRegInfo)regInfo;
        if(info.getUploadedFile() != null)
        {
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
                if(types.containsKey(info.getUploadedFile().getContentType()) )
                {
                    log.info("FOUND TYPE");
                    fileType = ((Long) types.get(info.getUploadedFile().getContentType())).intValue();
                }
                else
                {
                    log.info("DID NOT FIND TYPE " + info.getUploadedFile().getContentType());
                }
                fileName = info.getUploadedFile().getRemoteFileName();
                ResumeServices resumeServices = (ResumeServices) createEJB(getInitialContext(), ResumeServices.class);
                resumeServices.putResume(ret.getId(), fileType, fileName, fileBytes, transDb);
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
            ret.put(row.getStringItem("mime_type"), new Long( row.getLongItem("file_type_id")) );
        }
        return ret;
    }

    protected void handleActivation(SimpleRegInfo info, UserPrincipal newUser) throws TCWebException {
        try {
            if (((FullRegInfo)info).getCoderType()==Constants.STUDENT) {
                StringBuffer buf = new StringBuffer(1000);
                User user = (User) createEJB(getInitialContext(), User.class);
                String code = user.getActivationCode(newUser.getId(), db);

                TCSEmailMessage mail = new TCSEmailMessage();
                mail.setSubject("IMPORTANT - DoubleClick Activation Email");


                buf.append("You're invited to take part in the DoubleClick 2004 Coding Challenge, a programming competition that will be worthy of your time, your skills and your interest.\n\n");
                buf.append("DOUBLECLICK 2004 CODING CHALLENGE ACTIVATION INFORMATION\n\n");
                buf.append("Your DoubleClick activation code is ");
                buf.append(code);
                buf.append("\n\n");
                buf.append("To activate your account, navigate to the following WWW URL:\n\n");
                buf.append(getUrl(code));
                buf.append("\n\n");
                buf.append("If you cannot click on the web address above, please copy the address into your web browser to continue.  If the address spans two lines, please make sure you copy and paste both sections without any spaces between them.\n\n");
                buf.append("Your handle and password will provide you with access to the Competition Arena, where you can practice and chat, and where you'll compete in the DoubleClick 2004 Coding Challenge.\n\n");
                buf.append("PRACTICING FOR THE EVENT AND LAUNCHING THE ARENA\n");
                buf.append("There is a practice room available to you that will allow you to become acclimated with the competition environment before you participate in the Coding Challenge.  The practice room contains a problem set that will be very similar in nature to the problems you will encounter during competition.  The practice room will be available from 12:00PM ET on February 2 through 1:00PM ET on February 27, 2004.\n\n");
                buf.append("You can access the practice room and launch and login to the arena for the competition by navigating to ");
                buf.append("http://");
                buf.append(ApplicationServer.SERVER_NAME);
                buf.append("/pl/?&module=Static&d1=doubleclick&d2=col_arena\n\n");
                buf.append("Windows, Linux and Unix users need to have the Java 1.4.x runtime installed in order to launch the arena.\n\n");
                buf.append("Mac OS X users need to have the Java 1.4.x runtime installed, which requires OS X version 10.2.x.\n\n");
                buf.append("COMPETING IN THE QUALIFICATION ROUND\n");
                buf.append("You may participate in the Qualification Round during one of two sessions.  You can only attempt to qualify one time.  Session #1 will be open from 9:00AM through 9:00PM on Monday, February 16.  Session #2 will be open from 9:00AM through 9:00PM on Wednesday, February 18.  You will have up to one hour to solve one problem.  It is recommended that you utilize the practice area prior to participating in the Qualification Round.\n\n");
                buf.append("We also suggest that you read up on the competition process by navigating to ");
                buf.append("http://");
                buf.append(ApplicationServer.SERVER_NAME);
                buf.append("/pl/?&module=Static&d1=doubleclick&d2=col_overview");
                buf.append(" and downloading the competition manual.\n\n");
                buf.append("If you have any questions about how to participate, please email them to dccc@topcoder.com\n\n");
                buf.append("Thank you for registering for the DoubleClick 2004 Coding Challenge.  We look forward to seeing you in the Arena!\n\n");

                mail.setBody(buf.toString());
                mail.addToAddress(info.getEmail(), TCSEmailMessage.TO);
                mail.setFromAddress("service@topcoder.com");
                log.info("sent registration email to " + info.getEmail());
                EmailEngine.send(mail);
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


}

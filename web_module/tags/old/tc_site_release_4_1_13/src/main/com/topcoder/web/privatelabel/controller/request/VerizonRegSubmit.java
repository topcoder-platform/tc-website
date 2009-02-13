package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.DemographicResponse;
import com.topcoder.web.ejb.address.Address;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.user.UserAddress;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.VerizonRegInfo;

import java.util.Iterator;
import java.util.List;

public class VerizonRegSubmit extends FullRegSubmit {

    protected void setNextPage() {
        setNextPage(Constants.VERIZON_REG_PAGE);
        setIsNextPageInContext(true);
/*            SessionInfo info = (SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
            StringBuffer buf = new StringBuffer(150);
            buf.append("http://");
            buf.append(ApplicationServer.SERVER_NAME);
            buf.append(info.getServletPath());
            buf.append("?");
            buf.append(Constants.MODULE_KEY);
            buf.append("=");
            buf.append(Constants.STATIC);
            buf.append(Constants.VERIZON_REG_SUCCESS_PAGE);
            setNextPage(buf.toString());
            setIsNextPageInContext(false);*/
    }


    protected void handleActivation(SimpleRegInfo info, long userId) throws TCWebException {
        try {
//            if (isEligible()) {
            StringBuffer buf = new StringBuffer(1000);
            User user = (User) createEJB(getInitialContext(), User.class);
            String code = user.getActivationCode(userId, db);

            TCSEmailMessage mail = new TCSEmailMessage();
/*
                if (((VerizonRegInfo)info).isRegFull()) {
                    mail.setSubject("Verizon Activation Email");

                    buf.append("Thank you for providing your information in order to be notified of future Verizon coding events. Unfortunately, registration for the Verizon Coding Challenge is full.  However, you may activate your account and spend time practicing in the Arena to hone your skills for future Verizon coding events.\n\n");
                    buf.append("Your Verizon activation code is ");
                    buf.append(code);
                    buf.append("\n\n");
                    buf.append("To activate your account, navigate to the following WWW URL:\n\n");
                    buf.append(getUrl(code));
                    buf.append("\n\n");
                    buf.append("If you cannot click on the web address above, please copy the address into your web browser to continue. If the address spans two lines, please make sure you copy and paste both sections without any spaces between them.\n\n");
                    buf.append("Your handle and password will provide you with access to the Arena, where you can practice and chat with other members. The practice room is available to you and will allow you to become acclimated with the coding environment. The practice room contains a problem set that is very similar in nature to the problems encountered during Verizon competitions. The practice room will be available from 6:00AM IST (GMT +5:30) on October 15, 2003 through 7:00PM IST (GMT +5:30) on October 31, 2003.\n\n");
                    buf.append("You can access the practice rooms by navigating to http://www.topcoder.com/verizon and clicking on the \"Practice Arena\" link.\n\n");
                    buf.append("Windows, Linux and Unix users need to have the Java 1.4.x runtime installed in order to launch the arena.\n\n");
                    buf.append("Mac OS X users need to have the Java 1.4.x runtime installed, which requires OS X version 10.2.x.\n\n");
                    buf.append("If you have any questions about how to participate, please email them to service@topcoder.com\n\n");
                    buf.append("We look forward to seeing you in the Arena!\n\n");
                    buf.append("-The TopCoder Competitions Team\n\n");

                } else {
*/
            mail.setSubject("IMPORTANT - Verizon Coding Challenge Activation Email");

            buf.append("VERIZON CODING CHALLENGE ACTIVATION INFORMATION\n\n");
            buf.append("To activate your account, navigate to the URL below.  Once you have activated your account, you will be notified of your participation status in the Verizon Coding Challenge.\n\n");
            buf.append(getUrl(code));
            buf.append("\n\n");
            buf.append("If you cannot click on the web address above, please copy the address into your web browser to continue.  If the address spans two lines, please make sure you copy and paste both sections without any spaces between them.\n\n");
            buf.append("Your handle and password will provide you with access to the Practice and Competition Arena for the Verizon Coding Challenge.\n\n");
            buf.append("LAUNCHING THE ARENA/PRACTICING FOR THE EVENT\n");
            buf.append("There is a practice room available that will allow you to become acclimated with the competition environment for the Verizon Coding Challenge.  The practice room contains a problem set that is very similar in nature to the problems that will be given during competition.  The practice room will be available from 7:00AM IST (GMT +5:30) on October 31, 2003 through 6:00PM IST (GMT +5:30) on November 7, 2003.\n\n");
            buf.append("You can access the arena by navigating to http://www.topcoder.com/verizon and clicking on the \"Practice Arena\" link.\n\n");
            buf.append("Windows, Linux and Unix users need to have the Java 1.4.x runtime installed in order to launch the arena.\n\n");
            buf.append("Mac OS X users need to have the Java 1.4.x runtime installed, which requires OS X version 10.2.x.\n\n");
            buf.append("We also suggest that you read up on the competition process by navigating to http://www.topcoder.com/verizon and downloading the competition manual.\n\n");
            buf.append("If you have any questions about how to participate, please email them to service@topcoder.com\n\n");
            buf.append("Thank you for registering for the Verizon Coding Challenge.  We look forward to seeing you in the Arena!\n\n");
            buf.append("- The TopCoder Competitions Team\n\n");
//                }

            mail.setBody(buf.toString());
            mail.addToAddress(info.getEmail(), TCSEmailMessage.TO);
            mail.setFromAddress("service@topcoder.com");
            log.info("sent registration email to " + info.getEmail());
            EmailEngine.send(mail);
//            }
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
        buf.append(Constants.VERIZON_ACTIVATION);
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

    /**
     *
     * @return
     */
    protected static boolean isEligible(FullRegInfo info) {
        boolean hasDegree = true;
        boolean oldEnough = true;
        boolean isTechnical = true;
        List l = info.getResponses();
        DemographicResponse dr = null;
        for (Iterator it = l.iterator(); hasDegree && oldEnough && isTechnical && it.hasNext();) {
            dr = (DemographicResponse) it.next();
            //we're assuming that no other question has this as a valid answer.
            hasDegree = dr.getAnswerId() != Constants.NO_DEGREE_ANSWER;
            oldEnough = dr.getAnswerId() != Constants.TOO_YOUNG_ANSWER;
            isTechnical = dr.getAnswerId() != Constants.NON_TECHNICAL_ANSWER;
        }

        boolean ret = true;
        ret &= info.getCity().toLowerCase().equals("chennai");
        ret &= info.getCountryCode().equals("356"); //india
        ret &= hasDegree;
        ret &= oldEnough;
        ret &= isTechnical;

        return ret;
    }

    /**
     * set verizon specific stuff
     * @param regInfo
     * @return
     * @throws Exception
     */
    protected long store(SimpleRegInfo regInfo) throws Exception {
        long ret = super.store(regInfo);
        Address address = (Address) createEJB(getInitialContext(), Address.class);
        UserAddress userAddress = (UserAddress) createEJB(getInitialContext(), UserAddress.class);

        ResultSetContainer addresses = userAddress.getUserAddresses(ret, transDb);
        if (addresses.size() != 1) {
            throw new RuntimeException("found " + addresses.size() + " addresses for " + ret + " dunno what to do");
        }

        long addressId = addresses.getLongItem(0, "address_id");
        address.setProvince(addressId, regInfo.getProvince(), transDb);
        return ret;

    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        VerizonRegInfo ret = (VerizonRegInfo) super.makeRegInfo();
        ret.setRegFull(VerizonReg.getActiveCount(db) >= Constants.MAX_VERIZON_REGISTRATIONS);
        return ret;
    }

}

package com.topcoder.web.screening.model;

import java.text.SimpleDateFormat;
import java.util.Map;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;

import com.topcoder.web.common.security.PrincipalMgr;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.common.ScreeningException;

public class EmailInfo extends BaseModel {
    private static DataAccess access;

    private SessionInfo sessionInfo;
    private String subject;
    private String repSubject;
    private String candidateAddress;
    private String candidatePassword;
    private String candidateHandle;
    private long   companyId;
    private String companyName;
    private String repName;
    private String repAddress;

    private static final String REP_FROM_ADDRESS = "tct@topcoder.com";

    public EmailInfo() {
        subject = "Example Email";
        candidateAddress = "somecandidate@candidateaddress.com";
        candidateHandle = "candidate";
        candidatePassword = "password";
        repName = "Rep Name";
        companyName ="Rep's Company";
        repAddress = "rep@somecompany.com";
    }

    /**
     * Sets the value of <code>sessionInfo</code>.
     *
     * @param val
     */
    public void setSessionInfo( SessionInfo val ) {
        sessionInfo = val;
    }

    /**
     * Gets the value of <code>sessionInfo</code>.
     *
     * @return
     */
    public SessionInfo getSessionInfo() {
        return sessionInfo;
    }

    /**
     * Sets the value of <code>subject</code>.
     *
     * @param val
     */
    public void setSubject( String val ) {
        subject = val;
    }

    /**
     * Gets the value of <code>subject</code>.
     *
     * @return
     */
    public String getSubject() {
        return subject;
    }

    /**
     * Gets the value of <code>msgText</code>.
     *
     * @return
     */
    public String getMsgText() {
        if(sessionInfo == null) return null;
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy hh:mm aa");
        StringBuffer msgText = new StringBuffer(1000);
        msgText.append("Thank you for your interest in working at ");
        msgText.append(companyName);
        msgText.append(".  We would like you to participate in the Private Candidate Testing Application powered by ");
        msgText.append("TopCoder.  Through this Testing Application, you will be asked to solve algorithmic problems ");
        msgText.append("as an objective measure of your programming ability. Your results will then be compared to ");
        msgText.append("other candidates being evaluated for the same position.");
        msgText.append("\n\n");
        msgText.append("Please review the Help Manual before getting started: ");
        msgText.append("http://corporate.topcoder.com/testing/help/index.jsp");
        msgText.append("\n\n");
        msgText.append("The following session has been scheduled for you:");
        msgText.append("\n\n");
        msgText.append("Begin: ");
        msgText.append(sdf.format(sessionInfo.getBeginDate()));
        msgText.append("\n");
        msgText.append("End: ");
        msgText.append(sdf.format(sessionInfo.getEndDate()));
        msgText.append("\n");
        msgText.append("Login:  ");
        msgText.append(candidateHandle);
        msgText.append("\n");
        msgText.append("Password:  ");
        msgText.append(candidatePassword);
        msgText.append("\n\n");
        msgText.append("PLEASE NOTE THAT YOU MUST COMPLETE ALL PORTIONS OF THE TESTING APPLICATION PRIOR TO THE END ");
        msgText.append("TIME SHOWN ABOVE.  YOU SHOULD ALLOW APPROXIMATELY 2 HOURS TO COMPLETE ALL PORTIONS OF THE TEST.");
        msgText.append("\n\n");
        msgText.append("Windows, Linux and Unix users need to have the Java 1.4.x runtime installed and can access ");
        msgText.append("the Testing Application here: http://corporate.topcoder.com/testing/testingApp.jsp?company=");
        msgText.append(companyId);
        msgText.append("\n\n");
        msgText.append("Mac OS X users need to have the Java 1.4.x runtime installed, which requires OS X version ");
        msgText.append("10.2.x.  Those users may access the Testing Application here: ");
        msgText.append("http://corporate.topcoder.com/testing/testingApp.jsp?company=");
        msgText.append(companyId);
        msgText.append("\n\n");
        msgText.append("Thank you,\n");
        msgText.append(repName);
        msgText.append("\n");
        msgText.append(companyName);

        return msgText.toString();
    }

    private String getRepMsgText() {
        if(sessionInfo == null) return null;
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy hh:mm aa");
        StringBuffer msgText = new StringBuffer(1000);
        msgText.append(candidateHandle);
        msgText.append(" has been scheduled to participate in the Testing ");
        msgText.append("Application powered by TopCoder during the following times:");
        msgText.append("\n");
        msgText.append("\n");
        msgText.append("Begin: ");
        msgText.append(sdf.format(sessionInfo.getBeginDate()));
        msgText.append("\n");
        msgText.append("End: ");
        msgText.append(sdf.format(sessionInfo.getEndDate()));
        msgText.append("\n");
        msgText.append("\n");
        msgText.append("Access this individual's information by logging into the Testing Application ");
        msgText.append("Management Tool http://corporate.topcoder.com/testing and clicking on Candidates.");
        msgText.append("\n");
        msgText.append("\n");
        msgText.append("Thank you,");
        msgText.append("\n");
        msgText.append("The TopCoder Employment Services Team");
        return msgText.toString();
    }

    /**
     * Gets the value of <code>msgText</code> with changes made
     * so that it will be formatted appropriately in html.
     *
     * @return
     */
    public String getHTMLMsgText() {
        return StringUtils.htmlEncode(getMsgText());
    }


    /**
     * Sets the value of <code>candidateAddress</code>.
     *
     * @param val
     */
    public void setCandidateAddress( String val ) {
        candidateAddress = val;
    }

    /**
     * Gets the value of <code>candidateAddress</code>.
     *
     * @return
     */
    public String getCandidateAddress() {
        return candidateAddress;
    }

    /**
     * Sets the value of <code>candidatePassword</code>.
     *
     * @param val
     */
    public void setCandidatePassword( String val ) {
        candidatePassword = val;
    }

    /**
     * Gets the value of <code>candidatePassword</code>.
     *
     * @return
     */
    public String getCandidatePassword() {
        return candidatePassword;
    }

    /**
     * Sets the value of <code>candidateHandle</code>.
     *
     * @param val
     */
    public void setCandidateHandle( String val ) {
        candidateHandle = val;
    }

    /**
     * Gets the value of <code>candidateHandle</code>.
     *
     * @return
     */
    public String getCandidateHandle() {
        return candidateHandle;
    }

    /**
     * Sets the value of <code>companyId</code>.
     *
     * @param val
     */
    public void setCompanyId( long val ) {
        companyId = val;
    }

    /**
     * Gets the value of <code>companyId</code>.
     *
     * @return
     */
    public long getCompanyId() {
        return companyId;
    }

    /**
     * Sets the value of <code>companyName</code>.
     *
     * @param val
     */
    public void setCompanyName( String val ) {
        companyName = val;
    }

    /**
     * Gets the value of <code>companyName</code>.
     *
     * @return
     */
    public String getCompanyName() {
        return companyName;
    }

    /**
     * Sets the value of <code>repName</code>.
     *
     * @param val
     */
    public void setRepName( String val ) {
        repName = val;
    }

    /**
     * Gets the value of <code>repName</code>.
     *
     * @return
     */
    public String getRepName() {
        return repName;
    }

    /**
     * Sets the value of <code>repAddress</code>.
     *
     * @param val
     */
    public void setRepAddress( String val ) {
        repAddress = val;
    }

    /**
     * Gets the value of <code>repAddress</code>.
     *
     * @return
     */
    public String getRepAddress() {
        return repAddress;
    }

    public String getRepSubject() {
        return repSubject;
    }

    public void setRepSubject(String repSubject) {
        this.repSubject = repSubject;
    }

    public void sendEmail() throws Exception {
        if(sessionInfo.useCandidateEmail()) {
            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject(getSubject());
            mail.setBody(getMsgText());
            mail.addToAddress(candidateAddress, TCSEmailMessage.TO);
            mail.setFromAddress(repAddress);
            EmailEngine.send(mail);
        }

        if(sessionInfo.useRepEmail()) {
            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject(getRepSubject());
            mail.setBody(getRepMsgText());
            mail.addToAddress(repAddress, TCSEmailMessage.TO);
            mail.setFromAddress(REP_FROM_ADDRESS);
            EmailEngine.send(mail);
        }

    }

    public static EmailInfo createEmailInfo(SessionInfo info, User repInfo)
        throws Exception {
        EmailInfo emailInfo = new EmailInfo();
        emailInfo.setSessionInfo(info);
        PrincipalMgr mgr = new PrincipalMgr();
        long candidateId = Long.parseLong(info.getCandidateId());
        emailInfo.setCandidatePassword(mgr.getPassword(candidateId));

        if(access == null) {
            InitialContext context = new InitialContext();
            DataSource ds = (DataSource)
                PortableRemoteObject.narrow(
                        context.lookup(Constants.DATA_SOURCE),
                                            DataSource.class);

            access = new DataAccess(ds);
        }

        Request emailLookup = new Request();
        emailLookup.setProperty(DataAccessConstants.COMMAND,
                Constants.EMAIL_LOOKUP_COMMAND);

        emailLookup.setProperty("uid", String.valueOf(repInfo.getId()));
        emailLookup.setProperty("cid", info.getCandidateId());
        Map map = access.getData(emailLookup);
        ResultSetContainer rsc = (ResultSetContainer)
                    map.get(Constants.REP_EMAIL_INFO_QUERY_KEY);
        if(rsc.size() == 0) {
            throw new ScreeningException(
                    "Data Error, Rep Email info not found - uid " +
                    repInfo.getId());
        }
        if(rsc.size() > 1) {
            throw new ScreeningException(
                    "Data Error, Rep Email info returned too many results (" +
                    rsc.size() + ") - uid " + repInfo.getId());
        }

        ResultSetContainer.ResultSetRow row =
            (ResultSetContainer.ResultSetRow)rsc.get(0);
        emailInfo.setCompanyId(
                Long.parseLong(row.getItem("company_id").toString()));
        emailInfo.setCompanyName(row.getItem("company_name").toString());
        emailInfo.setRepName(row.getItem("rep_name").toString());
        emailInfo.setRepAddress(row.getItem("email_address").toString());

        rsc = (ResultSetContainer)
            map.get(Constants.CANDIDATE_EMAIL_INFO_QUERY_KEY);
        if(rsc.size() == 0) {
            throw new ScreeningException(
                    "Data Error, Candidate Email info not found - cid " +
                    info.getCandidateId());
        }
        if(rsc.size() > 1) {
            throw new ScreeningException(
                    "Data Error, Candidate Email info returned too many results (" +
                    rsc.size() + ") - cid " + info.getCandidateId());
        }

        row = (ResultSetContainer.ResultSetRow)rsc.get(0);
        emailInfo.setCandidateAddress(row.getItem("email_address").toString());
        emailInfo.setCandidateHandle(row.getItem("handle").toString());

        emailInfo.setSubject("Invitation to Private Candidate Testing Application");
        emailInfo.setRepSubject("Testing Application scheduled for " + emailInfo.getCandidateHandle());

        return emailInfo;
    }
}

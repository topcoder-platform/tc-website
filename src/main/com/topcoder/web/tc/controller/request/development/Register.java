package com.topcoder.web.tc.controller.request.development;

import com.topcoder.dde.catalog.ComponentManager;
import com.topcoder.dde.catalog.ComponentManagerHome;
import com.topcoder.dde.catalog.ComponentVersionInfo;
import com.topcoder.dde.catalog.Forum;
import com.topcoder.dde.user.UserManagerRemote;
import com.topcoder.dde.user.UserManagerRemoteHome;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.*;
import com.topcoder.util.format.ObjectFormatter;
import com.topcoder.util.format.ObjectFormatterFactory;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.tag.CalendarDateFormatMethod;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.project.Project;
import com.topcoder.web.ejb.project.ProjectLocal;
import com.topcoder.web.tc.Constants;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.transaction.TransactionManager;
import javax.transaction.Status;
import java.rmi.RemoteException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Map;
import java.util.TimeZone;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 6, 2006
 */
public class Register extends ViewRegistration {
    protected void developmentProcessing() throws TCWebException {

        try {
            //check if user can do the project (there's like 10 things to check.
            //if they can't, give them error message
            //if they can, check if they are registered for the tco
            //if they are not registered,
            //if they don't have final confirm flag
            //add a flag to the request and send them to a confirm page
            //register and go to success page
            validation();

            boolean agreed = "on".equals(getRequest().getParameter(Constants.TERMS_AGREE));
            if (agreed) {
                boolean isEligible = getRequest().getAttribute(Constants.MESSAGE) == null;
                if (isEligible) {
                    if (isTournamentTime()) {
                        boolean isRegisteredForTournament = getRequest().getAttribute("notRegistered") == null;
                        boolean isConfirmed = getRequest().getParameter("confirm") != null;
                        if (isRegisteredForTournament || isConfirmed) {
                            register();
                            //send email
                            setNextPage("/dev/regSuccess.jsp");
                            setIsNextPageInContext(true);
                        } else {
                            setNextPage("/dev/tournamentConfirm.jsp");
                            setIsNextPageInContext(true);
                        }
                    } else {
                        register();
                        setNextPage("/dev/regSuccess.jsp");
                        setIsNextPageInContext(true);
                    }
                } else {
                    setNextPage("/dev/message.jsp");
                    setIsNextPageInContext(true);
                }
            } else {
                getRequest().setAttribute("questionInfo", buildQuestions());
                setDefault(Constants.PROJECT_ID, getRequest().getParameter(Constants.PROJECT_ID));
                setNextPage("/dev/regTerms.jsp");
                setNextPage("true");
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private void register() throws Exception, RemoteException, CreateException {
        InitialContext ctx = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.TCS_APP_SERVER_URL);
            log.debug("creating user");
            Object objUserManager = ctx.lookup(UserManagerRemoteHome.EJB_REF_NAME);
            UserManagerRemoteHome userManagerHome = (UserManagerRemoteHome) PortableRemoteObject.narrow(objUserManager, UserManagerRemoteHome.class);
            UserManagerRemote userManager = userManagerHome.create();

            //we can assume it's valid, we've done the validation already
            long projectId = Long.parseLong(getRequest().getParameter(Constants.PROJECT_ID));

            ProjectLocal pl = (ProjectLocal) createLocalEJB(getInitialContext(), Project.class);
            long componentId = pl.getComponentId(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME);
            int phase = 111 + pl.getProjectTypeId(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME);

            Object objComponentManager = ctx.lookup(ComponentManagerHome.EJB_REF_NAME);
            ComponentManagerHome componentManagerHome =
                    (ComponentManagerHome) PortableRemoteObject.narrow(objComponentManager, ComponentManagerHome.class);
            ComponentManager componentManager = componentManagerHome.create(componentId);
            String project = componentManager.getComponentInfo().getName() +
                    (phase==ComponentVersionInfo.SPECIFICATION?"Design":"Development");
            long activeForumId = componentManager.getActiveForum(Forum.SPECIFICATION).getId();


            TransactionManager tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);

            try {
                tm.begin();
                userManager.registerForProject(getUser().getId(), getRequest().getParameter("Comment"), projectId);
                tm.commit();
            } catch (Exception e) {
                if (tm != null && tm.getStatus() == Status.STATUS_ACTIVE) {
                    tm.rollback();
                }
                throw e;
            }

            TCSEmailMessage mail = new TCSEmailMessage();
            Email e = (Email)createEJB(getInitialContext(), Email.class);
            mail.addToAddress(e.getAddress(e.getPrimaryEmailId(getUser().getId(), DBMS.OLTP_DATASOURCE_NAME),
                    DBMS.OLTP_DATASOURCE_NAME), TCSEmailMessage.TO);
            mail.setFromAddress("service@topcodersoftware.com");
            mail.setSubject(project);

            Request r = new Request();
            r.setContentHandle("project_detail");
            r.setProperty(Constants.PROJECT_ID, String.valueOf(projectId));
            Map resultMap = getDataAccess().getData(r);
            ResultSetContainer details = (ResultSetContainer) resultMap.get("project_detail");
            Timestamp submitDeadline = (Timestamp)details.getItem(0, "initial_submission_date").getResultData();
            Calendar cal = Calendar.getInstance();
            cal.setTime(submitDeadline);
            cal.setTimeZone(TimeZone.getDefault());

            ObjectFormatter formatter = ObjectFormatterFactory.getEmptyFormatter();
            formatter.setFormatMethodForClass(Calendar.class,
                                new CalendarDateFormatMethod("MM.dd.yyyy HH:mm a z"), true);
            String date = formatter.format(cal);

            if (phase == ComponentVersionInfo.SPECIFICATION) {
                mail.setBody("Registration Complete. \n\n" +
                        "Thank you, " + getUser().getUserName() + ", for your interest in the " + project + " component. You now have access to the Developer Forum ( http://" + ApplicationServer.SOFTWARE_SERVER_NAME + "/forum/c_forum.jsp?f=" + activeForumId + " ) which can be used to obtain design documentation (see the Design Phase Documents thread), as well as to ask questions regarding the component design. Please post your questions at any time and a product manager will respond within 24 hours. Any questions asked within 6 hours of the submission due date/time may not be answered in time, so get your questions in early!\n\n" +
                        "The deadline for submitting a solution is " + date + ". Please upload your design using the project page found here: http://" + ApplicationServer.SOFTWARE_SERVER_NAME + "/review.  If you encounter any problems, please contact us at service@topcodersoftware.com.  All late submissions will be ignored.\n\n" +
                        "If you have any questions please contact service@topcodersoftware.com\n\n" +
                        "TopCoder Software Team");

            } else {

                mail.setBody("Registration Complete\n\n" +
                        "Thank you, " + getUser().getUserName() + ", for your interest in the " + project + " component. You now have access to the Developer Forum ( http://" + ApplicationServer.SOFTWARE_SERVER_NAME + "/forum/c_forum.jsp?f=" + activeForumId + " ) which can be used to obtain the component design (See \"Development Phase Documents\" thread), as well as to ask questions regarding the development process or the component design. Please post your questions at any time and the component designer will respond within 24 hours. Any questions asked within 6 hours of the submission due date/time may not be answered, so get your questions in early!\n\n" +
                        "The deadline for submitting a solution is " + date + ". Please upload your solution using the project page found here: http://" + ApplicationServer.SOFTWARE_SERVER_NAME + "/review. If you encounter any problems, please contact us at service@topcodersoftware.com.  Any late submissions will be ignored. \n\n" +
                        "If you have any questions please contact service@topcodersoftware.com\n\n" +
                        "TopCoder Software Team");
            }
            EmailEngine.send(mail);


        } finally {
            close(ctx);
        }


    }
}
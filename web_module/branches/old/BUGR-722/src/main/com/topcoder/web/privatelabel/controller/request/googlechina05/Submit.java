package com.topcoder.web.privatelabel.controller.request.googlechina05;

import com.topcoder.web.privatelabel.controller.request.BaseActivate;
import com.topcoder.web.privatelabel.controller.request.ResumeRegSubmit;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.ejb.user.User;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.Request;

import java.util.*;

/**
 * @author dok
 * @version $Revision: 53709 $ $Date$
 *          Create Date: Oct 31, 2005
 */
public class Submit extends ResumeRegSubmit {


    protected void setNextPage() {
        Calendar end = Calendar.getInstance();
        end.set(2005, Calendar.DECEMBER, 11, 20, 0);
        Calendar beginning = Calendar.getInstance();
        //beginning.set(2005, Calendar.JULY, 25, 9, 0);
        beginning.set(2005, Calendar.OCTOBER, 31, 9, 0);

        Calendar now = Calendar.getInstance();
        now.setTime(new Date());

        if (now.before(beginning) || now.after(end)) {
            setNextPage(getBundle().getProperty("google_china_05_reg_closed_page"));
            setIsNextPageInContext(true);
        } else {
            if (isEligible((FullRegInfo) regInfo)) {
                if (hasErrors()) {
                    setNextPage(getBundle().getProperty("google_china_05_reg_page"));
                    setIsNextPageInContext(true);
                } else {
                    SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
                    StringBuffer buf = new StringBuffer(150);
                    buf.append(info.getAbsoluteServletPath());
                    buf.append("?");
                    buf.append(Constants.MODULE_KEY);
                    buf.append("=");
                    buf.append(Constants.STATIC);
                    buf.append(getBundle().getProperty("google_china_05_reg_success_page"));
                    setNextPage(buf.toString());
                    setIsNextPageInContext(false);
                }
            } else {
                throw new RuntimeException("impossible, isEligible returned false, fix the code");
            }
        }
    }

    protected void handleActivation(SimpleRegInfo info, long userId) throws TCWebException {
        try {
            StringBuffer buf = new StringBuffer(1000);
            User user = (User) createEJB(getInitialContext(), User.class);
            String code = user.getActivationCode(userId, db);

            TCSEmailMessage mail = new TCSEmailMessage();

            if (getLocale().getLanguage().equals(Locale.US.getLanguage())) {
                mail.setSubject("IMPORTANT - Google Code Jam China Activation Email");

                buf.append("You're invited to take part in the Google Code Jam China, a programming competition that will be worthy of your time, your skills and your interest.\n\n");
                buf.append("GOOGLE CODE JAM China ACTIVATION INFORMATION\n\n");
                buf.append("Your Google activation code is ");
                buf.append(code);
                buf.append("\n\n");
                buf.append("To activate your account, navigate to the following WWW URL:\n\n");
                buf.append(getUrl(code));
                buf.append("\n\n");
                buf.append("If you cannot click on the web address above, please copy the address into your web browser to continue.  If the address spans two lines, please make sure you copy and paste both sections without any spaces between them.\n\n");
                buf.append("Your handle and password will provide you with access to the Competition Arena, where you can practice and chat, and where you'll compete in the Google Code Jam China.\n\n");
                buf.append("PRACTICING FOR THE EVENT\n");
                buf.append("There is a practice room available to you that will allow you to become acclimated with the competition environment before you participate in the Google Code Jam China.  The practice room contains a problem set that will be very similar in nature to the problems you will encounter during competition.  The practice room will be available from 9:00AM GMT +8 on November 21, 2005 through 5:00PM GMT +8 on January 20, 2006.\n\n");
                buf.append("You can access the practice rooms by navigating to http://www.topcoder.com/gcjc and clicking on the Competition Arena tab.\n\n");
                buf.append("COMPETING IN THE QUALIFICATION ROUND\n");
                buf.append("You may participate in the Qualification Round at any time between Monday, December 12 at Noon GMT +8 and Tuesday, December 13 at Noon GMT +8.  You will have up to one hour to solve two problems.  It is recommended that you utilize the practice area prior to participating in the qualification.\n\n");
                buf.append("LAUNCHING THE ARENA\n");
                buf.append("You can launch and login to the competition arena at the appropriate time by navigating to http://www.topcoder.com/gcjc and clicking on the Competition Arena tab.\n\n");
                buf.append("You will need to have the Java 1.4.x runtime installed in order to launch the arena.\n\n");
                buf.append("We also suggest that you read up on the competition process by navigating to http://www.topcoder.com/gcjc and clicking the Instructions link at the top.\n\n");
                buf.append("If you have any questions about how to participate, please email them to gcjc@topcoder.com\n\n");
                buf.append("Thank you for registering for the Google Code Jam China.  We look forward to seeing you in the Arena!\n\n");

            } else {

                buf.append("您被�?请参加Google中国编程挑战赛，�?项将会对得起您的时间，能力和个人兴趣的计算机编程比赛\n\n");

                buf.append("Google中国编程挑战赛参赛激活信息\n\n");

                buf.append("您的Google�?活代码是�?");
                buf.append(code);
                buf.append("\n\n");

                buf.append("请到下面的互联网URL地址�?活您的帐号：\n\n");
                buf.append(getUrl(code));
                buf.append("\n\n");

                buf.append("如果您不能点击上面的网络地址，请拷贝那个地址到您浏览器的地址栏然后继续激活过程�?�如果那个网络地�?分开到了两行，请注意两行都要拷贝到浏览器的地�?栏，并且两行中间不能有空格�?�\n\n");

                buf.append("使用您的帐号名和密码您可以登录到比赛竞技场，那里将是您参加Google中国编程挑战赛的地方。在那里您也可以训练和聊天�?�\n\n");

                buf.append("比赛训练\n");
                buf.append("在比赛竞�?场里有一个训练室，在那里您可以在Google中国编程挑战赛正式比赛之前熟悉一下比赛环境�?�训练室中的题目和正式比赛时的题目形式非常相似�?�训练室�?放时间：从格林威治＋8时区时间2005�?11�?21日上�?9点到格林威治�?8时区时间2006�?1�?20日下�?5点�?�\n\n");

                buf.append("按照如下说明可以进入训练室：访问网页http://www.topcoder.com/gcjc_zh，然后点击比赛竞�?场（Competition Arena）标签�??");

                buf.append("参加资格赛\n");
                buf.append("资格赛的比赛时间是：从格林威治＋8时区时间2005�?12�?12号星期一正午12点到格林威治�?8时区时间2005�?12�?13号星期二正午12点�?�您可以在此段时间中的任何时间参加比赛�?�您将会有一个小时的时间解答两个题目。我们推荐您在参加资格赛前使用训练室熟悉�?下环境�?�\n\n");
                buf.append("运行竞技场程序\n");
                buf.append("在合适的时间您可以按照以下说明运行并且登录比赛竞�?场：访问网页http://www.topcoder.com/gcjc_zh，然后点击比赛竞�?场（Competition Arena）标签�?�\n\n");

                buf.append("为了运行竞技场程序，您必须安装Java 1.4.x 运行环境。\n\n");
                buf.append("我们建议您仔细阅读以下网页中的比赛说明：访问网页http://www.topcoder.com/gcjc_zh，然后点击上面的说明（Instructions）链接�?�\n\n");
                buf.append("如果您有关于参赛的任何问题，请将您的问题发至电子邮件地址：gcjc@topcoder.com\n\n");
                buf.append("感谢您注册加入Google中国编程挑战赛�?�我们期待在竞技场中看到您的身影。\n\n");

            }

            mail.setBody(buf.toString());
            mail.addToAddress(info.getEmail(), TCSEmailMessage.TO);
            mail.setFromAddress("gcjc@topcoder.com", "Google Code Jam Team");
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
        buf.append(Constants.GOOGLE_CHINA_05_ACTIVATION);
        buf.append("&");
        buf.append(BaseActivate.ACTIVATION_CODE);
        buf.append("=");
        buf.append(code);
        buf.append("&");
        buf.append(Constants.COMPANY_ID);
        buf.append("=");
        buf.append(regInfo.getCompanyId());
        buf.append("&");
        buf.append(Constants.LOCALE);
        buf.append("=");
        buf.append(getLocale().getLanguage());
        return buf.toString();
    }

    protected ResultSetContainer getCountryList() throws TCWebException {
        try {
            Request request = new Request();
            request.setContentHandle("country_list_google");
            Map map = getDataAccess(transDb, true).getData(request);
            if (map == null)
                throw new Exception("error getting country list from db");
            else
                return (ResultSetContainer) map.get("country_list_google");
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}

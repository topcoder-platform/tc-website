bpackage com.topcoder.web.tces.bean;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tces.common.*;

import javax.servlet.http.*;
import java.io.Serializable;
import java.math.BigInteger;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.*;

/**
 * Processes the member profile task.
 * @author bigjake <kitz@mit.edu>
 *
 */

public class MemberProfileTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(MemberProfileTask.class);

    private int campaignID;
    private int jobID;
    private int memberID;
    private Map memberInfo;
    private String jobName;
    private String companyName;
    private List statsByLevel;
    private List statsByLang;
    private boolean isStudent;

    private int uid;

    public MemberProfileTask() {
        super();
        setNextPage(TCESConstants.MEMBER_PROFILE_PAGE);

        uid=-1;

        setJobID(-1);
        setCampaignID(-1);
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public boolean getIsStudent() {
        return isStudent;
    }

    public void setIsStudent(boolean isStudent) {
        this.isStudent = isStudent;
    }

    public List getStatsByLevel() {
        return statsByLevel;
    }

    public void setStatsByLevel(List statsByLevel) {
        this.statsByLevel = statsByLevel;
    }

    public List getStatsByLang() {
        return statsByLang;
    }

    public void setStatsByLang(List statsByLang) {
        this.statsByLang = statsByLang;
    }

    public int getCampaignID() {
        return campaignID;
    }

    public void setCampaignID(int campaignID) {
        this.campaignID = campaignID;
    }

    public int getJobID() {
        return jobID;
    }

    public void setJobID(int jobID) {
        this.jobID = jobID;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }

    public Map getMemberInfo() {
        return memberInfo;
    }

    public void setMemberInfo(Map memberInfo) {
        this.memberInfo = memberInfo;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }


    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        HttpSession session = request.getSession(true);

        Integer userId = (Integer)session.getAttribute("user_id");
        if (userId == null || (userId.intValue()<0) ) {
            log.debug("User not authenticated for TCES access.");
            throw new Exception("User not authenticated for TCES access.");
        }

        uid = userId.intValue();
    }

    public void processStep(String step)
        throws Exception
    {
        viewMemberProfile();
    }

    private void viewMemberProfile() throws Exception
    {
        NumberFormat decFmt = TCESConstants.NUMBER_FORMAT;

        Map memberInfo = new HashMap();
        ArrayList statsByLevel = new ArrayList();
        ArrayList statsByLang = new ArrayList();

        setStatsByLevel(statsByLevel);
        setStatsByLang(statsByLang);
        setMemberInfo(memberInfo);

        // set up Data Warehouse query command.
        Request dwDataRequest = new Request();
        dwDataRequest.setContentHandle("tces_member_profile");
        dwDataRequest.setProperty("mid", Integer.toString(getMemberID()) );

        DataAccessInt dw = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.DW_DATASOURCE_NAME));
        Map dwResultMap = dw.getData(dwDataRequest);
        ResultSetContainer dwRSC = null;

        // set up OLTP query command.
        Request oltpDataRequest = new Request();
        oltpDataRequest.setContentHandle("tces_member_profile");
        oltpDataRequest.setProperty("uid", Integer.toString(uid) );
        oltpDataRequest.setProperty("jid", Integer.toString(getJobID()) );
        oltpDataRequest.setProperty("cid", Integer.toString(getCampaignID()) );
        oltpDataRequest.setProperty("mid", Integer.toString(getMemberID()) );

        DataAccessInt oltp = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.OLTP_DATASOURCE_NAME));
        Map oltpResultMap = oltp.getData(oltpDataRequest);

        // verify that campaign/job/tces user have access to this members's info.
        ResultSetContainer oltpRSC = (ResultSetContainer) oltpResultMap.get("TCES_Verify_Member_Access");
        if (oltpRSC.getRowCount() == 0) {
            throw new Exception (" mid="+Integer.toString(getMemberID())
                                 + " jid="+Integer.toString(getJobID())
                                 + " cid="+Integer.toString(getCampaignID())
                                 + "does not belong to uid="+Integer.toString(uid) );
        }

        // start packaging data for presentation.

        oltpRSC = (ResultSetContainer) oltpResultMap.get("TCES_Company_Name");
        ResultSetContainer.ResultSetRow cmpyNameRow = oltpRSC.getRow(0);
        setCompanyName( cmpyNameRow.getItem("company_name").toString() );

        oltpRSC = (ResultSetContainer) oltpResultMap.get("TCES_Member_Handle");
        ResultSetContainer.ResultSetRow memHdlRow = oltpRSC.getRow(0);
        memberInfo.put(TCESConstants.MEM_INFO_HANDLE_KEY, memHdlRow.getItem("handle").toString());

        oltpRSC = (ResultSetContainer) oltpResultMap.get("TCES_Position_Name");
        ResultSetContainer.ResultSetRow posNameRow = oltpRSC.getRow(0);
        setJobName( posNameRow.getItem("job_desc").toString() );

        oltpRSC = (ResultSetContainer) oltpResultMap.get("TCES_Member_Profile");
        ResultSetContainer.ResultSetRow memProfRow = oltpRSC.getRow(0);
        memberInfo.put(TCESConstants.MEM_INFO_FULLNAME_KEY ,
                            memProfRow.getItem("first_name").toString() + " " +
                            memProfRow.getItem("last_name").toString() );
        memberInfo.put(TCESConstants.MEM_INFO_FULLADDR_KEY ,
                            memProfRow.getItem("address1").toString() +
                            ((memProfRow.getItem("address2").toString().trim().length() > 0)?
                                ("<BR>"+memProfRow.getItem("address2").toString()+"<BR>")
                                : "<BR>" ) +
                            memProfRow.getItem("city").toString() +
                            ", " +
                            memProfRow.getItem("state_code").toString() +
                            " " +
                            memProfRow.getItem("zip"));
        memberInfo.put(TCESConstants.MEM_INFO_CONTACT_KEY,
                            memProfRow.getItem("email").toString() +
                            " | " +
                            memProfRow.getItem("home_phone").toString() );
        if (memProfRow.getItem("coder_type_desc").toString().toUpperCase().indexOf("STUDENT")>=0)
            setIsStudent(true);
        else
            setIsStudent(false);

        memberInfo.put(TCESConstants.MEM_INFO_MEMTYPE_KEY,
                            memProfRow.getItem("coder_type_desc").toString() );
        memberInfo.put(TCESConstants.MEM_INFO_SCHOOLNAME_KEY,
                            memProfRow.getItem("school_name").toString() );
        memberInfo.put(TCESConstants.MEM_INFO_DEGREE_KEY,
                            memProfRow.getItem("degree").toString() );
        memberInfo.put(TCESConstants.MEM_INFO_MAJOR_KEY,
                            memProfRow.getItem("major").toString() );
        memberInfo.put(TCESConstants.MEM_INFO_GRADDATE_KEY,
                            ((memProfRow.getItem("grad_month").toString.trim().length()>0)?
                                memProfRow.getItem("grad_month").toString() + ", " : "" ) +
                            memProfRow.getItem("grad_year").toString() );

        dwRSC = (ResultSetContainer) dwResultMap.get("TCES_Coder_Stats");
        ResultSetContainer.ResultSetRow memStatsRow = dwRSC.getRow(0);
        memberInfo.put(TCESConstants.MEM_RATING_CURRENT_KEY,
                            memStatsRow.getItem("rating").toString());
        memberInfo.put(TCESConstants.MEM_RATING_HIGH_KEY,
                            memStatsRow.getItem("highest_rating").toString() );
        memberInfo.put(TCESConstants.MEM_RATING_LOW_KEY,
                            memStatsRow.getItem("lowest_rating").toString() );
        memberInfo.put(TCESConstants.MEM_RATING_PCTILE_KEY,
                            memStatsRow.getItem("percentile").toString() );
        memberInfo.put(TCESConstants.MEM_RATING_NUMEVENTS_KEY,
                            memStatsRow.getItem("num_ratings").toString() );
        memberInfo.put(TCESConstants.MEM_RATING_MOSTRECENT_KEY,
                            getDate(memStatsRow,"last_rated_event") );
        memberInfo.put(TCESConstants.MEM_RATING_AVGPOINTS_KEY,
                            decFmt.format(Double.parseDouble(memStatsRow.getItem("avg_final_points").toString())) );


        dwRSC = (ResultSetContainer) dwResultMap.get("TCES_Coder_Stats_by_Level");
        ResultSetContainer.ResultSetRow memStatLvlRow = null;
        for (int rowI=0;rowI<dwRSC.getRowCount();rowI++) {
            memStatLvlRow = dwRSC.getRow(rowI);
            Map level = new HashMap();

            level.put( TCESConstants.MEM_RATING_STATSBYLEVEL_KEYS[0],
                       memStatLvlRow.getItem("level_desc").toString() );
            level.put( TCESConstants.MEM_RATING_STATSBYLEVEL_KEYS[1],
                       memStatLvlRow.getItem("presented").toString() );
            level.put( TCESConstants.MEM_RATING_STATSBYLEVEL_KEYS[2],
                       memStatLvlRow.getItem("submitted").toString() );
            level.put( TCESConstants.MEM_RATING_STATSBYLEVEL_KEYS[3],
                       decFmt.format( Double.parseDouble(memStatLvlRow.getItem("submit_percent").toString()) )+"%" );
            level.put( TCESConstants.MEM_RATING_STATSBYLEVEL_KEYS[4],
                       memStatLvlRow.getItem("correct").toString() );
            level.put( TCESConstants.MEM_RATING_STATSBYLEVEL_KEYS[5],
                       decFmt.format( Double.parseDouble(memStatLvlRow.getItem("submission_accuracy").toString()) ) +"%");
            level.put( TCESConstants.MEM_RATING_STATSBYLEVEL_KEYS[6],
                       decFmt.format( Double.parseDouble(memStatLvlRow.getItem("overall_accuracy").toString()) )+"%" );
            level.put( TCESConstants.MEM_RATING_STATSBYLEVEL_KEYS[7],
                       decFmt.format( Double.parseDouble(memStatLvlRow.getItem("avg_submission_points").toString()) ) );
            level.put( TCESConstants.MEM_RATING_STATSBYLEVEL_KEYS[8],
                       decFmt.format( Double.parseDouble(memStatLvlRow.getItem("avg_final_points").toString()) ) );
            level.put( TCESConstants.MEM_RATING_STATSBYLEVEL_KEYS[9],
                       JSPUtils.timeFormat(memStatLvlRow.getItem("avg_time_elapsed")) );

            statsByLevel.add(level);
        }
        // make a total row and add it to the maplist
        Map totalLevel = new HashMap();
        totalLevel.put( TCESConstants.MEM_RATING_STATSBYLEVEL_KEYS[0],
                        "All" );

        dwRSC = (ResultSetContainer) dwResultMap.get("TCES_Coder_Stats");
        ResultSetContainer.ResultSetRow memStatRow = dwRSC.getRow(0);

        totalLevel.put( TCESConstants.MEM_RATING_STATSBYLEVEL_KEYS[1],
                   memStatRow.getItem("total_presented").toString() );
        totalLevel.put( TCESConstants.MEM_RATING_STATSBYLEVEL_KEYS[2],
                   memStatRow.getItem("total_submitted").toString() );
        totalLevel.put( TCESConstants.MEM_RATING_STATSBYLEVEL_KEYS[3],
                   decFmt.format( Double.parseDouble(memStatRow.getItem("total_submit_percent").toString()) )+"%" );
        totalLevel.put( TCESConstants.MEM_RATING_STATSBYLEVEL_KEYS[4],
                   memStatRow.getItem("correct").toString() );
        totalLevel.put( TCESConstants.MEM_RATING_STATSBYLEVEL_KEYS[5],
                   decFmt.format( Double.parseDouble(memStatRow.getItem("total_submission_accuracy").toString()) ) +"%");
        totalLevel.put( TCESConstants.MEM_RATING_STATSBYLEVEL_KEYS[6],
                   decFmt.format( Double.parseDouble(memStatRow.getItem("total_overall_accuracy").toString()) )+"%" );
        totalLevel.put( TCESConstants.MEM_RATING_STATSBYLEVEL_KEYS[7],
                   decFmt.format( Double.parseDouble(memStatRow.getItem("avg_submission_points").toString()) ) );
        totalLevel.put( TCESConstants.MEM_RATING_STATSBYLEVEL_KEYS[8],
                   decFmt.format( Double.parseDouble(memStatRow.getItem("avg_final_points").toString()) ) );
        totalLevel.put( TCESConstants.MEM_RATING_STATSBYLEVEL_KEYS[9],
                   JSPUtils.timeFormat(memStatRow.getItem("avg_time_elapsed")) );

        statsByLevel.add(totalLevel);


        dwRSC = (ResultSetContainer) dwResultMap.get("TCES_Coder_Stats_by_Language");
        ResultSetContainer.ResultSetRow memStatLangRow = null;
        for (int rowI=0;rowI<dwRSC.getRowCount();rowI++) {
            memStatLangRow = dwRSC.getRow(rowI);
            Map language = new HashMap();

            language.put( TCESConstants.MEM_RATING_STATSBYLANG_KEYS[0],
                       memStatLangRow.getItem("language_name").toString() );
            language.put( TCESConstants.MEM_RATING_STATSBYLANG_KEYS[1],
                       memStatLangRow.getItem("submitted").toString() );
            language.put( TCESConstants.MEM_RATING_STATSBYLANG_KEYS[2],
                       decFmt.format( Double.parseDouble( memStatLangRow.getItem("submit_percent").toString())) + "%" );
            language.put( TCESConstants.MEM_RATING_STATSBYLANG_KEYS[3],
                       memStatLangRow.getItem("num_correct").toString() );
            language.put( TCESConstants.MEM_RATING_STATSBYLANG_KEYS[4],
                       decFmt.format( Double.parseDouble( memStatLangRow.getItem("submission_accuracy").toString())) +"%" );
            language.put( TCESConstants.MEM_RATING_STATSBYLANG_KEYS[5],
                       decFmt.format( Double.parseDouble( memStatLangRow.getItem("avg_submission_points").toString())) );
            language.put( TCESConstants.MEM_RATING_STATSBYLANG_KEYS[6],
                       JSPUtils.timeFormat(memStatLangRow.getItem("avg_submit_time")) );

            statsByLang.add(language);
        }

        Map totalLang = new HashMap();
        totalLang.put( TCESConstants.MEM_RATING_STATSBYLANG_KEYS[0],
                        "All" );
        totalLang.put( TCESConstants.MEM_RATING_STATSBYLANG_KEYS[1],
                   memStatRow.getItem("total_submitted").toString() );
        totalLang.put( TCESConstants.MEM_RATING_STATSBYLANG_KEYS[2],
                   decFmt.format( Double.parseDouble(memStatRow.getItem("total_submit_percent").toString()) )+"%" );
        totalLang.put( TCESConstants.MEM_RATING_STATSBYLANG_KEYS[3],
                   memStatRow.getItem("correct").toString() );
        totalLang.put( TCESConstants.MEM_RATING_STATSBYLANG_KEYS[4],
                   decFmt.format( Double.parseDouble(memStatRow.getItem("total_submission_accuracy").toString()) ) +"%");
        totalLang.put( TCESConstants.MEM_RATING_STATSBYLANG_KEYS[5],
                   decFmt.format( Double.parseDouble(memStatRow.getItem("avg_submission_points").toString()) ) );
        totalLang.put( TCESConstants.MEM_RATING_STATSBYLANG_KEYS[6],
                   JSPUtils.timeFormat(memStatRow.getItem("avg_time_elapsed")) );

        statsByLang.add(totalLang);

        setNextPage( TCESConstants.MEMBER_PROFILE_PAGE );
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

        if (paramName.equalsIgnoreCase(TCESConstants.CAMPAIGN_ID_PARAM))
            setCampaignID(Integer.parseInt(value));
        if (paramName.equalsIgnoreCase(TCESConstants.JOB_ID_PARAM))
            setJobID(Integer.parseInt(value));
        if (paramName.equalsIgnoreCase(TCESConstants.MEMBER_ID_PARAM))
            setMemberID(Integer.parseInt(value));
    }

}



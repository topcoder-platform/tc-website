package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.tag.ListSelectTag;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.ContestPropertyDAO;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestConfig;
import com.topcoder.web.studio.model.ContestProperty;
import com.topcoder.web.studio.model.StudioFileType;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 2, 2006
 */
public abstract class Base extends ShortHibernateProcessor {
    protected static final Integer[] CONTEST_PROPS = {ContestProperty.MIN_HEIGHT, ContestProperty.MAX_HEIGHT, ContestProperty.MIN_WIDTH,
            ContestProperty.MAX_WIDTH, ContestProperty.CONTEST_OVERVIEW_TEXT, ContestProperty.PRIZE_DESCRIPTION,
            ContestProperty.VIEWABLE_SUBMISSIONS, ContestProperty.MAX_SUBMISSIONS, ContestProperty.VIEWABLE_SUBMITTERS};


    protected void loadGeneralEditContestData() throws Exception {
        getRequest().setAttribute("docTypes", StudioDAOUtil.getFactory().getDocumentTypeDAO().getDocumentTypes());
        getRequest().setAttribute("contestStatuses", StudioDAOUtil.getFactory().getContestStatusDAO().getContestStatuses());
        getRequest().setAttribute("fileTypes", StudioDAOUtil.getFactory().getFileTypeDAO().getFileTypes());

        getRequest().setAttribute("forums", getForumList());
        getRequest().setAttribute("events", DAOUtil.getFactory().getEventDAO().getEvents(EventType.STUDIO_TOURNAMENT_ID));

        ArrayList<ListSelectTag.Option> viewSubmissionAnswers = new ArrayList<ListSelectTag.Option>();
        viewSubmissionAnswers.add(new ListSelectTag.Option(String.valueOf(true), "Yes"));
        viewSubmissionAnswers.add(new ListSelectTag.Option(String.valueOf(false), "No"));
        getRequest().setAttribute("viewSubmissionAnswers", viewSubmissionAnswers);

        ArrayList<ListSelectTag.Option> viewSubmittersAnswers = new ArrayList<ListSelectTag.Option>();
        viewSubmittersAnswers.add(new ListSelectTag.Option(String.valueOf(false), "No"));
        viewSubmittersAnswers.add(new ListSelectTag.Option(String.valueOf(true), "Yes"));
        getRequest().setAttribute("viewSubmitterAnswers", viewSubmittersAnswers);

        getRequest().setAttribute("projects", getProjectList());

        getRequest().setAttribute("prizeTypes", StudioDAOUtil.getFactory().getPrizeTypeDAO().getPrizeTypes());
    }

    protected ResultSetContainer getForumList() throws Exception {
        Request r = new Request();
        r.setContentHandle("forum_list");
        DataAccessInt da = new DataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        return da.getData(r).get("forum_list");

    }

    protected void loadEditContestData(Contest contest) throws Exception {
        if (contest == null) {
            throw new IllegalArgumentException("null contest specified");
        }
        loadGeneralEditContestData();
        getRequest().setAttribute("contest", contest);

        SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);

        ContestPropertyDAO dao = StudioDAOUtil.getFactory().getContestPropertyDAO();
        ContestConfig temp;
        for (Integer aCONTEST_PROPS : CONTEST_PROPS) {
            temp = contest.getConfig(dao.find(aCONTEST_PROPS));
            if (temp != null) {
                setDefault(Constants.CONTEST_PROPERTY + aCONTEST_PROPS, temp.getValue());
            }
        }

        Set a = contest.getFileTypes();
        ArrayList<String> fileTypes = new ArrayList<String>(a.size());
        for (Object anA : a) {
            fileTypes.add(((StudioFileType) anA).getId().toString());
        }
        setDefault(Constants.FILE_TYPE, fileTypes);

        setDefault(Constants.CONTEST_STATUS_ID, contest.getStatus().getId());
        setDefault(Constants.CONTEST_ID, contest.getId());
        if (contest.getEvent() != null) {
            setDefault(Constants.EVENT_ID, contest.getEvent().getId());
        }
        setDefault(Constants.CONTEST_NAME, contest.getName());
        setDefault(Constants.START_TIME, sdf.format(contest.getStartTime()));
        setDefault(Constants.END_TIME, sdf.format(contest.getEndTime()));

        if (contest.getProject() != null) {
            setDefault(Constants.PROJECT_ID_KEY, contest.getProject().getId());
        }


    }

    protected ResultSetContainer getProjectList() throws Exception {
        Request r = new Request();
        r.setContentHandle("project_list");
        DataAccessInt da = new DataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        return (ResultSetContainer) da.getData(r).get("project_list");

    }


}
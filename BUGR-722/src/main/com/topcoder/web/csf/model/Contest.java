package com.topcoder.web.csf.model;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.csf.dao.CSFDAOUtil;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 27, 2006
 */
public class Contest extends Base {
    private Long id;
    private String name;
    private Timestamp startTime;
    private Timestamp endTime;
    private Set config = new HashSet();
    private Set prizes = new TreeSet();
    private Set documents = new HashSet();
    private ContestStatus status;
    private Integer forumId;
    private Set submissions = new HashSet();
    private Set fileTypes = new HashSet();
    private Set results = new TreeSet();
    private Set elections = new HashSet();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public Set getConfig() {
        return config;
    }

    public void setConfig(Set config) {
        this.config = config;
    }

    public Set getPrizes() {
        return prizes;
    }

    public void setPrizes(Set prizes) {
        this.prizes = prizes;
    }

    public void addConfig(ContestConfig config) {
        this.config.add(config);
    }

    public void addPrize(Prize prize) {
        this.prizes.add(prize);
    }

    public ContestConfig getConfig(ContestProperty property) {
        boolean found = false;
        ContestConfig ret = null;
        for (Iterator it = config.iterator(); it.hasNext() && !found;) {
            ret = (ContestConfig) it.next();
            found = ret.getProperty() != null && ret.getProperty().equals(property);
        }
        if (found) {
            return ret;
        } else {
            return null;
        }
    }

    public ContestConfig getOverview() {
        return getConfig(CSFDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.CONTEST_OVERVIEW_TEXT));
    }

    public ContestConfig getPrizeDescription() {
        return getConfig(CSFDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.PRIZE_DESCRIPTION));
    }

    public ContestConfig getViewableSubmissions() {
        return getConfig(CSFDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.VIEWABLE_SUBMISSIONS));
    }

    public ContestConfig getMaxSubmissions() {
        return getConfig(CSFDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.MAX_SUBMISSIONS));
    }

    public Set getDocuments() {
        return documents;
    }

    public void setDocuments(Set documents) {
        this.documents = documents;
    }

    public void addDocument(Document document) {
        this.documents.add(document);
    }

    public ContestStatus getStatus() {
        return status;
    }

    public void setStatus(ContestStatus status) {
        this.status = status;
    }

    public Integer getForumId() {
        return forumId;
    }

    public void setForumId(Integer forumId) {
        this.forumId = forumId;
    }


    public Set getSubmissions() {
        return submissions;
    }

    public void setSubmissions(Set submissions) {
        this.submissions = submissions;
    }

    public Set getFileTypes() {
        return fileTypes;
    }

    public void setFileTypes(Set fileTypes) {
        this.fileTypes = fileTypes;
    }

    public void addFileType(CSFFileType fileType) {
        this.fileTypes.add(fileType);
    }

    public Set getResults() {
        return results;
    }

    public void setResults(Set results) {
        this.results = results;
    }


    public Set getElections() {
        return elections;
    }

    public void setElections(Set elections) {
        this.elections = elections;
    }
}

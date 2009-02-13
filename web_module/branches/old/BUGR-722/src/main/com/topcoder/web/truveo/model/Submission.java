package com.topcoder.web.truveo.model;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.User;

import java.sql.Timestamp;
import java.util.Set;
import java.util.TreeSet;

/**
 * @author dok
 * @version $Revision: 70119 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 27, 2006
 */
public class Submission extends Base {
    private Long id;
    private User submitter;
    private Contest contest;
    private String originalFileName;
    private String systemFileName;
    private FilePath path;
    private SubmissionType type;
    private MimeType mimeType;
    private SubmissionReview review;
    private ContestResult result;
    private Integer rank;
    private Timestamp createDate;
    private Integer height;
    private Integer width;
    private SubmissionStatus status;
    private com.topcoder.web.common.model.comp.Submission ORSubmission;
    private Set<Prize> prizes = new TreeSet<Prize>();


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getSubmitter() {
        return submitter;
    }

    public void setSubmitter(User submitter) {
        this.submitter = submitter;
    }

    public Contest getContest() {
        return contest;
    }

    public void setContest(Contest contest) {
        this.contest = contest;
    }

    public String getOriginalFileName() {
        return originalFileName;
    }

    public void setOriginalFileName(String originalFileName) {
        this.originalFileName = originalFileName;
    }

    public String getSystemFileName() {
        return systemFileName;
    }

    public void setSystemFileName(String systemFileName) {
        this.systemFileName = systemFileName;
    }

    public FilePath getPath() {
        return path;
    }

    public void setPath(FilePath path) {
        this.path = path;
    }

    public SubmissionType getType() {
        return type;
    }

    public SubmissionReview getReview() {
        return review;
    }

    public void setReview(SubmissionReview review) {
        this.review = review;
    }

    public void setType(SubmissionType type) {
        this.type = type;
    }

    public MimeType getMimeType() {
        return mimeType;
    }

    public void setMimeType(MimeType mimeType) {
        this.mimeType = mimeType;
    }

    public ContestResult getResult() {
        return result;
    }

    public void setResult(ContestResult result) {
        this.result = result;
    }


    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }


    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }


    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }


    public SubmissionStatus getStatus() {
        return status;
    }

    public void setStatus(SubmissionStatus status) {
        this.status = status;
    }


    public com.topcoder.web.common.model.comp.Submission getORSubmission() {
        return ORSubmission;
    }

    public void setORSubmission(com.topcoder.web.common.model.comp.Submission ORSubmission) {
        this.ORSubmission = ORSubmission;
    }


    public Set<Prize> getPrizes() {
        return prizes;
    }

    public void setPrizes(Set<Prize> prizes) {
        this.prizes = prizes;
    }

    public void addPrize(Prize p) {
        this.prizes.add(p);
    }

    public void removePrize(Prize p) {
        if (log.isDebugEnabled()) {
            log.debug("before size " + prizes.size());
        }
        this.prizes.remove(p);
        if (log.isDebugEnabled()) {
            log.debug("after size " + prizes.size());
        }
    }
}

package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;
import java.util.ArrayList;


public class News
        implements
        Serializable
        , TagRenderer
        , Comparable
        , QueryCriteria
        , Modifiable {

    private int NewsId;
    private String NewsTypeId;
    private String Headline;
    private String News;
    private String NewPosting;
    private java.sql.Timestamp PostingDate;
    private String Status;
    private String Modified;

    public News() {
        NewsId = 0;
        NewsTypeId = "";
        Headline = "";
        News = "";
        NewPosting = "";
        PostingDate = null;
        Status = "";
        Modified = "";
    }

    public ArrayList getCriteria(Object obj) {
        ArrayList result = new ArrayList(23);
        News other = (News) obj;
        if (this.getNewsId() != other.getNewsId()) {
            String[] criteria = {"int", "news", "news_id", Integer.toString(this.getNewsId())};
            result.add(criteria);
        }
        if (!this.getNewsTypeId().equals(other.getNewsTypeId())) {
            String[] criteria = {"String", "news", "news_type_id", this.getNewsTypeId()};
            result.add(criteria);
        }
        if (!this.getHeadline().equals(other.getHeadline())) {
            String[] criteria = {"String", "news", "headline", this.getHeadline()};
            result.add(criteria);
        }
        if (!this.getNews().equals(other.getNews())) {
            String[] criteria = {"String", "news", "news", this.getNews()};
            result.add(criteria);
        }
        if (!this.getNewPosting().equals(other.getNewPosting())) {
            String[] criteria = {"String", "news", "new_posting", this.getNewPosting()};
            result.add(criteria);
        }
        if (this.getPostingDate() != null) {
            String[] criteria = {"java.sql.Timestamp", "news", "posting_date", this.getPostingDate().toString()};
            result.add(criteria);
        }
        if (!this.getStatus().equals(other.getStatus())) {
            String[] criteria = {"String", "news", "status", this.getStatus()};
            result.add(criteria);
        }
        result.trimToSize();
        return result;
    }


/*
  public Object clone() throws CloneNotSupportedException, OutOfMemoryError {
    News result = null;
    try {
      result = new News();
      result.setNewsId( getNewsId() );
      result.setNewsTypeId( getNewsTypeId() );
      result.setHeadline( getHeadline() );
      result.setNews( getNews() );
      result.setNewPosting( getNewPosting() );
      result.setPostingDate( getPostingDate() );
      result.setStatus( getStatus() );
      result.setModified( getModified() );
    } catch (Exception e) {
      e.printStackTrace();
    }
    return result;
  }
*/

    public int compareTo(Object other) {
        int result = 0;
        News otherNews = (News) other;
        result = this.getPostingDate().compareTo(otherNews.getPostingDate());
        if (result == 0) {
            StringBuffer temp = new StringBuffer(256);
            char[] beginName = new char[4];
            temp.append(this.getHeadline());
            if (temp.length() > 5) {
                temp.getChars(1, 5, beginName, 0);
                if (beginName[0] == 'T' && beginName[1] == 'h' && beginName[2] == 'e' && beginName[3] == ' ') {
                    temp.delete(1, 5);
                }
            }
            String thisComparator = temp.toString();
            temp.delete(0, temp.length());
            temp.append(otherNews.getHeadline());
            if (temp.length() > 5) {
                temp.getChars(1, 5, beginName, 0);
                if (beginName[0] == 'T' && beginName[1] == 'h' && beginName[2] == 'e' && beginName[3] == ' ') {
                    temp.delete(1, 5);
                }
            }
            String otherComparator = temp.toString();
            result = thisComparator.compareToIgnoreCase(otherComparator);
        }
        return result;
    }

// set
    public void setAllModifiedStable() throws Exception {
        setModified("S");
    }

    public void setNewsId(int NewsId) {
        this.NewsId = NewsId;
    }

    public void setNewsTypeId(String NewsTypeId) {
        this.NewsTypeId = NewsTypeId;
    }

    public void setHeadline(String Headline) {
        this.Headline = Headline;
    }

    public void setNews(String News) {
        this.News = News;
    }

    public void setNewPosting(String NewPosting) {
        this.NewPosting = NewPosting;
    }

    public void setPostingDate(java.sql.Timestamp PostingDate) {
        this.PostingDate = PostingDate;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public void setModified(String Modified) {
        this.Modified = Modified;
    }


// get

    public int getNewsId() {
        return NewsId;
    }

    public String getNewsTypeId() {
        return NewsTypeId;
    }

    public String getHeadline() {
        return Headline;
    }

    public String getNews() {
        return News;
    }

    public String getNewPosting() {
        return NewPosting;
    }

    public java.sql.Timestamp getPostingDate() {
        return PostingDate;
    }

    public String getStatus() {
        return Status;
    }

    public String getModified() {
        return Modified;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("News");
            result.addTag(new ValueTag("NewsId", NewsId));
            result.addTag(new ValueTag("NewsTypeId", NewsTypeId));
            result.addTag(new ValueTag("Headline", Headline));
            result.addTag(new ValueTag("News", News));
            result.addTag(new ValueTag("NewPosting", NewPosting));
            result.addTag(new ValueTag("PostingDate", PostingDate));
            result.addTag(new ValueTag("Status", Status));
            result.addTag(new ValueTag("Modified", Modified));
        } catch (Exception e) {
            throw new Exception("common.web.data.News getXML ERROR: " + e);
        }
        return result;
    }


}

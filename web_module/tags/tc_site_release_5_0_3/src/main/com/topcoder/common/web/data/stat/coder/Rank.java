package com.topcoder.common.web.data.stat.coder;

import com.topcoder.common.web.constant.Sort;
import com.topcoder.common.web.data.SortKey;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;

public final class Rank implements Comparable, Serializable, TagRenderer {

    private int rank;
    private String handle;
    private int rating;
    private int coderId;

    private SortKey sort;

    public static final int RANK = 0;
    public static final int HANDLE = 1;
    public static final int RATING = 2;

    public Rank() {

        rank = 0;
        handle = "";
        rating = 0;
        coderId = 0;

        sort = new SortKey(Sort.DEFAULT_CODER_RANK_SORT_KEY, Sort.DEFAULT_CODER_RANK_SORT_DIR);

    }

    public int compareTo(Object other) {
        int result = 0;
        if (sort != null) {
            Rank otherRank = (Rank) other;
            Comparable thisComparator = null;
            Comparable otherComparator = null;
            switch (sort.getKey()) {
                case RANK:
                    thisComparator = new Integer(this.getRank());
                    otherComparator = new Integer(otherRank.getRank());
                    break;
                case HANDLE:
                    thisComparator = this.getHandle().toUpperCase();
                    otherComparator = otherRank.getHandle().toUpperCase();
                    break;
                case RATING:
                    thisComparator = new Integer(this.getRating());
                    otherComparator = new Integer(otherRank.getRating());
                    break;
            }
            if (sort.getDir() == 'A') {
                result = thisComparator.compareTo(otherComparator);
            } else {
                result = otherComparator.compareTo(thisComparator);
            }
        }
        return result;
    }


// set
    public void setRank(int rank) {
        this.rank = rank;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setCoderId(int coderId) {
        this.coderId = coderId;
    }

    public void setSort(SortKey sort) {
        this.sort = sort;
    }

// get
    public int getRank() {
        return rank;
    }

    public String getHandle() {
        return handle;
    }

    public int getRating() {
        return rating;
    }

    public int getCoderId() {
        return coderId;
    }

    public SortKey getSort() {
        return sort;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("TopRankedCoder");
            result.addTag(new ValueTag("Rank", rank));
            result.addTag(new ValueTag("Handle", handle));
            result.addTag(new ValueTag("Rating", rating));
            result.addTag(new ValueTag("CoderId", coderId));
            result.addTag(sort.getXML());
        } catch (Exception e) {
            throw new Exception("common.web.data.stat.coder.Rank getXML ERROR: " + e);
        }
        return result;
    }

}



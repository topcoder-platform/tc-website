package com.topcoder.common.web.data.stat.coder;

import com.topcoder.common.web.constant.Sort;
import com.topcoder.common.web.data.SortKey;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;
import java.text.DateFormat;

public final class Coder implements Serializable, TagRenderer, Comparable {

    private int coderId;
    private String handle;
    private String quote;
    private int rating;
    private int volatility;
    private int ranking;
    private java.sql.Date memberSince;
    private float totalEarnings;
    private int numCompetitions;

    private int maxRating;
    private float avgPoints;
    private float avgRanking;

    private float avgRoomSeed;
    private float avgRoomFinish;
    private float avgEarnings;
    private float avgContestFinish;

    private int numEasySubmitted;
    private int numMedSubmitted;
    private int numHardSubmitted;

    private int numEasyFailChallenge;  // number of easy problems that were broken by challenge
    private int numMedFailChallenge;   // ......
    private int numHardFailChallenge;  // ........

    private int numEasyFailSys;        // number of easy problems that failed system testing
    private int numMedFailSys;         // ......
    private int numHardFailSys;        // ........

    private int numEasyChallenges;     // number of easy problems coder has challenged
    private int numMedChallenges;      // .....
    private int numHardChallenges;     // ........

    private int numEasyChallengeFail;  // number of easy problems the coder has successfully challenged
    private int numMedChallengeFail;   // .....
    private int numHardChallengeFail;  // ........

    private SortKey sort;
    public static final int MEMBER_SINCE = 0;
    public static final int HANDLE = 1;
    public static final int RATING = 2;

    public String image;


    public int compareTo(Object other) {
        int result = 0;
        com.topcoder.common.web.data.stat.coder.Coder otherCoder = (com.topcoder.common.web.data.stat.coder.Coder) other;
        Comparable thisComparator = null;
        Comparable otherComparator = null;
        if (sort != null) {
            switch (sort.getKey()) {
                case MEMBER_SINCE:
                    thisComparator = this.getMemberSince();
                    otherComparator = otherCoder.getMemberSince();
                    break;
                case HANDLE:
                    thisComparator = this.getHandle();
                    otherComparator = otherCoder.getHandle();
                    break;
                case RATING:
                    thisComparator = new Integer(this.getRanking());
                    otherComparator = new Integer(otherCoder.getRanking());
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

    public Coder() {
        coderId = 0;
        handle = "";
        quote = "";
        rating = 0;
        sort = new SortKey(Sort.DEFAULT_REFERRAL_SORT_KEY, Sort.DEFAULT_REFERRAL_SORT_DIR);
        volatility = 0;
        ranking = 0;
        memberSince = null;
        totalEarnings = 0;
        numCompetitions = 0;
        maxRating = 0;
        avgPoints = 0;
        avgRanking = 0;
        avgRoomSeed = 0;
        avgRoomFinish = 0;
        avgEarnings = 0;
        avgContestFinish = 0;

        numEasySubmitted = 0;
        numMedSubmitted = 0;
        numHardSubmitted = 0;

        numEasyFailChallenge = 0;
        numMedFailChallenge = 0;
        numHardFailChallenge = 0;

        numEasyFailSys = 0;
        numMedFailSys = 0;
        numHardFailSys = 0;

        numEasyChallenges = 0;
        numMedChallenges = 0;
        numHardChallenges = 0;

        numEasyChallengeFail = 0;
        numMedChallengeFail = 0;
        numHardChallengeFail = 0;

        image = "";
    }

    //set
    public void setCoderId(int coderId) {
        this.coderId = coderId;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public void setSort(SortKey sort) {
        this.sort = sort;
    }

    public void setQuote(String quote) {
        this.quote = quote;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setVolatility(int volatility) {
        this.volatility = volatility;
    }

    public void setRanking(int ranking) {
        this.ranking = ranking;
    }

    public void setMemberSince(java.sql.Date memberSince) {
        this.memberSince = memberSince;
    }

    public void setTotalEarnings(float totalEarnings) {
        this.totalEarnings = totalEarnings;
    }

    public void setNumCompetitions(int numCompetitions) {
        this.numCompetitions = numCompetitions;
    }

    public void setMaxRating(int maxRating) {
        this.maxRating = maxRating;
    }

    public void setAvgPoints(float avgPoints) {
        this.avgPoints = avgPoints;
    }

    public void setAvgRanking(float avgRanking) {
        this.avgRanking = avgRanking;
    }

    public void setAvgRoomSeed(float avgRoomSeed) {
        this.avgRoomSeed = avgRoomSeed;
    }

    public void setAvgRoomFinish(float avgRoomFinish) {
        this.avgRoomFinish = avgRoomFinish;
    }

    public void setAvgEarnings(float avgEarnings) {
        this.avgEarnings = avgEarnings;
    }

    public void setAvgContestFinish(float avgContestFinish) {
        this.avgContestFinish = avgContestFinish;
    }


    public void setNumEasySubmitted(int numEasySubmitted) {
        this.numEasySubmitted = numEasySubmitted;
    }

    public void setNumMedSubmitted(int numMedSubmitted) {
        this.numMedSubmitted = numMedSubmitted;
    }

    public void setNumHardSubmitted(int numHardSubmitted) {
        this.numHardSubmitted = numHardSubmitted;
    }

    public void setNumEasyFailChallenge(int numEasyFailChallenge) {
        this.numEasyFailChallenge = numEasyFailChallenge;
    }

    public void setNumMedFailChallenge(int numMedFailChallenge) {
        this.numMedFailChallenge = numMedFailChallenge;
    }

    public void setNumHardFailChallenge(int numHardFailChallenge) {
        this.numHardFailChallenge = numHardFailChallenge;
    }

    public void setNumEasyFailSys(int numEasyFailSys) {
        this.numEasyFailSys = numEasyFailSys;
    }

    public void setNumMedFailSys(int numMedFailSys) {
        this.numMedFailSys = numMedFailSys;
    }

    public void setNumHardFailSys(int numHardFailSys) {
        this.numHardFailSys = numHardFailSys;
    }

    public void setNumEasyChallenges(int numEasyChallenges) {
        this.numEasyChallenges = numEasyChallenges;
    }

    public void setNumMedChallenges(int numMedChallenges) {
        this.numMedChallenges = numMedChallenges;
    }

    public void setNumHardChallenges(int numHardChallenges) {
        this.numHardChallenges = numHardChallenges;
    }

    public void setNumEasyChallengeFail(int numEasyChallengeFail) {
        this.numEasyChallengeFail = numEasyChallengeFail;
    }

    public void setNumMedChallengeFail(int numMedChallengeFail) {
        this.numMedChallengeFail = numMedChallengeFail;
    }

    public void setNumHardChallengeFail(int numHardChallengeFail) {
        this.numHardChallengeFail = numHardChallengeFail;
    }

    public void setImage(String image) {
        this.image = image;
    }


    //get
    public int getCoderId() {
        return coderId;
    }

    public SortKey getSort() {
        return sort;
    }

    public String getHandle() {
        return handle;
    }

    public String getQuote() {
        return quote;
    }

    public int getRating() {
        return rating;
    }

    public int getVolatility() {
        return volatility;
    }

    public int getRanking() {
        return ranking;
    }

    public java.sql.Date getMemberSince() {
        return memberSince;
    }

    public float getTotalEarnings() {
        return totalEarnings;
    }

    public int getNumCompetitions() {
        return numCompetitions;
    }

    public int getMaxRating() {
        return maxRating;
    }

    public float getAvgPoints() {
        return avgPoints;
    }

    public float getAvgRanking() {
        return avgRanking;
    }

    public float getAvgRoomSeed() {
        return avgRoomSeed;
    }

    public float getAvgRoomFinish() {
        return avgRoomFinish;
    }

    public float getAvgEarnings() {
        return avgEarnings;
    }

    public float getAvgContestFinish() {
        return avgContestFinish;
    }


    public int getNumEasySubmitted() {
        return numEasySubmitted;
    }

    public int getNumMedSubmitted() {
        return numMedSubmitted;
    }

    public int getNumHardSubmitted() {
        return numHardSubmitted;
    }

    public int getNumEasyFailChallenge() {
        return numEasyFailChallenge;
    }

    public int getNumMedFailChallenge() {
        return numMedFailChallenge;
    }

    public int getNumHardFailChallenge() {
        return numHardFailChallenge;
    }

    public int getNumEasyFailSys() {
        return numEasyFailSys;
    }

    public int getNumMedFailSys() {
        return numMedFailSys;
    }

    public int getNumHardFailSys() {
        return numHardFailSys;
    }

    public int getNumEasyChallenges() {
        return numEasyChallenges;
    }

    public int getNumMedChallenges() {
        return numMedChallenges;
    }

    public int getNumHardChallenges() {
        return numHardChallenges;
    }

    public int getNumEasyChallengeFail() {
        return numEasyChallengeFail;
    }

    public int getNumMedChalleneFail() {
        return numMedChallengeFail;
    }

    public int getNumHardChallengeFail() {
        return numHardChallengeFail;
    }


    public float getEasySuccessPercent() {
        if ((numEasyFailChallenge + numEasyFailSys) == 0)
            return numEasySubmitted == 0 ? 0 : 100;
        else
            return (1 - (float) (numEasyFailChallenge + numEasyFailSys) / numEasySubmitted) * 100;
    }

    public float getMedSuccessPercent() {
        if ((numMedFailChallenge + numMedFailSys) == 0)
            return numMedSubmitted == 0 ? 0 : 100;
        else
            return (1 - (float) (numMedFailChallenge + numMedFailSys) / numMedSubmitted) * 100;
    }

    public float getHardSuccessPercent() {
        if ((numHardFailChallenge + numHardFailSys) == 0)
            return numHardSubmitted == 0 ? 0 : 100;
        else
            return (1 - (float) (numHardFailChallenge + numHardFailSys) / numHardSubmitted) * 100;
    }

    public int getTotalSubmitted() {
        return numEasySubmitted + numMedSubmitted + numHardSubmitted;
    }

    public int getTotalFailChallenge() {
        return numEasyFailChallenge + numMedFailChallenge + numHardFailChallenge;
    }

    public int getTotalFailSys() {
        return numEasyFailSys + numMedFailSys + numHardFailSys;
    }

    public float getTotalSuccessPercent() {
        if ((getTotalFailSys() + getTotalFailChallenge()) == 0)
            return getTotalSubmitted() == 0 ? 0 : 100;
        else
            return (1 - (float) (getTotalFailChallenge() + getTotalFailSys()) / getTotalSubmitted()) * 100;
    }

    public float getEasyChallengePercent() {
        if (numEasyChallengeFail == 0)
            return numEasyChallenges == 0 ? 0 : 100;
        else
            return (1 - (float) numEasyChallengeFail / numEasyChallenges) * 100;
    }

    public float getMedChallengePercent() {
        if (numMedChallengeFail == 0)
            return numMedChallenges == 0 ? 0 : 100;
        else
            return (1 - (float) numMedChallengeFail / numMedChallenges) * 100;
    }

    public float getHardChallengePercent() {
        if (numHardChallengeFail == 0)
            return numHardChallenges == 0 ? 0 : 100;
        else
            return (1 - (float) numHardChallengeFail / numHardChallenges) * 100;
    }

    public int getTotalChallengeFail() {
        return numEasyChallengeFail + numMedChallengeFail + numHardChallengeFail;
    }

    public int getTotalNumChallenges() {
        return numEasyChallenges + numMedChallenges + numHardChallenges;
    }

    public float getTotalChallengePercent() {
        if (getTotalChallengeFail() == 0)
            return getTotalNumChallenges() == 0 ? 0 : 100;
        else
            return (1 - (float) getTotalChallengeFail() / getTotalNumChallenges()) * 100;
    }

    public String getImage() {
        return image;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Coder");
            result.addTag(new ValueTag("CoderId", coderId));
            result.addTag(new ValueTag("Handle", handle));
            result.addTag(new ValueTag("Image", image));
            result.addTag(new ValueTag("Quote", quote));
            result.addTag(new ValueTag("Rating", rating));
            result.addTag(new ValueTag("Volatility", volatility));
            result.addTag(new ValueTag("Ranking", ranking));
            if (memberSince != null) {
                result.addTag(new ValueTag("MemberSince", DateFormat.getDateInstance(DateFormat.LONG).format(memberSince)));
            }
            if (sort != null) {
                result.addTag(sort.getXML());
            }
            result.addTag(new ValueTag("TotalEarnings", totalEarnings));
            result.addTag(new ValueTag("NumCompetitions", numCompetitions));
            result.addTag(new ValueTag("MaxRating", maxRating));
            result.addTag(new ValueTag("AvgPoints", avgPoints));
            result.addTag(new ValueTag("AvgRanking", avgRanking));
            result.addTag(new ValueTag("AvgRoomSeed", avgRoomSeed));
            result.addTag(new ValueTag("AvgRoomFinish", avgRoomFinish));
            result.addTag(new ValueTag("AvgEarnings", avgEarnings));

            result.addTag(new ValueTag("NumEasySubmitted", numEasySubmitted));
            result.addTag(new ValueTag("NumMedSubmitted", numMedSubmitted));
            result.addTag(new ValueTag("NumHardSubmitted", numHardSubmitted));
            result.addTag(new ValueTag("NumEasyFailChallenge", numEasyFailChallenge));
            result.addTag(new ValueTag("NumMedFailChallenge", numMedFailChallenge));
            result.addTag(new ValueTag("NumHardFailChallenge", numHardFailChallenge));
            result.addTag(new ValueTag("NumEasyFailSys", numEasyFailSys));
            result.addTag(new ValueTag("NumMedFailSys", numMedFailSys));
            result.addTag(new ValueTag("NumHardFailSys", numHardFailSys));
            result.addTag(new ValueTag("EasySuccessPercent", getEasySuccessPercent()));
            result.addTag(new ValueTag("MedSuccessPercent", getMedSuccessPercent()));
            result.addTag(new ValueTag("HardSuccessPercent", getHardSuccessPercent()));
            result.addTag(new ValueTag("TotalSubmitted", getTotalSubmitted()));
            result.addTag(new ValueTag("TotalFailChallenge", getTotalFailChallenge()));
            result.addTag(new ValueTag("TotalFailSys", getTotalFailSys()));
            result.addTag(new ValueTag("TotalSuccessPercent", getTotalSuccessPercent()));

            result.addTag(new ValueTag("NumEasyChallenges", numEasyChallenges));
            result.addTag(new ValueTag("NumMedChallenges", numMedChallenges));
            result.addTag(new ValueTag("NumHardChallenges", numHardChallenges));
            result.addTag(new ValueTag("NumEasyChallengeFail", numEasyChallengeFail));
            result.addTag(new ValueTag("NumMedChallengeFail", numMedChallengeFail));
            result.addTag(new ValueTag("NumHardChallengeFail", numHardChallengeFail));

            result.addTag(new ValueTag("EasyChallengePercent", getEasyChallengePercent()));
            result.addTag(new ValueTag("MedChallengePercent", getMedChallengePercent()));
            result.addTag(new ValueTag("HardChallengePercent", getHardChallengePercent()));
            result.addTag(new ValueTag("TotalChallengeFail", getTotalChallengeFail()));
            result.addTag(new ValueTag("TotalNumChallenges", getTotalNumChallenges()));
            result.addTag(new ValueTag("TotalChallengePercent", getTotalChallengePercent()));

        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("common.web.data.stat.coder.Coder getXML ERROR: " + e);
        }
        return result;
    }


}

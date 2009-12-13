/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.JiveConstants;
import com.jivesoftware.base.JiveGlobals;
import com.jivesoftware.base.User;
import com.jivesoftware.base.UserNotFoundException;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.ForumCategoryNotFoundException;
import com.jivesoftware.forum.Query;
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.action.util.Paginator;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.ejb.forums.Forums;
import com.topcoder.web.ejb.forums.ForumsLocal;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.controller.ForumsUtil;
import com.topcoder.web.forums.model.ImageData;
import com.topcoder.web.forums.model.Paging;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;

/**
 * @author mtong
 *         <p/>
 *         Forwards to the search page.
 */
public class Search extends ForumsProcessor {
    private boolean displayPerThread
            = JiveGlobals.getJiveBooleanProperty("search.results.groupByThread", true);
    private static final String[] STOP_WORDS = {"a", "and", "are", "as", "at", "be", "but", "by", "do", "for", "i",
            "if", "in", "into", "is", "it", "me", "my", "no", "not", "of", "on", "or", "s", "such", "t", "that", "the",
            "their", "then", "there", "these", "they", "this", "to", "was", "will", "with", "you"};

    protected void businessProcessing() throws Exception {
        super.businessProcessing();

        ResultFilter resultFilter = new ResultFilter();
        resultFilter.setSortField(JiveConstants.FORUM_NAME);
        resultFilter.setSortOrder(ResultFilter.ASCENDING);
        Iterator itForums = forumFactory.getRootForumCategory().getForums(resultFilter);
        Iterator itCategories = forumFactory.getRootForumCategory().getCategories();

        HashMap dates = new HashMap();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.DAY_OF_MONTH, -1);
        dates.put(ForumConstants.SEARCH_DATE_YESTERDAY, calendar.getTime());
        calendar.add(Calendar.DAY_OF_MONTH, -6);
        dates.put(ForumConstants.SEARCH_DATE_LAST_7_DAYS, calendar.getTime());
        calendar.add(Calendar.DAY_OF_MONTH, -23);
        dates.put(ForumConstants.SEARCH_DATE_LAST_30_DAYS, calendar.getTime());
        calendar.add(Calendar.DAY_OF_MONTH, -60);
        dates.put(ForumConstants.SEARCH_DATE_LAST_90_DAYS, calendar.getTime());
        calendar.add(Calendar.DAY_OF_MONTH, 90);
        calendar.set(calendar.get(Calendar.YEAR), Calendar.JANUARY, 1);
        dates.put(ForumConstants.SEARCH_DATE_THIS_YEAR, calendar.getTime());
        calendar.add(Calendar.YEAR, -1);
        dates.put(ForumConstants.SEARCH_DATE_LAST_YEAR, calendar.getTime());

        getRequest().setAttribute("forums", itForums);
        getRequest().setAttribute("categories", itCategories);
        getRequest().setAttribute("dates", dates);

        String mode = StringUtils.checkNull(getRequest().getParameter(ForumConstants.SEARCH_MODE));
        String status = StringUtils.checkNull(getRequest().getParameter(ForumConstants.STATUS));

        if (mode.equals(ForumConstants.SEARCH_MODE_BASIC)) {
            setNextPage("/searchBasic.jsp");
        } else {
            setNextPage("/search.jsp");
        }
        setIsNextPageInContext(true);

        if (status.equals("search")) {
            String queryTerms = getRequest().getParameter(ForumConstants.SEARCH_QUERY);
            String searchScope = getRequest().getParameter(ForumConstants.SEARCH_SCOPE);
            String dateRange = getRequest().getParameter(ForumConstants.SEARCH_DATE_RANGE);
            String userHandle = StringUtils.checkNull(getRequest().getParameter(ForumConstants.SEARCH_HANDLE));
            String sortField = StringUtils.checkNull(getRequest().getParameter(ForumConstants.SEARCH_SORT_FIELD));
            User sortUser = null;

            int resultSize = ForumConstants.DEFAULT_SEARCH_RANGE;
            if (user != null) {
                try {
                    resultSize = Integer.parseInt(user.getProperty("jiveSearchRange"));
                } catch (Exception ignored) {
                }
            }
            if (!StringUtils.checkNull(getRequest().getParameter(ForumConstants.SEARCH_RESULT_SIZE)).equals("")) {
                resultSize = Integer.parseInt(getRequest().getParameter(ForumConstants.SEARCH_RESULT_SIZE));
            }
            int startIdx = 0;
            if (!StringUtils.checkNull(getRequest().getParameter(ForumConstants.START_IDX)).equals("")) {
                startIdx = Integer.parseInt(getRequest().getParameter(ForumConstants.START_IDX));
            }

            if (queryTerms.length() <= 0 && userHandle.equals("")) {
                addError(ForumConstants.SEARCH_QUERY, ForumConstants.ERR_NO_SEARCH_TERMS);
            }
            if (!userHandle.equals("")) {
                try {
                    sortUser = forumFactory.getUserManager().getUser(userHandle);
                } catch (UserNotFoundException une) {
                    addError(ForumConstants.SEARCH_HANDLE, ForumConstants.ERR_NO_SEARCH_HANDLE);
                }
            }
            if (hasErrors()) {
                status = "error";
            }

            Query query = null;
            boolean searchCategories = false;
            if (searchScope.equals("all")) {
                query = forumFactory.createQuery();
                try {
                    ForumCategory category = forumFactory.getForumCategory(WebConstants.TCS_FORUMS_ROOT_CATEGORY_ID);
                    searchCategories = (category.getCategoryCount() > 0);
                } catch (ForumCategoryNotFoundException e) {
                    searchCategories = false;
                }
            } else if (searchScope.startsWith("f")) {
                long forumID = Long.parseLong(searchScope.substring(1));
                Forum forum = forumFactory.getForum(forumID);
                query = forum.createQuery();
            } else if (searchScope.startsWith("c")) {
                long categoryID = Long.parseLong(searchScope.substring(1));
                ArrayList forumList = new ArrayList();
                ForumCategory category = forumFactory.getForumCategory(categoryID);
                searchCategories = (categoryID == WebConstants.TCS_FORUMS_ROOT_CATEGORY_ID && category.getCategoryCount() > 0);
                Iterator itCategoryForums = category.getRecursiveForums(resultFilter);
                while (itCategoryForums.hasNext()) {
                    Forum f = (Forum) itCategoryForums.next();
                    if (!forumList.contains(f)) {
                        forumList.add(f);
                    }
                }
                query = forumFactory.getQueryManager().createQuery(
                        (Forum[]) forumList.toArray(new Forum[forumList.size()]));
            }
            query.setQueryString(queryTerms);

            if (!dateRange.equals("all")) {
                query.setAfterDate((Date) dates.get(dateRange));
            }

            if (sortUser instanceof User) {
                query.filterOnUser(sortUser);
            }

            if (sortField.equals("") || Integer.parseInt(sortField) == Query.RELEVANCE) {
                query.setSortField(Query.RELEVANCE);
            } else if (Integer.parseInt(sortField) == Query.DATE) {
                query.setSortField(Query.DATE);
            }
            query.setSortOrder(ResultFilter.DESCENDING);

            ResultFilter pageFilter = new ResultFilter();
            pageFilter.setStartIndex(startIdx);
            pageFilter.setNumResults(resultSize);

            Iterator itResults = null;
            int totalItemCount = 0;
            if (displayPerThread) {
                itResults = query.getResultsByThread(startIdx, resultSize);
                totalItemCount = query.getResultByThreadCount();
            } else {
                itResults = query.getResults(startIdx, resultSize);
                totalItemCount = query.getResultCount();
            }

            Paging paging = new Paging(pageFilter, totalItemCount);
            Paginator paginator = new Paginator(paging);

            getRequest().setAttribute("status", status);
            getRequest().setAttribute("query", query);
            getRequest().setAttribute("dateRange", dateRange);
            getRequest().setAttribute("searchScope", searchScope);
            getRequest().setAttribute("results", itResults);
            getRequest().setAttribute("paginator", paginator);
            getRequest().setAttribute("mode", mode);

            if (searchCategories) {
                searchCategories(query);
            }
        }
    }

    // Consider using a search package to perform category search.
    private void searchCategories(Query query) throws Exception {
        int categoryResultSize = ForumConstants.DEFAULT_SEARCH_CATEGORY_RANGE;
        if (user != null) {
            try {
                categoryResultSize = Integer.parseInt(user.getProperty("jiveSearchCategoryRange"));
            } catch (Exception ignored) {
            }
        }
        if (!StringUtils.checkNull(getRequest().getParameter(ForumConstants.SEARCH_CATEGORY_RESULT_SIZE)).equals("")) {
            categoryResultSize = Integer.parseInt(getRequest().getParameter(ForumConstants.SEARCH_CATEGORY_RESULT_SIZE));
        }
        if (categoryResultSize == 0) return;
        int categoryStartIdx = 0;
        if (!StringUtils.checkNull(getRequest().getParameter(ForumConstants.SEARCH_CATEGORY_START_IDX)).equals("")) {
            categoryStartIdx = Integer.parseInt(getRequest().getParameter(ForumConstants.SEARCH_CATEGORY_START_IDX));
        }

        String queryString = query.getQueryString().toLowerCase().trim();

        String[] ss = queryString.split(" ");
        ArrayList<String> reqTokens = new ArrayList<String>();
        ArrayList<String> optTokens = new ArrayList<String>();
        ArrayList<String> curList = null;
        String curQuote = "";

        for (int i = 0; i < ss.length; i++) {
            if (curQuote.startsWith("\"")) {
                // append to quoted block
                curQuote += " " + ss[i];
                if (ss[i].endsWith("\"")) {
                    // quoted block is completed, add to list
                    curList.add(curQuote.substring(1, curQuote.length() - 1));
                    curQuote = "";
                }
            } else {
                if (ss[i].startsWith("+")) {
                    curList = reqTokens;
                    ss[i] = ss[i].substring(1);
                } else {
                    curList = optTokens;
                }
                if (ss[i].startsWith("\"")) {
                    // start new quoted block
                    curQuote = ss[i];
                } else {
                    // add single word to list
                    curList.add(ss[i]);
                }
            }
        }
        if (!curQuote.equals("")) {
            curList.add(curQuote);
        }

        for (int i = optTokens.size() - 1; i >= 0; i--) {
            for (String stopWord : STOP_WORDS) {
                if (optTokens.get(i).equals(stopWord)) {
                    optTokens.remove(i);
                    break;
                }
            }
        }

        String unquotedQueryString = "";
        if (queryString.length() >= 2 && queryString.startsWith("\"") && queryString.endsWith("\"")) {
            unquotedQueryString = queryString.substring(1, queryString.length() - 1).trim();
        }

        Iterator<ForumCategory> itSearchCategories = forumFactory.getForumCategory(WebConstants.TCS_FORUMS_ROOT_CATEGORY_ID).getCategories();
        ArrayList<ForumCategory> categoryResultsList = new ArrayList<ForumCategory>();
        Hashtable<ForumCategory, Integer> categoryRankTable = new Hashtable<ForumCategory, Integer>();
        Hashtable<ForumCategory, Integer> optMatchesTable = new Hashtable<ForumCategory, Integer>();
        while (itSearchCategories.hasNext()) {
            ForumCategory category = itSearchCategories.next();
            String categoryName = category.getName().toLowerCase().trim();
            String[] categoryNameTokens = categoryName.split(" ");
            int rank = -1;
            if (categoryName.equals(queryString) ||
                    (unquotedQueryString.length() > 0 && categoryName.equals(unquotedQueryString))) {
                rank = 1;
            } else if (categoryNameTokens.length > 0 && (categoryNameTokens[0].equals(queryString) ||
                    (unquotedQueryString.length() > 0 && categoryNameTokens[0].equals(unquotedQueryString)))) {
                rank = 2;
            } else {
                boolean hasAllReq = true;
                for (int i = 0; i < reqTokens.size(); i++) {
                    hasAllReq &= ForumsUtil.inArray(reqTokens.get(i), categoryNameTokens);
                }
                if (hasAllReq) {
                    int optTokensCNT = 0;
                    for (int i = 0; i < optTokens.size(); i++) {
                        if (ForumsUtil.inArray(optTokens.get(i), categoryNameTokens)) {
                            optTokensCNT++;
                        }
                    }
                    if (optTokensCNT > 0 || reqTokens.size() > 0) {
                        optMatchesTable.put(category, optTokensCNT);
                        rank = 3;
                    }
                }
            }
            if (rank > 0) {
                categoryRankTable.put(category, rank);
                categoryResultsList.add(category);
            }
        }

        Collections.sort(categoryResultsList,
                new CategoryResultComparator(categoryRankTable, optMatchesTable));

        ResultFilter pageFilter = new ResultFilter();
        pageFilter.setStartIndex(categoryStartIdx);
        pageFilter.setNumResults(categoryResultSize);

        Paging paging = new Paging(pageFilter, categoryResultsList.size());
        Paginator categoriesPaginator = new Paginator(paging);

        ForumsLocal forumsBean = (ForumsLocal) createLocalEJB(getInitialContext(), Forums.class);
        ArrayList<ForumCategory> categoryPageList = ForumsUtil.getPage(categoryResultsList, categoryStartIdx, categoryResultSize);
        if (categoryPageList.size() > 0) {
            Hashtable<String, ImageData> imageDataTable = ForumsUtil.getImageDataTable(forumsBean, categoryPageList);
            getRequest().setAttribute("imageDataTable", imageDataTable);
        }

        getRequest().setAttribute("categoriesPage", categoryPageList.iterator());
        getRequest().setAttribute("categoriesCount", new Integer(categoryResultsList.size()));
        getRequest().setAttribute("categoriesPaginator", categoriesPaginator);
    }

    class CategoryResultComparator implements Comparator<ForumCategory> {
        private Hashtable<ForumCategory, Integer> rankTable;
        private Hashtable<ForumCategory, Integer> optMatchesTable;    // number of optional tokens matched

        public CategoryResultComparator(Hashtable<ForumCategory, Integer> rankTable,
                                        Hashtable<ForumCategory, Integer> optMatchesTable) {
            this.rankTable = rankTable;
            this.optMatchesTable = optMatchesTable;
        }

        public final int compare(ForumCategory c1, ForumCategory c2) {
            int retVal = 0;
            retVal = rankTable.get(c1).compareTo(rankTable.get(c2));
            if (retVal == 0 && optMatchesTable.containsKey(c1) && optMatchesTable.containsKey(c2)) {
                retVal = -(optMatchesTable.get(c1).compareTo(optMatchesTable.get(c2)));
            }
            if (retVal == 0) {
                retVal = c1.getName().compareTo(c2.getName());
            }
            return retVal;
        }
    }
}
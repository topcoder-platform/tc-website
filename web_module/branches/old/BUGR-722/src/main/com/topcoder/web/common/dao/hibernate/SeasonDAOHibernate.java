package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.topcoder.web.common.dao.SeasonDAO;
import com.topcoder.web.common.model.Season;


/**
 * @author cucu
 */
public class SeasonDAOHibernate extends Base implements SeasonDAO {
    
    public SeasonDAOHibernate() {        
        super();
    }
    
    public SeasonDAOHibernate(Session session) {
        super(session);
    }
    
    public Season find(Integer seasonId) {
        return (Season) super.find(Season.class, seasonId);
    }

    /**
     * Return the current season, or the upcoming if there is no current season.
     */
    public Season findCurrent(Integer type) {
        List<Season> l = findCurrentAndUpcoming(type);
        if (l.size() == 0) return null;
        
        return l.get(0);
    }
    
    /**
     * Return the current and upcoming seasons.
     */
    @SuppressWarnings("unchecked")
    public List<Season> findCurrentAndUpcoming(Integer type) {
        Query q = session.createQuery(" from Season s where s.endDate > current and s.typeId = " + type + " order by s.endDate");
        return  q.list();        
    }

}

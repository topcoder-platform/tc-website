package com.topcoder.web.common.dao.hibernate;

import java.util.List;

import org.hibernate.Session;

import com.topcoder.web.common.dao.ImageDAO;
import com.topcoder.web.common.model.Image;
import com.topcoder.web.common.model.TimeZone;

/**
 * @author cucu, isv
 * @version 1.1
 */
public class ImageDAOHibernate extends Base implements ImageDAO {

    public ImageDAOHibernate() {
        super();
    }

    public ImageDAOHibernate(Session session) {
        super(session);
    }

    public List getTimeZones() {
        return findAll(TimeZone.class);
    }

    public Image find(Long id) {
        return (Image) find(Image.class, id);
    }


    @SuppressWarnings("unchecked")
    public List<Image> getImages() {
       return findAll(Image.class);
    }

    @SuppressWarnings("unchecked")
    public List<Image> getImages(Integer typeId) {
        return findAll(Image.class, "imageTypeId", typeId);
    }

    /**
     * <p>Saves or updates the data for the specified image to underlying persistent data store.</p>
     *
     * @param image an <code>Image</code> representing the image to be saved to data store.
     * @since Studio Submission Slideshow 
     */
    public void saveOrUpdate(Image image) {
        super.saveOrUpdate(image);
    }
}

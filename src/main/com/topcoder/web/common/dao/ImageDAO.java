package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Image;

import java.util.List;

/**
 * @author cucu, isv
 * @version 1.1
 */
public interface ImageDAO {
    List<Image> getImages();

    List<Image> getImages(Integer typeId);

    Image find(Long id);

    /**
     * <p>Saves or updates the data for the specified image to underlying persistent data store.</p>
     *
     * @param image an <code>Image</code> representing the image to be saved to data store.
     * @since Studio Submission Slideshow
     */
    void saveOrUpdate(Image image);
}

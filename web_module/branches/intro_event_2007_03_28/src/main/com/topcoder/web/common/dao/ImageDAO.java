package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Image;

import java.util.List;

/**
 * @author cucu
 */
public interface ImageDAO {
    List<Image> getImages();

    List<Image> getImages(Integer typeId);

    Image find(Integer id);
}

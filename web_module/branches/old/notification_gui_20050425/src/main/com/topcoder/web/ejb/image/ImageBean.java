package com.topcoder.web.ejb.image;

import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.ejb.idgeneratorclient.IdGeneratorClient;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Apr 6, 2005
 */
public class ImageBean extends BaseEJB {


    public long createImage(String fileName, int imageTypeId, long pathId, String dataSource)  {
        long id = IdGeneratorClient.getSeqId("IMAGE_SEQ");

        insert("image",
                new String[]{"image_id", "file_name", "image_type_id", "path_id"},
                new String[]{String.valueOf(id), fileName, String.valueOf(imageTypeId), String.valueOf(pathId)},
                dataSource);
        return id;
    }

    public void setFileName(long imageId, String fileName, String dataSource) {
        update("image", new String[]{"file_name"},
                new String[]{fileName},
                new String[]{"image_id"},
                new String[]{String.valueOf(imageId)},
                dataSource);

    }

    public void setImageTypeId(long imageId, int imageTypeId, String dataSource) {
        update("image", new String[]{"image_type_id"},
                new String[]{String.valueOf(imageTypeId)},
                new String[]{"image_id"},
                new String[]{String.valueOf(imageId)},
                dataSource);
    }

    public void setPathId(long imageId, long pathId, String dataSource) {
        update("image", new String[]{"path_id"},
                new String[]{String.valueOf(pathId)},
                new String[]{"image_id"},
                new String[]{String.valueOf(imageId)},
                dataSource);
    }

    public void setLink(long imageId, String link, String dataSource) {
        update("image", new String[]{"link"},
                new String[]{link},
                new String[]{"image_id"},
                new String[]{String.valueOf(imageId)},
                dataSource);
    }

    public void setHeight(long imageId, int height, String dataSource) {
        update("image", new String[]{"height"},
                new String[]{String.valueOf(height)},
                new String[]{"image_id"},
                new String[]{String.valueOf(imageId)},
                dataSource);
    }

    public void setWidth(long imageId, int width, String dataSource) {
        update("image", new String[]{"width"},
                new String[]{String.valueOf(width)},
                new String[]{"image_id"},
                new String[]{String.valueOf(imageId)},
                dataSource);
    }

    public String getFileName(long imageId, String dataSource) {
        return selectString("image", "file_name", new String[]{"image_id"},
                new String[]{String.valueOf(imageId)}, dataSource);

    }
    public int getImageTypeId(long imageId, String dataSource) {
        return selectInt("image", "file_name", new String[]{"image_id"},
                new String[]{String.valueOf(imageId)}, dataSource).intValue();
    }

    public long getPathId(long imageId, String dataSource) {
        return selectLong("image", "path_id", new String[]{"image_id"},
                new String[]{String.valueOf(imageId)}, dataSource).longValue();
    }
    public String getLink(long imageId, String dataSource) {
        return selectString("image", "link", new String[]{"image_id"},
                new String[]{String.valueOf(imageId)}, dataSource);
    }
    public int getHeight(long imageId, String dataSource) {
        return selectInt("image", "height", new String[]{"image_id"},
                new String[]{String.valueOf(imageId)}, dataSource).intValue();
    }
    public int getWidth(long imageId, String dataSource) {
        return selectInt("image", "width", new String[]{"image_id"},
                new String[]{String.valueOf(imageId)}, dataSource).intValue();
    }



}

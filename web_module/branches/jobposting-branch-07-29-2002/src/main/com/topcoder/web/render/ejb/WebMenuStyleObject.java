package	com.topcoder.web.render.ejb;

import	java.sql.Date;
import	java.io.Serializable;

public class WebMenuStyleObject 
  implements Serializable {
	public Integer	style_id;
	public String	style_desc;
	public Object	style_help;
	public Object	style_items;
}

<%@ page language="java"%>

<%! String getUserDisplay(com.coolservlets.forum.User u) {
      String color = "#cccccc";
      boolean bold = false;
      if ( u.getRating() > 2199 ) {
        color = "#ff0000";
      } else if ( u.getRating() > 1499 && u.getRating() < 2200 ) {
        color = "#ffff00";
      } else if ( u.getRating() > 1199 && u.getRating() < 1500 ) {
        color = "#66cccc";
      } else if ( u.getRating() > 899 && u.getRating() < 1200 ) {
        color = "#99ff33";
      } else if (u.getRating() >= 0 && u.getRating() < 900 ) {
        color = "#cccccc";
      } else if (u.getRating() < 0) {
        color = "#ff9933";
        bold = true;
      }
      
      if (bold)
        return "<FONT color=\""+color+"\"><B>"+u.getUsername()+"</B></FONT>";
      else 
        return "<FONT color=\""+color+"\">"+u.getUsername()+"</FONT>";
    }
%>

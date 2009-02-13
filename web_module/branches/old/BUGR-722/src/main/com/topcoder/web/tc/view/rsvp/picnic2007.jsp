<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<style type="text/css">
html{ 
margin:0px;
padding:0px;
font-family: Arial, Verdana, Helvetica, sans-serif;
}

body{ 
font-family: Arial, Verdana, Helvetica, sans-serif;
line-height: normal;
font-size: 12px;
color: #666666;
background: #FFFFFF;
margin:0px;
padding:0px 0px 20px 0px;
}

img{
border: none;
display: block;
}

h1{
color: #333333;
font-style: italic;
font-size: 125%;
}

h2{
color: #26408d;
}

h3{
color: #40ac49;
}

p{
padding: 0px;
margin: 0px 0px 10px 0px;
}

td, th{ 
line-height: normal;
font-size: 12px;
}

#content{
width: 700px;
margin: 20px;
background: #FFFFFF;
border: 4px solid #9fdae2;
}
</style>
</head>

<body>

<div align="center" style="background: transparent;">
    <div id="content">
        <div style="margin: 20px;" align="center">

            <div style="margin-bottom: 10px;">
                <img src="/i/about/rsvp/picnic2007/logo.png" alt="" />
            </div>

<p>
<em>TopCoder would like you and your family to join us at the
<br />Mt. Washington Hotel in Bretton Woods, New Hampshire
<br />for a weekend retreat in the mountains.</em>
</p>
 
<h2>
Schedule of Events
</h2>

<h3>
Friday, August 24
</h3>

<p>
<strong>7:00 pm Weekend Kickoff Party</strong>
<br />Mt. Washington Hotel South Veranda
</p>

<h3>
Saturday, August 25
</h3>

<p>
<strong>7:00 - 10:00 am Breakfast Buffet</strong>
<br />Mt. Washington Hotel Main Dining Room
</p>

<p>
<strong>10:00 am  Adventure Activities</strong>
<br />Lunch will be served
</p>

<p>
<strong>6:00 pm  Dinner &amp; Carnival</strong>
<br />Base Lodge
</p>

<p>
<strong>9:00 pm  Hypnotist Show</strong>
<br />Base Lodge
</p>

<h3>
Sunday, August 26
</h3>

<p>
<strong>7:00 - 10:00 am  Breakfast Buffet</strong>
<br />Mt. Washington Hotel Main Dining Room
</p>

<h2>
Adventure Activites
</h2>

<p>
Pick your Saturday activity. Spaces are
<br />reserved on a first come, first serve basis.
</p>

<h3>
Up For A Challenge
</h3>

<p>
Experienced Hike
<br />Mountain Biking (rentals available)
<br />Rock Climbing
</p>

<h3>
Picking Daisies
</h3>

<p>
Beginner Hike
<br />Nature Walk
</p>

<h3>
Just Wanna Have Fun
</h3>

<p>
Moose Hunt (no guns involved)
<br />Adult Recess (Bocce, wiffle, flag football)
<br />Bingo!
</p>

<h3>
It's In The Hole
</h3>

<p>
Golf Scramble
</p>

<h3>
Under Twelve
</h3>

<p>
Kids Camp
<br />Babysitting Services Available For Kids Under 4.
</p>

<h2>
RSVP by JULY 13, 2007
</h2>

<p>
Fill out the form below or contact:
<br />Jessie D'Amato Ford: 860-734-1233
<br />jford@topcoder.com 
</p>

<p>
Make sure to include your &amp; your guests'
<br />Adventure Activities to hold your spots!
</p>

<h2>
Important Info:
</h2>

<p>
All employees should make their own travel arrangements. 
</p>
<p>
Contact Barbara with travel questions.
</p>
<p>
All food and drink is provided.
</p>
<p>
All TopCoder Staff is invited with their spouse/significant other and children.
</p>
<p>
TopCoder will provide travel reimbursement expenses.
</p>

            <form name="submitRsvp" method="post" action="/tc">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Picnic2007Rsvp"/>

            <table cellpadding="4" cellspacing="0">
            <tbody>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td align="left">
                        <input name="attending" value="" type="radio" checked="checked" /> I will be attending
                        <br />
                        <input name="attending" value="not " type="radio" /> I will not be attending
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        Your Name:
                    </td>
                    <td>
                        <input type="text" size="30" name="name" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        Your Email:
                    </td>
                    <td>
                        <input type="text" size="30" name="email" />
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="2">
                        Guests (for any kids, give their names and ages):
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="guests" rows="3" cols="40"></textarea>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="2">
                        Activities (for all guests):
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="activities" rows="3" cols="40"></textarea>
                    </td>
                </tr>
            </tbody>
            </table>

            <button name="submit" value="submit" type="submit" class="button">Send</button>

            </form>

        </div>
    </div>
</div>


</body>

</html>

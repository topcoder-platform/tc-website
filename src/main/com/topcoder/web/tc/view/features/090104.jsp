<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
function changeImage(image, newImage) {
document[image].src=newImage;
return;
}
function open_window(url) {
mywin =
window.open(url,"win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');
}
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="features"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div style="margin: 0px 10px 0px 10px;">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

                        <p><font size="4"><strong>On Sentinels</strong></font><br />
                        Wednesday, September 1, 2004</p>

                        <p>By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=282560"><strong>leadhyena_inran</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
<p><b>Introduction</b><br/>
When competing in the arena, while it is important to be able to code a solution quickly in order to score more points, it is just as important for the solution to work so you can actually score those points. Use of sentinels is a technique that while it may not speed up the creation of your code or the speed of its operation, it will make your code less error-prone. By practicing the use of sentinels and internalizing them into your coding routine, it will make you worry less about corner cases that would normally nail your less cautious or more repetitious fellow coders.
<br/><br/>
The sentinel is a technique in programming where one avoids the checking of corner cases by placing a physical boundary around calculated values. The best way to explain it is through thought experiment: Picture yourself looking down a long narrow hallway that acted as a bridge across a bottomless pit. Walking down this hallway is maybe constrictive but rather simple, and with walls and a ceiling blocking all vision of the pit you wouldn't feel any fear of falling. Now, remove the walls and the ceiling. Even though you have more freedom to move about, and you are less constricted to move, it's not so easy to convince yourself that you could move faster that you did before the walls and extra floor was removed. The walls in this experiment are the sentinels; they make it easier for you to move about by restricting your movement. A sentinel is a collection of values in a data structure that make it easier for your code to avoid boundary checks by giving it walls to lean against; this sacrifice of space is made to increase the dependability of code.
<br/><br/>
Our first example illustrates the concept. The problem is that you are given an <span class="code">int[] values</span> and you need to determine how many elements in the array are greater than one of its neighbors. Let's also say for completeness that values can only have between 1 and 50 elements inclusive and that every value is between 1 and 10<sup>9</sup> inclusive. A first attempt at code would look like this:
<br/><br/>

<pre>
int neighborBest(int[] values){
	int count=0;
	for(int i=0; i&lt;values.length; i++){
		if(i==0){
			if(values[i]&gt;values[i+1])
				count++;
		} else if (i==values.length-1){
			if(values[i]&gt;values[i-1])
				count++;
		} else {
			if(values[i]&gt;values[i+1] || values[i]&gt;values[i-1])
				count++;
		}
	}
	
	return count;
}
</pre>

<br/><br/>
Notice the intricacies in the code when having to deal with the endpoints. This is you standing at the edge of the plank balancing yourself in place. While this code does work, there are at least two or three places where there could be bugs that could possibly be overlooked. This is due to code repetition: any time your code unnecessarily repeats you increase your chances of making a mistake in one of the repetitions. A faster and safer approach is to use sentinels. To use them you first give yourself room to place them, then place them, and then finally lean against them. Let's look at a solution with sentinels:
<br/><br/>

<pre>
int neighborBest(int[] values){
	int count=0;
	int auxa[]=new int[values.length+2]; // A
	Arrays.fill(auxa,Integer.MAX_VALUE); 
	for(int i=1;i&lt;auxa.length-1;i++)
		auxa[i]=values[i-1]; // B
	for(int i=1;i&lt;auxa.length-1;i++)
		if(auxa[i]&gt;Math.min(auxa[i-1],auxa[i+1]) // C
			count++; 
	return count;
}
</pre>

Not only is this approach simpler but it is much safer code. First look at step A. This is the creation of more space, for you need this extra space to place your walls. Then look at step B. This is the creation of the walls, where the rest of the values are recopied with the values in the original array. The most important part about this step is that the solution with the sentinels in place would be the exact same solution without the sentinels. In this case, the leftover <span class="code">Integer.MAX_VALUE</span>s act as walls in our search for lesser neighbors. Now for the active part of the code, look at step C. This is where we lean against the walls. Notice the lack of border checks. this is what we were looking for. We took three different corner cases and treated them all with the same case. It's a lot easier to verify your solution when you only have to check one case instead of three. While this may be a contrived example, the following examples will show the power of the sentinel.
<br/><br/>
The second example may not seem so obvious, but that is due to having to open your mind to the sentinel technique. Keep in mind that your walls need not be special values; they only need to be values that allow the code to lean against them in order to arrive at a solution. An example of this type of sentinel is when you're asked to look for a pattern x in a string y that represents not a line of letters but rather a circle of letters. One would obviously like to use available string search routines in some form, but most languages don't provide a construct for this kind of search. Three common approaches to this problem are to 1) rotate the letters and check each time for the pattern, 2) to look for partial substring matches in the beginning and look for the corresponding match in the back, and 3) to write your own naive matcher and ditch the prewritten routines entirely. All of these pass up the elegant move <span class="code">(y+y).indexOf(x)</span>. This is yet again a use of sentinels; notice that the creation of space is automatic in the string concatenation, the walls are formed by the boundaries of the new string, the new structure gives the exact same result, and the <span class="code">indexOf</span> method has no problems leaning against the newly-formed walls. Problem solved: elegantly, safely, and with lots of time to spare. Many successful coders made good use of this in the 2002 TCO Online Round 2 to get stellar scores in the 250.
<br/><br/>
Another great place to use a sentinel is in a map problem. In most map problems, you'll be given a <span class="code">String[]</span> that represents the map, with each character representing either an element of terrain or a wall. Just like in our first example, in map problems you'll have to look at the set of neighbors of a square of the map, and if you are at the edge or worse at a corner this set can become unwieldy. Sentinels can help in this situation. Assume that you cannot walk off the edge of the map, and that your <span class="code">String[]</span> map uses Xs as wall characters. Then the following bit of code may help:
<br/><br/>

<pre>
String[] mmap=new String[map.length+2];
Mmap[0]=mmap[mmap.length-1]="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX".substring(0,map[0].length()+2);
for(int i=1;i&lt;mmap.length-1;i++)
mmap[i]="X"+mmap[i]+"X";
</pre>

By wrapping the map in a new map with Xs all around the border it becomes much easier to detect the edge of the map. These Xs are literal sentinels. Your search in a legal square will never step outside the array because none of the border elements are legal, so as long as you start your search in a legal square you can always check the 8 neighbors without having to do border checks to see if the neighbor's location is still a legal array value. This is the most literal form of the sentinel, because you can see the walls you're making and leaning against, when I tried this the first time in the Arena it drove home of the power of this technique.
<br/><br/>The first time a CS student in college usually sees sentinels is in a data structures class when writing their first doubly-linked list. A sentinel is really useful here; just place the sentinel as the first element and have it point to itself as both the element in front of it and the element behind it. Note that the three steps are still here, but in this case the extra space used by the sentinel is really minimal and the one wall is used for both boundaries. This sentinel protects you from duplicating a number of checks during the add and delete procedure, making the code cleaner and less error-prone. Some tree implementations use this technique as well; most implementations of the red-black tree takes one black node and makes it the sentinel to represent what would normally be nulls in the left and right child pointers. This makes the rules check for red-black trees easier (not to mention other rather complicated add, delete, and rotate mechanisms), for one doesn't need to code in a special case for null pointers. Remember, it only takes one null-pointer exception to kill a solution in the Arena, and sentinels help to avoid that by never placing your code in the situation where it would be exposed to a null value.
<br/><br/>
Dynamic programming is another place you'll see the sentinel. This is because just like in map problems, DP problems calculate values by looking at neighbors. Let's say you're doing the quintessential DP problem: making best change. The best way to do this in DP is to dedicate an array with c rows and n columns, where c is the number of coin denominations and n is the value you're making change for. You'll see the lines:

<pre>
int dp[][] = new int[c+1][n+1];
dp[0][0]=1;
</pre>

The extra column makes sense (we want to represent all values from 0 cents to n cents), but why the extra row of mostly zeroes? Because the first row acts as a sentinel. Remember that the DP method usually calculates towards the correct answer by making intermediate calculations row by row, each row depending on the row before it. The calculations afterwards will start at row 1 and ignore row 0, because by starting at row 1 the coder always knows that there is a row behind the current row, and has no need to check for this row. Not only does this sentinel prevent a possible array index exception (or a possible segfault in C), but by removing another check that could become complicated if it tries to simulate this first row, it makes the code cleaner and easier to debug.
<br/><br/>
Once you start to use sentinels you will realize the power behind them. They are a very powerful coding technique to make your code safer, easier to debug, and much less prone to falling to corner cases. As mentioned earlier, it is not only important to be quick but it is also important to be correct, and sentinels allow you to be correct more often.
</p>
                        <p><br/></p>

                        <p>Would you like to <a href="/tc?module=Static&d1=features&d2=topics" class="bodyGeneric">write a feature?</a></p>



   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>

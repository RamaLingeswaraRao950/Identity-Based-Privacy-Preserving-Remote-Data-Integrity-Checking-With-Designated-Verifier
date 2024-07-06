<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<title>Verify</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-aller.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}
</script>


<style type="text/css">
<!--
.style1 {font-size: 24px}
.style2 {color: #FF0000}
.style4 {color: #FF0000; font-weight: bold; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
	<div class="logo style1">
        <h3 class="style1 style2">Identity Based Privacy Preserving Remote Data Integrity Checking
          <br />
          With a Designated Verifier </h3>
      </div>
      <div class="menu_nav">
        <ul>
          <li><a href="index.html"><span>Home </span></a></li>
          
          <li><a href="V_Main.jsp">Logout</a></li>
        </ul>
      </div>
   
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2>Block Verification Confirmation </h2>
          <p>&nbsp;</p>
          <div>


<%
		
  		String file = request.getParameter("file");
		String block = request.getParameter("block");
		String owner = request.getParameter("owner");
		
   		try {
		
			SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
		
		
	   	    String mac1,mac2; 
		   	String query1="";
			String query2="";
			if(block.equalsIgnoreCase("Block1"))
			{
			query1="select mac1 from backupcloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			query2="select mac1 from cloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			}
			if(block.equalsIgnoreCase("Block2"))
			{
			query1="select mac2 from backupcloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			query2="select mac2 from cloudserver where fname='"+file+"' and ownername='"+owner+"'";
			}
			if(block.equalsIgnoreCase("Block3"))
			{
			query1="select mac3 from backupcloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			query2="select mac3 from cloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			}
			if(block.equalsIgnoreCase("Block4"))
			{
			query1="select mac4 from backupcloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			query2="select mac4 from cloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			}
			
            Statement st1=connection.createStatement();
            ResultSet rs1=st1.executeQuery(query1);
	   if ( rs1.next() )
	      {
		    mac1=rs1.getString(1);
		   
		   
		    Statement st2=connection.createStatement();
		 
            ResultSet rs2=st2.executeQuery(query2);
	   if ( rs2.next() )
	      {
		   mac2=rs2.getString(1);
		   
		   if(mac1.equalsIgnoreCase(mac2))
		   {
		   %>
<h1>  <%=file%>  ---- <%=block %> ---  is Safe</h1><a href="V_Main.jsp">Back</a></br>

		  <%
		  
		  String type="Safe By Verifier";
		  String strQuery4 = "insert into verifierresults(fname,bname,ownername,vresponse,dt) values('"+ file+"','"+ block+"','"+owner+"','"+type+"','"+dt+ "')";
	      connection.createStatement().executeUpdate(strQuery4);
		   }
		   else
		   {
		    String type="Not Safe By Verifier";
			String strQuery4 = "insert into verifierresults(fname,bname,ownername,vresponse,dt) values('"+ file+"','"+ block+"','"+owner+"','"+type+"','"+dt+ "')";
			connection.createStatement().executeUpdate(strQuery4);
		   %>
		   <h1> <%=file%>  ---- <%=block %> ---is Not Safe</h1><a href="V_Main.jsp">Back</a><%
		
		   }
		    
		   
		   }
		   
		   }
		   
		   else
		   {%>
		   <h1> File doesnot exist</h1><a href="V_Main.jsp">Back</a><%
		   }
		    
       	}
      	catch(Exception e)
     	{
			out.println(e.getMessage());
   		}
   		//response.sendRedirect("O_VerifyBlock1.jsp");  
	%>


</div>
          <div align="justify"></div>
          <div class="clr"></div>
        </div>
        <p class="pages">&nbsp;</p>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            <span>
			
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search here" onBlur="if(this.value=='') this.value='Search here'" onFocus="if(this.value =='Search here' ) this.value=''" type="text" />
            </span>
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="clr"></div>
        <div class="gadget">
          <h2 class="star"><span>Sidebar</span> Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="V_Main.jsp">Home</a></li>
            <li><a href="V_Login.jsp">Logout</a></li>
          </ul>
        </div>
        <div class="gadget">
          <h2 class="star">&nbsp;</h2>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
  <div class="footer"></div>
</div>
<div align=center></div>
</body>
</html>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.util.Date" %>
<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@ include file="connect.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-georgia.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 24}
.style2 {padding:0; margin:0; width:100%; line-height:0; clear: both;}
.style3 {font-size: 36px; }
.style25 {color: #FFFFFF}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="U_Main.jsp">Home </a></li>
          <li><a href="U_Login.jsp">Logout</a></li>
        </ul>
      </div>
      <div class="logo">
        <h1 class="style3"><a href="index.html">Identity-Based Privacy Preserving Remote Data<br />
Integrity Checking With a Designated Verifier </a></h1>
      </div>
   
      </div>
      <div class="clr style1"></div>
    </div>
  </div>
  <div class="content style1">
    <div class="content_resize">
      <div class="mainbar">
        <div class="mainbar">
          <div class="article">
            <h2>Download  Files  </h2>
            <p class="infopost">&nbsp;</p>
            <%
		  
	try 
	{
		String file = request.getParameter("t1");
		String un=(String)application.getAttribute("uname");
		
	
				String mac1="";
				String mac2="";
				String mac3="";
				String mac4="";
				String sk="";
				String strQuery = "select * from cloudserver where fname='"+file+"' ";
				ResultSet rs = connection.createStatement().executeQuery(strQuery);
				if(rs.next()==true)
				{
							String oname1=rs.getString(3);
							String mac11=rs.getString(6);
							String  mac22=rs.getString(8);
							String  mac33=rs.getString(10);
							String  mac44=rs.getString(12);
							String  sk1=rs.getString(13);
							String Siz1=rs.getString(15);
							
							
							SimpleDateFormat sdfDate = new SimpleDateFormat(
							"dd/MM/yyyy");
							SimpleDateFormat sdfTime = new SimpleDateFormat(
							"HH:mm:ss");
							
							Date now = new Date();
							
							String strDate = sdfDate.format(now);
							String strTime = sdfTime.format(now);
							String dt = strDate + "   " + strTime;	
							
							
							%>
							<form action="DU_Download2.jsp" method="post" name="form1" id="form1">
							<table width="478" border="0" align="center">
							<tr>
							<td width="223" bgcolor="#FF0000"><span class="style1 style25"><strong>Enter File Name :</strong></span></td>
							<td width="245"><label>
							<input required="required" name="t1"
							type="text"  size="40" value="<%=file%>"/>
							</label></td>
							</tr>
							<tr>
							<td height="34" bgcolor="#FF0000"><span class="style1 style25"><strong>Enter Owner Name :</strong></span></td>
							<td><input name="oname" type="text" size="40" value="<%=oname1%>" /></td>
							</tr>
							<tr>
							<td height="34" bgcolor="#FF0000"><span class="style1 style25"><strong>Digital Sign 1 :</strong></span></td>
							<td><input name="t12" type="text" size="40" value="<%=mac11%>" /></td>
							</tr>
							<tr>
							<td height="34" bgcolor="#FF0000"><span class="style1 style25"><strong>Digital Sign 2 :</strong></span></td>
							<td><input name="t122" type="text" size="40" value="<%=mac22%>" /></td>
							</tr>
							<tr>
							<td height="34" bgcolor="#FF0000"><span class="style1 style25"><strong>Digital Sign 3 :</strong></span></td>
							<td><input name="t123" type="text" size="40" value="<%=mac33%>" /></td>
							</tr>
							<tr>
							<td height="34" bgcolor="#FF0000"><span class="style1 style25"><strong>Digital Sign 4 :</strong></span></td>
							<td><input name="t124" type="text" size="40"value="<%=mac44%>" /></td>
							</tr>
							<tr>
							<td bgcolor="#FF0000"><span class="style25 style1"><strong>Secret Key :</strong></span></td>
							<td><input name="t13" type="text" size="40" value="<%=sk1%>" /></td>
							</tr>
							<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							</tr>
							<tr>
							<td><div align="right">
							<input type="submit" name="Submit"
							value="Decrypt & Download" />
							</div></td>
							</tr>
							</table>
							</form>
							<%	
					}
					
					else
				   {
				
					out.println("File Doesn't Exist !!!");
					%>
					<p align="right">&nbsp;</p>
					<%
				   }	
			
		
		
		connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
            <div class="style2"></div>
            <div class="img">
              <div align="justify"></div>
            </div>
            <div class="post_content">
              <p align="right"><a href="DU_Main.jsp">Back</a></p>
            </div>
            <div class="style2"></div>
          </div>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
            
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="gadget">
          <h2 class="star"> Menu</h2>
          <div class="style2"></div>
          <ul class="sb_menu">
            <li><a href="DU_Main.jsp">Home</a></li>
            <li><a href="DU_Login.jsp">Logout</a></li>
          </ul>
        </div>
      </div>
      <div class="style2"></div>
    </div>
  </div>
  <div class="fbg style1"></div>
  <div class="footer style1">
    <div class="footer_resize">
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center class="style1"></div>
</body>
</html>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Deduplicator </title>
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
.style20 {
	color: #353c3e;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="D_Main.jsp">DEDUPLICATOR</a></li>
          <li><a href="D_Login.jsp">LOGOUT</a></li>
        </ul>
      </div>
      <div class="logo">
        <h1 class="style3">Leveraging Data Deduplication to Improve the Performance of Primary Storage Systems in the Cloud</h1>
      </div>
      <div class="clr style1"></div>
      <div class="slider style1">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="360" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="960" height="360" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="960" height="360" alt="" /> </a> </div>
        <div class="style2"></div>
      </div>
      <div class="clr style1"></div>
    </div>
  </div>
  <div class="content style1">
    <div class="content_resize">
      <div class="mainbar">
        <div class="mainbar">
          <div class="article">
            <h2> Deduplication Details </h2>
            <p class="infopost">&nbsp;</p>
            <p class="style20">
              <%
		  String name=request.getParameter("name");
		    String fname=request.getParameter("file");
					    String block=request.getParameter("block");
						    String mac=request.getParameter("mac");
						
			String query1="", query2="", query3="", query4="";
			
			query1="select mac1,fname,ownername from cloudserver  where fname!='"+fname+"'";
			
			query2="select mac2,fname,ownername from cloudserver where fname!='"+fname+"'";
		
			query3="select mac3,fname,ownername from cloudserver where fname!='"+fname+"'";
			
			query4="select mac4,fname,ownername from cloudserver where fname!='"+fname+"'";
			
			%>
            <h3>
              <span class="style20"><%=block%> File <%=fname%> of owner <%=name%> Deduplication details 
              </p>
              </span>
            <table width="598" border="1" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="100" height="32" class="style20"><span class="style4">Owner</span></td>
                <td width="100" class="style20"><span class="style4">File Name :- </span></td>
                <td width="100" class="style20"><span class="style4">Block </span></td>
              </tr>
              <%
		  try
		  {
		  ResultSet rs1=connection.createStatement().executeQuery(query1);
		  ResultSet rs2=connection.createStatement().executeQuery(query2);
		  ResultSet rs3=connection.createStatement().executeQuery(query3);
		  ResultSet rs4=connection.createStatement().executeQuery(query4);
			while(rs1.next())
			{
				
					String str=rs1.getString(1);
					if(mac.equalsIgnoreCase(str))
					{
					  %>
					  <tr>
						<td width="100" height="28" class="style20"><span class="style4"> <%=rs1.getString(3)%></span></td>
						<td width="100" class="style20"><span class="style4"> <%=rs1.getString(2)%></span></td>
						<td width="100" class="style20"><span class="style4"> Block-1</span></td>
					  </tr>
					  <%
					 } 
				/*}
				else
				{
						%><span class="style20"> No Deduplication Files Found ..!!</span><%
				}*/
			}
	%>
              <%
		  while(rs2.next())
		  {
		  String str=rs2.getString(1);
		  if(mac.equalsIgnoreCase(str))
		  {
		  %>
              <tr>
                <td width="100" height="27" class="style20"><span class="style4"> <%=rs2.getString(3)%></span></td>
                <td width="100" class="style20"><span class="style4"> <%=rs2.getString(2)%></span></td>
                <td width="100" class="style20"><span class="style4"> Block-2</span></td>
              </tr>
              <%
	}
	}
	%>
              <%
		  while(rs3.next())
		  {
		  String str=rs3.getString(1);
		  if(mac.equalsIgnoreCase(str))
		  {
		  %>
              <tr>
                <td width="100" height="27" class="style20"><span class="style4"> <%=rs3.getString(3)%></span></td>
                <td width="100" class="style20"><span class="style4"> <%=rs3.getString(2)%></span></td>
                <td width="100" class="style20"><span class="style4"> Block-3</span></td>
              </tr>
              <%
	}
	}
	%>
              <%
		  while(rs4.next())
		  {
		  String str=rs4.getString(1);
		  if(mac.equalsIgnoreCase(str))
		  {
		  %>
              <tr>
                <td width="100" height="26" class="style20"><span class="style4"> <%=rs4.getString(3)%></span></td>
                <td width="100" class="style20"><span class="style4"> <%=rs4.getString(2)%></span></td>
                <td width="100" class="style20"><span class="style4"> Block-4</span></td>
              </tr>
              <%
	}
	}
	%>
            </table>
              <span class="style20">
              <%

}
catch(Exception e)
{
e.printStackTrace();
}%>
              </span>
            <p align="right"><a href="D_F_Dedup.jsp">back</a></p>
            <div class="img">
              <div align="justify"></div>
            </div>
            <div class="post_content">
              <p align="justify">&nbsp;</p>
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
            <li><a href="D_Main.jsp">Home</a></li>
            <li><a href="D_Login.jsp">Logout</a></li>
          </ul>
        </div>
      </div>
      <div class="style2"></div>
    </div>
  </div>
  <div class="fbg style1">
    <div class="fbg_resize">
      <div class="col c1">
        <h2>Storage Capacity</h2>
        <a href="#"><img src="images/gal1.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal2.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal3.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal4.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal5.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal6.jpg" width="75" height="75" alt="" class="gal" /></a> </div>
      <div class="col c2">
        <h2>Data Redundancy</h2>
        <p align="justify">Experimental studies reveal that data redundancy exhibits a much higher level of intensity on the I/O path than that on disks due to relatively high temporal access locality associated with small I/O requests to redundant data. Moreover, directly applying data deduplication to primary storage systems in the Cloud will likely cause space contention in memory and data fragmentation<br />
        on disks.</p>
      </div>
      <div class="col c3">
        <h2>Primary Storage</h2>
        <p align="justify">Recent studies have shown that moderate to high data redundancy clearly exists in primary storage systems in the Cloud. Our experimental studies reveal that data redundancy exhibits a much higher level of intensity on the I/O path than that on<br />
        disks due to relatively high temporal access locality associated with small I/O requests to redundant data.</p>
      </div>
      <div class="style2"></div>
    </div>
  </div>
  <div class="footer style1">
    <div class="footer_resize">
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center class="style1"></div>
</body>
</html>

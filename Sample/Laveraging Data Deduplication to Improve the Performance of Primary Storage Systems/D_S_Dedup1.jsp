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
.style20 {color: #353c3e}
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
            <h2>Send  Deduplicated File Details </h2>
            <p class="infopost">&nbsp;</p>
            <div class="style2"></div>
            <div class="img">
              <div align="justify"></div>
            </div>
            <div class="post_content">
              <%
		    String fname=request.getParameter("file");
			String query="";
			
		  try
		  {
          
		  query="select mac1,mac2,mac3,mac4 ,ownername,status from cloudserver where  fname='"+fname+"'";
		  ResultSet rs=connection.createStatement().executeQuery(query);
		  if(rs.next())
		  {
		  String status=rs.getString(6);
		  if(status.equalsIgnoreCase("Shared"))
		  {
		  
		  	%>File  <%=fname%> is Already Shared<%
 		  }
		  else
		  {
		  
		  %>
              <form action="D_S_Dedup2.jsp" method="post">
                <table width="598" border="0" align="left" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="286" height="49"><span class="style20 style4"><strong>File Name :- </strong></span></td>
                    <td width="356"><input name="file" type="text" id="t42" size="50" value="<%=fname%>" readonly="readonly"></td>
                  </tr>
                  <input name="name" type="hidden" id="t42" size="50" value="<%=rs.getString(5)%>" readonly="readonly">
                  <tr>
                    <td width="286" height="34"><span class="style20 style4"><strong>Mac1 :- </strong></span></td>
                    <td width="356"><input name="mac1" type="text" id="t42" size="50" value="<%=rs.getString(1)%>" readonly="readonly"></td>
                  </tr>
                  <tr>
                    <td height="34"><span class="style20 style4"><strong>Mac2 :- </strong></span></td>
                    <td><input name="mac2" type="text" id="t42" size="50" value="<%=rs.getString(2)%>" readonly="readonly" /></td>
                  </tr>
                  <tr>
                    <td height="34"><span class="style20 style4"><strong>Mac3 :- </strong></span></td>
                    <td><input name="mac3" type="text" id="t42" size="50" value="<%=rs.getString(3)%>" readonly="readonly" /></td>
                  </tr>
                  <tr>
                    <td height="34"><span class="style20 style4"><strong>Mac4 :- </strong></span></td>
                    <td><input name="mac4" type="text" id="t42" size="50" value="<%=rs.getString(4)%>" readonly="readonly" /></td>
                  </tr>
                  <tr>
                    <td height="44"><div align="right"></div></td>
                    <td><input type="submit" name="Submit2" value="Find &amp; Send Deduplication" /></td>
                  </tr>
                </table>
              </form>
              <%
			  }
}
}
catch(Exception e)
{
e.printStackTrace();
}%>
<p>&nbsp;</p>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <p align="right"><a href="D_Main.jsp">Back</a></p>
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
            <li><a href="D_ViewFiles.jsp">View Files </a></li>
            <li><a href="D_F_Dedup.jsp">Find Deduplication </a></li>
            <li><a href="D_S_Dedup.jsp">Send Deduplication </a></li>
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

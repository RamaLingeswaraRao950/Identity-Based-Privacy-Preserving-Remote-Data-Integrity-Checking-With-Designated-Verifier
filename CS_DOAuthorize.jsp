<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="com.oreilly.servlet.*,java.lang.*,java.text.SimpleDateFormat,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec"%>
<%@ page import="org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.util.Random,java.io.PrintStream, java.io.FileOutputStream, java.io.FileInputStream, java.security.DigestInputStream, java.math.BigInteger, java.security.MessageDigest, java.io.BufferedInputStream" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Cloud  </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-titillium-250.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style7 {font-size: 14px; font-weight: bold; }
.style14 {color: #FF0000}
.style16 {font-size: 14px; font-weight: bold; color: #FF0000; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html"><span>Identity-Based Privacy Preserving Remote Data<br />
Integrity Checking With a Designated Verifier
</span></a><a href="index.html"><span></span></a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="CS_Main.jsp"><span>Home </span></a></li>
          <li><a href="CS_Login.jsp"><span>Logout</span></a></li>
          <li><a href="GM_Login.jsp"></a></li>
          <li><a href="TA_Login.jsp"></a></li>
          <li><a href="CS_Login.jsp"></a></li>
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
          <h2><span>Authorize Data Owners </span></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
          <div class="article">
            <table width="602" border="2" style="border-collapse:collapse" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="84" height="32" bgcolor="#FFFF00"><div align="center" class="style7 style14">User Image </div></td>
                <td width="72" bgcolor="#FFFF00"><div align="center" class="style16"> Name </div></td>
                <td width="126" bgcolor="#FFFF00"><div align="center" class="style16">E-Mail </div></td>
                <td width="86" bgcolor="#FFFF00"><div align="center" class="style16">Mobile</div></td>
                <td width="92" bgcolor="#FFFF00"><div align="center" class="style16">Address</div></td>
                <td width="94" bgcolor="#FFFF00"><div align="center" class="style16">Status </div></td>
              </tr>
              <%

      	
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="",s9,s10,s11,s12,s13="";
	int i=0;

      	try 
	{
        
           String query="select * from downer"; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		i=rs.getInt(1);
		s1=rs.getString(2);
		s2=rs.getString(4);
		s3=rs.getString(5);
		s4=rs.getString(6);
		s5=rs.getString(12);
		
	
		%>
              <tr>
                <td height="85"><div align="center">
                    <input  name="image" type="image" src="profileimage1.jsp?imgid=<%=i%>" width="80" height="80" alt="Submit" />
                </div></td>
                <td><div align="center"><%=s1%></div></td>
                <td ><div align="center"><%=s2%></div></td>
                <td><div align="center"><%=s3%></div></td>
                <td><div align="center"><%=s4%></div></td>
                <%
						if(s5.equalsIgnoreCase("Waiting"))
						{
							%>
                <td><div align="center"><a href="CS_DAStatus.jsp?id=<%=i%>"><%=s5%></div></td>
                <%
						}
						else
						{
							%>
                <td width="32"><div align="center"><%=s5%></div></td>
                <%
						}	
	   }
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
              </tr>
            </table>
            <p align="justify">&nbsp;</p>
            <p align="right"><a href="CS_Main.jsp">Back</a></p>
          </div>
          <div class="clr"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            <span>
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search :" type="text" />
            </span>
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="clr"></div>
        <div class="g1">
          <div class="g2">
            <div class="gadget">
              <h2 class="star">Menu</h2>
              <div class="clr"></div>
              <ul class="sb_menu">
                
                <li><a href="CS_Main.jsp">Home </a></li>
                <li><a href="CS_Login.jsp">Logout</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer"></div>
</div>
<div align=center></div>
</body>
</html>

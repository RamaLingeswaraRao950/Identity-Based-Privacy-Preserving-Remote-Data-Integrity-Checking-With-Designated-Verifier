<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.lang.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Cloud Main</title>
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
.style21 {font-size: 14px}
.style4 {color: #666666; font-weight: bold; font-size: 14px; }
.style24 {color: #666666}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="C_Main.jsp">CLOUD</a></li>
          <li><a href="C_Login.jsp">LOGOUT</a></li>
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
        <div class="article">
          <h2>Add  Memory   </h2>
          <p class="infopost">&nbsp;</p>
          <div class="style2"></div>
          <div class="img">
            <div align="justify"></div>
          </div>
          <div class="post_content">
            <p align="justify" class="style21"><a href="PC_AssignedMemSLA.jsp"><strong>View Assigned DataOwner's Memory And SLA Period </strong></a></p>
            <span class="style24">
            <%--<p align="justify"><a href="PC_AddMemory.jsp" class="style6">Add Memory</a></p>
            <p align="justify" class="style4"><a href="PC_AddSLA.jsp" class="style5">Add (Service Level Agreement)SLA Period </a></p>--%>
            </span>
            <table width="579"border="2"  style="border-collapse:collapse"  cellpadding="0" cellspacing="0" align="center">
              <tr>
                <td width="168" height="30" class="style24"><div align="center" class="style21"><strong>Cloud Name </strong></div></td>
                <td width="176" class="style24"><div align="center" class="style21"><strong> Memory </strong></div></td>
                <td width="176" class="style24"><div align="center" class="style21"><strong>SLA from</strong></div></td>
                <td width="176" class="style24"><div align="center" class="style21"><strong>SLA to</strong></div></td>
                <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
	String name=(String)application.getAttribute("cloudname");
	
	
try 
	{
      		String query="Select *from cloudstorage where cloud='"+name+"'"; 
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery(query);
			while ( rs.next() )
			{
					i=rs.getInt(1);
					s2=rs.getString(2);
					s3=rs.getString(3);
					s4=rs.getString(4);
					s5=rs.getString(5);
					
									
					%>
              </tr>
              <tr>
                <td height="28" class="style24"><div align="center"><%=s2%></div></td>
                <td class="style24"><div align="center"><%=s3%>Memory</div></td>
                <td class="style24"><div align="center"><%=s4%></div></td>
                <td class="style24"><div align="center"><%=s5%></div></td>
                <%					
			 		
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
            <p align="justify" class="style4"> </p>
            <form action="C_addstorage.jsp" method="post" name="form1" class="style24" id="form1">
              <table width="427" border="0" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
                <tr>
                  <th height="40" scope="row"><div align="left">Select Cloud: </div></th>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <select name="cloud">
                        <option><%=application.getAttribute("cloudname")%></option>
                      </select>                  </td>
                </tr>
                <tr>
                  <th height="40" scope="row"><div align="left">Enter Memory: </div></th>
                  <td><label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input name="memory" type="text" size="10" maxlength="8" />
                    </label>
                    MB </td>
                </tr>
                <tr>
                  <th width="141" height="40" scope="row"><div align="left">Enter SLA: </div></th>
                  <td width="286"><label> From
                    <input name="slafrom" type="text" size="10" maxlength="10" />
                    </label>
                    To
                    <input name="slato" type="text" size="10" maxlength="10" /></td>
                </tr>
                <tr>
                  <th height="89" scope="row">&nbsp;</th>
                  <td><label>
                    <input type="submit" name="Submit" value="Submit" />
                    </label>                  </td>
                </tr>
              </table>
            </form>
            <p align="right" class="style24"><a href="C_Main.jsp">Back</a></p>
          </div>
          <div class="style2"></div>
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
            <li><a href="C_Main.jsp">Home</a></li>
            <li><a href="C_Login.jsp">Logout</a></li>
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

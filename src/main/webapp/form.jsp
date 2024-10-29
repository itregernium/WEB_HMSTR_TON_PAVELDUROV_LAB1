<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.util.Locale" %>
<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="java.util.Date" %>
<%
    Locale locale = new Locale("en", "US");
    ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
%>
<form method="GET" autocomplete="off">
    <label for="x"><%= bundle.getString("xLabel") %></label>
    <div id="x">
        <label><input type="radio" name="x" value="-4" required>-4</label>
        <label><input type="radio" name="x" value="-3" required>-3</label>
        <label><input type="radio" name="x" value="-2" required>-2</label>
        <label><input type="radio" name="x" value="-1" required>-1</label>
        <label><input type="radio" name="x" value="0" required>0</label>
        <label><input type="radio" name="x" value="1" required>1</label>
        <label><input type="radio" name="x" value="2" required>2</label>
        <label><input type="radio" name="x" value="3" required>3</label>
        <label><input type="radio" name="x" value="4" required>4</label>
    </div>
    <label for="y"><%= bundle.getString("yLabel") %>
        <input type="number" id="y" name="y" placeholder="-3..5" min="-3" max="5" step="0.1" required>
    </label>
    <label for="r"><%= bundle.getString("rLabel") %>
        <input type="number" id="r" name="r" placeholder="1..4" min="1" max="4" step="0.1" required>
    </label>
    <button id="submit"><%= bundle.getString("submit") %></button>
    <%--<button id="clear"><%= bundle.getString("clear") %></button>--%>
    <%! Date nnn = new Date(); %>
</form>


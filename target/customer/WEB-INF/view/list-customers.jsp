<%--
  Created by IntelliJ IDEA.
  User: evghenii
  Date: 9/6/18
  Time: 5:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCKTYPE html>
<html>
<head>
    <title>Customers</title>

    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
</head>
<body>

<div id="wrapper">
    <div id="header">
        <h2>Customer Relationship Manager</h2>
    </div>
</div>


<div id="container">
    <div id="content">
        <%--add customer--%>
        <input type="button" value="Add customer" onclick="window.location.href='newCustomer'; return false;"
        class="add-button"/>

            <form:form action="search" method="POST">
                Search customer(by last name): <input type="text" name="theSearchName" />
                <input type="submit" value="Search" class="add-button" />
            </form:form>

            <table>
            <tr>
            <th>First name</th>
            <th>Last name</th>
            <th>Email</th>
                <th>Action</th>
            </tr>

            <c:forEach var="tempCustomer" items="${customerList}">

                <c:url value="/customer/updateCustomer" var="updateLink">
                    <c:param name="customerId" value="${tempCustomer.id}"/>
                </c:url>
                <c:url value="/customer/deleteCustomer" var="deleteLink">
                    <c:param name="customerId" value="${tempCustomer.id}"/>
                </c:url>

                <tr>
                    <td>${tempCustomer.firstName}</td>
                    <td>${tempCustomer.lastName}</td>
                    <td>${tempCustomer.email}</td>
                    <td>
                        <a href="${updateLink}">Update</a>
                        |
                        <a href="${deleteLink}"
                        onclick="if (!(confirm('Are you sure want to delete this customer?'))) return false">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

</body>
</html>

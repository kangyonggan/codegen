<#assign ctx="${(rca.contextPath)!''}">

<tr id="token-${token.code}">
    <td><#include "type.ftl"></td>
    <td>${token.mobile}</td>
    <td>${token.code}</td>
    <td><#include "delete.ftl"></td>
    <td><@c.relative_date datetime=token.createdTime/></td>
    <td><@c.relative_date datetime=token.updatedTime/></td>
</tr>
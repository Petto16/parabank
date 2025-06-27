<%@ include file="../include/include.jsp" %>

<!-- Congrats! You've found the secret Easter Carrot Egg. Your debugging skills are strong with this one. -->
<h1 class="title"><fmt:message key="bill.payment.complete"/> Carrot +1</h1>

<p>
  <fmt:formatNumber type="currency" pattern="$0.00;-$0.00" value="${model.amount}" var="amount"/>
  <fmt:formatNumber type="number" pattern="#" value="${model.fromAccountId}" var="fromAccountId"/>
  <fmt:message key="billpay.confirmation">
    <fmt:param value="<span id='payeeName'>${model.payeeName}</span>"/>
    <fmt:param value="<span id='payeeName'>${amount}</span>"/>
    <fmt:param value="<span id='fromAccountId'>${fromAccountId}</span>"/>
  </fmt:message>
</p>

<p><fmt:message key="see.account.activity"/></p>
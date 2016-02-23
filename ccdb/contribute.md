---
layout: ccdb
title: Contribute
nav: contribute
---

### API documentation

The Consumer Complaint Database's application programming interface (API) allows you to filter and download complaint data in machine-readable formats. The API uses the following base url:

<code>http://data.consumerfinance.gov/api/views</code>

By adding a <code>view ID</code> and the <code>rows</code> parameter, you can create a url, or endpoint, that will download complaints by category. You can also choose a data format by appending your choice (such as csv, json or xml) to your endpoint.

The following endpoint will download debt collection complaints as a csv file, a format that can be opened as a spreadsheet:

<code>http://data.consumerfinance.gov/api/views/fphp-cr5a/rows.csv</code>

**View IDs**

Here are the main view IDs for downloading complaints by category:

<table class="table-code">
<thead>
<tr>
<th>ID</th>
<th>Category</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>s6ew-h6mp</code></td>
<td>Consumer complaints (all categories)</td>
</tr>
<tr>
<td><code>t9fg-cqmi</code></td>
<td>Bank accounts or services</td>
</tr>
<tr>
<td><code>7zpz-7ury</code></td>
<td>Credit cards</td>
</tr>
<tr>
<td><code>xa48-juie</code></td>
<td>Credit reporting</td>
</tr>
<tr>
<td><code>ckyu-ku28</code></td>
<td>Debt collection</td>
</tr>
<tr>
<td><code>uha4-cwwn</code></td>
<td>Money transfers</td>
</tr>
<tr>
<td><code>g5qz-smft</code></td>
<td>Mortgages</td>
</tr>
<tr>
<td><code>b239-tvpx</code></td>
<td>Other financial services</td>
</tr>
<tr>
<td><code>6hp8-hzag</code></td>
<td>Payday loans</td>
</tr>
<tr>
<td><code>6yuf-367p</code></td>
<td>Prepaid cards</td>
</tr>
<tr>
<td><code>eew7-9yf2</code></td>
<td>Student loans</td>
</tr>
<tr>
<td><code>wfbn-zkat</code></td>
<td>Vehicle or other consumer loans</td>
</tr>
</tbody>
</table>

**More options**

Since this API is based on the Socrata Open Data API, you can also use Socrata's <code>resource</code> parameter to search and filter the data set. When using this option, be aware that Socrata imposes limits on the number of rows returned and may limit how quickly you can make requests if you send lots of them.

For details about Socrata's <code>resource</code> endpoint options, see [Socrata's API documentation overview](https://dev.socrata.com/docs/endpoints.html).

<body id="contribute"></body>
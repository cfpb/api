---
published: true
layout: default

---

<div class="m-notification
        m-notification__visible
        m-notification__warning" style="position: relative; padding: 15px; border: 1px solid #b4b5b6; background: #fff0dd; border-color: #ff9e1b; display: block;">
  <svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 1000 1200" class="cf-icon-svg" style="overflow: hidden; height: 1.1875em; vertical-align: text-top; max-width: 1em; position: absolute; fill: #ff9e1b;">
    <path d="M500 105.2c-276.1 0-500 223.9-500 500s223.9 500 500 500 500-223.9 500-500-223.9-500-500-500zm-49.7 234.6c0-27.6 22.4-50 50-50s50 22.4 50 50v328.6c0 27.6-22.4 50-50 50s-50-22.4-50-50V339.8zm50 582.5c-39.6 0-71.7-32.1-71.7-71.7s32.1-71.7 71.7-71.7S572 811 572 850.6s-32.1 71.7-71.7 71.7z" /></svg>
  <div class="m-notification_content" style="padding-left: 1.5625em;">
    <div class="h4 m-notification_message" style="font-size: 1.125em; font-weight: 500; letter-spacing: initial; line-height: 1.25; text-transform: initial; margin-bottom: 0;">This tool will sunset on 9/25/2020.</div>
    <p class="m-notification_explanation" style="margin: 1em 0; margin-bottom: 0; margin-top: .3125em;">
      <a href="https://www.consumerfinance.gov/data-research/hmda-api-retirement/">Learn more</a>.
      You can continue to analyze and download HMDA data using the following resources:
    </p>
    <ul style="margin-bottom: 0; margin-top: .3125em;">
      <li>
        <a href="https://ffiec.cfpb.gov/data-publication/">
          FFIEC Data Publication Products
        </a>
        (2017 &amp; later)
      </li>
      <li>
        <a href="https://ffiec.cfpb.gov/data-browser/">
          HMDA Data Browser and API
        </a>
        (2018 &amp; later)
      </li>
      <li>
        <a href="https://www.consumerfinance.gov/data-research/hmda/historic-data/">
          Historic HMDA Data
        </a>
        (2007–2017)
      </li>
      </ul>
  </div>
</div>

### Overview

Each year thousands of banks and other financial institutions report data about mortgages to the public as part of the [Home Mortgage Disclosure Act (HMDA)](http://www.consumerfinance.gov/hmda/#video). This data is important because:

- It helps show whether lenders are serving the housing needs of their communities;
- It gives public officials insight that helps them make informed decisions about policies; and
- It sheds light on lending patterns that could be discriminatory

##### Get started
We built the API to be as self-documenting as possible, but if you find yourself overwhelmed, we organized this site into four major areas.

- [API basics](basics.html) introduces you to the operations offered by the API.
- [API calls](console/) gives you a hands-on experience of those operations with an interactive console.
- [Query language](queries.html) contains a comprehensive listing of all the API's types, functions, and enumerations.
- [Field reference](fields.html) lists and describes the type of information reported in the LAR.

##### The HMDA API and Qu

[HMDA](http://www.consumerfinance.gov/hmda) is the CFPB's first dataset to publish using [Qu](http://cfpb.github.io/qu/), an in-progress data platform created to serve public data.

Qu is the first CFPB project built from the beginning on [GitHub](https://github.com/cfpb/), too. If you think you can make the API better–or just want to take a look under the hood–check it out, and learn about how you can host your own datasets or contribute to the project.

<ul class="repo-list">
  <li class="list-icon">
    <p class="image-wrap">
      <img src="../static/img/octocat.png" width="25px" title="Github">
    </p>
  </li>
  <li>
    <a href="https://github.com/cfpb/qu">
     <h4>Qu</h4>
      <p>The open source software that runs the platform</p>
    </a>
  </li>
</ul>
<body id="overview"></body>


Not interested in programming? You can still get the data! Visit the [explore the data](http://www.consumerfinance.gov/hmda/explore) section of our HMDA site, where you can create [custom data sets](http://consumerfinance.gov/hmda/explore.html) for download.

---
layout: ccdb
title: Release notes
nav: release-notes
---

### Release notes
<div class="expandable-group">
    <div class="expandable-group_items">
        <div class="expandable expandable__padded">
            <button class="expandable_header expandable_target" title="Expand content">
                <span class="expandable_header-left expandable_label">
                    Release 18 – August 2021
                </span>
                <span class="expandable_header-right expandable_link">
                    <span class="expandable_cue-open">
                        <span class="u-visually-hidden">Show</span>
                        <span class="cf-icon cf-icon-plus-round"></span>
                    </span>
                    <span class="expandable_cue-close">
                        Hide
                        <span class="cf-icon cf-icon-minus-round"></span>
                    </span>
                </span>
            </button>
            <div class="expandable_content">
                <p>
                    This release makes a significant upgrade to the technology behind complaint searches but should 
                    have little effect on users.
                </p>
                <p>
                    The main change is refactoring the [complaint database API](https://github.com/cfpb/ccdb5-api) to use version 7.9 of Elasticsearch, 
                    which is the indexing engine supporting the CFPB's complaint-search operations.
                </p>
                <p>
                    The upgrade should improve search performance and accuracy and offer a more stable method 
                    for exploring large sets of search results. 
                </p>
            </div>
        </div>
        <div class="expandable expandable__padded">
            <button class="expandable_header expandable_target" title="Expand content">
                <span class="expandable_header-left expandable_label">
                    Release 17 – July 2020
                </span>
                <span class="expandable_header-right expandable_link">
                    <span class="expandable_cue-open">
                        <span class="u-visually-hidden">Show</span>
                        <span class="cf-icon cf-icon-plus-round"></span>
                    </span>
                    <span class="expandable_cue-close">
                        Hide
                        <span class="cf-icon cf-icon-minus-round"></span>
                    </span>
                </span>
            </button>
            <div class="expandable_content">
                <p>This release adds a Trends View and API endpoint to the Consumer Complaint Database. Database users are able to:</p>
                <ul>
                    <li>View overall complaints over time</li>
                    <li>
                        View trends for complaints for products or companies
                    </li>
                    <li>
                        Apply word searches and filters to see trends
                    </li>
                    <li>
                        View product or company complaint snapshots
                    </li>
                    <li>
                        Toggle' between ‘Trends’, ‘Map’ and 'List' views to visualize and read complaints
                    </li>
                    <li>
                        Print out selected visualizations
                    </li>
                </ul>
            </div>
        </div>
        <div class="expandable expandable__padded">
            <button class="expandable_header expandable_target" title="Expand content">
                <span class="expandable_header-left expandable_label">
                    Release 16 – April 2020
                </span>
                <span class="expandable_header-right expandable_link">
                    <span class="expandable_cue-open">
                        <span class="u-visually-hidden">Show</span>
                        <span class="cf-icon cf-icon-plus-round"></span>
                    </span>
                    <span class="expandable_cue-close">
                        Hide
                        <span class="cf-icon cf-icon-minus-round"></span>
                    </span>
                </span>
            </button>
            <div class="expandable_content">
                <p>This release adds a geospatial view to the Consumer Complaint Database. With this addition, database users will now be able to view complaints by state with a U.S. map visualization, including the ability to:</p>
                <ul>
                    <li>Select from pre-defined time frames (e.g., 3 years) to help users understand more recent marketplace conditions</li>
                    <li>
                        Map complaints per 1,000 population or total complaints by state
                    </li>
                    <li>
                        View aggregate information about products and issues consumers submit complaints about
                    </li>
                    <li>
                        Apply word searches and filters to update the interactive map
                    </li>
                    <li>
                        'Toggle' back to the 'List' view to read complaints
                    </li>
                </ul>
            </div>
        </div>
        <div class="expandable expandable__padded">
            <button class="expandable_header expandable_target" title="Expand content">
                <span class="expandable_header-left expandable_label">
                    Release 15 – January 2020
                </span>
                <span class="expandable_header-right expandable_link">
                    <span class="expandable_cue-open">
                        <span class="u-visually-hidden">Show</span>
                        <span class="cf-icon cf-icon-plus-round"></span>
                    </span>
                    <span class="expandable_cue-close">
                        Hide
                        <span class="cf-icon cf-icon-minus-round"></span>
                    </span>
                </span>
            </button>
            <div class="expandable_content">
                <p>The CFPB recently updated its Application Programming Interface (API) service to ensure seamless data availability for users and real-time consistency with the Consumer Complaint Database. The Socrata platform has been retired. Check out our <a href="https://www.consumerfinance.gov/data-research/consumer-complaints/search/">search tool</a> and the new <a href="api.html">API service</a> to learn more about consumer complaints.</p>
            </div>
        </div>
        <div class="expandable expandable__padded">
            <button class="expandable_header expandable_target" title="Expand content">
                <span class="expandable_header-left expandable_label">
                    Release 14 – November 2017
                </span>
                <span class="expandable_header-right expandable_link">
                    <span class="expandable_cue-open">
                        <span class="u-visually-hidden">Show</span>
                        <span class="cf-icon cf-icon-plus-round"></span>
                    </span>
                    <span class="expandable_cue-close">
                        Hide
                        <span class="cf-icon cf-icon-minus-round"></span>
                    </span>
                </span>
            </button>
            <div class="expandable_content">
                <p>This release enhances the searching and filtering capabilities within the Consumer Complaint Database. For instance, users can filter by more than one value within each filter type, view complaint counts for the values in each filter type, and see the number of matching search results. Search capabilities allow users to find specific words or phrases in a complaint, refine a search to display matches within only the company name or narrative text, and use advanced search functions to further refine search results. The API also supports the new capabilities.</p>

                <h4>Users can still</h4>
                <ul>
                    <li>Filter and search on all database fields, except for ‘Consumer disputed?’</li>
                    <li>Export search results from the database via CSV and JSON formats only</li>
                    <li>“Toggle” back to the original Socrata interface</li>
                </ul>
                <h4>What Changed?</h4>
                <ul>
                    <li>Some filter labels were updated to be in better compliance with plain language standards. For instance, the “Submitted via” filter is now phrased “How did the consumer submit the complaint to the CFPB?” This does not affect how the data is labeled in the API or export.</li>
                    <li>Users can click on a complaint ID number to see all the details associated with that complaint in a detail page that has a unique, shareable URL.</li>
                    <li>“Consumer disputed?” is no longer a column that can be filtered; however, users will see the data in their search results and export files. The Bureau discontinued the consumer dispute option on April 24, 2017.</li>
                    <li>“Complaint ID” is no longer a column that can be filtered; however, users can search for specific complaint IDs.</li>
                </ul>

            </div>
        </div>
        <div class="expandable expandable__padded">
            <button class="expandable_header expandable_target" title="Expand content">
                <span class="expandable_header-left expandable_label">
                    Release 13 – May 2017
                </span>
                <span class="expandable_header-right expandable_link">
                    <span class="expandable_cue-open">
                        <span class="u-visually-hidden">Show</span>
                        <span class="cf-icon cf-icon-plus-round"></span>
                    </span>
                    <span class="expandable_cue-close">
                        Hide
                        <span class="cf-icon cf-icon-minus-round"></span>
                    </span>
                </span>
            </button>
            <div class="expandable_content">
                <p>
                    This release reflects updates made on April 24, 2017 to the form consumers use to submit complaints, including reorganizing how products, sub-products, issues, and sub-issues are grouped and making some plain language improvements.
                </p>
                <p>
                    The Consumer Complaint Database shows the consumer’s original product, sub-product, issue, and sub-issue selections consistent with the options available on the form at the time the consumer submitted the complaint.
                </p>
                <p>
                    This release also includes formatting updates of company names, reflects the discontinuation of the consumer dispute process, and displays U.S. territories in the State field.
                </p>
            </div>
        </div>
        <div class="expandable expandable__padded">
            <button class="expandable_header expandable_target" title="Expand content">
                <span class="expandable_header-left expandable_label">
                    Release 12 - September 2016
                </span>
                <span class="expandable_header-right expandable_link">
                    <span class="expandable_cue-open">
                        <span class="u-visually-hidden">Show</span>
                        <span class="cf-icon cf-icon-plus-round"></span>
                    </span>
                    <span class="expandable_cue-close">
                        Hide
                        <span class="cf-icon cf-icon-minus-round"></span>
                    </span>
                </span>
            </button>
            <div class="expandable_content">
                <p>
                    This release expands the database to include complaints we’ve received about federal student loan servicing dating back to February 25, 2016 and about virtual currency complaints dating back to August 11, 2014.
                </p>
            </div>
        </div>
        <div class="expandable expandable__padded">
            <button class="expandable_header expandable_target" title="Expand content">
                <span class="expandable_header-left expandable_label">
                    Release 11 - February 2016
                </span>
                <span class="expandable_header-right expandable_link">
                    <span class="expandable_cue-open">
                        Show
                        <span class="cf-icon cf-icon-plus-round"></span>
                    </span>
                    <span class="expandable_cue-close">
                        Hide
                        <span class="cf-icon cf-icon-minus-round"></span>
                    </span>
                </span>
            </button>
            <div class="expandable_content">
                <p>
                    This release expands the database to include two new columns to identify if a consumer opted to publish their complaint narrative and to identify if a complaint is related to a Servicemember or Older American.
                </p>
            </div>
        </div>
        <div class="expandable expandable__padded">
            <button class="expandable_header expandable_target" title="Expand content">
                <span class="expandable_header-left expandable_label">
                    Release 10 - June 2015
                </span>
                <span class="expandable_header-right expandable_link">
                    <span class="expandable_cue-open">
                        Show
                        <span class="cf-icon cf-icon-plus-round"></span>
                    </span>
                    <span class="expandable_cue-close">
                        Hide
                        <span class="cf-icon cf-icon-minus-round"></span>
                    </span>
                </span>
            </button>
            <div class="expandable_content">
                <p>
                    This release expands the database to include consumer complaint narratives and company public responses dating back to March 19, 2015.
                    <br/>
                    <br/>
                    Consumers' descriptions of what happened are included if consumers consent to publishing the description and after we take steps to remove personal information.
                    <br/>
                    <br/>
                    Companies' public-facing responses to complaints are included if companies choose to publish one. Companies may select a public response from a set list of options as soon as they respond to the complaint, but no later than 180 days after the complaint was sent to the company for response.
                    <br/>
                    <br/>
                    For complaints where consumers consent to publishing the description of what happened, only the first 3 digits of the consumer-reported ZIP codes are displayed.
                </p>
            </div>
        </div>
        <div class="expandable expandable__padded">
            <button class="expandable_header expandable_target" title="Expand content">
                <span class="expandable_header-left expandable_label">
                    Release 9 - January 2015
                </span>
                <span class="expandable_header-right expandable_link">
                    <span class="expandable_cue-open">
                        Show
                        <span class="cf-icon cf-icon-plus-round"></span>
                    </span>
                    <span class="expandable_cue-close">
                        Hide
                        <span class="cf-icon cf-icon-minus-round"></span>
                    </span>
                </span>
            </button>
            <div class="expandable_content">
                <p>
                    This release expands the database to include complaints we’ve received about prepaid cards, other consumer loans, and other financial services dating back to July 19, 2014.
                </p>
            </div>
        </div>
        <div class="expandable expandable__padded">
            <button class="expandable_header expandable_target" title="Expand content">
                <span class="expandable_header-left expandable_label">
                    Release 8 - July 2014
                </span>
                <span class="expandable_header-right expandable_link">
                    <span class="expandable_cue-open">
                        Show
                        <span class="cf-icon cf-icon-plus-round"></span>
                    </span>
                    <span class="expandable_cue-close">
                        Hide
                        <span class="cf-icon cf-icon-minus-round"></span>
                    </span>
                </span>
            </button>
            <div class="expandable_content">
                <p>
                    This release expands the database to include complaints we’ve received about payday loans dating back to November 6, 2013.
                </p>
            </div>
        </div>
        <div class="expandable expandable__padded">
            <button class="expandable_header expandable_target" title="Expand content">
                <span class="expandable_header-left expandable_label">
                    Release 7 - April 2014
                </span>
                <span class="expandable_header-right expandable_link">
                    <span class="expandable_cue-open">
                        Show
                        <span class="cf-icon cf-icon-plus-round"></span>
                    </span>
                    <span class="expandable_cue-close">
                        Hide
                        <span class="cf-icon cf-icon-minus-round"></span>
                    </span>
                </span>
            </button>
            <div class="expandable_content">
                <p>
                    This release includes complaints received after March 12, 2014, when the Bureau's case management system was upgraded. It also includes updates to older complaints that have happened since that date.
                </p>
            </div>
        </div>
        <div class="expandable expandable__padded">
            <button class="expandable_header expandable_target" title="Expand content">
                <span class="expandable_header-left expandable_label">
                    Release 6 - December 2013
                </span>
                <span class="expandable_header-right expandable_link">
                    <span class="expandable_cue-open">
                        Show
                        <span class="cf-icon cf-icon-plus-round"></span>
                    </span>
                    <span class="expandable_cue-close">
                        Hide
                        <span class="cf-icon cf-icon-minus-round"></span>
                    </span>
                </span>
            </button>
            <div class="expandable_content">
                <p>
                    This release reflects changes to the <a href="http://www.consumerfinance.gov/complaint/">consumer complaint form</a>.
                <ul>
                  <li>The issues consumers can select on the student loan complaint form were revised. “Repaying your loan” and “Problems when you are unable to pay” were removed and “Can’t pay my loan” and “Dealing with my lender or servicer” were added.</li>
                  <li>Consumers can now select a sub-issue for student loan complaints.</li>
                  <li>Consumers can now submit a credit reporting complaint about the issues “Incorrect information on my credit report” and “Credit reporting company’s investigation” without first filing a dispute with the credit reporting company.</li>
                </ul>
                Complaints we receive beginning December 18, 2013, will reflect these changes as they appear in the database. Complaints received before then will remain unchanged.
                </p>
            </div>
        </div>
        <div class="expandable expandable__padded">
            <button class="expandable_header expandable_target" title="Expand content">
                <span class="expandable_header-left expandable_label">
                    Release 5 - November 2013
                </span>
                <span class="expandable_header-right expandable_link">
                    <span class="expandable_cue-open">
                        Show
                        <span class="cf-icon cf-icon-plus-round"></span>
                    </span>
                    <span class="expandable_cue-close">
                        Hide
                        <span class="cf-icon cf-icon-minus-round"></span>
                    </span>
                </span>
            </button>
            <div class="expandable_content">
                <p>
                    This release expands the database to include complaints we’ve received about debt collection dating back to July 10, 2013. Additionally, consumer-reported ZIP codes for areas with populations of 20,000 or fewer persons are no longer included in the database.
                </p>
            </div>
        </div>
        <div class="expandable expandable__padded">
            <button class="expandable_header expandable_target" title="Expand content">
                <span class="expandable_header-left expandable_label">
                    Release 4 - May 2013
                </span>
                <span class="expandable_header-right expandable_link">
                    <span class="expandable_cue-open">
                        Show
                        <span class="cf-icon cf-icon-plus-round"></span>
                    </span>
                    <span class="expandable_cue-close">
                        Hide
                        <span class="cf-icon cf-icon-minus-round"></span>
                    </span>
                </span>
            </button>
            <div class="expandable_content">
                <p>
                    This release expands the database to include complaints we’ve received about credit reporting dating back to October 22, 2012 and about money transfers dating back to April 4, 2013. It also adds the Sub-issue and State data fields. More information on the newly added fields can be found in the Field Reference, above.
                </p>
            </div>
        </div>
        <div class="expandable expandable__padded">
            <button class="expandable_header expandable_target" title="Expand content">
                <span class="expandable_header-left expandable_label">
                    Release 3 - March 2013
                </span>
                <span class="expandable_header-right expandable_link">
                    <span class="expandable_cue-open">
                        Show
                        <span class="cf-icon cf-icon-plus-round"></span>
                    </span>
                    <span class="expandable_cue-close">
                        Hide
                        <span class="cf-icon cf-icon-minus-round"></span>
                    </span>
                </span>
            </button>
            <div class="expandable_content">
                <p>
                    This release expanded the database to include complaints we’ve received related to mortgages dating back to December 1, 2011 and bank accounts and services, private student loans, and other consumer loans dating back to March 1, 2012. It also added the Sub-product data field.
                </p>
            </div>
        </div>
        <div class="expandable expandable__padded">
            <button class="expandable_header expandable_target" title="Expand content">
                <span class="expandable_header-left expandable_label">
                    Release 2 - October 2012
                </span>
                <span class="expandable_header-right expandable_link">
                    <span class="expandable_cue-open">
                        Show
                        <span class="cf-icon cf-icon-plus-round"></span>
                    </span>
                    <span class="expandable_cue-close">
                        Hide
                        <span class="cf-icon cf-icon-minus-round"></span>
                    </span>
                </span>
            </button>
            <div class="expandable_content">
                <p>
                    This release expanded the database to include credit card complaints dating back to December 1, 2011.
                </p>
            </div>
        </div>
        <div class="expandable expandable__padded">
            <button class="expandable_header expandable_target" title="Expand content">
                <span class="expandable_header-left expandable_label">
                    Release 1 - June 2012
                </span>
                <span class="expandable_header-right expandable_link">
                    <span class="expandable_cue-open">
                        Show
                        <span class="cf-icon cf-icon-plus-round"></span>
                    </span>
                    <span class="expandable_cue-close">
                        Hide
                        <span class="cf-icon cf-icon-minus-round"></span>
                    </span>
                </span>
            </button>
            <div class="expandable_content">
                <p>
                    This release included complaints about credit cards received on or after June 1, 2012.
                </p>
            </div>
        </div>
    </div>
</div>

<body id="release-notes"></body>

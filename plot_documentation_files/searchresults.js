/* Copyright 2010-2024 The MathWorks, Inc. */

window.JST = window.JST || {};
var get_facet_label;

(function ($) {
    $.setParameter = function (uri, key, value) {
        var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
        //if the query parameter is already set, simply replace the new value in query parameter.
        if (uri.match(re)) {
            return uri.replace(re, '$1' + key + "=" + value + '$2');
        } else {
            var separator = uri.indexOf('?') !== -1 ? "&" : "?";
            return uri + separator + key + "=" + value;
        }
    };
})(jQuery);

const webSearchLocation = window.location.origin + window.location.pathname;

$(document).ready(function() {
    getAllSearchResults();
});

function getAllSearchResults() {
    var d1 = getSearchTemplatesDeferred();
    var d2 = getSearchResultsDeferred();
    $.when(d1,d2).done(function (v1,v2) {
        populateAllSearchResults(v1,v2);
    }).fail(function (jqXHR, textStatus, error) {
        var data = {"searchtext":"", "message":getLocalizedString('search_general_error')};
        displayError(data);
    });
}

function getSearchTemplatesDeferred() {
    var deferred = $.Deferred(function() {});
    $.getScript('/help/search/plugin/underscore-min.js', function () {
        $.ajax({
            url: '/help/search/js/views/templates/searchresultsv3.txt',
            method: 'get',
            dataType: 'html',
            success: function(data) {
                deferred.resolve(data);
            },
            error: function(jqXHR, textStatus, error) {
                deferred.reject(jqXHR, textStatus, error);
            }
        });
    });
    return deferred;
}

function getSearchResultsDeferred() {
    const deferred = $.Deferred(function() {});

    const d1 = getWebSearchResultsDeferred();
    let d2 = undefined;

    const searchData = parseQueryString();
    setCookiesFromParams(searchData);
    const connectorDocSource = getConnectorDocSource();
    if (connectorDocSource) {
        d2 = getConnectorSearchResultsDeferred(searchData, connectorDocSource);
    }

    if (d2) {
        $.when(d1,d2).done(function (v1,v2) {
            deferred.resolve(v1,v2);
        }).fail(function (jqXHR, textStatus, error) {
            deferred.reject();
        });
    } else {
        $.when(d1).done(function (v1) {
            deferred.resolve(v1);
        }).fail(function (jqXHR, textStatus, error) {
            deferred.reject();
        });
    }

    return deferred;
}

function getConnectorDocSource() {
  var supportedSources = getSupportedSources();  
  if(supportedSources.indexOf("3p") > -1) {
    return "3p";
  } else {
    return undefined;
  }
}

function getWebSearchResultsDeferred() {
    var deferred = $.Deferred(function() {});
    $.get(getSearchUrl(), function (data) {        
        deferred.resolve(data);
    }).fail(function() {
        deferred.reject();        
    })
    return deferred;
}

function getConnectorSearchResultsDeferred(searchData, connectorDocSource) {
    const deferred = $.Deferred(function() {});
    if (! searchData["selectedsource"]) {
        searchData["selectedsource"] = "mw";
    }
    searchData["source"] = connectorDocSource;
    const services = {
        "messageservice":"help/search/query",
        "messagechannel":"docsearch"
    };
    const errorhandler = function() {
        deferred.reject();
    }
    const successhandler = function(data) {
        deferred.resolve(data);
    }
    requestHelpService(searchData, services, successhandler, errorhandler);
    return deferred;
}

function parseLocalQueryString() {
    var params = {};
    var qs = window.location.search;
    if (qs && qs.length > 0) {
        var paramsArray = qs.replace(/^\?/,"").split("&");
        for (var i = 0; i < paramsArray.length; i++) {
            var nameValPair = paramsArray[i].split("=");
            var name = nameValPair[0];
            var value = nameValPair.length > 1 ? nameValPair[1] : "";
            if (name && name.length > 0) {
                value = decodeURIComponent(value.replace(/\+/g," "));
                if (params[name]) {
                    params[name] += "," + value;
                } else {
                    params[name] = value;
                }
            }
        }
    }
    return params;
}

function populateAllSearchResults(templateData, searchResultsArray) {
    populateTemplates(templateData);

    var sourceJson = getSourceJson(searchResultsArray);  
    var sources = sourceJson.sources;
    var jsonObject = sourceJson.selectedsearchresults;

    populateSearchResults(jsonObject, sources);
    populateSource(sources);
}

function populateTemplates(data) {
    var $data = $(data);
    JST['highlighter'] = _.template($.trim($data.filter('#highlighter').html()));
    JST['searchresults'] = _.template($.trim($data.filter('#searchresults').html()));
    JST['pagination'] = _.template($.trim($data.filter('#pagination').html()));
    JST['refinablefacet'] = _.template($.trim($data.filter('#refinablefacet').html()));
    JST['facets'] = _.template($.trim($data.filter('#facets').html()));
    JST['spellcheck'] = _.template($.trim($data.filter('#spellcheck').html()));
    JST['refinedfacet'] = _.template($.trim($data.filter('#refinedfacet').html()));
    JST['suggestionlist'] = _.template($.trim($data.filter('#suggestionlist').html()));
    JST['sources'] = _.template($.trim($data.filter('#sources').html()));
    JST['selectedsource'] = _.template($.trim($data.filter('#selectedsource').html()));
    JST['selectablesource'] = _.template($.trim($data.filter('#selectablesource').html()));
    JST['disabledsource'] = _.template($.trim($data.filter('#disabledsource').html()));
}

function populateSearchResults(data, sourceJson) {
    if (data.responsetype === "noresults") {
        populateLookupTable(data.facetlabels);
        populateNoResults(data, sourceJson);
    } else if (data.responsetype === "error") {
        displayError(data);
    } else {
        populateLookupTable(data.facetlabels);
        populateResultsList(data.results, data.searchtext);
        populateFacets(data.facets);
        populateResultData(data.pagedata, sourceJson);
        populateSpellCheck(data);
        appendHighlightExpand(data.searchtext, data.highlightexpand);
    }

    $('form#docsearch_form').tokenize({
        fields: ["product", "category", "type"],
        remove_if_empty: true,
        label_function: get_facet_label
    });

    if (typeof window.afterSearch === "function") {
        window.afterSearch(data);
    }

}

function populateSource(sourceJson) {
    // The sourceJson array is populated by the getSourceJson method.
    // If there is no custom doc installed, the sourceJson will be empty and we 
    // will not display the "Refine By Source" selector in the left nav.
    if ((! sourceJson) || jQuery.isEmptyObject(sourceJson)) {
        return;
    }
    // Populate the selected source in the search input params.
    // This is needed so that a new search on the page respects the selected source.
    populateSelectedSource(sourceJson);    
    // Populate the source area in the left nav.
    // If we don't have a search port, search is integrated and the source selector
    // is displayed in the left nav.
    // If we have a search port, search is two completely separate processes and we
    // do not display the source selector.
    if (! hasDocParam('searchPort')) {
        const sourceHtml = getSourceResultsHtml(sourceJson);
        const sourceDiv = $('#source_area');
        sourceDiv.html(sourceHtml);
    }
}

function populateSelectedSource(sourceJson) {
    var i;
    for (i = 0; i < sourceJson.length; i++) {
        var source = sourceJson[i];
        if (source.selectedsource) {
            var selectedsource = source.selectedsource;
            setSelectedSource(selectedsource.source);
        }
    }
}

function setSelectedSource(selectedSource) {
  document.getElementById('selected_source').value = selectedSource;
}

//===============================================================================

function getSearchResultsHtml(searchResults, searchTerm) {
    var jsonData = {searchResults: searchResults};
    _.extend(jsonData, {
        getHighlights: function (highlights, separator) {
            return highlights.join(separator);
        },
        getSearchResultClassType: function (type) {
            return 'result_type_' + type;
        },
        resolveProductHelpDir: function (productHelpDir) {
            return productHelpDir;
        },
        appendSearchHighlight: function () {
            if (searchTerm && searchTerm.length > 0) {
                return "?searchHighlight=" + encodeURIComponent(searchTerm) + "&s_tid=doc_srchtitle";
            } else {
                return "";
            }
        },
        getResultTypeElement: function(type, label) {
            var iconType = getTypeIconClass(type);
            if (iconType) {
                return '<span class="icon-' + iconType + ' icon_16 icon_color_general" title="' + label + '"></span>'
            } else {
                return "";
            }
        }
    });
    return JST['searchresults'](jsonData);
}

function appendHighlightExpand(searchTerm, highlightExpand) {
    if (searchTerm && highlightExpand) {
        localStorage.setItem(searchTerm, JSON.stringify(highlightExpand));
    }
}

function getTypeIconClass(type) {
    switch (type) {
        case "fcn" : return "function";
        case "blk" : return "block";
        case "so" : return "systemobject";
        case "ex" : return "examples";
        case "rn" : return "releasenotes";
        case "ht" : return "documentation";
        case "app": return "app";
        default : return null;
    }
}

function getSearchSummaryHtml(searchSummary) {
    return '<div id="result_summary_top">' + getPagination(searchSummary) + '</div>';
}

function getSearchFooterHtml(searchSummary) {
    return '<div id="result_summary_bottom">' + getPagination(searchSummary) + '</div>';
}

function getPagination(searchSummary) {
    var jsonData = {footer: searchSummary};
    _.extend(jsonData, {
        getPageUrl: function (pageNumber) {
            return $.setParameter(window.location.href, 'page', pageNumber);
        },
        getLocalizedString: function (str, locale) {
            return getLocalizedString(str, locale);
        }
    });

    return JST['pagination'](jsonData);
}

function getFacetResultsHtml(facetResults) {
    var jsonData = {
        facets: facetResults,
        refinedFacetTemplate: JST['refinedfacet'],
        refinableFacetTemplate: JST['refinablefacet'],
    }
    _.extend(jsonData, {
        getTypeIconClass : function(type) {
            return getTypeIconClass(type);
        }
    });
    return JST['facets'](jsonData);
}

function getSpellCheckResultsHtml(jsonData) {
    return JST['spellcheck'](jsonData);
}

function escapeHtml(text) {
    var map = {
        '&': '&amp;',
        '<': '&lt;',
        '>': '&gt;',
        '"': '&quot;',
        "'": '&#039;'
    };

    return text.replace(/[&<>"']/g, function(m) {
        return map[m];
    });
}

function getSourceResultsHtml(sourceResults) {
    var jsonData = {
        sources: sourceResults,
        selectedSourceTemplate: JST['selectedsource'],
        selectableSourceTemplate: JST['selectablesource'],
        disabledSourceTemplate: JST['disabledsource']
    }
    return JST['sources'](jsonData);
}

//===============================================================================

function getErrorHtml(error) {
    var html = '';
    html += '<div>';
    html += '<p>';
    html += '<font color="red">';
    html = html + error;
    html += '</font>';
    html += '</p>';
    html += '</div>';

    return html;
} // end function getErrorHtml

function getSuggestionsListHtml(noResultJson) {
    return JST['suggestionlist'](noResultJson);
}

function populateResultsList(searchresults, searchTerm) {
    $('#wait').remove();

    var resultsHtml = '';
    resultsHtml = getSearchResultsHtml(searchresults, searchTerm);

    var resultsDiv = $('#results_area');
    resultsDiv.html(resultsHtml);
}

function populateResultData(jsonObject, sourceJson) {
    var searchterm = jsonObject.searchterm;
    var summarydata = jsonObject.summarydata;
    var footerdata = jsonObject.footerdata;
    var searchTextDescJson = getSearchTextDescJson(jsonObject, sourceJson);

    $('#docsearch').val(searchterm);

    var summaryHtml = '';
    summaryHtml = getSearchSummaryHtml(footerdata);

    if (searchTextDescJson.length == 1) {
        var searchingInfoDiv = $('#search_result_info_header');
        searchingInfoDiv.html(searchTextDescJson[0]);   
    } else if (searchTextDescJson.length > 1) {
        var searchingInfoDiv1 = $('#search_result_info_line1');
        searchingInfoDiv1.html(searchTextDescJson[0]);   
        var searchingInfoDiv2 = $('#search_result_info_line2');
        searchingInfoDiv2.html(searchTextDescJson[1]);   
    }    

    var summaryDiv = $('#search_result_header');
    summaryDiv.html(summaryHtml);

    var footerHtml = '';
    footerHtml = getSearchFooterHtml(footerdata);

    var footerDiv = $('#search_result_footer');
    footerDiv.html(footerHtml);

    $("#search_result_header").show();

}

function getSearchTextDescJson(jsonObject, sourceJson) {
    if ((! sourceJson) || jQuery.isEmptyObject(sourceJson)) {
        return [jsonObject.searchtext];
    }

    let searchTextDescJson = [];
    searchTextDescJson.push(getSourceSearchTextDesc(sourceJson, 'selectedsource'));

    // If we have a search port, get the search text description for the alternatesource type.
    // If we don't have a search port, get the search text description for the selectablesource
    // type (if it's populated) or the disabledsource type (if selectablesource is not populated).
    const additionalSearchTextDesc = (hasDocParam('searchPort') ? 
                                      getSearchTextDesc(sourceJson, 'alternatesource') : 
                                      getSearchTextDesc(sourceJson, 'selectablesource', 'disabledsource'));

    if (additionalSearchTextDesc) {
        searchTextDescJson.push(additionalSearchTextDesc);
    }

    return searchTextDescJson;
}

function getSearchTextDesc(sourceJson, ...types) {
    // Get the search text description for the first type (e.g., selectedsource, selectablesource, disabledsource)
    // in the types array that contains a matching type in the sourceJson array.
    for (const type of types) {
        const searchTextForType = getSourceSearchTextDesc(sourceJson, type);
        if (searchTextForType.length > 0) {
            return searchTextForType;
        }
    }

    // No matching type from types array found in sourceJson array.
    // Returning undefined.
    return undefined;
}

function getSourceSearchTextDesc(sourceJson, type) {
    // Find the element in the sourceJson array that contains a matching type 
    // (e.g., selectedsource, selectablesource, disabledsource).
    // If a matching type is found, use it to build and return the HTML for the 
    // search text description displayed at the top of the search results.
    var itemType = getSourceJsonForType(sourceJson, type);
    if (itemType) {
        return getFormattedSearchTextDesc(itemType, type);
    }

    // No matching type found in the sourceJson array. Return an empty string.
    return '';
}

function getFormattedSearchTextDesc(sourceJson, type) {
    switch (type) {
        case "selectedsource" : return getLocalizedString("search_results_for_source_" + sourceJson.source).replace(/\{0\}/, sourceJson.searchterm).replace(/\{1\}/, Number(sourceJson.fullresultcount).toLocaleString('en'));
        case "selectablesource" : return getLocalizedString("show_results_for_" + sourceJson.source).replace(/\{0\}/, getSearchInHyperlink(sourceJson)).replace(/\{1\}/, Number(sourceJson.fullresultcount).toLocaleString('en'));
        case "disabledsource" : return getLocalizedString("search_no_results_source_" + sourceJson.source).replace(/\{0\}/, sourceJson.searchterm).replace(/\{1\}/, Number(sourceJson.fullresultcount).toLocaleString('en'));
        case "alternatesource" : return getLocalizedString("search_in_source_" + sourceJson.source).replace(/\{0\}/, getSearchInHyperlink(sourceJson));
        default : return '';
    }
}

function getSearchInHyperlink(sourceJson) {
    const searchTerm = sourceJson.searchterm;
    const source = sourceJson.source;
    const searchResultHref = _getSearchResultHref(searchTerm, source);
    return '<a href="' + searchResultHref + '">' + '<strong><i>' + searchTerm + '</i></strong>' + '</a>';
}

function _getSearchResultHref(searchTerm, source) {
    let searchResultURL;
    switch (source.toLowerCase()) {
        case "mw" : 
            searchResultURL = new URL(webSearchLocation);
            break;
        case "3p" : 
            try {
                // The doc params are stored in local storage.
                // local storage for the web page isn't shared with the installed page.
                // We have to add the param here so that the local page is displayed correctly.
                searchResultURL = new URL('http://127.0.0.1:' + getDocParam('searchPort') + '/static/help/customdoc/searchresults.html');
                searchResultURL.searchParams.append("searchPort", getDocParam('searchPort'));
            } catch (error) {
                console.error('Error for 3p source: ' + error);
                searchResultURL = new URL(webSearchLocation);
            }
            break;
        default : 
            // Return the page we're on, the web search page.
            console.error('Unsupported source: ' + source);
            searchResultURL = new URL(webSearchLocation);
    }
    searchResultURL.searchParams.append("qdoc", searchTerm);
    searchResultURL.searchParams.append("selectedsource", source);
    searchResultURL.searchParams.append("newsource", source);
    return searchResultURL.href;
}

function parse_query(query, fields) {
    var result = { query: "", tokens: [] },
        regexp, matchdata;

    $.each(fields, function (i, field) {
        regexp = new RegExp(field + ":(?:\"([^\"]+)\"|'([^']+)'|([^ ]+))", "i");

        while (matchdata = query.match(regexp)) {
            result.tokens.push({
                field: field,
                value: (matchdata[1] || matchdata[2] || matchdata[3])
            });
            query = query.replace(matchdata[0], "");
        }
    });
    result.query = $.trim(query);

    return result;
}

function populateFacets(facetJson) {
    var facetHtml = '';
    facetHtml = getFacetResultsHtml(facetJson);

    var facetDiv = $('#facets_area');
    facetDiv.html(facetHtml);
}


function displayError(data) {
    $('#docsearch').val(data.searchtext);
    var errorHtml = getErrorHtml(data.message);
    var errorDiv = $('#results_area');
    errorDiv.html(errorHtml);
}

function populateNoResults(jsonObject, sources) {
    var jsonData = _getNoResultsData(jsonObject, sources);
    displayNoResults(jsonData);
    displaySearchTips(jsonData);
    displaySpellCheck(jsonData);
}

function _getNoResultsData(jsonData, sources) {
    var allJson = {};

    var noResultsJson = _getNoResultsMessages(jsonData, sources);
    var searchTipsJson = _getSearchTipsMessages(jsonData, sources);

    var dymMessageId = (jsonData.hasfacets && jsonData.hasfacets === true ?
        'search_dym_message_results_without_filter_mw' :
        'search_dym_message_results_mw');
    var stidQSParam = 'SRCH_DYM_NA';
    var spellCheckJson = _getSpellCheckMessages(jsonData.spellcheck, dymMessageId, stidQSParam);

    $.extend(allJson, jsonData);
    $.extend(allJson, noResultsJson);
    $.extend(allJson, searchTipsJson);
    $.extend(allJson, spellCheckJson);

    return allJson;
}

function _getNoResultsMessages(jsonData, sources) {
    var noResultsJson = {};
    var message = _getNoResultsMessage(jsonData, sources);
    var altSearchMessage = _getAltSearchMessage(sources);
    noResultsJson.message = message;
    noResultsJson.alternatesearchmessage = altSearchMessage;
    return noResultsJson;
}

function _getAltSearchMessage(sourceJson) {
    if ((! sourceJson) || jQuery.isEmptyObject(sourceJson)) {
        return '';
    }

    const message = (hasDocParam('searchPort') ? 
                      _getAltSearchAlternateSourceMessage(sourceJson) : 
                      _getAltSearchSelectableSourceMessage(sourceJson));

    return message;
}

function _getAltSearchAlternateSourceMessage(sourceJson) {
    var alternateSourceJson = getSourceJsonForType(sourceJson, 'alternatesource');
    if (! alternateSourceJson) {
        return '';
    }

    var messageId = "search_in_source_" + alternateSourceJson.source;
    var searchHyperlink = getSearchInHyperlink(alternateSourceJson);
    var message = getLocalizedString(messageId).replace(/\{0\}/, searchHyperlink);

    return message;
}

function _getAltSearchSelectableSourceMessage(sourceJson) {
    var selectableSourceJson = getSourceJsonForType(sourceJson, 'selectablesource');
    if (! selectableSourceJson) {
        return '';
    }

    var messageId = "search_no_results_alt_search_" + selectableSourceJson.source;
    var searchHyperlink = getSearchInHyperlink(selectableSourceJson);
    var message = getLocalizedString(messageId).replace(/\{0\}/, searchHyperlink).replace(/\{1\}/, selectableSourceJson.fullresultcount);

    return message;
}

function _getNoResultsMessage(jsonData, sources) {
    var baseMessageId = _getNoResultsMessageId(jsonData, sources);
    var message = getLocalizedString(baseMessageId).replace(/\{0\}/, jsonData.spellcheck.searchtext);
    return message;
}

function _getNoResultsMessageId(jsonData, sources) {
    var baseMessageId = (jsonData.hasfacets === false ? "search_no_results_tips_message" : "search_no_results_tips_message_with_filter");

    var sourceIds = _getSourceIds(jsonData, sources);
    if ((! sourceIds) || jQuery.isEmptyObject(sourceIds)) {
        baseMessageId = baseMessageId + '_mw';
        return baseMessageId;
    }

    for(var i = 0; i < sourceIds.length; i++) {
        var sourceId = sourceIds[i];
        baseMessageId = baseMessageId + '_' + sourceId;
    }

    return baseMessageId;
}

function _getSourceIds(jsonData, sourceJson) {
    if ((! sourceJson) || jQuery.isEmptyObject(sourceJson)) {
        return '';
    }

    let sourceIds = [];
    const selectedSourceJson = getSourceJsonForType(sourceJson, 'selectedsource');
    sourceIds.push(selectedSourceJson.source);

    const additionalIdJson = (hasDocParam('searchPort') ? 
                              getSourceJsonForType(sourceJson, 'alternatesource') : 
                              getSourceJsonForType(sourceJson, 'disabledsource'));

    if (additionalIdJson) {
        sourceIds.push(additionalIdJson.source);
    }

    // Sort sources alphabetically on the 'source' property, then reverse it to get mw first.
    sourceIds.sort(function (a, b) {
        return (Object.values(a)[0].localeCompare(Object.values(b)[0]));
    });
    sourceIds.reverse();

    return sourceIds;
}

function getSourceJsonForType(sourceJson, type) {
    // Iterate over the sourceJson array. Find and return the array element containing
    // a matching type (e.g., selectedsource, selectablesource, disabledsource).
    for (const item of sourceJson) {
        const itemType = item[type];
        if (itemType) {
            return itemType;
        }
    }

    // No matching type found in sourceJson array. Return undefined.
    return undefined;
}

function _getSearchTipsMessages(jsonData, sources) {
    var searchTipsJson = {};

    var suggestionsheader = getLocalizedString("search_no_results_tips_header");
    var suggestions = [];
    var ctr = 0;
    var tip = getLocalizedString("search_no_results_tip_" + (ctr+1));
    while (tip && tip.length > 0) {
        suggestions[ctr] = tip;
        ctr++;
        tip = getLocalizedString("search_no_results_tip_" + (ctr+1));
    }

    searchTipsJson.suggestionsheader = suggestionsheader;
    searchTipsJson.suggestions = suggestions;

    return searchTipsJson;
}

function _getSpellCheckMessages(spellcheck, dymMessageId, stidQSParam) {
    var dymJson = {};

    var spellCheckHyperlink = _getSpellCheckHyperlink(spellcheck, stidQSParam);
    var dymMessage = getLocalizedString(dymMessageId).replace(/\{0\}/, spellCheckHyperlink).replace(/\{1\}/, spellcheck.spellcheckresultcount);

    spellcheck.didyoumeanmessage = dymMessage;

    dymJson.spellcheck = spellcheck;

    return dymJson;
}

function _getSpellCheckHyperlink(spellcheck, stidQSParam) {
    var searchTerm = encodeURIComponent(spellcheck.spellcheck);
    var searchText = spellcheck.spellcheck;
    return '<a href="search.html?qdoc=' + searchTerm + '&s_tid=' + stidQSParam + '">' + searchText + '</a>';
}

function displayNoResults(jsonData) {
    if (jsonData.alternatesearchmessage && jsonData.alternatesearchmessage.length > 0) {
        var searchingInfoDiv1 = $('#search_result_info_line1');
        searchingInfoDiv1.html(jsonData.message);
        var searchingInfoDiv2 = $('#search_result_info_line2');
        searchingInfoDiv2.html(jsonData.alternatesearchmessage);
    } else {
        var searchingInfoDiv = $('#search_result_info_header');
        searchingInfoDiv.html(jsonData.message);
    }
}

function displaySearchTips(jsonData) {
    var messageDiv = $('#results_area');
    messageDiv.empty();
    $('#docsearch').val(jsonData.searchtext);
    messageDiv.append(getSuggestionsListHtml(jsonData));
}

function populateSpellCheck(jsonData) {
    var allJson = {};

    var dymMessageId = ('search_dym_message_results');
    var stidQSParam = 'SRCH_DYM_LS';
    var spellCheckJson = _getSpellCheckMessages(jsonData.spellcheck, dymMessageId, stidQSParam);

    $.extend(allJson, jsonData);
    $.extend(allJson, spellCheckJson);

    displaySpellCheck(allJson);
}

function displaySpellCheck(jsonData) {
    if(jsonData === undefined) {
        return;
    }

    var spellcheckHtml = '';
    spellcheckHtml = getSpellCheckResultsHtml(jsonData);

    var messageDiv = $('#search_result_dym_header');
    messageDiv.append(spellcheckHtml);
}

function populateLookupTable(facetLabelJson) {

    var labels = {};
    for (var facetLabel in facetLabelJson) {
        if (facetLabelJson.hasOwnProperty(facetLabel)) {
            labels[facetLabelJson[facetLabel].field + ":" +
                facetLabelJson[facetLabel].value] = facetLabelJson[facetLabel].label;
        }
    }
    get_facet_label = function (token) {
        var labelDataString = sessionStorage.getItem('facetlookuptable');
        if(labelDataString !== undefined) {
            var labelData = JSON.parse(labelDataString);
            return labelData[token.field + ":" + token.value];
        }

        return labels[token.field + ":" + token.value];
    }

    if(!$.isEmptyObject(labels)) {
        sessionStorage.setItem('facetlookuptable', JSON.stringify(labels));
    }
}

function getSearchUrl() {
    var docSearchUrl = "/help/search/json/";
    var docSet = getDocSet();
    var lang = $('#docsearch_form').data('language');
    var release = $('#docsearch_form').data('release');
    docSearchUrl += docSet + "/" + lang + "/" + release;
    docSearchUrl += window.location.search;
    return getRequestArchiveParameter(docSearchUrl);
}

//===============================================================================

function getSupportedSources() {
    var supportedSources;
    var searchSource = getSessionStorageValue('searchsource');
    if (searchSource) {
        searchSource = searchSource.replace("+", " ");
        supportedSources = searchSource.split(" ");
    } else {
        supportedSources = [];
    }
    return supportedSources;
}

function getSessionStorageValue(key) {
    return (typeof(getSessionStorageItem) === typeof(Function) ? getSessionStorageItem(key) : undefined);
}

function getSourceJson(allSearchResults) {
    let allJson = {};
    // The sources array is used to support displaying search results for more than one
    // "source" (mw and 3p). If there is no custom doc installed, the sources array will
    // be/must be empty. The sources array is used later (in method populateSource) to
    // populate or not populate the "Refine By Source" selector in the left nav.
    let sources = [];

    if (! Array.isArray(allSearchResults)) {
        allSearchResults = [allSearchResults];
    }

    // If there's only one list of results and we don't have a search port, set the selected
    // search results to the list of results, the sources to an empty array, and return.
    // If there's only one list of results and we have a search port, we display the message
    // and link for the alternate search source (MathWorks or 3P).
    if ((allSearchResults.length == 1) && (! hasDocParam('searchPort'))) {
        allJson["selectedsearchresults"] = allSearchResults[0];
        allJson["sources"] = sources;        
        return allJson;        
    }

    for (const searchResults of allSearchResults) {
        let sourceJson = {};
        if (searchResults.source) {
            sourceJson["source"] = searchResults.source;
        } else {
            sourceJson["source"] = "mw";
        }

        let fullresultcount;
        if (searchResults.fullresultcount) {
            fullresultcount = searchResults.fullresultcount;
            sourceJson["fullresultcount"] = fullresultcount;
        } else {
            fullresultcount = "0";
            sourceJson["fullresultcount"] = fullresultcount;
        }

        if (searchResults.searchtext) {
            sourceJson["searchterm"] = getSearchTerm(searchResults.searchtext);
        } else {
            sourceJson["searchterm"] = "";
        }

        const selectedSource = isSelectedSource(searchResults);
        if (selectedSource) {
            allJson["selectedsearchresults"] = searchResults;
            sources.push({"selectedsource":sourceJson});
            if (hasDocParam('searchPort')) {
                // If we have a search port, create JSON for the link to the 
                // alternate search source (MathWorks or 3P).
                let alternateSourceJson = {};
                const otherSource = getOtherProductSearchSourceType(searchResults.source);
                alternateSourceJson["source"] = otherSource;
                alternateSourceJson["searchterm"] = getSearchTerm(searchResults.searchtext);
                sources.push({"alternatesource":alternateSourceJson});
            }
        } else {
            if (fullresultcount == "0") {
                sources.push({"disabledsource":sourceJson});
            } else {
                sources.push({"selectablesource":sourceJson});
            }
        }
    }

    // Sort sources alphabetically on the 'source' property, then reverse it to get mw first.
    sources.sort(function (a, b) {
        return (Object.values(a)[0].source.localeCompare(Object.values(b)[0].source));
    });
    sources.reverse();

    allJson["sources"] = sources;        
    return allJson;
}

function getOtherProductSearchSourceType(searchSourceType) {
    switch (searchSourceType.toLowerCase()) {
        case "mw" : return "3p";
        case "3p" : return "mw";
        default : return null;
    }
}

function isSelectedSource(searchResults) {
    if (searchResults.source && searchResults.selectedsource) {
        return searchResults.source == searchResults.selectedsource;
    }

    if (searchResults.selectedsource) {
        return true;
    }

    return false;
}

function getSearchTerm(searchText) {
    // Clean-up the search text, removing the facet data
    var typeIdx = searchText.indexOf("type");
    if (typeIdx >= 0) {
        return searchText.substring(0, typeIdx-1);
    }
    var prodIdx = searchText.indexOf("product");
    if (prodIdx >= 0) {
        return searchText.substring(0, prodIdx-1);
    }
    return searchText;
}
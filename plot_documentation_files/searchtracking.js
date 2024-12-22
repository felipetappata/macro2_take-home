// Copyright 2014 The MathWorks, Inc.
var SearchTracking = {};
SearchTracking.app = 'doc_center_search';
(function () {
    function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
        var regexS = "[\\?&]" + name + "=([^&#]*)";
        var regex = new RegExp(regexS, 'g');
        var results;
        var value = "";
        while (true) {
            results = regex.exec(window.location.href);
            if (results == null) {
                break;
            }
            value = decodeURIComponent(results[1].replace(/\+/g, " "));
        }
        return value;
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


    var page = getParameterByName('page') || 1;
    SearchTracking.page = parseInt(page);

    var searchTerm = getParameterByName('qdoc');
    var parsed_query = parse_query(searchTerm, ["product", "category", "type"]);
    SearchTracking.term = parsed_query.query;

    var current_doc_suggestion = getParameterByName('suggestion');
    var archived_doc_suggestion = getParameterByName('s_tid');
    if ((current_doc_suggestion === true) || (archived_doc_suggestion == 'doc_ta' )) {
        SearchTracking.typeahead = parsed_query.query;
    }

    var facetString = '';
    $.each(parsed_query.tokens, function (i, token) {
        facetString += token.field + ':\"' + token.value + '\" ' ;
    });
    SearchTracking.facets = $.trim(facetString);
})();


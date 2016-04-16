window.onload = function () {
    var wordcloudrr = JSON.parse(data)
    var wordcloudrr_list = []
    for (var row in wordcloudrr['data']) {
	wordcloudrr_list.push([wordcloudrr['data'][row]['word'], wordcloudrr['data'][row]['size']])
    }
    options= {
	list : wordcloudrr_list,
	rotateRatio: 0,
	shape: "triangle",
	// color: function (word, weight) {
	//     var floatweight = parseFloat(weight);
	//     if ( floatweight > 100 && floatweight <= 130 ) {
	// 	return('#00441b');
	//     } else if (floatweight > 80 && floatweight <= 100) {
	// 	return('#006d2c');
	//     } else if (floatweight > 60 && floatweight <= 80) {
	// 	return('#238b45');
	//     } else if (floatweight > 40 && floatweight <= 60) {
	// 	return('#41ab5d');
	//     } else {
	// 	return('#74c476');
	//     }}
    }
    WordCloud(document.getElementById('wordcloudrr'), options)
}

window.onload = function () {
    options= {
	list : [["本港", "126.232"],
		["提升", "120.612"],
		["權力", "113.028"],
		["特權", "113.028"],
		["張超雄", "111.613"],
		["六四", "26.909"],
		["可持續", "26.909"],
		["基建", "26.909"],
		["基本法", "26.909"]],
	rotateRatio: 0,
	shape: "triangle",
	color: function (word, weight) {
	    var floatweight = parseFloat(weight);
	    if ( floatweight > 100 && floatweight <= 130 ) {
		return('#00441b');
	    } else if (floatweight > 80 && floatweight <= 100) {
		return('#006d2c');
	    } else if (floatweight > 60 && floatweight <= 80) {
		return('#238b45');
	    } else if (floatweight > 40 && floatweight <= 60) {
		return('#41ab5d');
	    } else {
		return('#74c476');
	    }}
    };
    WordCloud(document.getElementById('wordcloudrr'), options);
};

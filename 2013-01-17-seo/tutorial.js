function calcRating(dom) {
	var rating = 0;

	var words = dom.text().split(' ').length;
	if (words > 500) {
		words = 500;
	}
	rating += words / 10;

	if (dom.find('h1').length == 1) {
		rating += 15;
	} else if (dom.find('h1').length > 1) {
		rating += 10;
	}

	rating += dom.find('h2').length * 4;
	rating += dom.find('h3').length * 3;
	rating += dom.find('h4').length * 1.5;

	words = dom.find('h1').text().split(' ').length;
	if (words > 5) {
		words = 5;
	}
	rating += words / 1;

	words = dom.find('h2').text().split(' ').length;
	if (words > 30) {
		words = 30;
	}
	rating += words / 2;

	words = dom.find('h3').text().split(' ').length;
	if (words > 50) {
		words = 50;
	}
	rating += words / 3;

	var descriptionWords = dom.find('meta[name=description]').attr('content').split(' ');
	words = descriptionWords.length;
	if (words > 0 && words < 20) {
		rating += words
	} else if (words > 20 && words < 30) {
		rating += 40 - words;
	}

	var title1 = dom.find('title').text();
	var title2 = dom.find('h1').text();
	if (title1.length && title2.length) {
		if (title1.indexOf(title2) != -1) {
			rating += 10;
		}
		if (title2.indexOf(title1) != -1) {
			rating += 10;
		}
	}

	for (var i = 0; i < title1.split(' ').length; i++) {
		if (dom.find('p').text().indexOf(title1.split(' ')[i]) != -1) {
			rating += 2;
		}
		if (i > 20) {
			break;
		}
	}

	for (var i = 0; i < descriptionWords.length; i++) {
		if (dom.find('p').text().indexOf(descriptionWords[i]) != -1) {
			rating += 0.5;
		}
		if (i > 20) {
			break;
		}
	}

	rating += dom.find('p').length

	return parseInt(rating);
}

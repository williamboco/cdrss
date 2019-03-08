
	
	//Allergy dynamic select
	$('a.addInputAll').on("click", function(e) {

		e.preventDefault();

		var $this = $(this);
		var limit = $this.parent().attr("value");
		var ctr = $this.parent().children().find('.dInput').size();
				
		if(ctr == limit) {
			alert("Max reached");
			return;
		}
		
		var $lastTbContainer = $this.closest('.fieldsGroup').children('.tbContainer:last');
		var $firstTbContainer = $this.closest('.fieldsGroup').children('.tbContainer:first');
		var $clone = $firstTbContainer.clone();

		if(ctr < 1) {
			$clone.find('button').hide();
		}

		$clone.css("display", "");
		$clone.find('select').css("width", "100%");
		$clone.find('select').removeAttr("id");
		$clone.find('select').first().addClass("dInput");
		$clone.find('select').attr("name", $(this).attr("value"));
		$clone.find('select').select2({
			tags: true
		});
		$lastTbContainer.after($clone);
	});

	$('.fieldsGroup').on('click', 'button.remove', function() {
		$(this).closest('.tbContainer').remove();
	});
	
	//Contact Person dynamic input
	$('a.addInputCP').on("click", function(e) {

		e.preventDefault();
		var $this = $(this);
		var limit = $this.parent().attr("value");
		var ctr = $this.parent().children().find('.dInput').size();
				
		if(ctr == limit) {
			alert("Max reached");
			return;
		}
		
		var $lastTbContainer = $this.closest('.fieldsGroup').children('.tbContainer:last');
		var $firstTbContainer = $this.closest('.fieldsGroup').children('.tbContainer:first');
		var $clone = $firstTbContainer.clone();

		if(ctr < 1) {
			$clone.find('button').hide();
		}

		$clone.css("display", "");
		$clone.find('input').addClass("dInput");
		$clone.find('input').attr("name", $(this).attr("value"));
		$lastTbContainer.after($clone);
	});

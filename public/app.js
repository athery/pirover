$(function() {
	var currentMove = null;
	var moveTo = function(direction) {
		currentMove = direction;
		$('.pad').removeClass('pressed');
		$.ajax('/move/' + direction)
			.done(function() {
				$('.pad.'+direction).addClass('pressed');
				console.log('moving ' + direction);
			})
			.fail(function() {
				console.log('error trying to move ' + direction);
			});
	}
	var stop = function() {
		currentMove = null;
		$.ajax('/stop')
			.done(function() {
				$('.pad').removeClass('pressed');
				console.log('robot stopped ');
			})
			.fail(function() {
				console.log('error trying to stop ');
			});
	}
	var arrowDown = function(direction) {
		if (currentMove != direction) {
				moveTo(direction);
			}
	}
	var arrowUp = function(direction) {
		if (currentMove == direction) {
				stop();
			}
	}
	$(document).keydown(function(e) {
		switch(e.which) {
			case 38:
			arrowDown('forward');
			break;

			case 39:
			arrowDown('right');
			break;
			
			case 37:
			arrowDown('left');
			break;
			
			case 40:
			arrowDown('back');
			break;

			default: return; // exit this handler for other keys
		}
		e.preventDefault(); // prevent the default action (scroll / move caret)
	});
	$(document).keyup(function(e) {
		switch(e.which) {
			case 37:
			arrowUp('left');
			break;

			case 38:
			arrowUp('forward');
			break;

			case 39:
			arrowUp('right');
			break;

			case 40:
			arrowUp('back');
			break;

			default: return; // exit this handler for other keys
		}
		e.preventDefault(); // prevent the default action (scroll / move caret)
	});
	$('.pad').mouseup(function() {
		arrowUp($(this).attr('data-direction'));
		});
	$('.pad').mousedown(function() {
		arrowDown($(this).attr('data-direction'));
		});
	$('.joystick').on('touchstart', '.pad', function(e){
		arrowDown($(this).attr('data-direction'));
		e.preventDefault();
		});
	$('.joystick').on('touchend', '.pad', function(e){
		arrowUp($(this).attr('data-direction'));
		e.preventDefault();
		});
});
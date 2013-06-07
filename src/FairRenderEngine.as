﻿package{	// http://www.8bitrocket.com/newsdisplay.aspx?newspage=10248		import flash.utils.Timer;	import flash.utils.getTimer;	import flash.events.TimerEvent;		public class RenderEngine{			public static const FRAME_RATE:int = 40;    	private var _period:Number = 1000 / FRAME_RATE; // milliseconds budgeted for loop    	private var _beforeTime:int = 0; // ts in milliseconds before loop    	private var _afterTime:int = 0; // ts in milliseconds after loop    	private var _timeDiff:int = 0;     	private var _sleepTime:int = 0;    	private var _overSleepTime:int = 0;    	private var _excess:int = 0;				private var gameTimer:Timer;				private var throwables:Array;				public function setThrowables(th:Array){			throwables = th;		}				public function start():void {			gameTimer=new Timer(_period,1); 		   	gameTimer.addEventListener(TimerEvent.TIMER, runGame);   			gameTimer.start();		}				public function stop():void {			gameTimer.stop();		}				var i:Number = 0;				private function runGame(e:TimerEvent) {   			_beforeTime = getTimer();    		_overSleepTime = (_beforeTime - _afterTime) - _sleepTime;			updateThrowables();    		/*checkKeys();   		 	updatePlayer();    		updateRocks();    		updateMissiles();    		checkCollisions();    		//canvasBD.lock();    		drawBackground();			drawPlayer();    		drawRocks();    		drawMissiles();    		drawParts();    		//canvasBD.unlock();*/        		_afterTime = getTimer();    		_timeDiff = _afterTime - _beforeTime;    		_sleepTime = (_period - _timeDiff) - _overSleepTime;          			if (_sleepTime <= 0) {        		_excess -= _sleepTime       			_sleepTime = 2;   			}            		gameTimer.reset();			trace(i++ +': '+_sleepTime);			trace('excess: '+_excess);    		gameTimer.delay = _sleepTime;    		gameTimer.start();			// catch up the game engine without the rendering engine   		 	/*while (_excess > _period) {				updateThrowables();        		/*checkKeys();        		updatePlayer();        		updateRocks();        		updateMissiles();        		checkCollisions();        		_excess -= _period;    		}*/        		//frameTimer.countFrames();    		//frameTimer.render();    		//if (aRock.length ==0 && aActiveParticle.length==0) stopRunningGame();    		e.updateAfterEvent();		}				private function updateThrowables(){			for each(var throwable in throwables){				throwable.update();			}		}	}}